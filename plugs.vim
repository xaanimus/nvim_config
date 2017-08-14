"init for plugins

call plug#begin('~/.vim/plugged')

"auto pairs
Plug 'jiangmiao/auto-pairs'

"Gui
Plug 'vim-airline/vim-airline'

"Golang
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

"Python
Plug 'davidhalter/jedi-vim'

"Misc Autocomplete
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
"Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'

"C++
Plug 'lyuts/vim-rtags'

"Julia
Plug 'JuliaEditorSupport/julia-vim'

"react
Plug 'mxw/vim-jsx'

"css
Plug 'othree/csscomplete.vim'

"Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

"Toml
Plug 'cespare/vim-toml'

"qml
Plug 'peterhoeg/vim-qml'

call plug#end()

"Rust settings ===============
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap gt <Plug>(rust-doc)

"Julia settings ===============
let g:default_julia_version = '0.6'

"language server
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       server = LanguageServer.LanguageServerInstance(STDIN, STDOUT, false);
\       server.runlinter = true;
\       run(server);
\   '],
\ }

au FileType julia nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
au FileType julia nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
au FileType julia nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

autocmd FileType jl LanguageClientStart

"init css
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
