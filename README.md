# VPS 快速部署脚本仓库

本仓库用于一键部署常用的 VPS 工具，包括：
- Clash Verge（翻墙工具）
- FRP（内网穿透/隧道工具）
- DNSLog 平台（安全测试平台）

## 使用方法

1. 赋予入口脚本执行权限：
   ```bash
   chmod +x deploy.sh
   ```
2. 选择要部署的工具，例如：
   ```bash
   ./deploy.sh clash
   ./deploy.sh frp
   ./deploy.sh dnslog
   ```

## 目录结构

- `deploy.sh`         一键部署入口脚本
- `scripts/`          各工具的安装脚本

## 后续扩展

你可以在 `scripts/` 目录下添加更多工具的安装脚本，并在 `deploy.sh` 中增加对应分支。

---

> 各工具的安装脚本目前为模板，请根据实际需求补充自动化安装命令。
# sofast