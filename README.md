# Kali Linux Post-Installation Provisioning Script
<img width="1376" height="768" alt="image" src="https://github.com/user-attachments/assets/30ef194f-11b2-48e6-ae71-d48cc20d5675" />



An automated bash post-installation script designed to rapidly provision a fresh Kali Linux installation. It updates the system core, extracts foundational wordlists, structures clean workspaces, configures an advanced terminal layout emulator, and installs critical Active Directory and Web Enumeration tools directly from official repositories.

## Features
* **System Provisioning:** Fully automates package repository updates (`apt update && apt dist-upgrade`).
* **Terminal Optimization:** Deploys an advanced tabbed terminal emulator for efficient, multi-window screen real estate management.
* **Wordlist Extraction:** Automatically handles the extraction of the standard compressed `rockyou.txt.gz` file.
* **Structured Directories:** Provisions organized workspace folders under `/home/$USER/Workspace/` (`Recon`, `Exploits`, `Wordlists`, `OSINT`).
* **Quality of Life Tweaks:** Disables GNOME desktop screen dimming and lock screens during long running operations.

## 🛠️ Automated Tool Deployment
The script directly installs the following specialized penetration testing tools and utilities:

| Category | Tool | Description |
| :--- | :--- | :--- |
| **System Utilities** | `terminator` | Robust terminal emulator that supports grid-like layout splits, tabs, and simultaneous typing. |
| **Pivoting & Tunnels** | `ligolo-ng` | High-performance TUN interface pivoting framework (Proxy & Agent). |
| **Active Directory** | `bloodyad` | Active Directory privilege escalation framework leveraging specific LDAP calls. |
| **Active Directory** | `kerberoast` | Kerberos authentication assessment and ticket harvesting toolkit. |
| **Active Directory** | `certipy-ad` | Active Directory Certificate Services (AD CS) enumeration and exploitation tool. |
| **Remote Management** | `evil-winrm-py` | Python-implemented WinRM shell interface for interacting with Windows targets. |
| **Web Enumeration** | `feroxbuster` | Extremely fast, recursive content discovery tool written in Rust. |
| **Web Enumeration** | `dirsearch` | Advanced command-line tool designed to brute force web directories and files. |

## ⚙️ Installation & Usage
Follow these quick commands to clone, configure, and execute the initialization script:

1. Create the script file:
   ```bash
   nano kali-setup.sh
   ```
   *Or clone from a repository:*
   ```bash
   git clone https://github.com/HackingHusky/My-custom-repo-install && cd My-custom-repo-install
   ```

2. Paste the code from your setup script into the text editor, save with `CTRL+O`, and exit with `CTRL+X`.

3. Make the script executable:
   ```bash
   chmod +x kali-setup.sh
   ```

4. Run with root privileges:
   ```bash
   sudo ./kali-setup.sh
   ```

## Important Notes
* **Privilege Requirement:** This script handles package operations and must be executed using `sudo`.
* **System Reboot:** It is highly recommended to restart your machine after the script finishes updating system distributions.
* **Wordlist Paths:** The unzipped `rockyou.txt` dictionary will be available in its native home at `/usr/share/wordlists/`.
