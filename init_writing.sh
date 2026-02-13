#!/bin/bash

# 写作环境初始化脚本
# Writing Environment Initialization Script

echo "=========================================="
echo "《我在火影玩数值暴力》写作环境初始化"
echo "=========================================="
echo ""

# 1. 检查当前目录
echo "[1/6] 检查工作目录..."
pwd
echo ""

# 2. 检查必要文件
echo "[2/6] 检查必要文件..."
files=(
    "chapter_tracking.json"
    "writing_progress.txt"
    "writing_session_template.md"
    "创作手册_完整版_456章_v2.0.0.md"
    "快速参考卡.md"
)

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $file"
    else
        echo "✗ $file (缺失)"
    fi
done
echo ""

# 3. 显示当前进度
echo "[3/6] 当前写作进度..."
if [ -f "chapter_tracking.json" ]; then
    # 使用 grep 提取关键信息
    echo "已完成章节: $(grep -o '"completed_chapters": [0-9]*' chapter_tracking.json | grep -o '[0-9]*')"
    echo "当前章节: $(grep -o '"current_chapter": [0-9]*' chapter_tracking.json | grep -o '[0-9]*')"
    echo "总字数: $(grep -o '"total_words_written": [0-9]*' chapter_tracking.json | grep -o '[0-9]*')"
fi
echo ""

# 4. 显示最近的 git 提交
echo "[4/6] 最近的 git 提交..."
git log --oneline -5 2>/dev/null || echo "Git 仓库未初始化或无提交记录"
echo ""

# 5. 显示下一章计划
echo "[5/6] 下一章写作计划..."
if [ -f "writing_progress.txt" ]; then
    echo "查看 writing_progress.txt 中的'下一章节计划'部分"
fi
echo ""

# 6. 准备开始写作
echo "[6/6] 环境检查完成!"
echo ""
echo "=========================================="
echo "准备开始写作会话"
echo "=========================================="
echo ""
echo "建议步骤:"
echo "1. 阅读 writing_progress.txt 了解当前进度"
echo "2. 查看 chapter_tracking.json 确认下一章规划"
echo "3. 参考创作手册对应章节"
echo "4. 使用 writing_session_template.md 作为写作指南"
echo "5. 完成后更新追踪文件并提交 git commit"
echo ""
