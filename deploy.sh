#!/bin/bash
# 一键部署入口脚本
# 用法: ./deploy.sh [工具名]


set -e

show_help() {
  echo "用法: $0 [工具名]"
  echo "支持的工具名："
  echo "  clash         部署 Clash Verge (翻墙工具)"
  echo "  frp           部署 FRP (内网穿透)"
  echo "  dnslog        部署 DNSLog 平台"
  echo "  awvs          部署 AWVS 漏洞扫描平台"
  echo "  pentest       一键安装渗透测试常用工具"
  echo "  defense       一键安装防守方常用分析工具"
  echo "  yak           安装并运行 YakLang 及相关服务"
  echo "  xray          部署 Xray (如有脚本)"
  echo "  ...           其他脚本可在 scripts/ 目录扩展"
  echo ""
  echo "示例:"
  echo "  ./deploy.sh clash"
  echo "  ./deploy.sh pentest"
  echo "  ./deploy.sh defense"
}

# 环境准备：安装常用渗透/运维工具
prepare_env() {
  echo "[+] 正在检测并安装常用工具..."
  PKGS=(curl wget git vim unzip net-tools lsof python3 python3-pip docker docker-compose wireshark tshark tcpdump gpg ncat openssl binwalk steghide hashcat)
  # 说明：
  # wireshark/tshark/tcpdump 抓包分析
  # gpg/openssl 解密解码
  # ncat 网络调试
  # binwalk/steghide 文件分析/隐写
  # hashcat 密码破解
  if [ -f /etc/debian_version ]; then
    sudo apt-get update -y
    for pkg in "${PKGS[@]}"; do
      if ! dpkg -s "$pkg" >/dev/null 2>&1; then
        echo "[+] 安装 $pkg ..."
        sudo apt-get install -y $pkg
      fi
    done
  elif [ -f /etc/redhat-release ]; then
    sudo yum makecache
    for pkg in "${PKGS[@]}"; do
      if ! rpm -q "$pkg" >/dev/null 2>&1; then
        echo "[+] 安装 $pkg ..."
        sudo yum install -y $pkg
      fi
    done
  else
    echo "[!] 未知系统，请手动安装常用工具。"
  fi
}

prepare_env

if [ $# -lt 1 ] || [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
  show_help
  exit 0
fi

TOOL=$1
SCRIPT_DIR=$(dirname "$0")/scripts

case $TOOL in
  defense)
    bash "$SCRIPT_DIR/install_defense_tools.sh"
    ;;
  xray)
    bash "$SCRIPT_DIR/install_xray.sh"
    ;;
  frp)
    bash "$SCRIPT_DIR/install_frp.sh"
    ;;
  dnslog)
    bash "$SCRIPT_DIR/install_dnslog.sh"
    ;;
  awvs)
    bash "$SCRIPT_DIR/install_awvs.sh"
    ;;
  pentest)
    bash "$SCRIPT_DIR/install_pentest_tools.sh"
    ;;
  yak)
    bash "$SCRIPT_DIR/install_and_run_yak.sh"
    ;;
  clash)
    echo "[!] Clash Verge 脚本待集成，请参考 README 或 scripts/ 目录。"
    ;;
  *)
    echo "未知工具: $TOOL"
    show_help
    exit 1
    ;;
esac
