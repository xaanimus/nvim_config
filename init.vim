"autoindenting/tab
filetype plugin indent on
set tabstop=2 "<TAB> when opening
set shiftwidth=2 "<TAB> when entered while editing
set expandtab

"underscores
set iskeyword-=_

"python
let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/usr/local/bin/python3'

let mapleader="\<Space>"

"misc keybindings
inoremap jj <ESC>
nnoremap <leader><space> :nohlsearch<CR>

let g:clang_library_path='/usr/local/opt/llvm/lib'

"misc
set number
syntax on
set showcmd
set wildmenu
set incsearch "search as you enter chars

"backspace
set backspace=indent,eol,start

set smartcase

set directory=~/.vim/swap//

"automatically set current dir
set autochdir

"GUI stuff
so ~/.config/nvim/gui.vim

"Plug stuff
so ~/.config/nvim/plugs.vim

"rtags
function! SetupNeocomleteForCppWithRtags()
    " Enable heavy omni completion.
    setlocal omnifunc=RtagsCompleteFunc

    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let l:cpp_patterns='[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.cpp = l:cpp_patterns 
    set completeopt+=longest,menuone
endfunction
autocmd FileType cpp,c call SetupNeocomleteForCppWithRtags()

let g:latex_to_unicode_tab = 0

inoremap <C-Space> <C-X><C-O>
inoremap <C-@> <C-X><C-O>
