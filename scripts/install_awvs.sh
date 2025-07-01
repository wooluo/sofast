#!/bin/bash
# AWVS Docker 一键部署脚本
set -e

echo "[+] 开始部署 AWVS (Acunetix Web Vulnerability Scanner) Docker..."

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
echo "[+] 安装依赖 (docker, docker-compose)..."
if [ "$OS" = "debian" ]; then
  sudo apt-get update -y
  sudo apt-get install -y docker.io docker-compose
elif [ "$OS" = "centos" ]; then
  sudo yum makecache
  sudo yum install -y docker docker-compose
fi

# 启动docker
sudo systemctl enable docker
sudo systemctl start docker

# 询问端口
read -p "请输入 AWVS Web 控制台端口 (默认 3443): " PORT
PORT=${PORT:-3443}

# 创建 docker-compose.yml
cat > docker-compose-awvs.yml <<EOF
version: '3'
services:
  awvs:
    image: secfa/docker-awvs:latest
    container_name: awvs
    restart: unless-stopped
    ports:
      - "${PORT}:3443"
    volumes:
      - ./awvs_data:/home/acunetix/.acunetix/data
EOF

# 启动 AWVS
sudo docker-compose -f docker-compose-awvs.yml up -d

echo "[+] AWVS 部署完成。"
echo "[+] 访问地址: https://$(curl -s ifconfig.me):$PORT/"
echo "[!] 首次登录用户名/密码请参考镜像说明或自行设置。"
