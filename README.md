#  NVIM Config
This is my simple nvim 0.8.0 config for my daily working.
![](src-readme/nvim_home.png)
<p align="center">
    <img src='./src-readme/nvim_davindj_ss_diagnostic.png' width="49%">
    <img src='./src-readme/nvim_davindj_ss_codeoutline.png' width="49%">
    <img src='./src-readme/nvim_davindj_ss_codereference.png' width="49%">
    <img src='./src-readme/nvim_davindj_ss_telescope.png' width="49%">
</p>

<sub>_Notes: for the background you must set your own background in your terminal emulator._</sub>

## 🌟 Overview
### Main
- Config for newest [neovim](https://neovim.io) 0.8.0
- Use [**Packer**](https://github.com/wbthomason/packer.nvim) as nvim plugin manager

### Plugins & Features
- **Easy File Navigation** with [**Telescope**](https://github.com/nvim-telescope/telescope.nvim) & [**Harpoon**](https://github.com/ThePrimeagen/harpoon). 
    - Find file like `ctrl` + `p` in vsc*de
    - See all commits and file changes in your git repo
    - Search manual, help, documentation.
    - Bookmark file and navigate easily with just few keystroke
- **LSP Integrated**. Makes neovim IDE-ish
    - Show Diagnostic such as Warning, Hint, Error of your codebase.
    - Code Action 💡
    - Go to Variable Definition & Implementation. (with help of [lspsaga](glepnir/lspsaga.nvim))
    - Format Whole Document.
    - See document outline and navigate to each property.
    - AutoComplete. (using [cmp](https://github.com/hrsh7th/nvim-cmp))
    - Snippet. (using [ultisnips](https://github.com/SirVer/ultisnips))
    - Show Hint & Detail Parameter during Code Writing (using [lsp_signature](https://github.com/ray-x/lsp_signature.nvim))
- **Linting** with [ale](https://github.com/dense-analysis/ale).
- **Better source code highlighting and context navigation** with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
    - Select function & classes with motion (using [treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects))
    - Show code context where we in such as func, class & others block (using [treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context))
- **Code Commentary with motion** with [Comment](https://github.com/numToStr/Comment.nvim). (also support treesitter motion)
- **Working Git File Changes** with [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
    - Highlight Changes in sign column
    - Jump to changes
    - Revert changes in hunk and file scope
    - Preview changes
    - See author of code/changes (git blame)
- **Project Structure** with [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua). see project structure and interact with your file.
- **Customized Start Screen** with [startify](https://github.com/mhinz/vim-startify), show your recently edited files and bookmarked files. you can also go to that file.

### Other Plugins
- [tokyonight](https://github.com/folke/tokyonight.nvim), colorscheme. TOKIOOOO FTW
- [lspkind](https://github.com/onsails/lspkind.nvim), better cmp UI
- [lualine](https://github.com/nvim-lualine/lualine.nvim), better statusline UI instead of native nvim statusline
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim), indent highlighting
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons), icon
- [presence](https://github.com/andweeb/presence.nvim), Discord Rich Presence show what you working now and time ellapse in your discord.


## 🔧 Requirement
Here's few importants requirements to use this config perfectly.

### OS Requirement
- MacOS or ANY Linux Distros
> For Windows User, I **HIGHLY RECOMMEND** to use [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).  

<sub>*Just migrate to Mac or Linux will ya :)*</sub>

### Software Requirement
- **Neovim** <sub>(duh)</sub>. Get it on your favorite OS package manager such as brew (for MacOS), dnf, apt.
```sh
# for brew
$ brew install neovim

# to check wether proper neovim is properly installed
$ nvim --version
```
- **pynvim**. This is used by **ultisnips** engine for snippet.
```sh
$ python3 -m pip install --user --upgrade pynvim
```
- **ripgrep**. This is used by **telescope** for `live_grep` features. You can install ripgrep in your OS Package Manager.
```sh
# for brew
$ brew install ripgrep
```

### LSP Requirement 
LSP is used to make your text editor smarter and have context of your codebase, or to make your text-editor become IDE. Since LSP for each programming language is different you can install your favorite programming languages LSP.
- **TSServer**. LSP for Javascript & Typescript. You'll need [npm](https://www.npmjs.com)
    ```bash
    # Install LSP
    $ sudo npm i -g typescript typescript-language-server

    # Check Path & Installation
    $ typescript-language-server --version
    ```
- **GOPLS**. LSP for Go. You'll need to install [go](https://go.dev).  
    Make sure `go/bin` is accessible in `$PATH`
    ```sh
    # ~/.zshrc
    export PATH="$PATH:$HOME/go/bin"
    ```          
    Install LSP
    ```bash
    # Install LSP
    $ go install golang.org/x/tools/gopls@latest

    # Check Path & Installation
    $ gopls version
    ```
- **SourceKit**. LSP for Swift. For this LSP there are few ways to install it. For me the easiest way is to just install [xcode](https://developer.apple.com/xcode/), because xcode come with LSP. but you can see other installation method on [their official repo](https://github.com/apple/sourcekit-lsp). And after that make sure `sourcekit-lsp` is accessible in `$PATH`
    ```sh
    # ~/.zshrc
    export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"
    ```
_Notes: if installation succeed but you can't run that LSP, make sure that your LSP is accessible in `$PATH`_

### UI Requirement
This config use [nerdfont](https://www.nerdfonts.com/font-downloads), so you'll need to set your terminal emulator font using nerdfont and enable ligature options.


## 🏃‍♂️ Getting Started
After you met all the requirement and done setup. Follow this step to use my nvim config
1. Clone / download this project anywhere
```sh
$ git clone https://github.com/davindj/nvim-config
```
2. Move config to nvim configuration folder `~/.config/nvim`
```sh
# make sure you backup your nvimconfig, otherwise it will be overwritten
$ mv ./nvim-config ~/.config/nvim
```
3. Run neovim
```sh
$ nvim
```
4. On the neovim, run this command to make sure all plugins were installed properly.
```
:PackerSync
```
5. Done!. Enjoy my config 😜.


## 🎯 TODO Next
- Mess around with Telescope
- Create customized snippet w/ ultisnips
- Explore Debugging Plugin
- Explore GIT-related Plugin 
- Config markdown plugin. seriously rn I use vsc*de for create this `readme.md`
- Add keymap list in this readme
- Update Preview NVIM in this readme (tokioooo)


## 📒 Additional Notes
If you have some tips 👍, ideas 💡, recommendations 📝, or even BUGG 👾, feel free to contact me :). And if you find this config useful, don't forget to give a 🌟
