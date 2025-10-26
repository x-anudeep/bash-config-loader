# Bash Config Loader

A lightweight Bash-based utility built to demonstrate **environment configuration management** 
using `.env` files, `set -a`, and `source`.  
This project is part of the *Grey-Box – CyberCafe (Sprint 3)* initiative, designed to help 
developers gain hands-on experience with Bash scripting, configuration automation, 
and DevOps workflow practices.

---

## 💡 Project Overview

This project shows how to **load, validate, and log environment configurations** in Bash.  
It ensures your application environment variables are loaded automatically, 
validated for completeness, and logged for audit and debugging purposes.

Each sprint team member focused on a specific Bash concept.  
This module, created by **Anudeep Cherukupalli**, implements a **Config Loader** script that:

- Reads key–value pairs from a `.env` file.
- Uses `set -a` and `source` to automatically export configuration variables.
- Validates that critical environment variables (`WEB_ROOT`, `PORT`, `DEBUG`) are defined.
- Logs progress and results into a timestamped log file.
- Outputs a formatted summary in the terminal for easy readability.

---

## 🚀 Features

- 🔄 Automatic environment loading from `.env`  
- 🧩 Validation for required configuration values  
- 🪵 Persistent logging (`logs/config_loader.log`)  
- 🖥️ Clean, color-friendly summary display  
- 📘 Reference `cheatsheet.md` for learning key Bash concepts  

---

## ⚙️ Usage

```bash
chmod +x loadconf.sh
./loadconf.sh