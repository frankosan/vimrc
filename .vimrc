set nocompatible               " be iMproved
filetype plugin on             " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
" =======
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Plugins <3
Bundle "tpope/vim-fugitive.git"
" Vim JS autocompletion with hints
" Bundle 'marijnh/tern_for_vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'daylerees/colour-schemes', { 'rtp': 'vim/' }
Bundle 'vim-scripts/Align'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'kien/ctrlp.vim'
Bundle 'fisadev/vim-ctrlp-cmdpalette'
Bundle 'edsono/vim-matchit'
Bundle 'scrooloose/nerdtree'
Bundle 'corntrace/bufexplorer'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
" Bundle 'msanders/snipmate.vim'
Bundle 'sjl/gundo.vim'

" zen coding plugin
Bundle 'tristen/vim-sparkup'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/LustyJuggler'
Bundle 'vim-scripts/LustyExplorer'
Bundle 'bling/vim-airline'

" Syntax plugins
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-markdown'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'jQuery'
Bundle 'hdima/python-syntax'

" color schemes
Bundle 'junegunn/seoul256.vim'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'tomasr/molokai'

" javscript autocompletion
" Bundle 'Valloric/YouCompleteMe'
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" set completeopt-=preview
" Bundle 'marijnh/tern_for_vim'

filetype plugin indent on

