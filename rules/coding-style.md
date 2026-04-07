# FEE Team — 編碼風格規範

## TypeScript

### 型別定義
- 使用 `interface` 定義物件結構，`type` 定義聯合型別或工具型別
- 禁止使用 `any`，必要時用 `unknown` 並做型別守衛
- 所有函數需標注回傳型別
- 使用 `readonly` 避免意外 mutation

```typescript
// WRONG
function getUser(id: any): any { ... }

// CORRECT
function getUser(id: string): Promise<User> { ... }
```

### 命名慣例
- 元件：`PascalCase`（`UserCard`, `DashboardLayout`）
- 函數 / 變數：`camelCase`（`fetchUsers`, `isLoading`）
- 常數：`UPPER_SNAKE_CASE`（`MAX_RETRY_COUNT`）
- 型別 / 介面：`PascalCase`（`UserProfile`, `ApiResponse`）
- 檔案：`kebab-case`（`user-card.tsx`, `use-auth.ts`）

## React

### 元件設計
- 優先使用 Function Component + Hooks
- 單一職責：每個元件只做一件事
- Props 解構並提供預設值

```typescript
// WRONG
export function Card(props: any) {
  return <div>{props.title}</div>
}

// CORRECT
interface CardProps {
  title: string
  description?: string
  onClick?: () => void
}

export function Card({ title, description, onClick }: CardProps) {
  return (
    <div onClick={onClick}>
      <h2>{title}</h2>
      {description && <p>{description}</p>}
    </div>
  )
}
```

### Hooks 規則
- 不在條件式或迴圈內呼叫 Hook
- useEffect 依賴陣列必須完整
- 複雜狀態邏輯抽取成 custom hook

### 不可變狀態更新

```typescript
// WRONG
setState(prev => {
  prev.items.push(newItem)  // 直接 mutate!
  return prev
})

// CORRECT
setState(prev => ({
  ...prev,
  items: [...prev.items, newItem]
}))
```

## 檔案組織

```
src/
├── app/              # Next.js App Router
├── components/       # 可重用元件
│   ├── ui/          # 基礎 UI 元件
│   └── features/    # 業務功能元件
├── hooks/            # Custom hooks
├── lib/              # 工具函數、API 客戶端
├── types/            # TypeScript 型別定義
└── store/            # 狀態管理
```

## 程式碼品質

- 函數 < 50 行
- 檔案 < 800 行
- 嵌套層級 <= 4 層（善用 early return）
- 移除所有 `console.log`（使用 logger 工具）
