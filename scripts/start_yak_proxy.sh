#!/bin/bash
# 一键启动 YakLang 代理脚本
set -e

# 检查 yak 是否已安装
if ! command -v yak &> /dev/null; then
  echo "[!] yak 未安装，请先运行 install_yak.sh 安装。"
  exit 1
fi

# 询问端口
read -p "请输入代理监听端口 (默认 7890): " PORT
PORT=${PORT:-7890}

# 启动 yak 代理
nohup yak proxy --listen 0.0.0.0:$PORT > yak_proxy.log 2>&1 &

sleep 1
echo "[+] YakLang 代理已启动，监听端口: $PORT"
echo "[+] 日志文件: $(pwd)/yak_proxy.log"
