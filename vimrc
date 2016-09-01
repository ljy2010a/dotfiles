if exists('$TMUX')
    set term=screen-256color
endif

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'Shougo/neocomplete'
Plug 'kien/ctrlp.vim'
Plug 'plasticboy/vim-markdown'
Plug 'altercation/vim-colors-solarized'

Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1

Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

" Plug 'scrooloose/syntastic'
" Plug 'gmarik/vundle'
" Plug 'Align'
" Plug 'msanders/snipmate.vim'
" Plug 'slim-template/vim-slim'
" Plug 'othree/html5.vim'
" Plug 'VundleVim/Vundle.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'benmills/vimux'
         
call plug#end()

set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
syntax on
set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set relativenumber
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case 
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw

set mouse=a
set wildmenu


" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2

" 80 clumn
" set textwidth=80
" set wrap
" set tw=80 fo+=Mm 
" au BufRead,BufNewFile *.c,*.cpp,*.py,*.go 2match Underlined /.\%81v/
" au BufRead,BufNewFile *.c,*.cpp,*.py,*.go match Error /\%80v.\%81v./


" Tab
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab


" markdown
let g:vim_markdown_folding_disabled = 1


" Colorscheme
syntax enable
set t_Co=256
let g:rehash256 = 1
colorscheme solarized
set background=dark
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000


" Yank text to the OS X clipboard" 将文本复制到OS X剪贴板中
set clipboard=unnamed
noremap <leader>y "*y
noremap <leader>yy "*Y
  
"  " Preserve indentation while pasting text from the OS X clipboard 在粘贴OS
"  X剪贴板中的文本时保留缩进
" noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>


" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif


" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif


" set mapleader
let mapleader = ","

" Navigator split window
nmap <Up> <c-w>k
nmap <Down> <c-w>j
nmap <Right> <c-w>l
nmap <Left> <c-w>h

" Save
nmap <F2> :w<cr>
" Save all
nmap <F3> :wa<cr>
" Close
nmap <F4> :q<cr>
" Format all
nmap <F11> gg=G<C-o>
nmap <A-up> :lprev<cr>
nmap <A-down> :lnext<cr>
nmap <A-right> :ll<cr>
map <F5> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F6> :GoMetaLinter<cr>

" Jump to next error with Ctrl-n and previous error with Ctrl-p. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h


autocmd BufRead,BufNewFile *.json set filetype=json

autocmd FileType make set noexpandtab tabstop=4 shiftwidth=4
autocmd FileType python set tabstop=4 shiftwidth=4


" airline 
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#buffer_nr_show = 1


" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 3
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['go'] }


" UltiSnips setting
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let g:go_list_height = 5
let g:go_list_type = "quickfix"

let g:go_autodetect_gopath = 0
let g:go_auto_type_info = 1

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

let g:go_metalinter_autosave = 1
" let g:go_metalinter_enabled = ['errcheck']
let g:go_metalinter_autosave_enabled = ['varcheck']
" let g:go_metalinter_autosave_enabled = ['errcheck']
let g:go_metalinter_deadline = "30s"


" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

" let g:syntastic_enable_go_checker = 1
" let g:syntastic_auto_loc_list = 3
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_go_checkers = ['gofmt','govet', 'errcheck', 'go']
" let g:syntastic_go_checkers = ['gofmt', 'golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" ==================== UltiSnips ====================
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"


" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction


let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
