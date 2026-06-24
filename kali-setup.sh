#!/bin/bash

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "[-] Please run this script with sudo."
  exit 1
fi

echo "[+] Starting fresh Kali Linux configuration with custom packages..."

# 1. Update system and package indices
echo "[+] Updating repositories and upgrading packages..."
apt update && apt dist-upgrade -y

# 2. Extract the standard RockYou wordlist
echo "[+] Checking and unzipping rockyou.txt wordlist..."
if [ -f /usr/share/wordlists/rockyou.txt.gz ]; then
  gunzip -f /usr/share/wordlists/rockyou.txt.gz
  echo "[+] rockyou.txt successfully unzipped."
else
  echo "[!] rockyou.txt.gz not found or already unzipped."
fi

# 3. Build structured workspace directories
echo "[+] Setting up tool folders..."
mkdir -p /home/$SUDO_USER/Workspace/{Recon,Exploits,Wordlists,OSINT}
chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/Workspace

# 4. Install Requested Tools directly from the official Kali repository
# This includes ligolo-ng, bloodyad, kerberoast, dirsearch, feroxbuster, and evil-winrm-py
echo "[+] Installing requested specialized pentesting tools..."
apt install -y \
  ligolo-ng \
  bloodyad \
  kerberoast \
  dirsearch \
  feroxbuster \
  evil-winrm-py

# 5. Fix common configuration bottlenecks
echo "[+] Configuring quality of life system tweaks..."
# Disable screen dimming/blanking during long operations
gsettings set org.gnome.desktop.session idle-delay 0 2>/dev/null
gsettings set org.gnome.desktop.screensaver lock-enabled false 2>/dev/null

echo "[+] Setup completed successfully! Your environment is ready."
