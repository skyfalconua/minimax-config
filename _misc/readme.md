### Setting up
```sh
# Download
git clone --filter=blob:none https://github.com/nvim-mini/MiniMax ./MiniMax

# Set up config (copies config files and possibly initiates Git repository)
NVIM_APPNAME=nvim-minimax nvim -l ./MiniMax/setup.lua

# Start Neovim
NVIM_APPNAME=nvim-minimax nvim

# Wait for plugins to install (there should be no new notifications)

# Enjoy your new config!
# Start with reading its files. Type `<Space>`+`e`+`i` to open 'init.lua'.
```

### Updating
```sh
bash _misc/rebase.sh
```

### Lua snippets
```lua
-- Standard paths
:lua print(vim.fn.stdpath('config'))
:lua print(vim.fn.stdpath('data'))
:lua print(vim.fn.stdpath('cache'))

-- Add a custom directory to the beginning of the runtimepath
vim.opt.runtimepath:prepend("~/my/custom/plugin/path")

-- Add a custom directory to the end of the packpath
vim.opt.packpath:append("~/another/custom/plugin/path")
```

### Shell snippets
```sh
ls $HOME/.local/share/nvim-minimax/site/pack/deps/opt/
```

## windows scripts
```ps1
git clone --depth 1 https://github.com/skyfalconua/minimax-config.git "$env:LOCALAPPDATA\nvim-minimax"

function vv {
  $env:NVIM_APPNAME = "nvim-minimax"
  nvim $args
}

Remove-Item -Recurse -Force `
  "$env:LOCALAPPDATA\nvim-minimax", `
  "$env:LOCALAPPDATA\nvim-minimax-data", `
  "$env:TEMP\nvim-minimax"
```

### Todo
- mini.files popup styles (if possible)
- more syntaxes highlight
- (maybe) debugger, spectre, etc ...
- (maybe) pack plugins to zip like zpresto
