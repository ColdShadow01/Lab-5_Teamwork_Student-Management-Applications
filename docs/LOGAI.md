# AI Usage & Refactoring Log (LOGAI.md)

## 1. Refactoring Context
- **Task Objective**: Refactor navigation state management by moving the selected navigation index (`currentIndex`) from a local `StatefulWidget` into a separate `Provider` state-management class.
- **AI Prompt Used**:
  > "Refactor this Flutter StatefulWidget containing a NavigationBar and IndexedStack so that currentIndex is managed via Provider. Separate the state logic from the UI to avoid unnecessary rebuilds and ensure null safety."

## 2. Tool Evaluation & Comparison

| Criteria | ChatGPT Codex | Gemini |
| :--- | :--- | :--- |
| **Requirements Adherence** | Full adherence. Provided Provider class and Consumer widget. | Full adherence. Provided ChangeNotifier and used `context.select` for granular rebuild control. |
| **Code Readability** | Bundled everything into one snippet. | Highly modular; separated provider and UI into distinct files with clear explanations. |
| **Null Safety** | Correct null safety syntax. | Correct null safety syntax. |
| **Widget Rebuilds** | Wrapped entire Scaffold in `Consumer`, causing unnecessary rebuilds of static Drawer and AppBar. | Used `context.select` and `context.read` cleanly; only rebuilds the IndexedStack and NavigationBar index. |
| **Flutter Analysis** | 0 errors, 1 info (avoid_print). | 0 errors, 0 warnings. |
| **Corrections Needed** | Had to refactor the `Consumer` out of top-level Scaffold to prevent full page re-renders. | None. Used as the final implementation. |

## 3. Conclusion & Team Code Review
Our group implemented the **Gemini** suggestion. By utilizing `context.select<NavigationProvider, int>((p) => p.currentIndex)`, we successfully prevented the constant `AppBar` and `Drawer` widgets from re-rendering whenever a user switches tabs, directly optimizing the UI rebuilds required by Section 5 of the lab instructions.

The implementation was submitted via Pull Request by Member 1 (Wan - 103014) and peer-reviewed by Member 5.

---

## 4. Student Records & DataTable Implementation (Member 3 - 106089)

### Refactoring & Fix Context
- **Task Objective**: Implement a standalone `StudentRecordsScreen` featuring an interactive `DataTable` with 10 student records, dual-column sorting (Name & CGPA), eliminate layout pixel overflow warnings, and fix Dart analyzer deprecation issues.
- **AI Prompts Used**:
  > "Provide a standalone Flutter DataTable screen with 10 sample student records and ascending/descending sorting for Name and CGPA."
  > "Fix right pixel overflow warning on DataTable and expand it cleanly across screen width."
  > "Fix flutter analyze error: 'withOpacity' is deprecated and shouldn't be used."

### Tool Evaluation & Solution Impact

| Criteria | AI Solution (Gemini) | Impact on Implementation |
| :--- | :--- | :--- |
| **Standalone Architecture** | Provided self-contained `StudentRecord` model and list inside the screen file. | Bypassed missing provider import errors and allowed independent testing. |
| **Responsive Layout** | Refactored table using `Expanded`, `Card`, `SingleChildScrollView`, and `ConstrainedBox`. | Completely eliminated yellow-and-black pixel overflow warning lines. |
| **Dart/Flutter Deprecation** | Replaced deprecated `.withOpacity(0.4)` with `.withValues(alpha: 0.4)`. | Fixed `flutter analyze` warning and achieved green checkmark status on GitHub Actions CI. |

### Conclusion
The AI-assisted layout constraints and Dart syntax updates allowed Member 3 to achieve complete rubric compliance for the Student Records page, pass all automated GitHub Actions CI workflow checks, and resolve merge conflicts smoothly.