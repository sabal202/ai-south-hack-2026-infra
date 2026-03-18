# AI South Hack — Подключение к серверу команды ${team_user}

## Быстрый старт

### Mac / Linux

1. Открой терминал
2. Перейди в папку с этим файлом:
   ```
   cd ~/Downloads/team-${team_user}
   ```
3. Запусти скрипт:
   ```
   bash setup.sh
   ```
4. Подключись:
   ```
   ssh -F ~/.ssh/ai-south-hack/ssh-config ${team_user}
   ```

### Windows

1. Кликни **правой кнопкой** на файл `setup.ps1`
2. Выбери **«Запустить с помощью PowerShell»**

   > Если появится ошибка о политике выполнения:
   > открой PowerShell и выполни один раз:
   > ```
   > Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
   > ```
   > Затем снова запусти `setup.ps1`

3. Подключись через терминал (PowerShell):
   ```
   ssh -F $HOME\.ssh\ai-south-hack\ssh-config ${team_user}
   ```

---

## Ручная установка (если скрипт не работает)

### Mac / Linux

```bash
mkdir -p ~/.ssh/ai-south-hack
cp ${team_user}-key     ~/.ssh/ai-south-hack/
cp ${team_user}-key.pub ~/.ssh/ai-south-hack/
cp ssh-config           ~/.ssh/ai-south-hack/
chmod 600 ~/.ssh/ai-south-hack/${team_user}-key
ssh -F ~/.ssh/ai-south-hack/ssh-config ${team_user}
```

### Windows (PowerShell)

```powershell
New-Item -ItemType Directory -Force "$HOME\.ssh\ai-south-hack"
Copy-Item "${team_user}-key"     "$HOME\.ssh\ai-south-hack\"
Copy-Item "${team_user}-key.pub" "$HOME\.ssh\ai-south-hack\"
Copy-Item "ssh-config"           "$HOME\.ssh\ai-south-hack\"
ssh -F "$HOME\.ssh\ai-south-hack\ssh-config" ${team_user}
```

---

## Что внутри этого архива

| Файл | Описание |
|------|----------|
| `${team_user}-key` | Приватный SSH-ключ (не передавай никому) |
| `${team_user}-key.pub` | Публичный SSH-ключ |
| `ssh-config` | Конфиг SSH для автоматического ProxyJump через bastion |
| `setup.sh` | Скрипт установки для Mac/Linux |
| `setup.ps1` | Скрипт установки для Windows |

---

## Адреса

- **Bastion:** `bastion.${domain}`
- **Твой сервер:** `${team_user}.${domain}` (через bastion)
