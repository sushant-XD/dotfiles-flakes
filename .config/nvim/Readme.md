# Neovim Configuration with Lazyvim 
This is a neovim configuration that comes with handy keybindings and some plugins that I've found useful for myself.
Uses lazy.nvim as plugin manager. 
Configured for C++ and Rust, including linting, autocomplete, etc.

Feel free to clone and customize this configuration for your own personal use. 
Install plugins in lua/plugins/ directory, create a new .lua file (recommeneded) or add in the lua/plugins/init.lua file.
For just installing plugins and short ones, I'd recommend installin in init.lua file instead of creating a new one.

## Installation
1) Backup the existing neovim configuration: `mv ~/.config/nvim ~/.config/nvim.bak/`
2) Create a new nvim configuration folder: `mkdir ~/.config/nvim/`
2) Install this configuration: `git clone git@github.com:sushant-XD/neovim-config.git ~/.config/nvim/`
3) Customize as required by making changes in the `~/.config/nvim/` configuration 

### Common problems
1) ***PATH not being configured properly for linting, styling*** -- install corresponding packages (cmake, rust, etc.) via Mason or manually 
and make sure to add to PATH directory if installing externally

2) ***Symbols not visible as expected***  -- install nerd fonts 

3) ***MD files errors*** -- While opening .md files, you might see errors because of obsidian plugin. Obsidian is a plugin
for creating notes from neovim that can be opened by obsidian easily. Its a really good tool for notetaking. If you don't
want to use Obsidian though, just add `enabled=false` in the `obsidian.lua` file. Or (better), create vaults that Obsidian can find:
`mkdir -p ~/vaults/personal`
`mkdir -p ~/vaults/work`
Or change the path in which Obsidian searches for vaults in the `obsidian.lua` plugin in `lua/{username}/plugins/obsidian.lua`
