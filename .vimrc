set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=nicr
syntax on
highlight Comment ctermfg=green
set number
filetype plugin on
set ofu=syntaxcomplete#Complete
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

let g:SuperTabDefaultCompletionType = "context"
let g:clang_complete_copen = 1
highlight Pmenu ctermfg=black  ctermbg=grey
highlight PmenuSel ctermfg=black ctermbg=green

" Tab management
map <F7> :tabp <CR>
map <F8> :tabn <CR>

" Paste insert quick key
nmap \o :set paste!<CR>

" Make keys behave like the _other_ editor
inoremap <C-a> <Home>
inoremap <C-e> <End>
map <C-a> <Home>
map <C-e> <End>

" Better searching
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>

" Pathogen plugin manager
execute pathogen#infect()

" NERD tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-o> :NERDTreeToggle<CR>

" vim-airline
set laststatus=2

match ErrorMsg '\s\+$'

set textwidth=80

let g:indentLine_color_term = 239
"let g:indentLine_color_tty_light = 1
