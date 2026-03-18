#!/usr/bin/env bash
# =============================================================================
# AI South Hack — Setup SSH access for ${team_user}
# =============================================================================
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SSH_DIR="$HOME/.ssh/ai-south-hack"
KEY_NAME="${team_user}-key"

echo "==> Создаём директорию $SSH_DIR"
mkdir -p "$SSH_DIR"

echo "==> Копируем ключи и конфиг"
cp "$SCRIPT_DIR/$KEY_NAME"     "$SSH_DIR/$KEY_NAME"
cp "$SCRIPT_DIR/$KEY_NAME.pub" "$SSH_DIR/$KEY_NAME.pub"
cp "$SCRIPT_DIR/ssh-config"    "$SSH_DIR/ssh-config"

echo "==> Устанавливаем права доступа"
chmod 700 "$SSH_DIR"
chmod 600 "$SSH_DIR/$KEY_NAME"
chmod 644 "$SSH_DIR/$KEY_NAME.pub"
chmod 644 "$SSH_DIR/ssh-config"

echo "==> Проверяем соединение..."
if ssh -F "$SSH_DIR/ssh-config" -o ConnectTimeout=10 -o BatchMode=yes ${team_user} echo "OK" 2>/dev/null; then
  echo ""
  echo "v  Всё готово! Подключайся командой:"
  echo ""
  echo "    ssh -F ~/.ssh/ai-south-hack/ssh-config ${team_user}"
  echo ""
else
  echo ""
  echo "!  Ключи установлены, но соединение не проверено (VM может быть ещё недоступна)."
  echo "   Попробуй подключиться позже:"
  echo ""
  echo "    ssh -F ~/.ssh/ai-south-hack/ssh-config ${team_user}"
  echo ""
fi
