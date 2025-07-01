#!/bin/bash
# Afrog 一键安装脚本
set -e

echo "[+] 开始安装 Afrog..."

ARCH=$(uname -m)
if [[ $ARCH == *aarch64* ]]; then
  URL="https://github.com/zan8in/afrog/releases/latest/download/afrog_linux_arm64.zip"
else
  URL="https://github.com/zan8in/afrog/releases/latest/download/afrog_linux_amd64.zip"
fi

wget -O afrog.zip "$URL"
unzip -o afrog.zip -d ./afrog_bin
sudo mv ./afrog_bin/afrog /usr/local/bin/
sudo chmod +x /usr/local/bin/afrog
rm -rf afrog.zip afrog_bin

echo "[+] Afrog 安装完成，使用命令：afrog"
