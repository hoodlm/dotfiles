execute pathogen#infect()
syntax on
filetype plugin indent on

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set ruler
set background=dark
set number
set incsearch

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
