#!/bin/bash
# install.sh — FEE Team Claude Plugin 安裝腳本

set -e

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "🚀 安裝 FEE Team Claude Plugin..."
echo "   Plugin 路徑: $PLUGIN_DIR"
echo "   目標路徑: $CLAUDE_DIR"
echo ""

# 建立必要目錄
mkdir -p "$CLAUDE_DIR/agents"
mkdir -p "$CLAUDE_DIR/skills/fee"
mkdir -p "$CLAUDE_DIR/rules/fee-team"
mkdir -p "$CLAUDE_DIR/hooks"

# 安裝 Agents
echo "📦 安裝 Agents..."
for agent in "$PLUGIN_DIR/agents"/*.md; do
  name=$(basename "$agent")
  cp "$agent" "$CLAUDE_DIR/agents/$name"
  echo "   ✓ agents/$name"
done

# 安裝 Skills
echo "📦 安裝 Skills..."
for skill in "$PLUGIN_DIR/skills/fee"/*.md; do
  name=$(basename "$skill")
  cp "$skill" "$CLAUDE_DIR/skills/fee/$name"
  echo "   ✓ skills/fee/$name"
done

# 安裝 Rules
echo "📦 安裝 Rules..."
for rule in "$PLUGIN_DIR/rules"/*.md; do
  name=$(basename "$rule")
  cp "$rule" "$CLAUDE_DIR/rules/fee-team/$name"
  echo "   ✓ rules/fee-team/$name"
done

# 安裝 Hooks
echo "📦 安裝 Hooks..."
for hook in "$PLUGIN_DIR/hooks"/*.sh; do
  name=$(basename "$hook")
  cp "$hook" "$CLAUDE_DIR/hooks/$name"
  chmod +x "$CLAUDE_DIR/hooks/$name"
  echo "   ✓ hooks/$name"
done

# 安裝 CLAUDE.md（詢問確認）
echo ""
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
  read -r -p "⚠️  $CLAUDE_DIR/CLAUDE.md 已存在，是否覆蓋？[y/N] " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    cp "$PLUGIN_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
    echo "   ✓ CLAUDE.md（已覆蓋）"
  else
    echo "   ⏭  跳過 CLAUDE.md"
    echo "   💡 請手動將 $PLUGIN_DIR/CLAUDE.md 的內容合併至 $CLAUDE_DIR/CLAUDE.md"
  fi
else
  cp "$PLUGIN_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
  echo "   ✓ CLAUDE.md"
fi

# settings.json 提示
echo ""
if [ ! -f "$CLAUDE_DIR/settings.json" ]; then
  echo "💡 尚未設定 settings.json，可參考範例："
  echo "   cp $PLUGIN_DIR/settings.example.json $CLAUDE_DIR/settings.json"
else
  echo "💡 settings.json 已存在，請參考 settings.example.json 手動合併所需設定"
fi

echo ""
echo "✅ 安裝完成！"
echo ""
echo "已安裝的 Agents："
echo "  - fee-planner  → 功能規劃"
echo "  - fee-reviewer → 程式碼審查"
echo "  - fee-tdd      → 測試驅動開發"
echo ""
echo "已安裝的 Skills："
echo "  - /fee:commit → 產生 commit message"
echo "  - /fee:pr     → 建立 Pull Request"
