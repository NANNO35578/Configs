-- init.lua / lualine.lua
require("config.lazy")
-- local nyan = require("nyan_font")

-- 在 init.lua 中添加以下内容
vim.opt.number         = true   -- 显示绝对行号
vim.opt.relativenumber = true   -- 显示相对行号
vim.opt.wrap           = false  -- 不折行
vim.opt.laststatus     = 3

-- 启用自动匹配括号
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', ')', ')<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', ']', ']<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '}', '}<Left>', { noremap = true })


-- tmux彩色支持
-- init.vim
-- if has('termguicolors')
--  set termguicolors
-- endif 
-- colorscheme = everforest

-- autocmd FileType c,cpp nnoremap <leader>f :%!clang-format<CR>
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"c", "cpp"},  -- 针对 C 和 C++ 文件
    callback = function()
        -- 设置快捷键
        vim.api.nvim_set_keymap('n', '<leader>f', ':%!clang-format<CR>', { noremap = true, silent = true })
    end,
})

-- vim.o.laststatus = 2
-- vim.o.statusline = '%{g:NyanModoki()}'
-- vim.g.nyan_modoki_select_cat_face_number = 2
-- vim.g.nyan_modoki_animation_enabled = 1

local function moving_cat()
  local total = vim.fn.line('$')
  local current = vim.fn.line('.')
  local width = 40
  local pos = math.floor((current - 1) / (total - 1) * (width - 1) + 0.5)
  local bar = ""
  for i = 0, width - 1 do
    if i == pos then
      bar = bar .. '🫠'
    else
      if i < pos then
        bar = bar .. "%#LualineCatBar#━"
      else
        bar = bar .. "%#LualineCatTrail#━"
      end
    end
  end
  return bar
end



-- 在 init.lua 中
require'lualine'.setup {
  options = { 
    theme = 'everforest', 
  },
  sections = {
    lualine_c = {
      'filename',
      moving_cat,
      -- nyan.nyan_font,
    }
  }
}

-- set relativenumber
-- autocmd FileType c,cpp nnoremap <leader>f :%!clang-format<CR>

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- 使用 luasnip 作为片段引擎
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
})

vim.cmd([[
  highlight! LualineCatBar guifg=#a7c080 guibg=#343F44 ctermfg=108 ctermbg=237
  highlight! LualineCatTrail guifg=#859289 guibg=#343F44 ctermfg=245 ctermbg=237
]])


