@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo   尼康 F 卡口镜头全表 · 本地预览
echo   地址: http://localhost:8080/
echo   停止: Ctrl+C
echo.
where py >nul 2>nul
if %errorlevel%==0 (
  py -m http.server 8080
) else (
  python -m http.server 8080
)
pause
