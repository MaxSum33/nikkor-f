# 尼康 F 卡口资料库 · PWA

可离线运行的静态站点，包含三个页面：

| 页面 | 内容 |
|---|---|
| `index.html` | 379 支尼康 F 卡口原厂镜头，按世代/焦距/光圈/重量/口径筛选排序 |
| `cameras.html` | 113 台尼康 F 卡口机身（胶片 60 + 数码 53）、机身时间线、22 台非尼康 F 卡口机身；点机身看 632 条原厂配件清单 |
| `reviews.html` | 每支镜头 / 每台机身的评测检索入口 |

## 文件

| 文件 | 作用 |
|---|---|
| `index.html` / `cameras.html` / `reviews.html` | 三个页面，各含全部数据，互相用顶部导航跳转 |
| `manifest.json` | 应用名称、图标、standalone 启动 |
| `sw.js` | Service Worker，首次访问后缓存全部页面，断网可用 |
| `icon-192/512.png`、`icon-maskable-512.png` | 桌面 / Android 自适应图标 |
| `apple-touch-icon.png` | iOS 添加到主屏 |
| `serve.bat` | Windows 本地预览（需要 Python） |

## 本地预览

```bat
serve.bat
```

或 `python -m http.server 8080` 后打开 http://localhost:8080/

> 必须 `https://` 或 `localhost`，`file://` 下不能注册 Service Worker，也就无法安装。

## 部署

**GitHub Pages**：把本目录所有文件传到仓库根目录 → Settings → Pages → Deploy from a branch → main / (root) → 等 1–3 分钟。

**Cloudflare Pages / Netlify / Vercel**：直接拖文件夹。

## 在 Edge 中安装

打开 HTTPS 地址 → 地址栏「安装」图标，或 `···` → 应用 → 将此站点安装为应用。
管理：`edge://apps`。

## 更新数据

```bash
python ../build_cams.py     # 合并机身 / 配件 / 非尼康数据
python ../build_pages.py    # 生成三个页面
```

改完把 `sw.js` 里的 `nikkor-f-v2` 改成 `v3`，否则已安装用户读到旧缓存。

## 数据说明

- 镜头表字段以尼康原厂说明书、mir.com.my、photosynthesis 为准，见各页页脚
- 机身表字段参照中文摄影圈流传的尼康 F 机身速查表，数码机型另加像素/传感器/电池
- 评测页的链接是**按型号精确检索**的入口，不是某一篇固定文章（多数老镜头没有单一权威评测）
- 标注 `—` 表示不适用或资料缺失，`约` 表示年份有争议
