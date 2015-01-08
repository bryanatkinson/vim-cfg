" Vundle {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

"Plugins
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'corntrace/bufexplorer'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/xptemplate'
Plugin 'derekwyatt/vim-scala'
Plugin 'vim-scripts/AutoTag'
Plugin 'vlaadbrain/gnuplot.vim'
Plugin 'jcf/vim-latex'
Plugin 'tclem/vim-arduino'
Plugin 'vim-scripts/DirDiff.vim'
Plugin 'Lokaltog/powerline'
Plugin 'vim-scripts/pmd.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'vim-scripts/TwitVim'

call vundle#end()
filetype plugin indent on
" Vundle }}}

" Generic stuff {{{
syn on
set go-=m
set go-=T
set go-=r
set go-=L

if has("gui_running")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 7
    set ruler
    set lsp=-1
endif
" set number
set relativenumber

set nowrap
set showmode
set wrapscan

set directory=.,~/tmp

set cul
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set hidden
set shiftwidth=4
set tabstop=4
set expandtab
set laststatus=2
set lazyredraw
set scrolloff=8
" set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

set wildmenu
set wildmode=list:longest,full

set foldmethod=marker
if has("autocmd")
	filetype plugin indent on
endif


set smarttab
set backspace=indent,eol,start
set wildignore=*.o,*.obj,*.class,*.exe,*.bin


set undolevels=1000
set cpoptions=ces$

filetype on
filetype indent on
filetype plugin on

syntax on

set tags=tags;/

set complete=.,w,b,u,t,i

augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END

au BufEnter * set colorcolumn=
    
" Generic Stuff }}}

" Backup Stuff {{{
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup//
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif
" Backup Stuff}}}

" Perl specific stuff {{{
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite
" Perl specific stuff }}}

" Java specific stuff {{{
setlocal omnifunc=javacomplete#Complete
setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType java set errorformat=[ERROR]\ %f:[%l\\,%v]\ %m
let java_highlight_all=1

" I like an 80 character max 
" autocmd FileType java match OverLength /\%91v.\+/
au BufEnter *.java set colorcolumn=91
au BufEnter *.java set shiftwidth=4
syn match javaError "<<<\|\.\.\|=>\|||=\|&&=\|[^-]->\|\*\/"

" Java specific }}}

" Scala stuff {{{
au BufEnter *.scala set colorcolumn=101
au BufRead,BufNewFile *.scala set filetype=scala
au BufEnter *.scala setl formatprg=~/bin/scalariform.jar\ --stdin\ --stdout
au BufEnter *.scala set shiftwidth=2
" au BufWritePost *.scala silent! !ctags -R &
" autocmd FileType scala match OverLength /\%120v.\+/
" Scala stuff }}}

" Arduino stuff {{{
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino
autocmd FileType arduino match OverLength /\%80v.\+/
" }}}

" Variables {{{

" Sets whether or not XPT adds spaces around parameters
let g:xptemplate_vars = "SParg="

" Java Imp Variables
let g:JavaImpDataDir = "~/.vim/JavaImp"

" EasyMotion Variables
let g:EasyMotion_leader_key = '<Leader>'

" FuzzyFinder Variables
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
let g:fuf_file_exclude = '\v\~$|\.(o|class|exe|dll|bak|orig|pyc|sw[po]|\\)$|(^|[/\\])(target|\.hg|\.git|\.bzr|\.svn)($|[/\\])'
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|class|exe|dll|bak|orig|pyc|sw[po])$|(^|[/\\])(target|\.hg|\.git|\.bzr|\.svn)($|[/\\])'
let g:fuf_dir_exclude = '\v(^|[/\\])(target|\.hg|\.git|\.bzr|\.svn|build)($|[/\\])'
let g:fuf_mrufile_exclude = '\v\~$|\.(o|class|exe|dll|bak|orig|pyc|sw[po])$|^(\/\/|\\\\|target|\/mnt\/|\/media\/)'

let g:hier_enabled = 1
let g:airline_detect_whitespace=0
let g:airline_section_warning=""

let g:autotagExcludeSuffixes="tml.xml.text.txt.log.js.css.py"
let g:autotagCtagsCmd="ctags"
let g:autotagDisabled=1

" neocomplcache {{{
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_disable_auto_complete = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
" neocomplcache }}}}

" Variables }}}

" Mappings {{{
vmap y y`]
cmap w!! %!sudo tee > /dev/null %
cmap wall 1,9000bwipeout
cmap jp %!python -m json.tool
nnoremap 'fb :FufBuffer<CR>
" nnoremap 'fc :FufMruCmd<CR>
nnoremap 'fd :FufDir **/<CR>
nnoremap 'fta :FufBufferTagAll<CR>
nnoremap 'fe :FufFile **/<CR>
nnoremap 'fh :FufHelp<CR>
" nnoremap 'fm :FufMruFile<CR>
nnoremap 'fq :FufQuickfix<CR>
nnoremap 'ftt :FufTag<CR>
nnoremap 'ftb :FufBufferTag<CR>
nnoremap 'frc :FufRenewCache<CR>
nnoremap 'd :NERDTreeFind<CR>
nnoremap 'n :nohl<CR>
nnoremap 'w <C-w>w
nnoremap zh 10zh
nnoremap zl 10zl
nnoremap 'bl :b#<CR>
nnoremap 'h *N
nnoremap 'u :GundoToggle<CR>
nnoremap 'cn :cnext<CR>
nnoremap 'cp :cprevious<CR>
nnoremap 'cl :clist<CR>
nnoremap 'ff :SortScalaImports<CR>msgggqG's
nnoremap 'sc :SyntasticCheck<CR>
nnoremap 'sr :SyntasticReset<CR>

imap jj <Esc>
imap <C-O> <C-o>O

" autocmd FileType java,scala,c,cpp inoremap ( ()<Esc>i
autocmd FileType java,scala,c,cpp inoremap { {}<Esc>i
" autocmd FileType java,scala,c,cpp inoremap [ []<Esc>i

" Mappings }}}

" Colors {{{ "
if has("gui_running")
    colorscheme ego 
    hi NonText              gui=NONE guibg=grey6 guifg=LightSkyBlue
    hi Pmenu                gui=bold guibg=#305060 guifg=#b0d0e0
    hi Search               guibg=#305060 guifg=#b0d0e0
    hi OverLength           guibg=#445599        guifg=gray      gui=none
    hi ColorColumn          guibg=grey6
    hi SignColumn           guibg=grey6
endif
" }}}

" DirDiff Variables {{{ "
let g:DirDiffExcludes = ".svn,target,*.class,bin"
" }}}

" Functions {{{

function! Grep (expr, ext)
    exe 'vimgrep ' . a:expr . ' **/*.' . a:ext
    cw
endfunction

command! -nargs=1 Jgrep call Grep(<f-args>, 'java')
command! -nargs=1 Xgrep call Grep(<f-args>, 'xml')
command! -nargs=1 Pygrep call Grep(<f-args>, 'py')
command! -nargs=1 Plgrep call Grep(<f-args>, 'pl')
command! -nargs=1 Rbgrep call Grep(<f-args>, 'rb')
command! -nargs=1 Sgrep call Grep(<f-args>, 'scala')

function! JPretty()
    exe '%!python -m json.tool'
    cw
endfunction

command! -nargs=0 Jpretty call JPretty()

" Functions}}}

" Powerline {{{
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
" Powerline }}}

" Load local vim configuration
source ~/.vimlocal

