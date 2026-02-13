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

# 在【】前后换行
text = re.sub(r'([^\n])【', r'\1\n【', text)
text = re.sub(r'】([^\n])', r'】\n\1', text)

# 在对话引号后换行（模式："..."后面紧跟其他文字）
text = re.sub(r'"([。！？；]+)"', r'\1"\n', text)
text = re.sub(r'"\n([^\n"【】])', r'\1', text)

# 在连续对话中的引号后换行："A"B" -> "A"\n"B"
text = re.sub(r'"\n([^"\n]{1,15})"([^"\n])', r'\1"\n\2"', text)

# 在句号等标点后的对话开始前换行
text = re.sub(r'([。！？；])([^"\n【】])', r'\1\n\2', text)

# 在冒号后换行
text = re.sub(r'：([^\n【】])', r'：\n\1', text)

# 压缩多余空行
text = re.sub(r'\n{3,}', '\n\n', text)

# 确保标题后有换行
text = re.sub(r'(#.+)\n?', r'\1\n\n', text)

# 在---前后添加换行
text = re.sub(r'([^\n])---', r'\1\n\n---', text)
text = re.sub(r'---([^\n*])', r'---\n\n\1', text)

# 写入文件
with open('第050章.md', 'w', encoding='utf-8') as f:
    f.write(text)

print(f"修复完成！")
print(f"总行数: {text.count(chr(10)) + 1}")
