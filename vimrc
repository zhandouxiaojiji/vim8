""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'  
Bundle 'jlanzarotta/bufexplorer'
Bundle 'kien/ctrlp.vim'
Bundle 'mrtazz/DoxygenToolkit.vim'
Bundle 'morhetz/gruvbox'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomasr/molokai'
Bundle 'Valloric/YouCompleteMe'
"Bundle 'roxma/nvim-completion-manager'
Bundle 'vim-scripts/taglist.vim'

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

filetype plugin on
filetype indent on
set encoding=utf8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
set ffs=unix,dos,mac

set history=512
set autoread
set so=7
set wildmenu
set wildignore=*.o,*~,*.pyc
set ruler
set hid
set nu
set showcmd
set cmdheight=1
set cursorline
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set completeopt-=preview
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2

set noerrorbells
set novisualbell
set vb t_vb=
set tm=500

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500

set ai
set si
set nowrap
set viminfo^=%

set laststatus=2 
"set statusline=\%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L:%c
set statusline=\%F%m%r%h\ %w\ \ Line:\ %l/%L:%c
set ut=2000

set background=dark
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
colorscheme molokai
"colorscheme solarized

" Specify the behavior when switching between buffers 
try
set switchbuf=useopen,usetab,newtab
set stal=2
catch
endtry

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_by_filename = 1
let g:ctrlp_follow_symlinks = 2
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = '0'
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_global_ycm_extra_conf = '.ycm_extra_conf.py'
let g:neocomplete#enable_fuzzy_completion = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 20
let Tlist_Show_One_File = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Auto_Highlight_Tag = 1
let Tlist_WinWidth = 30 
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
map j gj
map k gk
map <f4> :NERDTreeToggle<cr>
map <F8> :TlistToggle<cr>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-g> :q<cr>
map <f5> :call Build()<cr>
map <leader>, :nohl<cr>
map <leader>n :NERDTreeFind<cr>
map <c-_> <leader>c<space>

" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<c-v><cr>//ge<cr>'tzt'm

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
if has("mac")
    nnoremap ∆ :m .+1<cr>==
    nnoremap ˚ :m .-2<cr>==
    inoremap ∆ <esc>:m .+1<cr>==gi
    inoremap ˚ <esc>:m .-2<cr>==gi
    vnoremap ∆ :m '>+1<cr>gv=gv
    vnoremap ˚ :m '<-2<cr>gv=gv
else
    nmap <m-j> mz:m+<cr>`z
    nmap <m-k> mz:m-2<cr>`z
    vmap <m-j> :m'>+<cr>`<my`>mzgv`yo`z
    vmap <m-k> :m'<-2<cr>`>my`<mzgv`yo`z
endif

"=> mappings for tabs
map <leader>t :tabedit %<cr>
map <s-h> :tabp<cr>
map <s-l> :tabn<cr>

"=> mappings for vimgrep
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader><space> :vimgrep // <c-r>%<C-B><right><right><right><right><right><right><right><right><right>
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
vnoremap <silent> gv :call VisualSelection('gv')<cr>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<cr>
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<cr>
vnoremap <silent> # :call VisualSelection('b')<cr>

"=> mappings for cscope
map <F12> :call BuildCsTag()<cr>
nmap fs :cs find s <c-r>=expand("<cword>")<cr><cr>	
nmap fg :cs find g <c-r>=expand("<cword>")<cr><cr>	
nmap fc :cs find c <c-r>=expand("<cword>")<cr><cr>	
nmap ft :cs find t <c-r>=expand("<cword>")<cr><cr>	
nmap fe :cs find e <c-r>=expand("<cword>")<cr><cr>	
nmap ff :cs find f <c-r>=expand("<cfile>")<cr><cr>	
nmap fi :cs find i ^<c-r>=expand("<cfile>")<cr>$<cr>
nmap fd :cs find d <c-r>=expand("<cword>")<cr><cr>	

if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable(".cscope.out")
        execute "cs add .cscope.out"
    endif
    set csverb
endif

set tags=.tags 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! BuildCsTag()
    let dir = getcwd()
    if filereadable(".tags") && delete("./.tags") != 0
       echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable(".cscope.out") && delete("./.cscope.out") != 0
        echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
    endif
    if(executable('ctags'))
       silent! execute "!ctags --languages=C,C++,Lua -R -f .tags"
    endif
    if(executable('cscope') && has("cscope"))
        silent! execute "!find . -name '*.erl' -o -name '*.lua' -o -name '*.h' -o -name '*.cpp' -o -name '*.c' -o -name '*.cc' -o -name '*.hpp' | xargs cscope -b -f .cscope.out"
        execute "normal :"        
        if filereadable(".cscope.out")
            silent! execute "cs add .cscope.out"
        endif
    endif
    redraw!
endfunction

function! Build()
    if &filetype == 'lua' 
        execute '!lua %'
    elseif &filetype == "sh"
        execute '!bash %'
    end
endfunction
