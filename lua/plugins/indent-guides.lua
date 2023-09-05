local m = {
  "Yggdroot/indentLine",
  init = function()
    vim.cmd([[
      let g:indentLine_enabled = 1
      let g:indentLine_char = '▏'
    ]])
  end
}
return {}
