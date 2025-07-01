@echo off
REM 一键打开常用渗透/开发扩展的 Chrome Web Store 页面（适用于 Windows）
REM 需手动点击“添加到Chrome”

setlocal enabledelayedexpansion
set EXT1=https://chrome.google.com/webstore/detail/x-forwarded-for-header/ljfoeinjpaedjfecbmggjgodbgkmjkjk
set EXT2=https://chrome.google.com/webstore/detail/hacktools/cmbndhnoonmghfofefkcccljbkdpamhi
set EXT3=https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo
set EXT4=https://chrome.google.com/webstore/detail/hackbar/pbghoenlaojkcpjmfcgplflaoabjclob
set EXT5=https://chrome.google.com/webstore/detail/page-assist/okhcdipplnlmcnjgbfdbpmmhcmhcbgpm
set EXT6=https://chrome.google.com/webstore/detail/user-agent-switcher-for-c/ljdobmomdgdljniojadhoplhkpialdid
set EXT7=https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc
set EXT8=https://chrome.google.com/webstore/detail/switchyomega/padekgcemlokbadohgkifijomclgjgif

for %%E in (1 2 3 4 5 6 7 8) do (
    set URL=!EXT%%E!
    start "" !URL!
    timeout /t 1 >nul
)

echo [!] 请在浏览器中依次点击“添加到Chrome”安装扩展。
pause