" General settings
" ================
set wildignore+=**/.tmp/**
set wildignore+=*.pyc
set completeopt-=preview
set showbreak=↪
set ffs=unix
set noswapfile
set autoindent
set hidden                                 " switch among buffers without saving
set nobackup                               " do not keep a backup file, use versions instead
set history=50                             " keep 50 lines of command line history
set ruler                                  " show the cursor position all the time
set showcmd                                " display incomplete commands
set incsearch                              " do incremental searching
set clipboard=unnamed                      " let yanking and pasting from other apps without               " *
set expandtab                              " use spaces instead of tabs
set tabstop=2                              " 2 spaces for tab
set softtabstop=2
set shiftwidth=2                           " indent by 2 characters
set nowrapscan                             " searches do not resume at the beginning when reaching the end
set number                                 " display line numbers
set shiftround                             " indent and unindent to a multiple of 'shiftwidth'
set smarttab
set modelines=3
set scrolloff=3
set noshowmatch
set clipboard=unnamed,exclude:cons\|screen
set cursorline                             " to easily spot where the cursor is
set mouse=a                                " Enable the use of the mouse in xterm or the GUI
set noignorecase
set backspace=indent,eol,start             " allow backspacing over everything in insert mode
set wildmenu

set tags=tags

" tablength exceptions
autocmd FileType python setlocal foldmethod=indent foldlevel=99 shiftwidth=4 tabstop=4 softtabstop=4
" fold markers for sass/less/js
set foldlevelstart=20
autocmd BufRead,BufNewFile *.scss,*.less,*.css setlocal foldmethod=marker foldmarker={,}
autocmd BufRead,BufNewFile *.js setlocal foldmethod=marker foldmarker={,}

" ignore these extension for command-line auto-completion
set wildignore+=*.exe,*.com,*.dll,*.obj,*.a,*.o
" How to display matches when auto-completing
set wildmode=longest,list
" Use ack (petdance's App::Ack) instead of GNU grep
set grepprg=ack "\ --ignore-dir\ .tmp\ --ignore-dir\ bower_components
" set shellpipe="&>" attempt not to output grep result on terminal
" Autocomplete without "i" (don't search included files, too many in Perl)
set complete=.,w,b,u,t

" Handy key mappings
" ==================

" toggle ignore case
noremap <C-G> :set noignorecase!<bar>set ignorecase?<CR>

" map F3 to ack for word under cursor
nnoremap <F3> :grep <C-R><C-W><CR>

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " Special settings for xml-like files
  autocmd FileType php,xml,html,xsl,sgml  setlocal sw=2 matchpairs+=<:>
  autocmd FileType php,html,sgml,sql,plsql setlocal ic

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

syntax enable
set background=dark
colorscheme seoul256

" Settings and mapping for the mini buffer
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1

" Toggle highlight search on/off
" map <F5> :set hls!<bar>set hls?<CR>
" Toggle scrollbind
" map <F4> :set scb!<bar>set scb?<CR>
" Toggle paste on/off
map <S-F6> :set paste!<bar>set paste?<CR>
" remove search highlights with backspace
map <bs> :noh<CR>
" so that the :W would work
cnoreabbrev W w
" so that the :Q would work
cnoreabbrev Q q

" turning off Q and <F1>
map Q <nop>
map <F1> <nop>
imap <F1> <nop>

" turning off Ctrl space
imap <Nul> <Space>
map  <Nul> <Nop>
vmap <Nul> <Nop>
cmap <Nul> <Nop>
nmap <Nul> <Nop>

" easier to reach than <esc> or <C-[>
inoremap jj <esc>
inoremap qq <esc>A
" repeat and go back to where we were before repeating
nnoremap . .`[

" Easy navigation in grep results
map <F7>   :cN<CR>
map <S-F7> :cNf<CR>
map <F8>   :cn<CR>
map <S-F8> :cnf<CR>

" navigate betweeen bufferes using TAB
nnoremap <TAB> :b#<cr>
" `.

nnoremap <F5> :bufdo e!<CR>

" change working directory to the directoy of the open file
nnoremap <silent> <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Remove the menubar
set guioptions-=m
" Remove the toolbar
set guioptions-=T

" Auto-completion with tab.
function! InsertTabWrapper(direction)
   let col = col('.') - 1
   if !col || getline('.')[col - 1] !~ '\k'
       return "\<tab>"
   elseif "backward" == a:direction
       return "\<c-p>"
   else
       return "\<c-n>"
   endif
endfunction
inoremap <S-tab> <c-r>=InsertTabWrapper ("backward")<cr>
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>

" Tag list (requires exuberant-ctags)
nmap <F4> :TlistToggle<cr>
map <F12> :!ctags -R .<cr>

if has("terminfo")
    if &term =~ "screen" || &term =~ "xterm" || &term =~ "rxvt"
        set t_Co=16
        set t_Sf=<Esc>[3%dm
        set t_Sb=<Esc>[4%dm
    endif
endif

" windows navs made easier
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <F6>  <C-W>w
nnoremap -     <C-W>-
nnoremap +     <C-W>+
nnoremap <M-<> <C-W><
nnoremap <M->> <C-W>>

" insert newline without entering insert mode
nnoremap <RETURN> o<ESC>^"_D

" insert a new line under the caret
inoremap <C-RETURN> <CR><CR><C-o>k<Tab>
" insert a new line on the caret position
nnoremap <S-RETURN> i<CR><ESC>l

" map \m to higlight the more than 80 chars per line
function! ToggleMatch80 ()
    if exists("w:m80") && w:m80 > 0
        call matchdelete(w:m80)
        unlet w:m80
    else
        let w:m80=matchadd('ErrorMsg', '\%>80v.\+', -1)
    endif
endfunction
map <silent> <Leader>m :call ToggleMatch80()<CR>

" It's useful to show the buffer number in the status line.
" set laststatus=2 statusline=%02n:\ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" ,e to :e on the directory of the active file
map ,f :e <C-R>=expand("%:h") . "/"<CR>

" old autocomplete keyboard shortcut
inoremap <C-J> <C-X><C-O>

" PLUGINS configuration
" =====================

" RagTag
" ======
let g:ragtag_global_maps = 1

" go to defn of tag under the cursor
fun! MatchCaseTag()
    let ic = &ic
    set noic
    try
        exe 'tjump ' . expand('<cword>')
    finally
       let &ic = ic
    endtry
endfun
nnoremap <silent> <c-]> :call MatchCaseTag()<CR>


" Tern JS
" =======
let g:tern_map_keys=1
let g:tern_show_arguement_hints=0

" Vim Commentary
" ==============
map <silent> <Leader>x gcc
map <silent> <Leader>z gccj

" EasyMotion
" ==========
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

map K <Plug>(easymotion-bd-jk)

" remappin of f-ind and t-ail
nmap f <Plug>(easymotion-s)
nmap F <Plug>(easymotion-s)
nmap t <Plug>(easymotion-bd-t)
nmap T <Plug>(easymotion-bd-t)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1

" Emmet
" =====
" let g:user_emmet_mode='i'    "only enable insert mode functions.
" let g:user_emmet_install_global = 0
" autocmd FileType html,css,scss EmmetInstall
" let g:user_emmet_leader_key='<C-Z>'

" TagList
nnoremap <silent> <leader>tl :Tlist<cr>

" Exploring Stuff Lusty way
nmap ,j :LustyJuggler<CR>
nmap ,b :LustyBufferExplorer<CR>
nmap ,g :LustyBufferGrep<CR>
let g:LustyExplorerSuppressRubyWarning=1

" Conque Shell
" function! s:Terminal(direction)
"   if "v" == a:direction
"     execute 'ConqueTermVSplit bash --login'
"   else
"     execute 'ConqueTermSplit bash --login'
"   endif
" endfunction
" command! Terminal  call s:Terminal("h")
" command! VTerminal call s:Terminal("v")

" NERDTree
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
let g:NERDTreeWinSize = 40
" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|dist\|DS_Store\|git\|.tmp\|build'
" CtrlP (new fuzzy finder)
let g:ctrlp_map = ',e'
let g:ctrlp_working_path_mode = 0
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,l :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
nmap ,c :CtrlPCmdPalette<CR>

" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wl :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>

" Gundo
nnoremap <silent> <leader>gu :GundoToggle<CR>
let g:gundo_right=1
let g:gundo_close_on_revert=1

" needs to be called after the yankstack setup
map Y y$

" Align
vnoremap = :Align =<CR>
vnoremap ; :Align :<CR>

" Javascript Formatter (esformatter)
nnoremap <silent> <leader>e :call JSFormat()<cr>

function! JSFormat()
  " Preparation: save last search, and cursor position.
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')

  " call esformatter with the contents form and cleanup the extra newline
  execute ":%!~/.vim/bin/js-format.sh"
  if v:shell_error
      echoerr 'format script failed'
      undo
      return 0
  endif
  " Clean up: restore previous search history, and cursor position
  call winrestview(l:win_view)
  call setreg('/', l:last_search)
endfunction

" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

" session saving
nnoremap <F10> :MBEClose<cr> :mksession! ~/.vim_session<cr> :MBEOpen<cr>


" handy shortcuts
" enter function
inoremap <silent> <leader>fu function() {}<ESC>i<CR><CR><C-o>k<Tab><ESC>k$F(a
nnoremap <silent> <leader>fu ifunction() {}<ESC>i<CR><CR><C-o>k<Tab><ESC>k$F(a
" enter console.log line
inoremap <silent> <leader>cl console.log('');<esc>hhi
nnoremap <silent> <leader>cl iconsole.log('');<esc>hhi

" navigate buffer using ALT-Arrow
" mapping the alt key will not work from terminal
nnoremap <M-RIGHT> :bn<cr>
nnoremap <M-LEFT>  :bp<cr>

" visually selecting the pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap <expr> gi '`[v`]'
" out gh to something useful
nnoremap gh :bw<cr>

" convenient way to play a macro recorded to register q
" nnoremap <SPACE> @q

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileType python,javascript autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileType python,javascript autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FileType python,javascript autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd FileType python,javascript autocmd BufWritePre     * :call TrimWhiteSpace()
