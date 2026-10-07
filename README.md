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
| `claude/themes/catppuccin-macchiato.json` | `~/.claude/themes/catppuccin-macchiato.json` | Catppuccin Macchiato theme, diff colors retuned for a darker terminal background |

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
