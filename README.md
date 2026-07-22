# Synology SPK for MediaPlayer

[English](#english) | [中文](#中文)

---

## 中文

### 简介

这是 [MediaPlayer](https://github.com/kuai410022283/mediaplayer) 的群晖 (Synology) NAS 套件打包项目。

MediaPlayer 是专为 Android TV 与机顶盒打造的专业级私有化 IPTV 服务端，本项目将其打包为群晖 SPK 格式，方便在群晖 NAS 上一键安装部署。

### 支持的架构

| 架构 | 文件名后缀 | 适用机型 |
|------|-----------|--------|
| x86_64 | `x86_64` | DS918+, DS920+, DS1522+, DS720+, DS923+, RS822+ 等 Intel/AMD 型号 |
| aarch64 | `aarch64` | DS220j, DS223, DS223j, DS420j 等 ARM64 型号 |
| armv7l | `armv7l` | DS216 等旧款 ARM 机型 |

### 安装方法

1. 前往 [Releases](../../releases) 页面下载对应架构的 `.spk` 文件
2. 打开群晖 DSM → 套件中心 → 手动安装
3. 选择下载的 `.spk` 文件
4. 按照安装向导完成安装（可配置端口和密码）
5. 安装完成后访问 `http://<NAS_IP>:9527` 进入管理面板

### 默认配置

- **Web 管理面板**: `http://<NAS_IP>:9527`
- **默认密码**: `admin123`（安装时可自定义）
- **数据目录**: `/volume1/MediaPlayerData`（安装时可自定义，升级不丢失）
- **配置文件**: `/volume1/MediaPlayerData/config/config.yaml`
- **数据库**: `/volume1/MediaPlayerData/data/mediaplayer.db`
- **缓存目录**: `/volume1/MediaPlayerData/data/cache`

> 运行时通过符号链接将 `/var/packages/MediaPlayer/target/var/data` → 用户数据目录，二进制从 cwd 读取 `config.yaml` 并通过相对路径 `./data/` 访问数据库和缓存。
>
> ⚠️ 安装后请尽快修改默认密码和 JWT secret（在 config.yaml 中）

### 自动更新机制

本项目支持自动检测上游 [mediaplayer](https://github.com/kuai410022283/mediaplayer) 新版本并触发构建：

- **定时检查**: 每天 UTC 06:00（北京时间 14:00）自动检查上游 Release
- **自动触发**: 检测到新版本后自动创建对应的 SPK 构建任务
- **自动发布**: 构建完成后自动发布到本仓库的 [Releases](../../releases) 页面

工作流说明：
| 工作流 | 触发方式 | 用途 |
|--------|---------|------|
| `build-spk.yml` | 手动触发 / tag 推送 | 构建并发布 SPK |
| `check-upstream.yml` | 定时（每天） / 手动 | 检测上游新版本，自动触发构建 |

### 手动构建

```bash
# 方式一：手动触发（GitHub Actions 页面输入版本号）
# 方式二：Tag 触发
git tag v1.1.10
git push origin v1.1.10
```

### 工作原理

```
mediaplayer releases (Go binary)
        │
        ▼
GitHub Actions (build-spk.yml)
        │
        ├─ 下载 mediaplayer-linux-amd64.tar.gz    → MediaPlayer-x86_64.spk
        ├─ 下载 mediaplayer-linux-arm64.tar.gz     → MediaPlayer-aarch64.spk
        └─ 下载 mediaplayer-linux-arm-armv7l.tar.gz → MediaPlayer-armv7l.spk
        │
        ▼
GitHub Release (自动发布)
```

### 项目结构

```
syno-mediaplayer/
├── .github/workflows/
│   ├── build-spk.yml           # SPK 构建与发布
│   └── check-upstream.yml      # 上游版本检测
├── package/
│   ├── INFO                    # 套件元信息（多语言）
│   ├── PACKAGE_ICON.PNG        # 72x72 图标
│   ├── PACKAGE_ICON_256.PNG    # 256x256 图标
│   ├── conf/
│   │   └── config.yaml.template  # 配置模板
│   ├── scripts/                # 生命周期脚本
│   │   ├── start-stop-status   # 服务管理
│   │   ├── preinst             # 安装前检查
│   │   ├── postinst            # 安装后初始化
│   │   ├── preuninst           # 卸载前停止
│   │   ├── postuninst          # 卸载后清理
│   │   └── postupgrade         # 升级后处理
│   └── wizard/                 # 安装/升级向导（三语）
│       ├── install_uifile.sh
│       └── upgrade_uifile.sh
└── README.md
```

---

## English

### About

This is the Synology NAS package (SPK) build project for [MediaPlayer](https://github.com/kuai410022283/mediaplayer).

MediaPlayer is a professional private IPTV backend server for Android TV and set-top boxes. This project packages it into Synology SPK format for easy one-click installation on Synology NAS devices.

### Supported Architectures

| Architecture | File suffix | Compatible Models |
|---|---|---|
| x86_64 | `x86_64` | DS918+, DS920+, DS1522+, DS720+, DS923+, RS822+, etc. |
| aarch64 | `aarch64` | DS220j, DS223, DS223j, DS420j, etc. |
| armv7l | `armv7l` | DS216, etc. (older ARM models) |

### Installation

1. Download the `.spk` file for your architecture from [Releases](../../releases)
2. Open Synology DSM → Package Center → Manual Install
3. Select the downloaded `.spk` file
4. Follow the installation wizard (port and password are configurable)
5. Access the web panel at `http://<NAS_IP>:9527`

### Default Configuration

- **Web Panel**: `http://<NAS_IP>:9527`
- **Default Password**: `admin123` (customizable during install)
- **Data Directory**: `/volume1/MediaPlayerData` (customizable, survives upgrades)
- **Config File**: `/volume1/MediaPlayerData/config/config.yaml`
- **Database**: `/volume1/MediaPlayerData/data/mediaplayer.db`
- **Cache Directory**: `/volume1/MediaPlayerData/data/cache`

> At runtime, a symlink maps `/var/packages/MediaPlayer/target/var/data` → user data directory. The binary reads `config.yaml` from cwd and accesses database/cache via relative path `./data/`.
>
> ⚠️ Change the default password and JWT secret in config.yaml after installation

### Auto-Update Mechanism

This project supports automatic detection of new upstream [mediaplayer](https://github.com/kuai410022283/mediaplayer) releases:

- **Scheduled Check**: Daily at UTC 06:00 (14:00 Beijing Time) for new upstream releases
- **Auto Trigger**: Automatically creates SPK build when a new version is detected
- **Auto Release**: Publishes to this repo's [Releases](../../releases) page after build completes

Workflow overview:
| Workflow | Trigger | Purpose |
|----------|---------|---------|
| `build-spk.yml` | Manual / Tag push | Build and publish SPK |
| `check-upstream.yml` | Daily schedule / Manual | Detect upstream new version, auto-trigger build |

### How It Works

```
mediaplayer releases (Go binary)
        │
        ▼
GitHub Actions (build-spk.yml)
        │
        ├─ Download mediaplayer-linux-amd64.tar.gz    → MediaPlayer-x86_64.spk
        ├─ Download mediaplayer-linux-arm64.tar.gz     → MediaPlayer-aarch64.spk
        └─ Download mediaplayer-linux-arm-armv7l.tar.gz → MediaPlayer-armv7l.spk
        │
        ▼
GitHub Release (auto-published)
```

### Project Structure

```
syno-mediaplayer/
├── .github/workflows/
│   ├── build-spk.yml           # SPK build & release
│   └── check-upstream.yml      # Upstream version check
├── package/
│   ├── INFO                    # Package metadata (i18n)
│   ├── PACKAGE_ICON.PNG        # 72x72 icon
│   ├── PACKAGE_ICON_256.PNG    # 256x256 icon
│   ├── conf/
│   │   └── config.yaml.template  # Config template
│   ├── scripts/                # Lifecycle scripts
│   │   ├── start-stop-status   # Service management
│   │   ├── preinst             # Pre-install check
│   │   ├── postinst            # Post-install init
│   │   ├── preuninst           # Pre-uninstall stop
│   │   ├── postuninst          # Post-uninstall cleanup
│   │   └── postupgrade         # Post-upgrade handler
│   └── wizard/                 # Install/upgrade wizard (trilingual)
│       ├── install_uifile.sh
│       └── upgrade_uifile.sh
└── README.md
```

---

## License

This project follows the same license as [MediaPlayer](https://github.com/kuai410022283/mediaplayer/blob/main/LICENSE).