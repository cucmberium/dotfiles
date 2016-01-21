" .vimrc of clovertown

" vi互換無効化
set nocompatible

" ファイルタイプの自動検出無効化
filetype off

" 構文ハイライト
syntax enable

" エンコード関連
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs-8,cp932,sjis

" ターミナルで256色で表示
set t_Co=256

" 改行を\nにする
set fileformats=unix

" ビジュアルモードの矩形選択で文字のないところへの選択が可能に
set virtualedit=block

" NeoBundle
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

let g:neobundle_default_git_protocol='https'

NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle "Shougo/echodoc.vim"
NeoBundle "Shougo/neocomplete.vim"
NeoBundle "chriskempson/vim-tomorrow-theme"
NeoBundle "Shougo/vimshell.vim"
NeoBundle "Shougo/vinarise.vim"
NeoBundle "ujihisa/unite-colorscheme"
NeoBundle "tomasr/molokai"
NeoBundle "sjl/badwolf"

NeoBundleLazy "davidhalter/jedi-vim", {
    \ "autoload" : {
    \     "filetypes": ["python", "python3", "djangohtml"]
    \ }}

NeoBundleLazy "nvie/vim-flake8", {
    \ "autoload" : {
    \     "filetypes": ["python", "python3", "djangohtml"]
    \ }}

NeoBundleLazy "Shougo/unite.vim", {
    \ "autoload" : {
    \     "commands": ["Unite"]
    \ }}

NeoBundleLazy "Shougo/vimfiler.vim", {
    \ "depends" : ["Shougo/unite.vim"],
    \ "autoload" : {
    \     "commands": ["VimFilerTab", "VimFiler", "VimFilerExplorer"]
    \ }}


" autocmd FileType python set omnifunc=jedi#completions
if !empty(neobundle#get("jedi-vim"))
    let g:jedi#auto_initialization=1
    let g:jedi#auto_vim_configuration=1

    let g:jedi#completions_command="<C-N>"
    let g:jedi#show_call_signatures=1
endif

call neobundle#end()

" 検索時に大文字小文字を区別しない
set ignorecase

" 検索パターンに大文字が含まれる場合のみ区別
set smartcase

" インクリメンタルに検索
set incsearch

" 検索ハイライトを一時的に消す
set nohlsearch

" カーソルが何行何列にあるかどうかを表示
set ruler

" 検索が末尾まで進んだらファイル先頭に戻る
set wrapscan

" タブ文字を表示
set list
set listchars=tab:>-

" 行数を表示
set number

" 全角文字を2個のスペースで表示
set ambiwidth=double

" ステータスラインを下から二行目に表示
set laststatus=2

" タブページを表示
set showtabline=2

" ヤンクされたテキストをクリップボードに
set clipboard=unnamed

" バックスペースキーで削除できる文字の指定
set backspace=eol,indent,start

" タブのスペースを半角4文字文に
set tabstop=4

" 自動インデントでずれる量
set shiftwidth=4

" 改行時に前の行のインデントを継続
set autoindent

" タブを空白に置き換えない
set noexpandtab

" スマートなタブ
set smarttab

" 編集中の行番号をハイライト
" set cursorline

" vimのファイル名補完
set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll

" カーソルを括弧内に突っ込む
" imap {} {}<Left>
" imap [] []<Left>
" imap () ()<Left>
" imap "" ""<Left>
" imap '' ''<Left>

" ファイルタイプ関連を有効に
filetype plugin indent on

" Python用の設定
autocmd FileType python set tabstop=4
autocmd FileType python set expandtab
autocmd FileType python let b:did_ftplugin = 1
autocmd FileType python set completeopt-=preview

" カラースキームの設定
colorscheme molokai 
highlight Normal ctermbg=none
