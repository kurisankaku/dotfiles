" vi互換ではなくVimのデフォルト設定にすうる
set nocompatible
"-------------------------
"Start Neobndle Settings.
"-------------------------

" 一旦ファイルタイプ関連を無効化
filetype off
" neobundleでプラグインを管理
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundle 'Shougo/neobundle.vim'
" 以下のプラグインをバンドル
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'basyura/unite-rails'
NeoBundle 'kana/vim-submode'
NeoBundle "slim-template/vim-slim"
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'thoughtbot/vim-rspec'
call neobundle#end()

filetype plugin indent on
"-------------------------
" End Neobundle Settings.
"-------------------------
syntax on
set background=dark
colorscheme jellybeans
set list listchars=tab:\¦\
set number         " 行番号を表示する
set showmatch      " 対応する括弧を強調表示
set list           " 不可視文字を表示
set ruler          " カーソルが何行目の何列か表示
set showcmd        " コマンドの一部を表示
set encoding=utf8  " エンコード"
set fileencoding=utf-8


" 不可視文字の表示記号指定
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" カーソル移動関連の設定

set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" ファイル処理関連の設定

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" 検索/置換の設定

set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

" タブ/インデントの設定

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" 動作環境との統合関連の設定

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
" マウスの入力を受け付ける
set mouse=a

" コマンドラインの設定

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

" ビープの設定

"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴ら

"------------------------------
"キーをカスタマイズ
"------------------------------
" ハイライトをESC二回で消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Rspec用ショートカット"
map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec -c {spec}"
"-------------------------------
"固有設定
"-------------------------------
"
"===============================
" デフォルトでツリーを表示させる
"= =============================
autocmd VimEnter * execute 'NERDTree'

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""
" NERDTree setting
"""""""""""""""""""""""""""""""
" カーソルが外れているときは自動的にnerdtreeを隠す
function! ExecuteNERDTree()
 "b:nerdstatus = 1 : NERDTree 表示中
 "b:nerdstatus = 2 : NERDTree 非表示中
  if !exists('g:nerdstatus')
    execute 'NERDTree ./'
    let g:windowWidth = winwidth(winnr())
    let g:nerdtreebuf = bufnr('')
    let g:nerdstatus = 1
  elseif g:nerdstatus == 1
    execute 'wincmd t'
    execute 'vertical resize' 0
    execute 'wincmd p'
    let g:nerdstatus = 2
  elseif g:nerdstatus == 2
    execute 'wincmd t'
    execute 'vertical resize' g:windowWidth
    let g:nerdstatus = 1
  endif
endfunction
"noremap <c-e> :<c-u>:call ExecuteNERDTree()<cr>
