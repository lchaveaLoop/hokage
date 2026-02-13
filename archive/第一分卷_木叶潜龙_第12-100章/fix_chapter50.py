# -*- coding: utf-8 -*-
import re

# 读取备份文件
with open('第050章_备份.md', 'r', encoding='utf-8') as f:
    lines = f.readlines()

# 处理每一行
processed_chars = []
for line in lines:
    line = line.strip()
    if line:
        # 去掉行末的...
        if line.endswith('...'):
            line = line[:-3]
        # 去掉行末的、。
        if line.endswith('、') or line.endswith('。'):
            pass  # 保留标点
        # 跳过空行处理后的内容
        if line:
            processed_chars.append(line)

# 组合成连续文本
text = ''.join(processed_chars)

# 在适当的位置添加换行符
# 1. 在【】前换行
text = re.sub(r'([^\n])【', r'\1\n【', text)

# 2. 在句号、问号、感叹号后换行（对话除外）
text = re.sub(r'([。！？；])"([^\n【】])', r'\1"\n\2', text)
text = re.sub(r'([。！？；])([^"\n【」』\d])', r'\1\n\2', text)

# 3. 在冒号后换行（如果有对话）
text = re.sub(r'：([^\n])', r'：\n\1', text)

# 4. 在对话引号后换行
text = re.sub(r'"([^"]{10,})"', lambda m: '"' + m.group(1) + '"\n', text)

# 5. 去掉多余的空行（超过2个连续换行压缩为2个）
text = re.sub(r'\n{3,}', '\n\n', text)

# 6. 在"---"前后添加空行
text = re.sub(r'([^\n])---', r'\1\n\n---', text)
text = re.sub(r'---([^\n])', r'---\n\n\1', text)

# 写入修复后的文件
with open('第050章.md', 'w', encoding='utf-8') as f:
    f.write(text)

print(f"修复完成！")
print(f"原始行数: {len(lines)}")
print(f"修复后预计约: {text.count(chr(10)) + 1} 行")
