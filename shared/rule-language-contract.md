# T-800 — язык rules (*.mdc)

## Закон

Все **Cursor rules** (`*.mdc`) — **только на русском языке**:

- `description` в frontmatter (текст значения)
- заголовки и списки в теле правила
- пояснения, триггеры, запреты

## Исключения (не переводить)

| Что | Пример |
|-----|--------|
| Имена файлов и пути | `agents/t-800-scout.md`, `~/.cursor/rules/` |
| Вызовы субагентов | `Task(t-800-factory)` |
| Команды | `/t800-start`, `/t800-bootstrap` |
| Ключи YAML frontmatter | `description`, `alwaysApply`, `globs` |
| Идентификаторы в коде | `readonly: true`, `artifact_surface` |

Цитаты из англоязычной документации API — допустимы **с кратким русским пояснением** рядом.

## Кто обязан соблюдать

| Роль | Действие |
|------|----------|
| Main chat / любой агент | Создаёт и правит rules на русском |
| `t-800-factory-builder` | Черновики `rules/*.mdc` — русский |
| `t-800-factory-integrator` | Финальные rules в plugin/workspace/user — русский |
| `t-800-maintainer` | KB и plugin rules — русский |

## Глобальное правило пользователя

Файл: `~/.cursor/rules/russian-rules-language.mdc`
`alwaysApply: true` — во всех проектах.

Устанавливается при bootstrap или по явной просьбе пользователя.

## Проверка (auditor)

FAIL, если в новом/изменённом rule:

- заголовки или bullets целиком на английском без причины;
- `description` на английском (кроме технических токенов из таблицы исключений).
