" dein vim config ----------
" 参考：http://qiita.com/ryo2851/items/4e3c287d5a0005780034
" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    let g:rc_dir    = expand("~/.config/nvim/")
    let s:toml      = g:rc_dir . '/dein.toml'
    " 起動時に必ずしも必要で無いプラグインはLazyに記載(今は特にないのでコメントアウト)
    " let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    " call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable


" Basic config ----------
" Line number
set number
" color scheme
colorscheme molokai
syntax on
" 256色
set t_Co=256
" truecolor¬
set termguicolors
" 背景色
set background=dark

if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Syntax hightlight
syntax enable
" 不可視文字を表示
set list
" スクロールするときに下が見えるように
set scrolloff=2
" 現在行をハイライト
set cursorline


" Tab ----------
" タブの代わりに空白文字を挿入する
set expandtab
" tabキーを押した時の幅を設定
set tabstop=4
" 自動インデントの幅
set shiftwidth=4
" 新しい行を作った時に高度なインデントを行う
set smarttab
" 新しい行のインデントを現在と同じにする
set autoindent


" Edit ----------
" 閉じカッコが入力されたとき、対応するカッコを表示する。
set showmatch
" 文字コードをUTF-8に変換させる
set encoding=utf-8
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" バックスペースで各種消せるように
set backspace=indent,eol,start
" Share clipbord
set clipboard=unnamed
" NERD Tree Toggle mapping.
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Search ----------
" 検索時に大文字小文字を区別しない
set ignorecase
" 大文字を含めた検索はそのままの通りで検索
set smartcase
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
" インクリメンタールサーチ有効(逐次検索)
set incsearch


" Other ----------
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" PreVim Settings
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
" PreVim kemap
nnoremap <silent><C-p> :PrevimOpen<CR>
" markdownの折りたたみを無効にする
let g:vim_markdown_folding_disabled=1
