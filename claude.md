# CLAUDE.md

## 🧑‍💻 Development Instructions (Dart)

Follow these steps to ensure code quality, readability, and full test coverage.

---

### 1. 📦 Code in Dart

- Write your code in Dart, following clean architecture and separation of concerns.
- Use null safety.
- Avoid complex logic in UI layers, prefer using riverpod.
- Document public methods and classes using `///`.

---

### 2. 🧹 Run Dart Analyzer

Use Dart analyzer to identify and fix issues:

```bash
dart analyze
```

- Fix **all** warnings and errors.
- Prefer using linter rules and make sure all are resolved.
- Optionally configure `.analysis_options.yaml` to enforce stricter rules if needed.

---

### 3. 🧽 Format the Code

Ensure your code is formatted properly:

```bash
dart format .
```

- This guarantees consistency with Dart style guidelines.

---

### 4. ✅ Run Tests and Check Coverage

Run unit and integration tests:

```bash
flutter test --coverage
```

Or if not using Flutter:

```bash
dart test --coverage=coverage
```

Then convert and view the coverage:

```bash
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

Make sure:

- **Code coverage is 100%**
- All branches and conditions are covered
- No uncovered lines remain in business-critical logic

---

### 5. 🧪 Maintain 100% Code Coverage

- Write exhaustive tests for every feature, class, and edge case.
- Cover exceptions and failure cases.
- Avoid skipping lines or test scenarios.

---

### 6. 📏 Respect Dart Standards

- Follow [Effective Dart](https://dart.dev/effective-dart) guidelines.
- Ensure:
  - Descriptive variable/method names
  - Small, focused functions
  - Immutability when appropriate
  - Separation of concerns
- Lint your code regularly using `dart analyze`.
- withOpacity is depracated, use withValues(alpha:) instead 

---

### 7. 🔁 Commit Workflow (Suggestion)

1. Write your code and tests.
2. Run:
   ```bash
   dart format .
   dart analyze
   flutter test --coverage
   ```
3. Ensure 100% test coverage.
4. Commit with a clear message:
   ```
   feat: add feature X with full test coverage
   ```

---

### ✅ Final Checklist

- [ ] Code is in Dart and properly formatted
- [ ] `dart analyze` shows no issues
- [ ] Test coverage is **100%**
- [ ] Follows Dart and project-specific standards
- [ ] Documentation is up to date

---

Let's keep our code clean, covered, and consistent. 🚀