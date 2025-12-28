# # nmin blog

技術メモとナレッジベースを共有するブログサイトです。

## 🌐 サイトURL

https://n-has3.github.io/knowledge/

## 📝 概要

日々の開発で学んだことや技術的な発見をまとめるための個人的なナレッジベースです。
GitHub PagesとJekyllを使用して構築されています。

## 🚀 ローカルでの実行方法

### 必要な環境

- Ruby 2.7以上
- Bundler

### セットアップ

```bash
# リポジトリをクローン
git clone https://github.com/n-has3/knowledge.git
cd knowledge

# 依存パッケージのインストール
bundle install
```

### 開発サーバーの起動（プレビュー用）

```bash
# ローカルサーバーの起動
bundle exec jekyll serve

# ブラウザで http://localhost:4000/knowledge/ にアクセス
```

### ビルド & デプロイ

このサイトは**ローカルでビルドしてから**GitHub Pagesにデプロイします。

#### ビルド

```bash
# ビルドスクリプトを実行
./scripts/build.sh

# 静的ファイルが docs/ ディレクトリに生成されます
```

```

#### GitHub Pages設定

1. リポジトリの Settings → Pages
2. Source: **Deploy from a branch**
3. Branch: `main` / Folder: `/docs`
4. Save

→ `docs/` ディレクトリの内容がそのまま公開されます（ビルド済みなのでActionsは動きません）

## 📂 ディレクトリ構成

```
.
├── _config.yml          # サイト設定
├── _feature-post/       # 記事の下書き置き場
├── _layouts/            # レイアウトテンプレート
│   ├── default.html     # 基本レイアウト
│   ├── home.html        # トップページ
│   ├── post.html        # ブログ記事
│   └── page.html        # 固定ページ
├── _posts/              # ブログ記事（Markdown）
├── assets/              # 静的ファイル
│   ├── css/
│   │   └── style.css    # スタイルシート
│   └── js/
│       └── search.js    # 検索機能
├── pages/               # ページファイル(Markdown & HTML)
│   ├── about.md         # Aboutページ
│   ├── archive.md       # アーカイブページ
│   ├── categories.html  # カテゴリリダイレクト
│   ├── retrospective.md # 振り返りページ
│   ├── search.md        # 検索ページ
│   ├── tags.md          # タグページ
│   ├── tech-memo.md     # 技術メモページ
│   └── test-interactions.md  # テストページ
├── _templates/          # 新規記事テンプレート
├── docs/                # ビルド済み静的ファイル（GitHub Pages公開用）
├── img/                 # 画像アセット
├── scripts/             # ビルド・デプロイスクリプト
│   ├── build.sh         # ビルドスクリプト
│   └── deploy.sh        # デプロイスクリプト
├── Gemfile              # Ruby依存の定義
├── Gemfile.lock         # 依存関係のロックファイル
├── .nojekyll            # GitHub PagesでJekyllビルドを無効化
├── search.json          # 検索インデックス
├── index.md             # トップページ
```

## ✍️ 記事の書き方

### 新しい記事の作成

1. `_posts` ディレクトリに新しいMarkdownファイルを作成
2. ファイル名は `YYYY-MM-DD-title.md` 形式にする
3. Front Matterを記述

```markdown
---
layout: post
title: "記事のタイトル"
date: YYYY-MM-DD
categories: [カテゴリ1, カテゴリ2]
tags: [タグ1, タグ2]
---

ここに記事の内容を書く
```

### Markdownの記法

- 見出し: `#`, `##`, `###`
- リスト: `-` または `1.`
- コードブロック: バッククォート3つで囲む
- リンク: `[テキスト](URL)`
- 画像: `![代替テキスト](画像URL)`

## 🎨 カスタマイズ

### サイト設定の変更

`_config.yml` でサイトのタイトル、説明、URLなどを変更できます。

### スタイルの変更

`assets/css/style.css` でデザインをカスタマイズできます。

### カラーテーマの変更

`style.css` の `:root` セクションでカラー変数を変更できます：

```css
:root {
    --primary-color: #2c3e50;
    --secondary-color: #3498db;
    --accent-color: #e74c3c;
    /* ... */
}
```

## 📦 使用技術

- [Jekyll](https://jekyllrb.com/) - 静的サイトジェネレーター
- [GitHub Pages](https://pages.github.com/) - ホスティング
- [Markdown](https://www.markdownguide.org/) - 記事の執筆
