# 📝 Neovim (minimax) config

A stable, polished Neovim config built around the [mini.nvim](https://github.com/nvim-mini/mini.nvim)
ecosystem. Designed for a feature-rich, out-of-the-box experience with minimal complexity.

## 🛠️ Installation

Clone into your Neovim config directory and use alias to run it:

```sh
  git clone --depth 1 https://github.com/skyfalconua/minimax-config.git ~/.config/nvim-minimax
  alias vv="NVIM_APPNAME=nvim-minimax nvim"
  vv
```

## 🧹 Clean up

To remove the config and local data:

```sh
  rm -rf ~/.config/nvim-minimax && \
  rm -rf ~/.local/share/nvim-minimax && \
  rm -rf ~/.local/state/nvim-minimax && \
  rm -rf ~/.cache/nvim-minimax
```
