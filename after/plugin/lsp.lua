---[[
local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({})

lsp.set_preferences({
	sign_icons = { }
})

local yaml = {

  schemaStore = {
    enable = true,
    url = "https://www.schemastore.org/api/json/catalog.json",
  },

  schemas = {
    kubernetes = "*.yaml",
    ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
    ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
    ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "azure-pipelines.yml",
    ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
    ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
  },

  format = { enabled = false },
  validate = false,
  completion = true,
  hover = true,

}

lsp.setup({
    settings = {
        yaml = yaml,
    }
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local cmp_select = {behavior = cmp.SelectBehavior.Select}

local cmp_mappings = lsp.defaults.cmp_mappings({

    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm(cmp_select),

    -- Use Ctrl k and j to move up and down completion list
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  })

cmp.setup({
    mapping = cmp_mappings,
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
    },
})
--]]
