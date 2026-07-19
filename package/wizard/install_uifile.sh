#!/bin/sh

# Installation wizard UI file for MediaPlayer
# This script outputs a JSON wizard definition for DSM 7

cat << 'EOF'
{
    "step_title": {
        "chs": "MediaPlayer 安装说明",
        "cht": "MediaPlayer 安裝說明",
        "eng": "MediaPlayer Installation Notes"
    },
    "items": [
        {
            "desc": {
                "chs": "欢迎安装 MediaPlayer 智能电视流媒体中心！安装完成后可通过 http://<NAS_IP>:9527 访问管理面板。",
                "cht": "歡迎安裝 MediaPlayer 智慧電視串流中心！安裝完成後可通過 http://<NAS_IP>:9527 訪問管理面板。",
                "eng": "Welcome! After installation, access the admin panel at http://<NAS_IP>:9527"
            }
        },
        {
            "desc": {
                "chs": "默认密码: admin123 (请在安装后立即修改!)",
                "cht": "預設密碼: admin123 (請在安裝後立即修改!)",
                "eng": "Default password: admin123 (Change it immediately after installation!)"
            }
        }
    ],
    "nextstep": ""
}
EOF
