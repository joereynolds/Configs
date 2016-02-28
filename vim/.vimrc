set nocompatible
execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

"Keyboard mappings
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap < <><Left>

"Learn vim properly. Disable lazyness
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"Clear the search when we press space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>:set nospell<CR>

" runs the current file you're in
map <buffer> <F5> :w<CR>:!php %<CR>

" times scripts execution
map <buffer> <S-F5> :w<CR>:!time php %<CR>

"Toggle the tagbar when we press f4
map <F4> :TagbarToggle<CR>

"Control t opens a new tab. Just like da interwebz
nmap <c-t> :tabnew<CR>

"Go to next tab with tab
nmap <Tab> :tabnext<CR>

"Go to next match from vimgrep with right arrow"
nmap <Right> :cnext<CR>

"Go to next match from vimgrep with right arrow"
nmap <Left> :cprev<CR>


set tags=tags;/

"Commands

au BufRead,BufNewFile *.json setfiletype javascript " Set all .json files to have JS syntax
au BufRead,BufNewFile *.lock setfiletype javascript " Set all .lock files to have JS syntax
au BufRead,BufNewFile *.less setfiletype css " Set all .less files to have CSS syntax
au BufRead,BufNewFile *.scss setfiletype css " Set all .scss files to have CSS syntax

"On startup, turn the tagbar on
autocmd VimEnter *.php TagbarToggle
autocmd VimEnter *.py TagbarToggle

"When we write to the buffer, run pylint on the current file
"if it's a python file
"Note this is no longer needed since syntastic is way better.
"autocmd BufWritePost *.py !pylint <afile>

"Before we have written to our buffer, or when we read it,
"format it nicely on xml and html files
autocmd BufWritePre,BufRead *.html :normal gg=G
autocmd BufWritePre,BufRead *.xml :normal gg=G

" Makes sure our highlight doesn't get destroyed by setting the colorscheme
autocmd ColorScheme * highlight Search ctermfg=white ctermbg=green
autocmd ColorScheme * highlight TrailingWhitespace ctermbg=yellow
autocmd ColorScheme * highlight overLengthSoft ctermbg=magenta
autocmd ColorScheme * highlight overLengthHard ctermbg=red

"Give our highlight groups names so we can display them on matches
highlight Search ctermfg=white ctermbg=green
highlight TrailingWhitespace ctermbg=yellow
highlight overLengthSoft ctermbg=magenta
highlight overLengthHard ctermbg=red

"Highlights
call matchadd('overLengthHard', '\%100v');
call matchadd('overLengthSoft', '\%81v');
match TrailingWhitespace /\s\+$/

"Skeletons
"none here yet....

scriptencoding utf-8 "Unicode support is good

set viminfo='20,<1000,s1000 "By default vim only yanks up to 50 lines. This changes it to 1000 lines
set scrolloff=3 "Keep at least 3 lines in view when the cursor hits the bottom of the buffer
set backspace=indent,eol,start "Make backspace behave like it does everywhere else
set shiftwidth=4 "indentation should be 4 spaces when we use >> and <<
set complete-=i "Don't scan included files with omnicompletion
set relativenumber "Turn on relative numbering for all lines
set tabstop=4 "Pressing tab should only indent 4 spaces
set incsearch "highlight them as they're typed as well
set numberwidth=2 "Make the line number gutter smaller
set cursorline "Show the current line you're on
set encoding=utf-8 "We like funny characters
set ignorecase "Ignore cases when searching
set hlsearch "Highlight matching searches
set expandtab "Change tabs into spaces
set omnifunc=syntaxcomplete#Complete
set ruler "Show our current position
set number "Show line numbers

"syntastic plugin settings
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%#warningmsg#
set statusline+=%*o

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

syntax on
colorscheme elflord
