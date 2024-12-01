# Neovim Config

My neovim configuration. Many thanks to [ThePrimeagen](https://github.com/ThePrimeagen) for his [0 to LSP video](https://youtu.be/w7i4amO_zaE?si=6aaoleriSHM82s63), which got me up and running with Neovim. This config is heavily influenced by the setup in that tutorial.

## Setup

1. Go to your `.config` directory:

    ```bash
    cd ~/.config 
    ```
1. Clone the repo: 

    ```bash
    git clone https://github.com/nealwp/nvim-config.git nvim
    ```
1. Run the update script to install the latest stable neovim:

    ```bash
    ./nvim/update
    ``` 
1. Create symlink to appimage:

    ```bash
    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
    ```

1. Run the setup script to make sure Packer is installed 

    ```bash
    ./nvim/setup
    ``` 
1. Launch without plugins and source Packer
    ```bash
    nvim --noplugin
    # when nvim launches run the following commands
    # :source ./nvim/lua/nealwp/packer.lua
    # :PackerSync
    ```
1. Exit and reopen `nvim`

