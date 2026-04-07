# FEE Team — Git 工作流程

## 分支策略

```
main          ← 生產環境（受保護，禁止直接 push）
staging       ← 測試環境
develop       ← 開發整合
feat/xxx      ← 新功能
fix/xxx       ← Bug 修復
hotfix/xxx    ← 緊急修復
refactor/xxx  ← 重構
```

## 分支命名

```bash
feat/user-authentication
feat/dashboard-analytics
fix/login-redirect-bug
hotfix/payment-calculation
refactor/api-client
docs/update-readme
```

## Commit Message 格式

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type
`feat` | `fix` | `refactor` | `docs` | `test` | `chore` | `perf` | `ci` | `style`

### 範例

```
feat(auth): implement JWT refresh token rotation

Add automatic token refresh before expiry to improve UX.
Tokens now refresh 5 minutes before expiry using a background timer.

Closes #42
```

## PR 規範

1. **分支與 main 保持同步**（rebase 優先）
2. **PR 大小**：建議 < 400 行 diff
3. **自我審查**：提 PR 前先過一遍 checklist
4. **需要至少 1 位 reviewer 核准**才能合併
5. **CI 全部通過**才能合併

## PR Checklist

提交前確認：
- [ ] 功能正確運作（本地測試通過）
- [ ] 測試覆蓋率 >= 80%
- [ ] 無 `console.log` 殘留
- [ ] 無硬編碼密鑰
- [ ] TypeScript 無型別錯誤
- [ ] ESLint 無 error

## Rebase 流程

```bash
# 更新 main
git fetch origin
git rebase origin/main

# 解決衝突後
git add .
git rebase --continue

# 推送（首次需要 force）
git push -u origin feat/my-feature
# 後續更新
git push --force-with-lease
```
