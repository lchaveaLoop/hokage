# AGENTS.md

Guide for AI coding/writing agents working in this repository.

## responds
使用中文回复我

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
创作手册_1-150章生产大纲.md          # Current production outline (ACTIVE)
创作手册_151-800章远期里程碑.md      # Long-range milestones (direction only)
火影忍者时间线.md                    # Konoha calendar & timeline
CLAUDE.md                          # Claude Code specific guidance
```

## File Naming Conventions

| Type | Pattern | Example |
|------|---------|---------|
| Chapters | `正文/{NNN}章_{标题}.md` | `正文/053章_回到木叶.md` |
| Characters | `资料库/人物传记/{NNN}_{角色名}.md` | `资料库/人物传记/001_漩涡鸣人.md` |

- **CRITICAL**: Use 3-digit zero-padded numbers (001, 002, 003...)
- Chapter titles in Chinese, concise
- Files must be `.md` format

## The Three-Layer Manual Rule

**Priority order for canonical sources** (never violate):

1. **Landed prose** (已落地正文) — already written chapters are immutable
2. **Production outline** (生产大纲) — `创作手册_1-150章生产大纲.md` governs active writing
3. **World bible** (世界圣经) — `创作手册_完整版_456章_v2.0.0.md` for rules, themes, conflict cards
4. **Long-range milestones** (远期里程碑) — direction only, never overrules finished prose

**Rule**: Active chapters (51-150) follow the production outline first. World bible validates consistency. Long-range milestones only guide direction.

## Writing Workflow

1. **Before writing**: Read the last 2-3 chapters for continuity
2. **Character check**: Reference `资料库/人物传记/目录索引.md` → read specific character file
3. **Timeline**: Verify dates against `火影忍者时间线.md` (Konoha calendar: 木叶51年=鸣人出生年)
4. **Production outline**: Check `创作手册_1-150章生产大纲.md` for chapter purpose, hooks, transitions
5. **World bible**: Verify themes/rules in `创作手册_完整版_456章_v2.0.0.md`
6. **After writing**: Commit with descriptive Chinese message

## Content Guidelines

- **Tone**: Mix hot-blooded action with tragic undertones and human struggle
- **Conflict**: DNF mechanics vs Naruto bloodline system — prove strength without bloodlines
- **System UI**: Integrate DNF game mechanics naturally (e.g., `【破招判定成功】`, `【倒地追加】`) as narrative flavor, not blockquote panels
- **Restrictions**: No excessive gore; keep platform-appropriate; respect character personalities
- **Power system**: DNF classes (鬼剑士/格斗家/神枪手/魔法师/圣职者) mapped to chakra system

## Style Rules (from 51-100章写法工具卡)

- **Battle scenes**: Include `站位→起手→变招→命中/落空→身体反馈→场面后果`
- **Spatial anchors**: Every fight needs terrain, distance, cover, elevation
- **Physical feedback**: Hand numbness, vision blur, breathing, slipping — not just "he was fast"
- **Skill effects**: Must hit visible things (ground cracks, shockwaves, dust, sweat, blood)
- **Finishing moves**: Half-beat windup before impact, never instant
- **Emotional beats**: Use action pauses, broken dialogue, cold environment — not self-pity monologues

## Git Workflow

- Standard git; no build/test tooling
- Commit completed or revised chapters
- **Use descriptive commit messages in Chinese** (e.g., "重写波之国决战篇18-27章：再不斩替白挡雷切...")
- Do not commit drafts (see .gitignore — `draft/`, `草稿/` are ignored)

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
