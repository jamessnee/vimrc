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
let g:airline#extensions#tabline#enabled = 1

match ErrorMsg '\s\+$'

set textwidth=80

let g:indentLine_color_term = 239

function! JumpTexChapter(var1)
  let chapTitle=a:var1
  let searchStr="\chapter{".chapTitle."}"
  let s_flags="cw"
  call search(searchStr, s_flags)
endfunction
command! -nargs=1 JC call JumpTexChapter(<f-args>)

function! JumpTexNextSection(var1)
  let secTitle=a:var1
  let searchStr="\section{".secTitle."}"
  let s_flags="cW"
  call search(searchStr, s_flags)
endfunction
command! -nargs=1 JS call JumpTexNextSection(<f-args>)
