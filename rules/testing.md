# FEE Team — 測試規範

## 工具

| 工具 | 用途 |
|------|------|
| Vitest | 單元測試 / 整合測試框架 |
| React Testing Library | 元件測試 |
| Playwright | E2E 測試 |
| MSW (Mock Service Worker) | API Mock |

## 覆蓋率要求

最低 **80%**（Statements, Branches, Functions, Lines）

```bash
# 執行並輸出覆蓋率
npx vitest run --coverage

# 監視模式
npx vitest --coverage
```

## 測試結構

```
src/
├── components/
│   ├── UserCard.tsx
│   └── UserCard.test.tsx      # 同目錄放測試
├── hooks/
│   ├── useAuth.ts
│   └── useAuth.test.ts
└── lib/
    ├── formatDate.ts
    └── formatDate.test.ts

tests/
└── e2e/
    ├── auth.spec.ts
    └── dashboard.spec.ts
```

## 測試命名規範

```typescript
describe('元件/函數名稱', () => {
  describe('方法或情境', () => {
    it('應該 [預期行為] 當 [條件]', () => { ... })
  })
})
```

範例：
```typescript
describe('LoginForm', () => {
  describe('提交行為', () => {
    it('應該呼叫 onSubmit 當表單有效時', async () => { ... })
    it('應該顯示錯誤訊息當密碼為空時', async () => { ... })
  })
})
```

## TDD 工作流

```
RED   → 寫測試（確認失敗）
GREEN → 最小實作（讓測試通過）
IMPROVE → 重構（不破壞測試）
```

## API Mock 策略

使用 MSW 進行 API mock，避免直接 mock 模組：

```typescript
// src/mocks/handlers.ts
import { http, HttpResponse } from 'msw'

export const handlers = [
  http.get('/api/users', () => {
    return HttpResponse.json([
      { id: 1, name: 'Alice' },
      { id: 2, name: 'Bob' }
    ])
  })
]
```

## E2E 測試範圍

僅針對關鍵用戶流程：
1. 登入 / 登出
2. 核心業務流程（依專案定義）
3. 付款流程（如有）
4. 權限控制驗證
