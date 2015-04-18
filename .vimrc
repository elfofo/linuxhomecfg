syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set completeopt-=preview

call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'bronson/vim-trailing-whitespace'

Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'rdnetto/YCM-Generator'

Plug 'altercation/vim-colors-solarized'

Plug 'jalcine/cmake.vim'

" Unite
"   depend on vimproc
"   ------------- VERY IMPORTANT ------------
"   you have to go to .vim/plugin/vimproc.vim and do a ./make
"   -----------------------------------------
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'

Plug 'rking/ag.vim'

" Show which line changed since your last commit.
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/vim-easy-align'

Plug 'bbchung/clighter'

call plug#end()

if (exists('+colorcolumn'))
    set colorcolumn=120
    highlight ColorColumn ctermbg=9
endif

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" -- solarized personal conf
set background=dark
colorscheme solarized
let g:solarized_termcolors=256


let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :vsplit<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)


" --- type ° to search the word in all files in the current dir
nmap ° :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag 


" Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<cr>
nmap ga <Plug>(EasyAlign)

"clighter params
let g:clighter_libclang_file = '/usr/lib/libclang.so' 
let g:clighter_rename_prompt_level = 0
let g:clighter_enable_cross_rename = 0
