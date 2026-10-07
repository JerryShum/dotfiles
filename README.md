# dotfiles

Personal config files, version-controlled so a new machine can be set up in one command.

## Contents

| File | Links to | Summary |
|---|---|---|
| `zshrc` | `~/.zshrc` | Tab completion, zsh-autosuggestions, zoxide (`z <dir>`), zsh-syntax-highlighting |
| `zprofile` | `~/.zprofile` | Loads Homebrew's shell environment |
| `profile` | `~/.profile` | Loads the Rust/Cargo environment |
| `tcshrc` | `~/.tcshrc` | Loads the Rust/Cargo environment (tcsh variant) |
| `gitconfig` | `~/.gitconfig` | Git identity, SSH commit signing, `trunk` as default branch, `wt` alias for `worktree` |
| `claude/settings.json` | `~/.claude/settings.json` | Claude Code permissions, hooks, statusline, enabled plugins, model/effort settings, theme |
| `ghostty/config` | `~/.config/ghostty/config` | Terminal theme (Solarized Osaka Night), font (Fira Code SemiBold), font size |
| `git/ignore` | `~/.config/git/ignore` | Global gitignore |
| `gh/config.yml` | `~/.config/gh/config.yml` | GitHub CLI preferences (`co: pr checkout` alias, protocol, prompts) |
| `herdr/config.toml` | `~/.config/herdr/config.toml` | Herdr workspace multiplexer preferences |
| `zed/settings.json` | `~/.config/zed/settings.json` | Zed editor settings (formatters, agent models, theme, font) |
| `zed/keymap.json` | `~/.config/zed/keymap.json` | Zed custom key bindings |
| `zed/tasks.json` | `~/.config/zed/tasks.json` | Zed project tasks (Television-integrated file finder) |

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
