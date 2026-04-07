#!/bin/bash
# post-edit-lint.sh
# PostToolUse hook：編輯 TypeScript/JavaScript 檔案後自動執行 lint
#
# 設定方式：在 ~/.claude/settings.json 的 hooks 區塊加入：
# {
#   "hooks": {
#     "PostToolUse": [
#       {
#         "matcher": "Edit|Write",
#         "hooks": [{ "type": "command", "command": "~/.claude/hooks/post-edit-lint.sh" }]
#       }
#     ]
#   }
# }

# 取得被編輯的檔案路徑（由 Claude Code 透過環境變數傳入）
FILE_PATH="${CLAUDE_TOOL_RESULT_FILE_PATH:-}"

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# 只處理 TypeScript / JavaScript 檔案
if [[ ! "$FILE_PATH" =~ \.(ts|tsx|js|jsx|mts|cts)$ ]]; then
  exit 0
fi

# 確認 eslint 存在
if ! command -v npx &> /dev/null; then
  exit 0
fi

# 執行 ESLint（僅修復可自動修復的問題）
echo "🔍 ESLint: $FILE_PATH"
npx eslint --fix "$FILE_PATH" 2>/dev/null

# 執行 Prettier 格式化
if npx prettier --version &> /dev/null 2>&1; then
  echo "✨ Prettier: $FILE_PATH"
  npx prettier --write "$FILE_PATH" 2>/dev/null
fi

exit 0
