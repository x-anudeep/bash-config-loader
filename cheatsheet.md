# Bash Config Loader Cheat Sheet

## Key Concepts

| Command | Purpose |
|----------|----------|
| `set -a` | Automatically export all variables defined after this command |
| `source <file>` | Load and execute the contents of a file in the current shell |
| `set +a` | Stop auto-exporting variables |
| `printenv` | Show all exported environment variables |
| `tee -a <file>` | Write output to both terminal and log file |

## Typical Pattern

```bash
set -a
source ./demo.env
set +a