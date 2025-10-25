# Bash Config Loader

A lightweight Bash utility that demonstrates how to load and validate environment
variables from a `.env` file using `set -a` and `source`.

Developed by **Anudeep Cherukupalli**  
as part of the *Grey-Box - CyberCafe* project (Sprint 3).

---

## 🚀 Features
- Automatically exports all variables in `.env` using `set -a`
- Validates required configuration keys (`WEB_ROOT`, `PORT`, and `DEBUG`)
- Logs activity to `logs/config_loader.log`
- Prints a formatted configuration summary
- Includes a reference `cheatsheet.md` for Bash environment commands

---

## 🧩 Usage

```bash
chmod +x loadconf.sh
./loadconf.sh