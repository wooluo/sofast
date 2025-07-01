#!/bin/bash
# 一键部署入口脚本
# 用法: ./deploy.sh [工具名]


set -e

# 环境准备：安装常用渗透/运维工具
prepare_env() {
  echo "[+] 正在检测并安装常用工具..."
  PKGS=(curl wget git vim unzip net-tools lsof python3 python3-pip docker docker-compose)
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

if [ $# -lt 1 ]; then
  echo "用法: $0 [xray|frp|dnslog]"
  exit 1
fi

TOOL=$1
SCRIPT_DIR=$(dirname "$0")/scripts

case $TOOL in
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
  *)
    echo "未知工具: $TOOL"
    exit 1
    ;;
esac
