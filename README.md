# Synology SPK for MediaPlayer

[English](#english) | [中文](#中文)

## 中文

### 简介

这是 [MediaPlayer](https://github.com/kuai410022283/mediaplayer) 的群晖 (Synology) NAS 套件打包项目。

MediaPlayer 是专为 Android TV 与机顶盒打造的专业级私有化 IPTV 服务端，本项目将其打包为群晖 SPK 格式，方便在群晖 NAS 上一键安装部署。

### 支持的架构

| 架构 | 文件名后缀 | 适用机型 |
|------|-----------|---------|
| x86_64 | `x86_64` | DS920+, DS1522+, DS720+, DS923+, RS822+ 等 Intel/AMD 型号 |
| aarch64 | `aarch64` | DS220+, DS723+, DS423+ 等 ARM64 型号 |
| armv7l | `armv7l` | 部分旧款 ARM 机型 |

### 安装方法

1. 前往 [Releases](../../releases) 页面下载对应架构的 `.spk` 文件
2. 打开群晖 DSM → 套件中心 → 手动安装
3. 选择下载的 `.spk` 文件
4. 按照安装向导完成安装
5. 安装完成后访问 `http://<NAS_IP>:9527` 进入管理面板

### 默认配置

- **Web 管理面板**: `http://<NAS_IP>:9527`
- **默认密码**: `admin123`（请务必在安装后修改！）
- **配置文件路径**: `/var/packages/MediaPlayer/target/etc/config.yaml`
- **数据目录**: `/var/packages/MediaPlayer/target/var/`

### 工作原理

本项目通过 GitHub Actions 自动化工作流：

1. **触发构建**：手动指定 mediaplayer 版本号，或推送 tag 触发
2. **下载二进制**：从 [mediaplayer releases](https://github.com/kuai410022283/mediaplayer/releases) 下载对应架构的 Go 编译二进制
3. **打包 SPK**：将二进制 + 配置 + 安装脚本打包为群晖 SPK 格式
4. **发布 Release**：自动创建 GitHub Release 并上传 SPK 文件

### 自行构建

#### 前置条件
- GitHub 账号
- Fork 本仓库

#### 手动触发
1. 进入仓库的 Actions 页面
2. 选择 "Build SPK" 工作流
3. 点击 "Run workflow"
4. 输入 mediaplayer 版本号（如 `v1.1.10`）
5. 等待构建完成，在 Releases 页面下载

#### Tag 触发
```bash
git tag v1.1.10
git push origin v1.1.10
```

---

## English

### About

This is the Synology NAS package (SPK) build project for [MediaPlayer](https://github.com/kuai410022283/mediaplayer).

MediaPlayer is a professional private IPTV backend server for Android TV and set-top boxes. This project packages it into Synology SPK format for easy one-click installation on Synology NAS devices.

### Supported Architectures

| Architecture | File suffix | Compatible Models |
|---|---|---|
| x86_64 | `x86_64` | DS920+, DS1522+, DS720+, DS923+, RS822+, etc. |
| aarch64 | `aarch64` | DS220+, DS723+, DS423+, etc. |
| armv7l | `armv7l` | Some older ARM models |

### Installation

1. Download the `.spk` file for your architecture from [Releases](../../releases)
2. Open Synology DSM → Package Center → Manual Install
3. Select the downloaded `.spk` file
4. Follow the installation wizard
5. Access the web panel at `http://<NAS_IP>:9527`

### Default Credentials

- **Web Panel**: `http://<NAS_IP>:9527`
- **Default Password**: `admin123` (CHANGE THIS after installation!)
- **Config File**: `/var/packages/MediaPlayer/target/etc/config.yaml`
- **Data Directory**: `/var/packages/MediaPlayer/target/var/`

---

## License

This project follows the same license as [MediaPlayer](https://github.com/kuai410022283/mediaplayer/blob/main/LICENSE).
