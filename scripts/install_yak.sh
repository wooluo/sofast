#!/bin/bash
# YakLang 一键安装脚本（适用于 Linux/macOS）
set -e

echo "[+] 开始安装 YakLang..."

bash <(curl -sS -L http://oss-qn.yaklang.com/install-latest-yak.sh)

echo "[+] YakLang 安装完成。"
