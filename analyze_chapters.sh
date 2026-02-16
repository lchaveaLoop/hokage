#!/bin/bash
# 章节质量分析脚本
# 分析101-199章的质量问题

echo "=== DNF小说章节质量分析报告 (101-199章) ==="
echo "分析时间: $(date)"
echo ""

# 初始化计数器
total_chapters=0
c_level=0
b_level=0
a_level=0
s_level=0

echo "详细分析结果:"
echo "------------------------------------------------------------------------"
echo "章节 | 字数 | 省略号 | 短行数 | 质量等级 | 问题描述"
echo "------------------------------------------------------------------------"

for i in $(seq 101 199); do
    file="正文/已发布/${i}章.md"
    
    if [ ! -f "$file" ]; then
        continue
    fi
    
    total_chapters=$((total_chapters + 1))
    
    # 计算字数 (中文字符+英文单词)
    word_count=$(cat "$file" | wc -m)
    
    # 计算省略号数量
    ellipsis_count=$(grep -o '\.\.\.' "$file" | wc -l)
    
    # 计算短行数量 (每行少于15个字符的行数，排除空行和标题)
    short_lines=$(cat "$file" | grep -v '^$' | grep -v '^#' | awk 'length($0) < 15' | wc -l)
    
    # 计算总行数
    total_lines=$(cat "$file" | wc -l)
    
    # 计算平均行长度
    avg_line_length=0
    if [ $total_lines -gt 0 ]; then
        avg_line_length=$((word_count / total_lines))
    fi
    
    # 质量等级判定
    grade="S"
    issues=""
    
    # C级判定标准：
    # 1. 字数少于1000，或
    # 2. 省略号超过10个，或
    # 3. 短行数超过总行数的50%，或
    # 4. 平均行长度小于20
    
    if [ $word_count -lt 1000 ]; then
        grade="C"
        issues="字数过少($word_count)"
        c_level=$((c_level + 1))
    elif [ $ellipsis_count -gt 10 ]; then
        grade="C"
        issues="省略号滥用($ellipsis_count个)"
        c_level=$((c_level + 1))
    elif [ $short_lines -gt $((total_lines / 2)) ]; then
        grade="C"
        issues="短句分割严重(${short_lines}/${total_lines}行)"
        c_level=$((c_level + 1))
    elif [ $avg_line_length -lt 20 ]; then
        grade="C"
        issues="平均行长短($avg_line_length字符)"
        c_level=$((c_level + 1))
    # B级判定标准：
    # 1. 字数1000-1500，或
    # 2. 省略号5-10个，或
    # 3. 短行数30-50%
    elif [ $word_count -lt 1500 ]; then
        grade="B"
        issues="字数偏少"
        b_level=$((b_level + 1))
    elif [ $ellipsis_count -gt 5 ]; then
        grade="B"
        issues="省略号较多"
        b_level=$((b_level + 1))
    elif [ $short_lines -gt $((total_lines / 3)) ]; then
        grade="B"
        issues="短行较多"
        b_level=$((b_level + 1))
    # A级判定标准：
    # 1. 字数1500-2000，正常段落
    elif [ $word_count -lt 2000 ]; then
        grade="A"
        issues="可优化"
        a_level=$((a_level + 1))
    else
        grade="S"
        issues="良好"
        s_level=$((s_level + 1))
    fi
    
    # 只输出有问题的章节 (C级和B级)
    if [ "$grade" == "C" ] || [ "$grade" == "B" ]; then
        printf "%3d章 | %4d | %2d | %3d/%3d | %s | %s\n" $i $word_count $ellipsis_count $short_lines $total_lines $grade "$issues"
    fi
done

echo "------------------------------------------------------------------------"
echo ""
echo "=== 质量统计汇总 ==="
echo "总章节数: $total_chapters"
echo ""
echo "S级 (优秀): $s_level 章 ($(echo "scale=1; $s_level*100/$total_chapters" | bc)%)"
echo "A级 (良好): $a_level 章 ($(echo "scale=1; $a_level*100/$total_chapters" | bc)%)"
echo "B级 (需优化): $b_level 章 ($(echo "scale=1; $b_level*100/$total_chapters" | bc)%)"
echo "C级 (需重写): $c_level 章 ($(echo "scale=1; $c_level*100/$total_chapters" | bc)%)"
echo ""
echo "=== 修复建议 ==="
if [ $c_level -gt 0 ]; then
    echo "C级章节 ($c_level章): 需要全文重写，修复短句分割和省略号滥用"
fi
if [ $b_level -gt 0 ]; then
    echo "B级章节 ($b_level章): 需要重点优化，合并段落，减少省略号"
fi
if [ $a_level -gt 0 ]; then
    echo "A级章节 ($a_level章): 可局部优化"
fi
echo ""
