# dotfiles

Personal config files for Ghostty, tmux, and Neovim (LazyVim), plus Aerospace and Karabiner scripts.

## Quick start — link everything

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
bash link_dotfiles.sh
```

The script creates symlinks for all configs and backs up any existing files as `<file>.backup.<timestamp>`.

---

## Individual setups

### Ghostty

```bash
mkdir -p ~/.config/ghostty
ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config
```

Key settings: Argonaut theme, font size 18, 80% background opacity, blur.

---

### tmux

```bash
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
```

Reload inside tmux with `prefix + r`. Prefix is `Ctrl-a`.

**Notable bindings:**

| Key | Action |
|-----|--------|
| `prefix + \|` | Horizontal split |
| `prefix + -` | Vertical split |
| `prefix + r` | Reload config |
| `prefix + j/k` | Resize pane down/up |

Tmux layout templates live in `tmux-templates/` — source any script to open a pre-arranged session.

---

### Neovim (LazyVim)

```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
```

Built on [LazyVim](https://github.com/LazyVim/LazyVim). On first launch, Lazy will install all plugins automatically.

Requires Neovim 0.9+.

---

### Aerospace (window manager)

```bash
ln -s ~/dotfiles/aerospace.toml ~/.aerospace.toml
```

---

### Karabiner scripts

Key-remapping scripts are in `karabiner-scripts/`. Import each `.txt` file manually via the Karabiner-Elements complex modifications editor.
