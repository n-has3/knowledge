---
layout: post
title: "Gitコマンド早見表"
date: 2025-12-27
categories: [Git, バージョン管理]
tags: [Git, CLI, チートシート]
---

よく使うGitコマンドをまとめました。日々の開発で参考にしてください。

## 基本操作

### リポジトリの初期化

```bash
# 新規リポジトリの作成
git init

# リモートリポジトリのクローン
git clone <repository-url>
```

### 変更の追跡

```bash
# ファイルをステージング
git add <file>

# すべての変更をステージング
git add .

# ステータス確認
git status

# 変更内容の確認
git diff
```

### コミット

```bash
# コミットの作成
git commit -m "コミットメッセージ"

# ステージングとコミットを同時に実行
git commit -am "コミットメッセージ"

# 直前のコミットを修正
git commit --amend
```

## ブランチ操作

### ブランチの管理

```bash
# ブランチ一覧の表示
git branch

# 新しいブランチの作成
git branch <branch-name>

# ブランチの切り替え
git checkout <branch-name>

# ブランチの作成と切り替えを同時に実行
git checkout -b <branch-name>

# ブランチの削除
git branch -d <branch-name>
```

### マージ

```bash
# ブランチをマージ
git merge <branch-name>

# マージの中止
git merge --abort
```

## リモート操作

### リモートリポジトリ

```bash
# リモートの一覧表示
git remote -v

# リモートの追加
git remote add origin <repository-url>

# リモートからの取得
git fetch origin

# リモートからの取得とマージ
git pull origin <branch-name>

# リモートへのプッシュ
git push origin <branch-name>
```

## 履歴の確認

### ログの表示

```bash
# コミット履歴の表示
git log

# グラフ表示
git log --graph --oneline --all

# 特定ファイルの履歴
git log <file>
```

### 変更の確認

```bash
# ワーキングディレクトリとステージングの差分
git diff

# ステージングとHEADの差分
git diff --staged

# 特定のコミット間の差分
git diff <commit1> <commit2>
```

## やり直し

### 変更の取り消し

```bash
# ワーキングディレクトリの変更を破棄
git checkout -- <file>

# ステージングを解除
git reset HEAD <file>

# コミットの取り消し（HEADの移動）
git reset --soft HEAD^

# コミットと変更の取り消し
git reset --hard HEAD^
```

### 特定のコミットに戻る

```bash
# 特定のコミットに移動（detached HEAD）
git checkout <commit-hash>

# 特定のコミットまで戻る
git reset --hard <commit-hash>

# 特定のコミットを打ち消す新しいコミットを作成
git revert <commit-hash>
```

## 便利なコマンド

### スタッシュ

```bash
# 変更を一時保存
git stash

# スタッシュ一覧
git stash list

# スタッシュを適用
git stash apply

# スタッシュを適用して削除
git stash pop
```

### タグ

```bash
# タグの作成
git tag <tag-name>

# 注釈付きタグの作成
git tag -a <tag-name> -m "メッセージ"

# タグの一覧
git tag

# タグをプッシュ
git push origin <tag-name>
```

## まとめ

これらのコマンドを覚えておけば、日常的なGit操作には困りません。
より詳しい使い方は公式ドキュメントを参照してください。

## 参考リンク

- [Git公式ドキュメント](https://git-scm.com/doc)
- [Pro Git Book](https://git-scm.com/book/ja/v2)
