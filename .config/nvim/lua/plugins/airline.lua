return {
  {
    "bling/vim-airline",
    lazy = false,
    init = function()
      vim.cmd("let g:airline_theme='bubblegum'")
      vim.cmd("let g:airline#extensions#whitespace#symbol = '!'")
    end,
  }
}
