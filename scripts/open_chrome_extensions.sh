#!/bin/bash
# 一键打开常用渗透/开发扩展的 Chrome Web Store 页面（适用于 macOS/Linux）
# 需手动点击“添加到Chrome”

EXT_URLS=(
  "https://chrome.google.com/webstore/detail/x-forwarded-for-header/ljfoeinjpaedjfecbmggjgodbgkmjkjk"
  "https://chrome.google.com/webstore/detail/hacktools/cmbndhnoonmghfofefkcccljbkdpamhi"
  "https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo"
  "https://chrome.google.com/webstore/detail/hackbar/pbghoenlaojkcpjmfcgplflaoabjclob"
  "https://chrome.google.com/webstore/detail/page-assist/okhcdipplnlmcnjgbfdbpmmhcmhcbgpm"
  "https://chrome.google.com/webstore/detail/user-agent-switcher-for-c/ljdobmomdgdljniojadhoplhkpialdid"
  "https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc"
  "https://chrome.google.com/webstore/detail/switchyomega/padekgcemlokbadohgkifijomclgjgif"
)

open_url() {
  if command -v open >/dev/null 2>&1; then
    open "$1"   # macOS
  elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$1"  # Linux
  else
    echo "请手动打开: $1"
  fi
}

echo "[+] 正在为你打开常用 Chrome 扩展页面..."
for url in "${EXT_URLS[@]}"; do
  open_url "$url"
  sleep 1
  echo "[+] 已打开: $url"
done

echo "[!] 请在浏览器中依次点击“添加到Chrome”安装扩展。"
