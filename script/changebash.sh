#!/bin/bash

# 現在のユーザーのホームディレクトリを使用
USER_HOME=$HOME

# バックアップを作成
cp $USER_HOME/.bashrc $USER_HOME/bashrc.bak

# カスタムbashrcをコピー
cp $USER_HOME/workspace/.bashrc $USER_HOME/.bashrc

# バックアップを削除
rm -f $USER_HOME/bashrc.bak

# 新しい設定を読み込み
source $USER_HOME/.bashrc
