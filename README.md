# dotfiles
My editor configuration files.

## 開発環境エディタ関連の設定ファイル管理
【対象エディタ】  
・vim  
・Eclipse (neon:5.5.0)  
・秀丸  
・iTerm2  
・Visual Studio Code  

## 作業PCのホームディレクトリに dotfiles をcloneする。
```
$ git clone https://github.com/yhecha/dotfiles
```

## シンボリックリンクを貼る
```
$ ln -sf /Users/{ユーザー名}/dotfiles/vim/.vimrc ~/.vimrc
```

-s：シンボリックリンクを作成。  
-f：リンク先に同名のファイルがあっても上書きする。  

## VScode関連の設定
プラグインは ~/.vscode にあるが、膨大な量になってしまうので  
GitHubでの管理対象とはしない。  

```
$ ln -nfs /Users/{ユーザー名}/dotfiles/VScode/Code/User /Users/{ユーザー名}/Library/Application Support/Code/User
```
