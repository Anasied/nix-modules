# Установка NixOS 26.05 — Ryzen 5 7500F / RX 7900 GRE / Niri
## 1. Разметка диска
lsblk

sudo mkfs.ext4 -L NIXROOT /dev/nvmeXnXpX

## 2. Монтирование (ESP Windows → /boot)
sudo mount /dev/nvmeXnXpX /mnt

sudo mkdir -p /mnt/boot

sudo mount /dev/nvmeXnXpX /mnt/boot

## 3. Генерация hardware-configuration.nix
sudo nixos-generate-config --root /mnt

## 4. Клонирование конфига
nix-shell -p git

git clone https://github.com/Anasied/nix-modules.git /tmp/cfg

## Убираем Git отслежку
rm -rf /tmp/cfg/.git

# Копируем конфиг
sudo cp -r /tmp/cfg/. /mnt/etc/nixos/

## 5. Установка
# Включаем flakes для текущей сессии установщика
sudo mkdir -p /etc/nix

echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf

# Ставим систему
sudo nixos-install --flake /mnt/etc/nixos#nixos

# После установки
sudo umount -R /mnt

reboot

## 6. Для будущих исправлений
sudo nixos-rebuild switch --flake /etc/nixos#nixos
