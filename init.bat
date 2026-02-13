@echo off
chcp 65001 >nul
echo ========================================
echo 《我在火影玩数值暴力》写作环境
echo ========================================
echo.

REM 检查工作目录
echo [1/5] 检查工作目录...
cd /d "%~dp0"
echo 当前目录: %CD%
echo.

REM 检查Git仓库
echo [2/5] 检查Git仓库状态...
if exist ".git" (
    echo ✓ Git仓库已初始化
    git status --short
) else (
    echo ✗ Git仓库未初始化
    echo   运行 'git init' 来初始化仓库
)
echo.

REM 读取进度信息
echo [3/5] 读取写作进度...
if exist "chapter_list.json" (
    echo ✓ 章节清单文件存在
    REM 使用PowerShell解析JSON获取进度
    for /f "delims=" %%i in ('powershell -Command "(Get-Content chapter_list.json | ConvertFrom-Json).project.current_progress.completed_chapters"') do set COMPLETED=%%i
    for /f "delims=" %%i in ('powershell -Command "(Get-Content chapter_list.json | ConvertFrom-Json).project.current_progress.pending_chapters"') do set PENDING=%%i
    echo   已完成: %COMPLETED% 章
    echo   待写作: %PENDING% 章
) else (
    echo ✗ 章节清单文件不存在
)
echo.

REM 显示下一个待写章节
echo [4/5] 下一个待写章节...
if exist "chapter_list.json" (
    powershell -Command "$json = Get-Content chapter_list.json | ConvertFrom-Json; $next = $json.chapters | Where-Object {$_.status -eq 'pending'} | Select-Object -First 1; if ($next) { Write-Host '  第' $next.chapter_number '章:' $next.title; Write-Host '  核心剧情:' $next.core_plot } else { Write-Host '  所有章节已完成!' }"
) else (
    echo   无法读取章节信息
)
echo.

REM 显示目录结构
echo [5/5] 检查目录结构...
if exist "正文\已发布" (echo ✓ 正文\已发布) else (echo ✗ 正文\已发布)
if exist "正文\第一分卷_木叶潜龙" (echo ✓ 正文\第一分卷_木叶潜龙) else (echo ✗ 正文\第一分卷_木叶潜龙)
if exist "正文\第二分卷_晓之阴云" (echo ✓ 正文\第二分卷_晓之阴云) else (echo ✗ 正文\第二分卷_晓之阴云)
if exist "正文\第三分卷_终极之战" (echo ✓ 正文\第三分卷_终极之战) else (echo ✗ 正文\第三分卷_终极之战)
if exist "quick_reference" (echo ✓ quick_reference) else (echo ✗ quick_reference)
echo.

echo ========================================
echo 环境检查完成!
echo ========================================
echo.
echo 快速命令:
echo   - 查看进度: type writing_progress.txt
echo   - 查看检查清单: type writing_checklist.md
echo   - 查看场景模板: type scene_templates.md
echo   - Git提交: git add . ^&^& git commit -m "完成第XX章"
echo.
pause
