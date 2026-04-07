---
name: fee:pr
description: 從目前分支建立完整的 Pull Request。Use when user says "開 PR", "create PR", "幫我建立 pull request", or is ready to merge a feature branch.
---

# fee:pr

從目前分支建立完整的 Pull Request，包含變更摘要和測試計畫。

## 使用方式

```
/fee:pr
```

## 步驟

1. 執行 `git log main...HEAD --oneline` 查看所有提交
2. 執行 `git diff main...HEAD --stat` 查看異動檔案
3. 確認目前分支是否已推送至遠端
4. 使用 `gh pr create` 建立 PR

## PR 格式

```markdown
## 變更摘要

<!-- 2-4 點說明這個 PR 做了什麼 -->
- 

## 問題背景

<!-- 為什麼需要這個變更？解決什麼問題？ -->

## 實作方式

<!-- 主要的技術決策與取捨 -->

## 測試計畫

- [ ] 單元測試通過 (`npm test`)
- [ ] 本地 E2E 測試通過
- [ ] 在 staging 環境驗證
- [ ] 手動測試核心流程：
  - [ ] ...

## 截圖 / 錄影（UI 變更時必填）

## Checklist

- [ ] 程式碼符合團隊規範
- [ ] 測試覆蓋率 >= 80%
- [ ] 無 console.log 殘留
- [ ] 無硬編碼密鑰
- [ ] CLAUDE.md / README 如有需要已更新
```

## 注意事項

- 新分支使用 `gh pr create --base main`
- 加上 `--draft` 建立草稿 PR
- 使用 `--label` 加上適當標籤（`bug`, `enhancement`, `documentation`）
