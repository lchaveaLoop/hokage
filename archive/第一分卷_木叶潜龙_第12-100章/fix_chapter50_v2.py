# -*- coding: utf-8 -*-
import re

# 读取备份文件
with open('第050章_备份.md', 'r', encoding='utf-8') as f:
    content = f.read()

# 去掉所有"..."
content = content.replace('...', '')

# 去掉所有换行符，组合成连续文本
lines = content.split('\n')
text = ''.join([line.strip() for line in lines if line.strip()])

# 在【】前换行
text = re.sub(r'([^\n])【', r'\1\n【', text)

# 在】后换行
text = re.sub(r'】([^\n])', r'】\n\1', text)

# 在"。"！？""；"后换行
text = re.sub(r'([。！？；])\n?' + r'"', r'\1"\n', text)
text = re.sub(r'([。！？；])([^\n"【」』])', r'\1\n\2', text)

# 在对话引号后换行（长对话）
text = re.sub(r'"([^"]{8,})"', lambda m: '"\n' + m.group(1) + '\n"', text)

# 在冒号后换行（如果是对话）
text = re.sub(r'：([^\n【】])', r'：\n\1', text)

# 压缩多余空行
text = re.sub(r'\n{3,}', '\n\n', text)

# 确保标题后有换行
text = re.sub(r'(#.+)\n?', r'\1\n\n', text)

# 在---前后添加换行
text = re.sub(r'([^\n])---', r'\1\n\n---', text)

# 写入文件
with open('第050章.md', 'w', encoding='utf-8') as f:
    f.write(text)

print(f"修复完成！")
