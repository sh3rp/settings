call plug#begin('$HOME/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'AndrewRadev/splitjoin.vim'
"Plug 'SirVer/ultisnips'
call plug#end()
set autowrite
set t_Co=256
set softtabstop=4
set shiftwidth=4
set background=dark
set number
let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"
let g:airline_theme = 'codedark'
let g:deoplete#enable_at_startup = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <C-a> :NERDTreeToggle<CR>
map <C-m> :GoDef<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>
autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)
colorscheme codedark
set expandtab  
set tabstop=2  
set shiftwidth=2  
set autoindent  
set smartindent  
set bg=dark  
set nowrap  
set paste
