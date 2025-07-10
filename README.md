# AWUS036AXML-Kali 🚀

**Auto-installer script for Alfa AWUS036AXL / AXML WiFi adapters on Kali Linux or Parrot OS.**

This script installs required firmware and configures your system to use the **MediaTek MT7921U** chipset, commonly used in Alfa AWUS036AXM and AWUS036AXML USB adapters.

---

## 🔧 Features

- ✅ Installs required kernel headers and dependencies
- ✅ Downloads and installs MT7921U firmware
- ✅ Blacklists conflicting Bluetooth modules
- ✅ Sets permissions and prompts reboot

---

## 💻 Usage

1. **Clone this repository:**

```bash
git clone https://github.com/at0m-b0mb/AWUS036AXML-Kali.git
cd AWUS036AXML-Kali
```

2. **Make the script executable and run it:**

```bash
chmod +x awus036axl-installer.sh
sudo ./awus036axl-installer.sh
```

3. **Reboot your system** when prompted.

4. After reboot, plug in the Alfa adapter and check with:

```bash
lsusb
iwconfig
```

---

## ⚠️ Requirements

- Kali Linux or Parrot OS
- sudo/root access
- Internet connection to download packages and firmware

---

## 🧪 Tested On

- ✅ Kali Linux 2025.2 (64-bit)
- ✅ Alfa AWUS036AXML

---

## 🐛 Troubleshooting

| Problem | Solution |
|--------|----------|
| Adapter not detected | Replug USB and check with `lsusb` |
| No monitor mode | Use `iwconfig` to verify interface; try `sudo ip link set wlan1 down` and set to monitor |
| Firmware not loaded | Ensure firmware files exist in `/lib/firmware/mediatek/` |

---

## 🤝 Contributing

PRs and improvements welcome!  
Feel free to fork and submit a pull request.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙏 Credits

- Based on [sapsan-sklep.pl guide](https://sapsan-sklep.pl/en/blogs/articles/alfa-network-awus036axm-awus036axml-driver-installation-kali-linux-2024-4)
- Inspired by real-world community needs
