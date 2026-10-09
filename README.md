# dotfiles

Personal config files, version-controlled so a new machine can be set up in one command.

## Contents

| Application | Files | Summary |
|---|---|---|
| Shell | `zshrc`, `zprofile`, `profile`, `tcshrc` | zsh completion, autosuggestions, zoxide, syntax-highlighting; Homebrew and Cargo environment setup |
| Git | `gitconfig`, `git/ignore` | Identity, SSH commit signing, `trunk` as default branch, `wt` alias, global gitignore |
| GitHub CLI | `gh/config.yml` | `co: pr checkout` alias, protocol, prompts |
| Claude Code | `claude/settings.json`, `claude/CLAUDE.md`, `claude/themes/catppuccin-macchiato.json` | Permissions, hooks, statusline, enabled plugins, model/effort settings, global instructions, custom theme |
| Ghostty | `ghostty/config` | Terminal theme (Solarized Osaka Night), font (Fira Code SemiBold), font size |
| Herdr | `herdr/config.toml` | Workspace multiplexer preferences |
| Zed | `zed/settings.json`, `zed/keymap.json`, `zed/tasks.json` | Formatters, agent models, theme, font, custom keybindings, Television-integrated file finder task |

## Install

```sh
./install.sh
```

What it does:
1. Finds this repo's own location (works no matter where it's cloned).
2. For each file above, symlinks it to its target path in `$HOME`.
3. If something already exists at that target and isn't already this symlink, moves it to `<file>.bak` first — nothing is overwritten silently.
4. Safe to re-run; already-linked files are skipped.

To set up a new machine:
```sh
git clone https://github.com/JerryShum/dotfiles.git
cd dotfiles
./install.sh
```
