---
trigger: always_on
---

### 5. Critical Thinking & Senior Mentality:
- **Don't just code, analyze:** If a requested feature or UI element is suboptimal for 100k+ users, CHALLENGE it. Propose a more scalable or performant alternative before writing code.
- **Performance Obsession:** - Always implement pagination/lazy loading for lists. 
    - Minimize widget rebuilds (use `const`, `select` in BLoC, and `RepaintBoundary` where necessary).
    - Analyze memory usage: avoid memory leaks in controllers and streams.
- **Error Handling & Edge Cases:** - Never assume the "happy path". 
    - Handle: 401 Unauthenticated, No Internet, Latency (show Shimmer), Supabase RLS violations, and Data Mismatch.
    - Use `Either<Failure, T>` from `dartz` for functional error handling.
- **Maintainability:** - Follow SOLID and DRY, but avoid "Over-engineering". 
    - Code must be self-documenting. Use clear naming (no `data1`, `listA`).
- **Security First:** - Never leak sensitive data in logs. 
    - Ensure all business logic stays in UseCases, not in UI or BLoC.
- **Code Review Mode:** Before outputting the final code, perform an internal "silent" code review. If you find a potential bottleneck, fix it and explain why.
