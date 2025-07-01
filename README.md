# VPS 快速部署脚本仓库

本仓库用于一键部署常用的 VPS 工具，支持攻防两端自动化环境搭建，包括：
- Clash Verge（翻墙工具）
- FRP（内网穿透/隧道工具）
- DNSLog 平台（安全测试平台）
- AWVS（漏洞扫描平台）
- 渗透测试工具集（nmap、sqlmap、hydra、gobuster、dirsearch、whatweb、nikto、john、metasploit、seclists等）
- 防守方分析工具集（wireshark、tshark、tcpdump、gpg、ncat、openssl、binwalk、steghide、hashcat、volatility、foremost、exiftool、yara等）
- YakLang、Fscan、Afrog、Nuclei 等主流安全工具

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
   ./deploy.sh awvs
   ./deploy.sh pentest      # 一键安装渗透测试常用工具
   ./deploy.sh defense      # 一键安装防守方常用分析工具
   ```

## 目录结构

- `deploy.sh`         一键部署入口脚本
- `scripts/`          各工具的安装脚本

## 扩展说明

- `scripts/install_pentest_tools.sh`    渗透测试工具一键安装
- `scripts/install_defense_tools.sh`    防守方分析工具一键安装
- `scripts/install_yak.sh`              YakLang 一键安装
- `scripts/install_fscan.sh`            Fscan 一键安装
- `scripts/install_afrog.sh`            Afrog 一键安装
- `scripts/install_nuclei.sh`           Nuclei 一键安装及规则拉取
- `scripts/install_nmap.sh`             Nmap 一键安装
- `scripts/install_sqlmap.sh`           Sqlmap 一键安装

## 其他说明

- 各工具脚本均支持主流 Linux 发行版，部分工具支持自动拉取规则或字典。
- 防守方工具集成抓包、解密、隐写、取证、YARA等常用分析工具。
- 如需 Windows 版本或更多自动化脚本，请参考 scripts 目录下相关 .bat 文件。

---

> 如有新需求或遇到问题，欢迎反馈与补充！