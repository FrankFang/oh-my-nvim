local m = {
  'rrethy/vim-hexokinase',
  build = 'make hexokinase',
  init = function() 
    vim.g.Hexokinase_highlighters = {'backgroundfull'}
  end
}

return {}
