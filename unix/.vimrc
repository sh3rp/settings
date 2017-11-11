execute pathogen#infect()
call plug#begin('/home/shep/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
call plug#end()
set autowrite
set t_Co=256
set softtabstop=4
set shiftwidth=4
set background=dark
set number
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"
let g:airline_theme = 'cobalt2'
map <C-n> :NERDTreeToggle<CR>
colorscheme PaperColor
