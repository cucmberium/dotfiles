" .vimrc of clovertown

" vi�ߴ�̵����
set nocompatible

" �ե����륿���פμ�ư����̵����
filetype off

" ��ʸ�ϥ��饤��
syntax enable

" ���󥳡��ɴ�Ϣ
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs-8,cp932,sjis

" �����ߥʥ��256����ɽ��
set t_Co=256

" ���Ԥ�\n�ˤ���
set fileformats=unix

" �ӥ��奢��⡼�ɤζ�������ʸ���Τʤ��Ȥ���ؤ����򤬲�ǽ��
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

" ����������ʸ����ʸ������̤��ʤ�
set ignorecase

" �����ѥ��������ʸ�����ޤޤ����Τ߶���
set smartcase

" ���󥯥��󥿥�˸���
set incsearch

" �����ϥ��饤�Ȥ���Ū�˾ä�
set nohlsearch

" �������뤬���Բ���ˤ��뤫�ɤ�����ɽ��
set ruler

" �����������ޤǿʤ����ե�������Ƭ�����
set wrapscan

" ����ʸ����ɽ��
set list
set listchars=tab:>-

" �Կ���ɽ��
set number

" ����ʸ����2�ĤΥ��ڡ�����ɽ��
set ambiwidth=double

" ���ơ������饤��򲼤�������ܤ�ɽ��
set laststatus=2

" ���֥ڡ�����ɽ��
set showtabline=2

" ��󥯤��줿�ƥ����Ȥ򥯥�åץܡ��ɤ�
set clipboard=unnamed

" �Хå����ڡ��������Ǻ���Ǥ���ʸ���λ���
set backspace=eol,indent,start

" ���֤Υ��ڡ�����Ⱦ��4ʸ��ʸ��
set tabstop=4

" ��ư����ǥ�ȤǤ������
set shiftwidth=4

" ���Ի������ιԤΥ���ǥ�Ȥ��³
set autoindent

" ���֤������֤������ʤ�
set noexpandtab

" ���ޡ��Ȥʥ���
set smarttab

" �Խ���ι��ֹ��ϥ��饤��
" set cursorline

" vim�Υե�����̾�䴰
set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll

" ���������������ͤù���
" imap {} {}<Left>
" imap [] []<Left>
" imap () ()<Left>
" imap "" ""<Left>
" imap '' ''<Left>

" �ե����륿���״�Ϣ��ͭ����
filetype plugin indent on

" Python�Ѥ�����
autocmd FileType python set tabstop=4
autocmd FileType python set expandtab
autocmd FileType python let b:did_ftplugin = 1
autocmd FileType python set completeopt-=preview

" ���顼�������������
colorscheme molokai 
highlight Normal ctermbg=none
