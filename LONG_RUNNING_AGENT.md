# 长效运行代理机制 (Long-Running Agent Harness)

> 基于 Anthropic 的《Effective harnesses for long-running agents》设计
>
> 参考文章: https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents

---

## 核心理念

长效运行代理面临的核心挑战是**跨多个上下文窗口保持一致进度**。本项目采用两阶段解决方案:

1. **初始化代理** (Initializer Agent) - 首次运行时设置环境
2. **写作代理** (Writing Agent) - 每次会话增量写作一章,留下清晰记录

---

## 一、初始化代理 (已完成)

### 环境设置清单

✅ **章节列表文件** (`chapter_list.json`)
- 包含全部456章的结构化信息
- 每章标记状态: `completed` / `pending`
- 类似软件开发中的 feature list

✅ **进度日志文件** (`writing_progress.txt`)
- 记录每次写作会话的工作内容
- 类似软件开发中的 progress notes

✅ **Git 仓库**
- 每章完成后提交 commit
- commit message 格式: `完成第X章: [标题]`

✅ **初始化脚本** (`init.bat`)
- 快速启动写作环境
- 显示当前进度和下一章计划

✅ **质量标准文件**
- `writing_checklist.md` - 写作检查清单
- `scene_templates.md` - 场景模板库
- `创作手册_完整版_456章_v2.0.0.md` - 完整创作指南

✅ **快速参考资料** (`quick_reference/`)
- 核心机制、能级体系、角色档案、技能数据库

---

## 二、写作代理会话流程

### 阶段1: 会话开始 (Getting Up to Speed)

每次写作会话开始时,代理必须执行以下步骤:

```
1. 运行 pwd 确认工作目录
2. 读取 writing_progress.txt 了解最近工作
3. 读取 git log --oneline -10 查看最近提交
4. 读取 chapter_list.json 确认下一章
5. 读取创作手册对应章节的规划
6. 确认核心剧情、爽点设计、技能展示
```

**标准开场消息**:
```
[Assistant] 开始新的写作会话。让我先了解当前进度。
[Tool Use] <bash - pwd>
[Tool Use] <read - writing_progress.txt>
[Tool Use] <read - chapter_list.json>
[Tool Use] <bash - git log --oneline -10>
[Assistant] 当前进度: 已完成第X章,下一章是第Y章: [标题]
[Tool Use] <read - 创作手册_完整版_456章_v2.0.0.md> (对应章节)
[Assistant] 开始写作第Y章...
```

### 阶段2: 增量写作 (Incremental Progress)

**核心原则**: 每次会话只写一章,不贪多

**写作流程**:
1. 按照创作手册的章节规划写作
2. 使用 scene_templates.md 中的场景模板
3. 参考 writing_checklist.md 进行自我检查
4. 确保字数在 1,900-2,500 字范围内
5. 确保至少2个爽点
6. 确保符合创作手册的质量标准

**避免的失败模式**:
- ❌ 一次写多章 (会导致质量下降)
- ❌ 写到一半就停 (会导致下次会话难以继续)
- ❌ 不做质量检查就提交 (会导致返工)
- ❌ 不更新进度文件 (会导致下次会话迷失)

### 阶段3: 自我验证 (Self-Verification)

写作完成后,代理必须进行质量检查:

```
使用 writing_checklist.md 中的检查清单:

✓ 字数检查: 1,900-2,500字
✓ 爽点检查: 至少2个明确爽点
✓ 对话比例: 30-40%
✓ 系统提示: 3-5次,格式统一
✓ 技能展示: 清晰准确
✓ 情感节奏: 到位
✓ 剧情推进: 符合创作手册
✓ 角色语言: 符合性格
```

**只有通过所有检查,才能标记章节为 completed**

### 阶段4: 会话结束 (Clean State)

每次会话结束时,代理必须:

```
1. 更新 chapter_list.json
   - 标记当前章节状态为 "completed"
   - 记录实际字数

2. 更新 writing_progress.txt
   - 添加新的会话记录
   - 记录完成的章节号、标题、字数
   - 记录核心剧情、爽点、技能展示
   - 记录质量检查结果

3. 提交 Git commit
   - git add 正文/第X章.md
   - git add chapter_list.json
   - git add writing_progress.txt
   - git commit -m "完成第X章: [标题]"

4. 准备下一章
   - 在 writing_progress.txt 中添加下一章计划
```

**标准结束消息**:
```
[Assistant] 第X章写作完成,已通过质量检查。
[Tool Use] <edit - chapter_list.json> (更新状态)
[Tool Use] <edit - writing_progress.txt> (添加记录)
[Tool Use] <bash - git add . && git commit -m "完成第X章: [标题]">
[Assistant] 下一章是第Y章: [标题],已在进度文件中添加计划。
```

---

## 三、失败模式与解决方案

