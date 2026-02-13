# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a creative writing project for a Chinese web novel: 《我在火影玩数值暴力》(Playing with Numerical Violence in Naruto). It's a DNF (Dungeon & Fighter) x Naruto crossover fanfiction where the protagonist uses game mechanics in the ninja world.

**This is NOT a software development project.** There are no build commands, tests, or code to run. All work involves editing markdown files containing story chapters and reference materials.

## Project Structure

### Published Content
- `正文/已发布/` - Published chapters (第一章.md through 第十一章.md)
- Chapters are numbered in Chinese: 第一章 (Chapter 1), 第二章 (Chapter 2), etc.
- Each chapter is approximately 2,000 words (±400 words)

### Reference Materials
- `创作手册_完整版_456章_v2.0.0.md` - Complete creative manual with detailed plot outline for all 456 planned chapters, character profiles, world-building rules, and writing techniques
- `快速参考卡.md` - Quick reference card for core mechanics, skill data, power levels, and combat templates
- `数据表/技能数据库.md` - Skill database with judgment mechanics and visual effects
- `DNF男格斗技能列表.md` - DNF male fighter skill list
- `README.md` - Project navigation guide

### Archive
- `archive/` - Old versions of chapters and deprecated design documents
- `archive/第一分卷_木叶潜龙_第12-100章/` - Archived chapters 12-101
- `archive/精简版_第1-145章_v3.0.0/` - Simplified version with 145 chapters (v3.0.0)
- `archive/docs_历史报告_2026-02-12/` - Historical reports and old creative manual (v1.0.0)
- `archive/specs_已完成_2026-02-12/` - Completed revision tasks (system_rename, chapter_4_plot_fix)
- `archive/审读报告_原始批注_2026-02-06/` - Review reports from Feb 6
- `archive/v1.0_2026-01-11/` - Original v1.0 documents

### Documentation
- `docs/` - Reserved for future documentation (currently empty after 2026-02-12 cleanup)

## Revision Workflow (specs/ folder)

The `specs/` folder is used for planning major revisions to chapters or story elements. When starting a new revision task, create a subfolder with this three-phase structure:

1. **requirements.md** - Define what needs to be changed and why
   - User stories with acceptance criteria
   - Narrative atmosphere and style guidelines

2. **design.md** - Plan how to implement the changes
   - Detailed scene breakdowns
   - Dialogue and action sequences
   - Technical implementation notes

3. **tasks.md** - Break down work into actionable tasks
   - Checklist format for tracking progress

**Completed tasks are archived** to `archive/specs_已完成_[date]/` to keep the specs/ folder clean. The folder is currently empty after the 2026-02-12 cleanup.

## Core Story Mechanics

### System Name
The protagonist's ability system is called **"位面舞王系统"** (Planar Dance King System), previously known as "DNF男格斗技能系统" or "直觉UI系统".

### Key Concepts
- **数值暴力** (Numerical Violence) - Overwhelming enemies through superior mechanics, base stats, and growth potential
- **绝对判定** (Absolute Judgment) - Game-like priority system that overrides traditional ninja techniques
- **直觉UI** (Intuitive UI) - Visual system showing HP bars, weak points, and enemy levels
- **能级颜色** (Power Level Colors) - White (common), Blue (elite), Purple (boss), Gold (legendary)

### Protagonist
- **Name:** 李武 (Li Wu)
- **Identity:** Lee Rock's older brother in the Naruto world
- **Classes:** Striker (散打) + Nen Master (气功师) → Extreme Martial Saint (极武圣) → Return to Origin (归元)
- **Core trait:** Uses DNF game mechanics to protect his brother and change tragic fates

## Writing Guidelines

### Chapter Structure
- Target: 2,000 words per chapter (flexible range: 1,600-2,400 words)
- Focus on action, dialogue, and character moments
- Use DNF terminology naturally: 判定 (judgment), 霸体 (super armor), 位格 (rank/tier)

### Tone and Style
- **Narrative voice:** Cool, analytical protagonist with occasional dry humor
- **Combat descriptions:** Emphasize visual impact and mechanical superiority
- **Emotional beats:** Brotherly bond with Lee, changing tragic fates from original Naruto story

### Key Story Arcs (from 创作手册)
1. **木叶潜龙** (Hidden Dragon in Konoha) - Chapters 1-100: Awakening and first class advancement
2. **晓之阴云** (Shadow of Akatsuki) - Chapters 101-300: Confronting Akatsuki, second class advancement
3. **终极之战** (Ultimate Battle) - Chapters 301-456: Fighting Apostles and Otsutsuki, third class advancement, return home

## Important Notes

- All content is in Chinese (Simplified)
- Chapter files use Chinese numbering: 第一章, 第二章, etc.
- When editing chapters, maintain the existing formatting and style
- Reference 创作手册 for plot continuity and character consistency
- Use 快速参考卡 for quick lookups of mechanics and power levels
- Check 技能数据库 for accurate skill descriptions and effects
