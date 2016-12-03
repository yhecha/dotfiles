" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" 2016/11/04 NeoBundle config Add **********
" 起動時にruntimepathにNeoBundleのパスを追加する
if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=/Users/hecha/.vim/bundle/neobundle.vim/
endif

" NeoBundle設定の開始
call neobundle#begin(expand('/Users/hecha/.vim/bundle'))

" NeoBundleのバージョンをNeoBundle自身で管理する
NeoBundleFetch 'Shougo/neobundle.vim'

" --- 以下にインストールしたいプラグインを記述 ---

" unite.vimプラグイン
NeoBundle 'Shougo/unite.vim'

" Markdown リアルタイムプレビュー用プラグイン
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" NERDTree
NeoBundle 'scrooloose/nerdtree'
" NERDTree key map
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" ------------------------------------------------

" NeoBundle設定の終了
call neobundle#end()

filetype plugin indent on
                 
" vim起動時に未インストールのプラグインをインストールする
NeoBundleCheck
"*******************************************

" Customize **********
"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup

"スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup

" Line number
set number

" インクリメンタールサーチ有効(逐次検索)
set incsearch

" タブの代わりに空白文字を挿入する
set expandtab

" tabキーを押した時の幅を設定
set tabstop=4

" 閉じカッコが入力されたとき、対応するカッコを表示する。
set showmatch

" 文字コードをUTF-8に変換させる
set encoding=utf-8

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" PreVim Settings
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" Previm key map
nnoremap <silent><C-p> :PrevimOpen<CR>

" markdownの折りたたみを無効にする
let g:vim_markdown_folding_disabled=1

"----------
" カラースキーム
"----------
colorscheme molokai
syntax on

