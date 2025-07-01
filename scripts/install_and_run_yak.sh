#!/bin/bash
##########################
#                        #
# install yak for tools  # 
#                        #
##########################
# 适用于 Ubuntu 23.04 及 amd64 架构
set -e

echo "[+] 开始安装 YakLang..."
bash <(curl -sS -L http://oss.yaklang.io/install-latest-yak.sh)

echo "[+] 配置防火墙端口..."
sudo ufw allow 64333
sudo ufw allow 8085
sudo ufw allow 8087
sudo ufw allow 8080
sudo ufw allow 8888
sudo ufw reload

echo "[+] 安装 iftop..."
sudo apt-get update -y
sudo apt-get install -y iftop

echo "[+] 启动 yak bridge (全局反连)..."
nohup yak bridge --secret cisco888* >yak_bridge.log 2>&1 &

echo "[+] 启动 yak grpc (远程模式)..."
nohup yak grpc --host 0.0.0.0 --port 8087 --secret youR-aw0some-PA5sss --tls >yak_grpc.log 2>&1 &

sleep 2
echo "[+] 当前 yak 进程："
ps -ef | grep yak | grep -v grep

echo "[+] 查看连接证书命令："
echo "yak grpc --host 0.0.0.0 --port 8087 --secret youR-aw0some-PA5sss --tls"
