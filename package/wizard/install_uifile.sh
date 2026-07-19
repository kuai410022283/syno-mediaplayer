#!/bin/sh

# Installation wizard UI file for MediaPlayer
# Allows user to configure port and admin password during install

cat << 'EOF'
{
    "step_title": {
        "chs": "MediaPlayer 安装配置",
        "cht": "MediaPlayer 安裝配置",
        "eng": "MediaPlayer Installation Setup"
    },
    "items": [
        {
            "type": "tips",
            "helpText": {
                "chs": "MediaPlayer 智能电视流媒体中心 - 专为 Android TV 与机顶盒打造的私有化 IPTV 服务端",
                "cht": "MediaPlayer 智慧電視串流中心 - 專為 Android TV 與機上盒打造的私有化 IPTV 服務端",
                "eng": "MediaPlayer Smart TV Streaming Center - Private IPTV backend for Android TV and set-top boxes"
            }
        },
        {
            "type": "text",
            "field": "server_port",
            "label": {
                "chs": "服务端口",
                "cht": "服務端口",
                "eng": "Service Port"
            },
            "initValue": "9527",
            "rules": [
                { "required": true, "message": { "chs": "端口不能为空", "cht": "端口不能為空", "eng": "Port is required" } },
                { "pattern": "^[0-9]+$", "message": { "chs": "端口必须为数字", "cht": "端口必須為數字", "eng": "Port must be a number" } },
                { "min": 1, "max": 65535, "message": { "chs": "端口范围 1-65535", "cht": "端口範圍 1-65535", "eng": "Port range: 1-65535" } }
            ]
        },
        {
            "type": "password",
            "field": "admin_password",
            "label": {
                "chs": "管理员密码",
                "cht": "管理員密碼",
                "eng": "Admin Password"
            },
            "initValue": "admin123",
            "rules": [
                { "required": true, "message": { "chs": "密码不能为空", "cht": "密碼不能為空", "eng": "Password is required" } }
            ]
        }
    ],
    "nextstep": ""
}
EOF
