#!/bin/bash
# 一键将 Ubuntu 系统更新为支持 Kali 工具包的脚本
set -e

echo "[+] 检查系统..."
if ! grep -qi ubuntu /etc/os-release; then
  echo "[!] 当前系统不是 Ubuntu，无法自动升级为 Kali 工具环境。"
  exit 1
fi

sudo apt-get update -y
sudo apt-get upgrade -y

# 添加 Kali Linux 仓库
if ! grep -q "kali-rolling" /etc/apt/sources.list; then
  echo "[+] 添加 Kali Linux 仓库..."
  echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee -a /etc/apt/sources.list
fi

# 导入 Kali 公钥
wget -q -O - https://archive.kali.org/archive-key.asc | sudo apt-key add -

# 更新源并安装常用 Kali 工具
sudo apt-get update -y

echo "[+] 可用的 Kali 工具示例："
echo "  sudo apt-get install -y nmap metasploit-framework sqlmap hydra john burpsuite gobuster seclists ..."
echo "[!] 请根据实际需求手动安装所需 Kali 工具。"
