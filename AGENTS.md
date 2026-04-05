# AGENTS.md

Guide for AI coding/writing agents working in this repository.

## Project Overview

**《我在火影玩数值暴力》** — a Chinese web novel: Naruto fanfiction with DNF (Dungeon Fighter Online) game mechanics.

- **Genre**: 热血 + 悲剧 + 系统流
- **Protagonist**: 李武 (Li Wu) — transmigrator, DNF power system in Naruto world
- **Core Theme**: Breaking bloodline monopoly through DNF mechanics

## Repository Structure

```
正文/                              # Main chapters (001章_标题.md)
资料库/人物传记/                    # Character profiles
创作手册_完整版_456章_v2.0.0.md     # 世界圣经 + 总索引
创作手册_1-150章生产大纲.md          # Current production outline
创作手册_151-800章远期里程碑.md      # Long-range milestones
火影忍者时间线.md                    # Konoha calendar & timeline
CLAUDE.md                          # Claude Code specific guidance
```

## File Naming Conventions

| Type | Pattern | Example |
|------|---------|---------|
| Chapters | `正文/{NNN}章_{标题}.md` | `正文/053章_回到木叶.md` |
| Characters | `资料库/人物传记/{NNN}_{角色名}.md` | `资料库/人物传记/001_漩涡鸣人.md` |

- Use 3-digit zero-padded numbers (001, 002, etc.)
- Chapter titles in Chinese, concise

## Writing Workflow

1. **Before writing**: Read the last 2-3 chapters for continuity
2. **Reference**: Check `资料库/人物传记/` for character consistency
3. **Timeline**: Verify dates against `火影忍者时间线.md`
4. **World bible**: Check `创作手册_完整版_456章_v2.0.0.md` for themes, rules, and conflict tables
5. **Production outline**: Use `创作手册_1-150章生产大纲.md` for any chapter in the active writing range
6. **Long range**: Use `创作手册_151-800章远期里程碑.md` only to control direction, not to overrule landed prose
7. **After writing**: Commit chapter file with descriptive message

## Content Guidelines

- **Tone**: Mix hot-blooded action with tragic undertones and human struggle
- **Conflict**: DNF mechanics vs Naruto bloodline system — prove strength without bloodlines
- **Restrictions**: No excessive gore; keep platform-appropriate; respect character personalities
- **Power system**: DNF classes (鬼剑士/格斗家/神枪手/魔法师/圣职者) mapped to chakra system

## Git Workflow

- Standard git; no special tooling
- Commit completed or revised chapters
- Use descriptive commit messages in Chinese
- Do not commit drafts (see .gitignore)

## Key Reference Files

| File | Purpose |
|------|---------|
| `创作手册_完整版_456章_v2.0.0.md` | World bible, rules, conflict cards, timeline anchors |
| `创作手册_1-150章生产大纲.md` | Active production outline for current writing range |
| `创作手册_151-800章远期里程碑.md` | Long-range milestones and ending spine |
| `火影忍者时间线.md` | Official timeline, Konoha calendar, character ages |
| `资料库/人物传记/目录索引.md` | Character biography index |

## Agent Behavior

- Always read context chapters before writing new content
- Maintain character voice consistency per biographies
- Follow the three-layer manual structure; active chapters obey the production outline first
- When revising, preserve author's original style and intent
- Ask for clarification on plot decisions rather than inventing them
