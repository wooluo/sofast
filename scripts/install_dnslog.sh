#!/bin/bash
# DNSLog 平台一键安装脚本
set -e

echo "[+] 开始安装 DNSLog 平台..."

# 检测系统类型
if [ -f /etc/debian_version ]; then
  OS=debian
elif [ -f /etc/redhat-release ]; then
  OS=centos
else
  echo "[!] 未知系统类型，请手动安装依赖。"
  exit 1
fi

# 安装依赖
echo "[+] 安装依赖 (git, docker, docker-compose)..."
if [ "$OS" = "debian" ]; then
  sudo apt-get update -y
  sudo apt-get install -y git docker.io docker-compose
elif [ "$OS" = "centos" ]; then
  sudo yum makecache
  sudo yum install -y git docker docker-compose
fi

# 启动docker
sudo systemctl enable docker
sudo systemctl start docker

# 询问用户关键信息
read -p "请输入 DNSLog 平台监听端口 (默认 8080): " PORT
PORT=${PORT:-8080}
read -p "请输入自定义平台域名 (可选，直接回车跳过): " DOMAIN

# 克隆项目
if [ ! -d dnslog ]; then
  git clone https://github.com/dnslog/dnslog.git
fi
cd dnslog

# 修改 docker-compose.yml 端口映射
if [ -f docker-compose.yml ]; then
  sed -i "s/8080:8080/${PORT}:8080/g" docker-compose.yml
fi

# 启动服务
sudo docker-compose up -d

echo "[+] DNSLog 平台安装完成。"
echo "[+] 访问地址: http://$(curl -s ifconfig.me):$PORT/"
if [ -n "$DOMAIN" ]; then
  echo "[+] 请将 $DOMAIN 解析到本机公网IP后访问。"
fi
