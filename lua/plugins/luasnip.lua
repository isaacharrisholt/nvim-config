return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    local ls = require("luasnip")
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })
    -- include the default astronvim config that calls the setup call
    require("astronvim.plugins.configs.luasnip")(plugin, opts)
    -- load snippets paths
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/snippets" },
    })
  end,
}
