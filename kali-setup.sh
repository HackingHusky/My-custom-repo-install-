#!/bin/bash

# Ensure the script is run as root
if [ $EUID -ne 0 ]; then
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

# 4. Install Requested Tools and Utilities
echo "[+] Installing requested specialized pentesting tools..."
apt install -y \
  terminator \
  ligolo-ng \
  bloodyad \
  kerberoast \
  dirsearch \
  feroxbuster \
  evil-winrm-py \
  certipy-ad

# 5. Fix common configuration bottlenecks
echo "[+] Configuring quality of life system tweaks..."
# Disable screen dimming/blanking during long operations
gsettings set org.gnome.desktop.session idle-delay 0 2>/dev/null
gsettings set org.gnome.desktop.screensaver lock-enabled false 2>/dev/null

# 6. Initialize Terminator configuration file for the standard user
echo "[+] Generating baseline configuration for Terminator..."
USER_HOME=/home/$SUDO_USER
TERM_CONFIG_DIR=$USER_HOME/.config/terminator
mkdir -p $TERM_CONFIG_DIR

cat << EOF > $TERM_CONFIG_DIR/config
[global_config]
  suppress_multiple_term_dialog = True
[keybindings]
[profiles]
  [[default]]
    background_darkness = 0.85
    background_type = transparent
    cursor_color = #aaaaaa
    foreground_color = #ffffff
    show_titlebar = False
    scrollback_lines = 5000
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      type = Terminal
    [[[window0]]]
      parent = 
      type = Window
[plugins]
EOF

# Correct ownership of the configuration files
chown -R $SUDO_USER:$SUDO_USER $USER_HOME/.config

echo "[+] Setup completed successfully!"
