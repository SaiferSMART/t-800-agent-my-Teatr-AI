#!/usr/bin/env bash
# install-russian-rules-rule.sh — глобальное правило: все rules на русском
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$HERE/.." && pwd)"
RULE_SRC="$ROOT/rules/russian-rules-language.mdc"
RULE_DEST="${HOME}/.cursor/rules/russian-rules-language.mdc"
YES=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --yes) YES=true; shift ;;
    *) shift ;;
  esac
done

if [[ "$YES" != true ]]; then
  echo "Требуется подтверждение: install-russian-rules-rule.sh --yes" >&2
  exit 2
fi

if [[ ! -f "$RULE_SRC" ]]; then
  echo "Не найден шаблон: $RULE_SRC" >&2
  exit 1
fi

mkdir -p "${HOME}/.cursor/rules"
cp -f "$RULE_SRC" "$RULE_DEST"
bash "$HERE/t800-state.sh" set russian_rules_installed true 2>/dev/null || true

echo "OK global rule: $RULE_DEST"
echo "Reload Window в Cursor для применения правила."
