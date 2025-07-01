@echo off
REM YakLang 一键安装脚本（适用于 Windows）
chcp 65001 >nul

echo [*] 开始下载并安装 YakLang ...

powershell -Command "(new-object System.Net.WebClient).DownloadFile('https://oss-qn.yaklang.com/yak/latest/yak_windows_amd64.exe','yak_windows_amd64.exe')"
yak_windows_amd64.exe install
del /f yak_windows_amd64.exe

echo [*] YakLang 安装完成。
pause
