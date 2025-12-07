-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--------------------
--- CUSTOM MACROs---
--------------------
--- JsLogMacro ---
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.api.nvim_create_augroup("JsLogMacro", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "JsLogMacro",
  pattern = { "javascript", "typescript" },
  callback = function()
    vim.fn.setreg("l", "yoconsole.log('" .. esc .. "pa : " .. esc .. "la, " .. esc .. "pk")
  end,
})
