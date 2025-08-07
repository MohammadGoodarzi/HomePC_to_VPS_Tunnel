#  Reverse SSH Tunnel from Home PC to VPS

This project creates a **persistent reverse SSH tunnel** from a private machine (e.g., a homelab) to a public VPS. It allows you to access the home PC via your VPS even if the home PC doesn't have a public IP.

**lastest version is in ver4 folder**

## 🇮🇷 توضیحات فارسی
این پروژه یک تونل معکوس SSH بین کامپیوتر خانگی شما و یک سرور مجازی (VPS) برقرار می‌کند. با استفاده از این روش می‌توانید به کامپیوتر خانگی‌تان از طریق سرور دسترسی داشته باشید، حتی اگر کامپیوتر خانگی IP عمومی نداشته باشد. این راه‌حل برای دسترسی از راه دور به هوم‌لب یا کامپیوترهای پشت فایروال بسیار مفید است. 
اگر عجله دارید از فولدر ver1 استفاده کنید و اگر فرصت کافی دارید از فولدر ver4.هر سوالی داشتید ایمیل بزنید و بپرسید

---

##  Included Files

| File | Purpose |
|------|---------|
| `reverse-ssh-tunnel.sh` | The main bash script that starts the tunnel |
| `reverse-ssh.env (please create)`       | Environment variables (VPS IP, ports, etc.) |
| `reverse-ssh.service`   | Systemd service to start the tunnel on boot |

---

##  How It Works

This setup uses a **reverse SSH tunnel** with **SSH key authentication**. It forwards a port on your VPS (e.g. 29876) to the SSH port of your home machine (usually 22), allowing access via:

```bash
ssh -p 29876 your_home_user@your_vps_ip
```

---

##  Setup Instructions

### 1.  Prerequisites

- Ubuntu or other Linux OS (home PC and VPS)

- SSH server installed on both machines:

```bash
sudo apt update && sudo apt install openssh-server
```

- SSH key authentication set up from home PC to VPS:

```bash
ssh-keygen -t ed25519 -C "reverse_tunnel"
ssh-copy-id -p YOUR_VPS_SSH_PORT YOUR_VPS_USER@YOUR_VPS_IP
```

### 2.  Configure Your Connection Details

Create the `reverse-ssh.env` file to set your connection data:

```env
VPS_USER=your_vps_user
VPS_HOST=your.vps.ip.address
VPS_PORT=22
REMOTE_FORWARD_PORT=29876
HOME_SSH_PORT=22
```

### 3.  Copy Files to Proper Locations

Run the following to move everything into place:

```bash
sudo cp reverse-ssh-tunnel.sh /usr/local/bin/reverse-ssh-tunnel.sh
sudo chmod +x /usr/local/bin/reverse-ssh-tunnel.sh

sudo cp reverse-ssh.env /etc/reverse-ssh.env
sudo cp reverse-ssh.service /etc/systemd/system/reverse-ssh.service
```

### 4.  Reload & Start the Systemd Service

```bash
sudo systemctl daemon-reload
sudo systemctl enable reverse-ssh.service
sudo systemctl start reverse-ssh.service
```

### 5.  Verify the Tunnel is Active

Check the service status:

```bash
sudo systemctl status reverse-ssh.service
```

Or view live logs:

```bash
journalctl -u reverse-ssh.service -f
```

---

##  To Stop the Tunnel

```bash
sudo systemctl stop reverse-ssh.service
```

---

##  To Test the Tunnel

Once the tunnel is active, SSH into your home PC via the VPS:

```bash
ssh -p 29876 your_home_user@your.vps.ip.address
```

---

##  Security Notice

**DO NOT** store passwords in `.env` files. Use SSH keys only.

Add `.env` to `.gitignore` if you fork or clone this repo:

```
reverse-ssh.env
```

---

##  Credits

Created by Mohammad Goodarzi.  
Contributions and improvements welcome!

---

##  License

MIT License