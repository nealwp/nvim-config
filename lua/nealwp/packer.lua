-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

	use 'Mofiqul/vscode.nvim'
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use({
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
      requires = "nvim-treesitter/nvim-treesitter",
    })

	use {
		'VonHeikemen/lsp-zero.nvim',
  		branch = 'v2.x',
  		requires = {
    			-- LSP Support
    			{'neovim/nvim-lspconfig'},             -- Required
    			{                                      -- Optional
      				'williamboman/mason.nvim',
      				run = function()
        				pcall(vim.cmd, 'MasonUpdate')
      				end,
    			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

    			-- Autocompletion
    			{'hrsh7th/nvim-cmp'},     -- Required
    			{'hrsh7th/cmp-nvim-lsp'}, -- Required
    			{'L3MON4D3/LuaSnip'},     -- Required
  		}
	}


    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use({
      "folke/zen-mode.nvim",
    })

    use ({
        'preservim/vim-pencil',
        opt = false,
      })

    use('tpope/vim-fugitive')

    use({
        "folke/twilight.nvim",
        config = function() 
            require("twilight").setup({
                dimming = {
                    alpha = 0.25, -- amount of dimming
                    -- we try to get the foreground from the highlight groups or fallback color
                    color = { "Normal", "#ffffff" },
                    term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
                    inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
                },
                context = 0,
                treesitter = true,
                expand = {
                    "function",
                    "method",
                    "table",
                    "if_statement",
                    "paragraph",
                    "fenced_code_block",
                    "list",
                }
            })
        end
    })

	if packer_bootstrap then
		require('packer').sync()
	end
end)
