# Fee Team Claude Plugin

前端工程團隊 (FEE Team) 的 Claude Code 共用設定與工具集。

## 功能

- 統一的 AI 輔助開發規範
- 客製化 Agents（規劃、審查、測試等）
- 團隊專屬 Skills
- Git Hooks 自動化流程

## 目錄結構

```
fee-team-plugin/
├── CLAUDE.md              # 全域指令（複製至 ~/.claude/CLAUDE.md）
├── agents/                # 自訂 Agents
│   ├── fee-planner.md
│   ├── fee-reviewer.md
│   └── fee-tdd.md
├── skills/                # 自訂 Skills（namespace: fee）
│   └── fee/
│       ├── commit.md      # /fee:commit
│       └── pr.md          # /fee:pr
├── rules/                 # 編碼規範
│   ├── coding-style.md
│   ├── testing.md
│   └── git-workflow.md
├── hooks/                 # Hook 腳本
│   └── post-edit-lint.sh
├── settings.example.json  # settings.json 範例
└── install.sh             # 一鍵安裝腳本
```

## 快速安裝

```bash
git clone git@github.com:pft-SteveLee/fee-team-plugin.git
cd fee-team-plugin
./install.sh
```

## 手動安裝

```bash
# 1. 複製 CLAUDE.md
cp CLAUDE.md ~/.claude/CLAUDE.md

# 2. 安裝 agents
cp -r agents/* ~/.claude/agents/

# 3. 安裝 skills
cp -r skills/* ~/.claude/skills/

# 4. 安裝 rules
cp -r rules ~/.claude/rules/fee-team

# 5. 設定參考
cat settings.example.json
```

## 貢獻方式

1. 新增 Agent/Skill 請放到對應目錄並提 PR
2. 規範更新請更新 `rules/` 目錄
3. 安裝腳本如有異動請同步更新 `install.sh`
