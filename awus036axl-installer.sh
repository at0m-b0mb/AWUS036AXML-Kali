#!/bin/bash
# Automatic setup for Alfa AWUS036AXM & AWUS036AXML on Kali Linux or Parrot OS

set -e

echo "[*] Updating system..."
sudo apt update && sudo apt full-upgrade -y

echo "[*] Installing prerequisites..."
sudo apt install -y linux-headers-$(uname -r) build-essential dkms git wget

echo "[*] Setting up Mediatek firmware..."
sudo rm -r /lib/firmware/mediatek/*
sudo mkdir -p /lib/firmware/mediatek
sudo wget -qO /lib/firmware/mediatek/WIFI_RAM_CODE_MT7961_1.bin \
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/mediatek/WIFI_RAM_CODE_MT7961_1.bin
sudo wget -qO /lib/firmware/mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin \
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
sudo chmod 644 /lib/firmware/mediatek/WIFI_*.bin

echo "[*] Blacklisting Bluetooth submodules (mt7921u has built‑in BT)..."
echo -e "blacklist btmtk\nblacklist btusb\nblacklist btrtl" | sudo tee /etc/modprobe.d/blacklist-mt7921u-bt.conf

echo "[*] Driver installation complete. Reboot is required."
read -p "Reboot now? [Y/n]: " REBOOT
if [[ $REBOOT =~ ^[Yy]|""$ ]]; then
  echo "[*] Rebooting..."
  sudo reboot
else
  echo "[*] Please reboot manually before using the adapter."
fi