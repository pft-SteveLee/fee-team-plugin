---
name: fee:commit
description: 分析 git 變更並產生符合 FEE Team 規範的 commit message。Use when user says "commit", "幫我 commit", "產生 commit message", or has staged/unstaged changes ready to commit.
---

# fee:commit

分析目前的 git 變更並產生符合團隊規範的 commit message。

## 使用方式

```
/fee:commit
```

## 步驟

1. 執行 `git diff --staged` 查看已暫存的變更
2. 執行 `git diff` 查看未暫存的變更
3. 執行 `git status` 查看工作狀態
4. 分析所有變更，理解「做了什麼」及「為什麼」
5. 依照格式產生 commit message

## Commit Message 格式

```
<type>(<scope>): <subject>

<body（選填）>

<footer（選填）>
```

### Type 說明

| Type | 使用時機 |
|------|---------|
| `feat` | 新增功能 |
| `fix` | 修復 Bug |
| `refactor` | 重構（不改功能） |
| `docs` | 文件更新 |
| `test` | 新增或修改測試 |
| `chore` | 建置流程、工具設定 |
| `perf` | 效能改善 |
| `ci` | CI/CD 相關 |
| `style` | 排版調整（不影響邏輯） |

### Scope 範例

`auth`, `dashboard`, `api`, `components`, `hooks`, `utils`, `types`

### 規則

- subject 用**祈使句**（英文）或**動詞開頭**（中文），不加句點
- subject 長度 <= 72 字元
- body 解釋「為什麼」不是「做了什麼」
- Breaking change 在 footer 加 `BREAKING CHANGE:`

## 範例

```
feat(auth): add social login with Google OAuth

Implement Google OAuth 2.0 flow to reduce sign-up friction.
Users can now authenticate with existing Google accounts.

Closes #123
```

```
fix(dashboard): correct revenue calculation for refunded orders

Refunded orders were incorrectly included in total revenue.
Now filters out orders with status 'refunded' before summing.
```

完成後詢問是否要執行 `git commit -m "..."` 提交。
