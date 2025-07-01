#!/bin/bash
# Nuclei 一键安装脚本
set -e

echo "[+] 开始安装 Nuclei..."

ARCH=$(uname -m)
if [[ $ARCH == *aarch64* ]]; then
  URL="https://github.com/projectdiscovery/nuclei/releases/latest/download/nuclei_linux_arm64.zip"
else
  URL="https://github.com/projectdiscovery/nuclei/releases/latest/download/nuclei_linux_amd64.zip"
fi

wget -O nuclei.zip "$URL"
unzip -o nuclei.zip -d ./nuclei_bin
sudo mv ./nuclei_bin/nuclei /usr/local/bin/
sudo chmod +x /usr/local/bin/nuclei
rm -rf nuclei.zip nuclei_bin

echo "[+] Nuclei 安装完成，使用命令：nuclei"
