call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "Fuzzy searching
Plug 'junegunn/fzf.vim'                 "Fuzzy searching in vim
Plug 'kshenoy/vim-signature'            "visible marks
Plug 'neomake/neomake'                  "linting
Plug 'crusoexia/vim-monokai'            "nice colourscheme
Plug 'easymotion/vim-easymotion'        "it's pretty incredible
Plug 'joonty/vdebug'                    "Debugging support
Plug 'janko-m/vim-test'                 "Run unit tests
Plug 'Shougo/deoplete.nvim'             "completion
Plug 'tpope/vim-commentary'             "easier commenting
Plug 'tpope/vim-surround'               "surround editing
Plug 'vimwiki/vimwiki'                  "organisational stuff
Plug 'godlygeek/csapprox'               "terminal colours
Plug 'tpope/vim-fugitive'               "git integration

call plug#end()
call deoplete#enable()

colorscheme monokai

"Clear the search when we press space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>:set nospell<CR>

nnoremap <leader>v :e ~/programs/configs/nvim/init.vim<cr>

"resize windows easily
nnoremap <up> :resize +10<cr>
nnoremap <down> :resize -10<cr>
nnoremap <left> :vertical resize -10<cr>
nnoremap <right> :vertical resize +10<cr>

"move code up or down
nnoremap <c-s-j> :m .+1<CR>==
nnoremap <c-s-k> :m .-2<CR>==
inoremap <c-s-j> <Esc>:m .+1<CR>==gi
inoremap <c-s-k> <Esc>:m .-2<CR>==gi
vnoremap <c-s-j> :m '>+1<CR>gv=gv
vnoremap <c-s-k> :m '<-2<CR>gv=gv

"IDE style mappings (Sublime text)
nmap <c-t> :tabnew<cr>

"save like a sane person		
nnoremap <c-s> :w<cr>		
inoremap <c-s> <esc>:w<cr>		

"comments <c-_> actually means ctrl+/ for some reason _ is registered as /
nmap <c-_> gcc
vmap <c-_> gcc
imap <c-_> <esc>gcc 

"copy paste
vmap <C-c> "+yi
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

"Commands
autocmd BufRead,BufNewFile *.json setfiletype javascript " Set all .json files to have JS syntax
autocmd BufRead,BufNewFile *.lock setfiletype javascript " Set all .json files to have JS syntax

autocmd BufRead,BufNewFile *.less set filetype=less.css " Set all .less files to have CSS syntax
autocmd BufRead,BufNewFile *.scss set filetype=sass.css " Set all .scss files to have CSS syntax

"Format html and xml
autocmd BufWritePre,BufRead *.html :normal gg=G
autocmd BufWritePre,BufRead *.xml :normal gg=G

autocmd BufEnter * :set modifiable

" Lint on write
autocmd BufWritePost * Neomake

scriptencoding utf-8 "Unicode support is good

"statusline
set statusline=%{fugitive#statusline()}%=%t[%04l,%04v]
hi StatusLine ctermbg=white ctermfg=blue

set viminfo='20,<1000,s1000 "By default vim only yanks up to 50 lines. This changes it to 1000 lines
set scrolloff=10 "Keep at least 10 lines in view when the cursor hits the bottom of the buffer
set notimeout "Wait indefinitely for a keypress when we press the leader key
set shiftwidth=4 "indentation should be 4 spaces when we use >> and <<
set relativenumber "Turn on relative numbering for all lines
set inccommand=split "Live substitution is the bees knees
set tabstop=4 "Pressing tab should only indent 4 spaces
set numberwidth=2 "Make the line number gutter smaller
set cursorline "Show the current line you're on
set encoding=utf-8 "We like funny characters
set ignorecase "Ignore cases when searching
set expandtab "Change tabs into spaces
set number "Show line numbers
set mouse=a "mouse support
set shell=/bin/bash


"plugins

"vim-test
nnoremap <leader>t :TestFile -strategy=neovim<cr>

"vdebug
let g:vdebug_options = {}
let g:vdebug_options["port"] = 1337

let g:vdebug_options["path_maps"] = {
\ "/var/www/enterprise": "/home/joe/code/enterprise"
\}

"netrw
let g:netrw_liststyle = 3 "style it as a tree
let g:netrw_banner = 0    "Hide the default banner
let g:netrw_winsize = -40 "Give the window an absolute size of 40

"vim easymotion
"Have the motion work bi-directionally
nmap <leader><leader>w <Plug>(easymotion-bd-w)

"vim fugitive
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gh :Git checkout<space>
nnoremap <leader>gd :Gdiff<cr>
"For some reason :Gpush crashes my terminal so have to use the native version
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gt :Git stash<cr>

"fzf
nnoremap <c-p> :GFiles<cr>
nnoremap <c-r> :BTags<cr>
nnoremap <c-s-c> :Commits<cr>
nnoremap <leader>f :Ag<cr>
nnoremap <c-x> :Commands<cr>


"vimwiki
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]

" Use matchit
if !exists('g:loaded_matchit')
    runtime macros/matchit.vim
endif
