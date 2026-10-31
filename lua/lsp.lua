local keymap = vim.keymap.set

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        -- Jump to definition
        -- gd / gi / gr are handled by the snacks picker (plugins/snacks.lua).
        keymap('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'Go to declaration' })
        keymap('n', 'gt', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = 'Go to type definition' })
        -- Show documentation
        keymap('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'Show hover documentation' })
        keymap('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = 'Show signature help' })
        -- Refactoring
        keymap('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename symbol' })
        keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Code actions' })
        -- Formatting
        keymap('n', '<leader>f', function()
            vim.lsp.buf.format({ async = true })
        end, { buffer = ev.buf, desc = 'Format buffer' })
        -- Diagnostics (errors and warnings) navigation
        keymap('n', '[d', vim.diagnostic.goto_prev, { buffer = ev.buf, desc = 'Go to previous diagnostic' })
        keymap('n', ']d', vim.diagnostic.goto_next, { buffer = ev.buf, desc = 'Go to next diagnostic' })
        keymap('n', '<leader>e', vim.diagnostic.open_float, { buffer = ev.buf, desc = 'Show diagnostic in float' })
        keymap('n', '<leader>q', vim.diagnostic.setloclist, { buffer = ev.buf, desc = 'Open diagnostic quickfix list' })
    end,
})

-----------------------------------------------
--- Language Servers
-----------------------------------------------

-- diagnostic
vim.diagnostic.config({
    virtual_text = {
        format = function(diagnostic)
            -- shows message (LSP: rule)
            return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
        end,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
})

-- Nix
local nixd_opts = {
    cmd = { 'nixd' },
    filetypes = { 'nix' },
    root_markers = { 'flake.nix', 'shell.nix', '.git' },
    single_file_support = true,
}

vim.lsp.config('nixd', nixd_opts)
vim.lsp.enable('nixd')

-- Lua
local lua_ls_opts = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            diagnostics = {
                unusedLocalExclude = { '_*' },
                globals = { 'vim' }
            }
        }
    }
}

vim.lsp.config('lua_ls', lua_ls_opts)
vim.lsp.enable('lua_ls')

-- Go
local gopls_opts = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.mod', 'go.work', '.git' },
    single_file_support = true,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
}

vim.lsp.config('gopls', gopls_opts)
vim.lsp.enable('gopls')

-- Zig
local zls_opts = {
    cmd = { 'zls' },
    filetypes = { 'zig' },
    root_markers = { 'build.zig', 'build.zig.zon', '.git' },
    single_file_support = true,
}

vim.lsp.config('zls', zls_opts)
vim.lsp.enable('zls')

-- TypeScript / JavaScript
local ts_ls_opts = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
    single_file_support = true,
}

vim.lsp.config('ts_ls', ts_ls_opts)
vim.lsp.enable('ts_ls')

-- Rust
local rust_analyzer_opts = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml', '.git' },
    single_file_support = true,
}

vim.lsp.config('rust_analyzer', rust_analyzer_opts)
vim.lsp.enable('rust_analyzer')

-- Markdown
local marksman_opts = {
    cmd = { 'marksman', 'server' },
    filetypes = { 'markdown' },
    root_markers = { '.marksman.toml', '.git' },
    single_file_support = true,
}

vim.lsp.config('marksman', marksman_opts)
vim.lsp.enable('marksman')
