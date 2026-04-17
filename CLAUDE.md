# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## responds
使用中文回复我

## Project Overview

This is a Chinese web novel project: **《我在火影玩数值暴力》** (Playing with Numerical Violence in Naruto).

**Genre**: Naruto fanfiction with DNF (Dungeon Fighter Online) game mechanics
**Protagonist**: 李武 (Li Wu) - a transmigrator who brings DNF's power system into the Naruto world
**Core Theme**: Breaking bloodline monopoly through DNF mechanics - proving "you can become strong without bloodlines"
**Current Date**: 2026/04/17 (木叶62年-63年 for chapters 1-150)

## The Three-Layer Manual Rule (Critical Priority)

**Never violate this priority order for canonical sources:**

1. **Landed prose** (已落地正文) — already written chapters are immutable
2. **Production outline** (生产大纲) — `创作手册_1-150章生产大纲.md` governs active writing
3. **World bible** (世界圣经) — `创作手册_完整版_456章_v2.0.0.md` for rules, themes, conflict cards
4. **Long-range milestones** (远期里程碑) — direction only, never overrules finished prose

Active chapters (51-150) follow the production outline first. World bible validates consistency.

## Repository Structure

```
正文/                          # Main story chapters (numbered: 001章_标题.md)
资料库/人物传记/               # Character biographies and profiles
docs/plans/                    # Writing templates and standards
创作手册_完整版_456章_v2.0.0.md  # World bible + index
创作手册_1-150章生产大纲.md     # Active production outline (PRIMARY for writing)
创作手册_151-800章远期里程碑.md # Long-range milestones (direction only)
火影忍者时间线.md               # Naruto timeline reference (Konoha calendar)
AGENTS.md                      # Collaboration guide for AI agents
```

## File Naming Conventions

**Chapter files**: `正文/{序号}章_{标题}.md`
- Example: `正文/053章_回到木叶.md`
- Use 3-digit zero-padded numbers (001, 002, etc.)

**Character files**: `资料库/人物传记/{序号}_{角色名}.md`
- Example: `资料库/人物传记/001_漩涡鸣人.md`

## Writing Workflow

1. **Before writing**: Read the last 2-3 chapters for continuity
2. **Character check**: Reference `资料库/人物传记/目录索引.md` → read specific character file
3. **Timeline**: Verify dates against `火影忍者时间线.md` (Konoha calendar: 木叶50年=鸣人出生年)
4. **Production outline**: Check `创作手册_1-150章生产大纲.md` for chapter purpose, hooks, transitions
5. **World bible**: Verify themes/rules in `创作手册_完整版_456章_v2.0.0.md`
6. **After writing**: Commit with descriptive Chinese message

## Style Rules (Battle & Emotion)

### Battle Scenes
- Must include: `站位 → 起手 → 变招 → 命中/落空 → 身体反馈 → 场面后果`
- Every fight needs spatial anchors: terrain, distance, cover, elevation
- Physical feedback required: hand numbness, vision blur, breathing, slipping — not just "he was fast"
- Skill effects must hit visible things: ground cracks, shockwaves, dust, sweat, blood
- Finishing moves need half-beat windup before impact, never instant
- Key counterattacks must include prominent system UI feedback (e.g., `【破招判定成功】`, `【倒地追加】`) to showcase DNF mechanics crushing Naruto jutsu logic

### Emotional Beats
- Use action pauses, broken dialogue, cold environment — not self-pity monologues
- Flashbacks only for character wounds, failure echoes, value origins — max 1-2 short segments, must return to present immediately
- Emotion chapters must show "what this decision changed," not empty sentiment

### Protagonist Tone
- Combat: Fast, brutal, precise, mechanism-based dominance. Always composed, casual high-dimensional suppression
- Daily life: Dark humor, high-status snark, poison-tongue but fiercely protective
- Philosophy: Inner sage, outer king — no hesitation when confronting threats, ruthless efficiency

## Writing Guidelines

1. **Story continuity**: New chapters must connect with previous chapters - always read the last 2-3 chapters before writing new content
2. **Character consistency**: Follow character profiles in `资料库/人物传记/` and personality guidelines in the creation manual
3. **Timeline accuracy**: Reference `火影忍者时间线.md` for Konoha calendar dates and character ages
4. **Tone balance**: Mix hot-blooded action with tragic undertones and human struggles
5. **Core conflict**: DNF mechanics vs Naruto bloodline system — protagonist proves strength without bloodlines
6. **System integration**: DNF UI prompts (`【霸体护甲生成】`, `【破招判定成功】`) as narrative flavor, not blockquote panels

## Key Reference Files

| File | Purpose |
|------|---------|
| `创作手册_完整版_456章_v2.0.0.md` | World bible, rules, conflict cards, timeline anchors |
| `创作手册_1-150章生产大纲.md` | Active production outline — PRIMARY for chapter writing |
| `创作手册_151-800章远期里程碑.md` | Long-range direction only |
| `火影忍者时间线.md` | Official timeline, Konoha calendar, character ages |
| `资料库/人物传记/目录索引.md` | Character biography index |
| `docs/plans/claude-output-convention.md` | Output templates for chapter outlines, logic checks, revisions |

## Content Restrictions

- Avoid excessive violence and gore descriptions
- Keep content appropriate for web novel platforms
- Respect established character personalities from the creation manual

## Git Workflow

Standard git workflow. Chapter files are tracked and committed as they are completed or revised.
- **Use descriptive commit messages in Chinese** (e.g., "重写波之国决战篇18-27章：再不斩替白挡雷切...")
- Do not commit drafts (`.gitignore` excludes `draft/`, `草稿/`)
