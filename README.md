# 尼康 F 卡口镜头全表 · PWA

一个可离线运行的静态 PWA：379 支尼康 F 卡口原厂镜头，支持按世代、焦距、光圈、重量、滤镜口径筛选与排序，详情弹窗、CSV 导出，全部数据内嵌在 `index.html` 里。

## 文件

| 文件 | 作用 |
|---|---|
| `index.html` | 应用本体（单文件，含全部数据与样式脚本） |
| `manifest.json` | 应用名称、图标、启动方式（standalone） |
| `sw.js` | Service Worker，首次访问后缓存全部资源，断网可用 |
| `icon-192.png` / `icon-512.png` | 桌面/开始菜单图标 |
| `icon-maskable-512.png` | Android 自适应图标（留了安全边距） |
| `apple-touch-icon.png` | iOS 添加到主屏用 |
| `serve.bat` | Windows 本地预览脚本（需要 Python） |

## 本地预览

```bat
serve.bat
```

或手动：

```bash
python -m http.server 8080
# 打开 http://localhost:8080/
```

> 必须是 `https://` 或 `http://localhost` / `127.0.0.1`。直接双击 `index.html`（`file://`）无法注册 Service Worker，也就不能安装。

## 部署到 HTTPS

**GitHub Pages（最省事）**

1. 新建仓库，把本目录所有文件上传到仓库根目录
2. Settings → Pages → Source 选 `Deploy from a branch` → `main` / `(root)`
3. 等 1 分钟，访问 `https://<用户名>.github.io/<仓库名>/`

**Cloudflare Pages / Netlify / Vercel**：直接把本目录拖进控制台即可，无需构建命令。

## 在 Edge 中安装

1. Edge 打开部署后的 HTTPS 地址，等页面完全加载
2. 地址栏右侧出现「安装」图标；或点 `···` → **应用** → **将此站点安装为应用**
3. 确认名称 → 安装
4. 开始菜单/桌面出现图标，独立窗口运行，无地址栏

管理已安装应用：地址栏输入 `edge://apps`，可卸载、创建桌面快捷方式、设置登录 Windows 时自动启动。

手机 Edge 同理：`···` → **添加到手机**，会装成独立图标的应用。

## 验证是否真的离线可用

1. 首次打开后按 F12 → Application → Service Worker，确认状态为 `activated`
2. Application → Cache Storage 里应有 `nikkor-f-v1`
3. 断网（或 DevTools → Network 勾 Offline）后刷新，页面应照常显示 379 条

## 更新数据

```bash
python ../build.py      # 重建 Excel（数据源在 ../data/）
python ../make_site.py  # 重建单文件 HTML
python ../make_pwa.py   # 注入 PWA 头，生成 pwa/index.html
```

**改完记得把 `sw.js` 里的 `nikkor-f-v1` 改成 `v2`**，否则已安装的用户会一直读到旧缓存。

## 已知边界

- 数据为爱好者整理，停产年份、金圈、马达形态等存在推断项，页面底部与 Excel「图例与说明」有说明
- `index.html` 约 180 KB，首屏无网络请求，加载很快
- 不支持 `file://` 安装；这是浏览器安全策略，不是页面问题
