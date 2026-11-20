# 尼康 F 卡口资料库 · PWA

可离线运行的静态站点，包含三个页面：

| 页面 | 内容 |
|---|---|
| `index.html` | 379 支尼康 F 卡口原厂镜头，按世代/焦距/光圈/重量/口径筛选排序 |
| `cameras.html` | 93 台机身（胶片 43 + 数码 50）、机身时间线、22 台非尼康 F 卡口机身；点机身看卡口兼容矩阵、子型号差异与 872 条原厂配件（含 122 种对焦屏、24 条后背） |
| `reviews.html` | 已核实的独立评测页（镜头 16 / 机身 15 条），无链接留空显示「—」 |

## 文件

`index.html`、`cameras.html`、`reviews.html`、`manifest.json`、`sw.js`、图标三件、`apple-touch-icon.png`、`README.md`、`serve.bat`

## 本地预览

`serve.bat` 或 `python -m http.server 8080`，打开 http://localhost:8080/

> 必须 `https://` 或 `localhost`，`file://` 无法注册 Service Worker。

## 部署

GitHub Pages：把本目录文件传到仓库根目录 → Settings → Pages → Deploy from a branch → main / (root)。Cloudflare Pages / Netlify 直接拖文件夹。

## 安装

Edge 打开 HTTPS 地址 → 地址栏「安装」图标，或 `···` → 应用 → 将此站点安装为应用。管理：`edge://apps`。

## 更新数据

```bash
python ../build_cams.py     # 合并机身/配件/兼容矩阵/评测
python ../build_pages.py    # 生成三个页面
```

改完把 `sw.js` 的 `nikkor-f-v7` 改成 `v6`。

## 数据说明

- 镜头：原厂说明书、mir.com.my、photosynthesis 为准
- 机身：速查表口径 + 官网规格；同机身变体（F2A/F2AS 等）归并到基础型号，差异在详情里展开
- 卡口兼容矩阵：每台 8 种卡口 × 完全/部分/不支持，按官方说明书与年代规则判定，推断项在说明里写明
- 评测链接只收已核实的独立评测页，找不到就留空，不跳搜索引擎
- `—` = 不适用或资料缺失，`约` = 年份有争议
