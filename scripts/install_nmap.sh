#!/bin/bash
# Nmap 一键安装脚本
set -e

echo "[+] 开始安装 Nmap..."

if [ -f /etc/debian_version ]; then
  sudo apt-get update -y
  sudo apt-get install -y nmap
elif [ -f /etc/redhat-release ]; then
  sudo yum makecache
  sudo yum install -y nmap
else
  echo "[!] 未知系统类型，请手动安装 nmap。"
  exit 1
fi

echo "[+] Nmap 安装完成，使用命令：nmap"
