#!/bin/bash
# Sqlmap 一键安装脚本
set -e

echo "[+] 开始安装 sqlmap..."

if [ -f /etc/debian_version ]; then
  sudo apt-get update -y
  sudo apt-get install -y git python3-pip
elif [ -f /etc/redhat-release ]; then
  sudo yum makecache
  sudo yum install -y git python3-pip
else
  echo "[!] 未知系统类型，请手动安装 sqlmap。"
  exit 1
fi

if [ ! -d /opt/sqlmap ]; then
  sudo git clone https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap
fi
sudo ln -sf /opt/sqlmap/sqlmap.py /usr/local/bin/sqlmap
sudo chmod +x /opt/sqlmap/sqlmap.py

echo "[+] sqlmap 安装完成，使用命令：sqlmap"
