# 1. Разметка диска NixOS
sudo gdisk /dev/nvme1n1
# p → посмотреть
# n → +8G → 8200 (swap)
# n → всё оставшееся → 8300 (root)
# w → Y

# 2. Файловые системы
sudo mkswap -L NIXSWAP /dev/nvme1n1p1
sudo swapon /dev/nvme1n1p1
sudo mkfs.ext4 -L NIXROOT /dev/nvme1n1p2

# 3. Монтирование (ESP Windows → /boot)
sudo mount /dev/nvme1n1p2 /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/nvme0n1p3 /mnt/boot

# 4. Генерация
sudo nixos-generate-config --root /mnt

# 5. Клон
nix-shell -p git
git clone https://github.com/Anasied/nix-modules.git /tmp/cfg
sudo cp -r /tmp/cfg/. /mnt/etc/nixos/

# 6. Установка
sudo nixos-install --flake "path:/mnt/etc/nixos#nixos"
