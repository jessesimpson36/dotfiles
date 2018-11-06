" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

" Install Nerdtree
Plug 'scrooloose/nerdtree'

" Auto-completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" ends quotes/brackets/etc
Plug 'cohama/lexima.vim'

" PlantUML syntax highlighting
Plug 'aklt/plantuml-syntax'

"Syntax Checking
"Plug 'vim-syntastic/syntastic'

" Python syntax highlighting
Plug 'hdima/python-syntax'

" Kotlin syntax checking and maybe highlighting.
Plug 'udalov/kotlin-vim'

" Sensible defaults
Plug 'tpope/vim-sensible'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

filetype plugin indent on    " required



syntax on
set autoindent
set cindent
set shiftwidth=4
map <F2> :NERDTreeToggle <CR>
map <Tab> :s/^/    <CR>
map <S-Tab> :s/^    /<CR>
map <C-_> :s/^/# <CR>
set clipboard=unnamedplus
set tabstop=4
set expandtab shiftwidth=4 softtabstop=4
set mouse=a
set number
set expandtab
set encoding=utf-8

let g:netrw_banner=0 "disables annoying banner
let g:netrw_browse_split=4 "open in prior window
let g:netrw_altv=1 "open splits to the right
let g:netrw_liststyle=3 "tree view

" Searches sub-directories
set path+=**
" Enables tab completion for files/directories
set wildmenu
function! TrimWhiteSpace()
    %s/\s\+$//e
		endfunction
		autocmd BufWritePre     *.c :call TrimWhiteSpace()

let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction


nnoremap <leader><Space> :call ToggleComment()<cr>
vnoremap <leader><Space> :call ToggleComment()<cr>





" Syntastic configuring
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
