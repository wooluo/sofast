#!/bin/bash
# 防守方常用自动化分析工具一键安装脚本
set -e

echo "[+] 开始安装防守方常用分析工具..."

TOOLS=(wireshark tshark tcpdump gpg ncat openssl binwalk steghide hashcat volatility foremost exiftool yara)

if [ -f /etc/debian_version ]; then
  sudo apt-get update -y
  sudo apt-get install -y ${TOOLS[@]}
elif [ -f /etc/redhat-release ]; then
  sudo yum makecache
  sudo yum install -y ${TOOLS[@]}
else
  echo "[!] 未知系统类型，请手动安装分析工具。"
  exit 1
fi

echo "[+] 工具安装完成。"
echo "[+] 包含：抓包分析、解密解码、隐写取证、内存分析、文件恢复、元数据分析、YARA规则等。"
