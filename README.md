# Neovim Config

My neovim configuration. Many thanks to [ThePrimeagen](https://github.com/ThePrimeagen) for his [0 to LSP video](https://youtu.be/w7i4amO_zaE?si=6aaoleriSHM82s63), which got me up and running with Neovim. This config is heavily influenced by the setup in that tutorial.

Requires Neovim 0.12+ (uses the built-in `vim.pack` plugin manager).

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
1. Launch `nvim`. Plugins are installed automatically on first launch via
   Neovim's built-in `vim.pack` plugin manager (see `lua/config/pack.lua`) -
   no extra setup step is required.

## Updating plugins

Run `:packupdate` to check for and interactively apply plugin updates. Once
confirmed (`:write` in the update buffer), commit the resulting
`nvim-pack-lock.json` so the pinned revisions travel with the rest of the
config.
