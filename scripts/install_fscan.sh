#!/bin/bash
# Fscan 一键安装脚本
set -e

echo "[+] 开始安装 Fscan..."

ARCH=$(uname -m)
if [[ $ARCH == *aarch64* ]]; then
  URL="https://github.com/shadow1ng/fscan/releases/latest/download/fscan_linux_arm64.zip"
else
  URL="https://github.com/shadow1ng/fscan/releases/latest/download/fscan_linux_amd64.zip"
fi

wget -O fscan.zip "$URL"
unzip -o fscan.zip -d ./fscan_bin
sudo mv ./fscan_bin/fscan /usr/local/bin/
sudo chmod +x /usr/local/bin/fscan
rm -rf fscan.zip fscan_bin

echo "[+] Fscan 安装完成，使用命令：fscan"
