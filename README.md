# Tech Knowledge Base

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

# ローカルサーバーの起動
bundle exec jekyll serve

# ブラウザで http://localhost:4000/knowledge/ にアクセス
```

## 📂 ディレクトリ構成

```
.
├── _config.yml          # サイト設定
├── _layouts/            # レイアウトテンプレート
│   ├── default.html     # 基本レイアウト
│   ├── home.html        # トップページ
│   ├── post.html        # ブログ記事
│   └── page.html        # 固定ページ
├── _posts/              # ブログ記事（Markdown）
├── assets/              # 静的ファイル
│   └── css/
│       └── style.css    # スタイルシート
├── about.md             # Aboutページ
├── archive.md           # アーカイブページ
└── index.md             # トップページ
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

## 🤝 コントリビューション

バグ報告や機能提案は、GitHubのIssuesからお願いします。

## 📄 ライセンス

MIT License

## 📮 お問い合わせ

ご質問やフィードバックがありましたら、GitHubのIssuesからお気軽にご連絡ください。