| 问题 | 初始化代理行为 | 写作代理行为 |
|------|---------------|-------------|
| 代理过早宣布项目完成 | 设置456章的完整章节列表 | 每次会话开始时读取章节列表,选择下一个 pending 章节 |
| 代理留下未完成的章节 | 设置 Git 仓库和进度文件 | 会话开始时读取进度和 git log,检查是否有未完成章节 |
| 代理标记章节为完成但质量不达标 | 设置质量检查清单 | 使用 writing_checklist.md 自我验证,只有通过才标记为 completed |
| 代理不知道如何开始写作 | 创建 scene_templates.md 和创作手册 | 会话开始时读取创作手册和场景模板 |

---

## 四、关键文件说明

### chapter_list.json
- **作用**: 类似软件开发中的 feature list
- **格式**: JSON,包含全部456章
- **字段**: chapter_number, title, status, word_count, core_plot, key_scenes
- **状态**: `completed` / `pending`
- **更新**: 每章完成后更新状态和字数

### writing_progress.txt
- **作用**: 类似软件开发中的 progress notes
- **格式**: Markdown,按时间顺序记录
- **内容**: 会话记录、完成章节、质量检查、下一章计划
- **更新**: 每次会话结束时添加新记录

### writing_checklist.md
- **作用**: 质量检查清单
- **格式**: Markdown,checkbox 格式
- **内容**: 字数、爽点、对话比例、系统提示、技能展示等
- **使用**: 每章完成后逐项检查

### scene_templates.md
- **作用**: 场景模板库
- **格式**: Markdown,包含战斗、日常、情感场景模板
- **内容**: 结构、示例、使用建议
- **使用**: 写作时参考对应场景模板

### 创作手册_完整版_456章_v2.0.0.md
- **作用**: 完整创作指南
- **格式**: Markdown,60%写作指南+40%剧情规划
- **内容**: 写作流程、场景构建、对话技巧、战斗描写、章节规划
- **使用**: 每章写作前查看对应章节规划

---

## 五、使用示例

### 示例1: 开始新的写作会话

```
用户: 开始写作第12章

代理:
1. 读取 writing_progress.txt → 确认上次完成第11章
2. 读取 chapter_list.json → 确认第12章状态为 pending
3. 读取 git log → 确认最近提交是"完成第11章"
4. 读取创作手册 4.1.2节 → 了解第12章规划
5. 开始写作第12章: 白的冰遁
6. 使用战斗场景模板
7. 完成后使用 writing_checklist.md 检查
8. 更新 chapter_list.json 和 writing_progress.txt
9. 提交 git commit
```

### 示例2: 恢复中断的会话

```
用户: 继续写作

代理:
1. 读取 writing_progress.txt → 发现上次会话未完成
2. 读取 git log → 确认最近提交
3. 读取 chapter_list.json → 查找 pending 章节
4. 继续写作未完成的章节
```

### 示例3: 质量检查失败

```
代理写作完成后:
1. 使用 writing_checklist.md 检查
2. 发现字数不足 (1,600字 < 1,900字)
3. 增加围观者反应和环境描写 (200-300字)
4. 再次检查,通过
5. 更新文件并提交
```

---

## 六、成功指标

### 每章质量指标
- ✅ 字数: 1,900-2,500字
- ✅ 爽点: 至少2个
- ✅ 对话比例: 30-40%
- ✅ 系统提示: 3-5次
- ✅ 符合创作手册规划

### 项目进度指标
- ✅ 每次会话完成1章
- ✅ 每章都有 git commit
- ✅ 进度文件持续更新
- ✅ 章节列表状态准确

### 长期目标
- 🎯 完成456章
- 🎯 总字数约100万字
- 🎯 保持质量一致性
- 🎯 按创作手册规划推进

---

## 七、下一步行动

### 当前状态
- ✅ 初始化代理: 已完成环境设置
- ✅ 已完成章节: 第1-168章
- 📝 剩余章节: 第169-456章 (288章)

### 立即行动
1. 运行 `init.bat` 或 `bash init_writing.sh` 启动环境
2. 开始写作第12章
3. 按照本文档的流程执行
4. 完成后更新文件并提交

### 长期规划
- 第1-20章: 波之国任务完结
- 第21-50章: 中忍考试篇
- 第51-100章: 木叶崩溃与一觉
- 第101-456章: 按创作手册推进

---

## 八、常见问题

### Q: 如果一章写不完怎么办?
A: 不要强行完成。在 writing_progress.txt 中记录当前进度,下次会话继续。但尽量避免这种情况,每次会话应该完成一章。

### Q: 如果质量检查不通过怎么办?
A: 根据 writing_checklist.md 的建议修改,直到通过所有检查。不要降低标准。

### Q: 如果发现之前的章节有问题怎么办?
A: 创建新的 git commit 修复,在 writing_progress.txt 中记录修复内容。

### Q: 如何保持456章的质量一致性?
A: 严格遵循本文档的流程,每章都使用 writing_checklist.md 检查,参考创作手册和场景模板。

---

**最后更新**: 2026-02-13
**版本**: v1.0.0
**状态**: 已激活,准备开始写作
