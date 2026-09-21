# Установка NixOS 26.05 — Ryzen 5 7500F / RX 7900 GRE / Niri

## 1. Разметка диска
sudo gdisk /dev/nvme1n1
# p → посмотреть
# n → +8G → 8200 (swap)
# n → всё оставшееся → 8300 (root)
# w → Y

## 2. Файловые системы
sudo mkswap -L NIXSWAP /dev/nvme1n1p1
sudo swapon /dev/nvme1n1p1
sudo mkfs.ext4 -L NIXROOT /dev/nvme1n1p2

## 3. Монтирование (ESP Windows → /boot)
sudo mount /dev/nvme1n1p2 /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/nvme0n1p3 /mnt/boot

## 4. Генерация hardware-configuration.nix
sudo nixos-generate-config --root /mnt

## 5. Клонирование конфига
nix-shell -p git --run "git clone https://github.com/Anasied/nix-modules.git /tmp/cfg"
sudo cp -r /tmp/cfg/. /mnt/etc/nixos/

## 6. Установка
# Включаем flakes для текущей сессии установщика
sudo mkdir -p /etc/nix
echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf

# Ставим систему
sudo nixos-install --flake /mnt/etc/nixos#nixos

## 7. После перезагрузки
passwd   # задать пароль пользователю anasied (initialPassword убран из конфига)
