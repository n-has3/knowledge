---
layout: post
title: "Jekyllで技術ブログを始める方法"
date: 2025-12-28
categories: [Jekyll, Web開発]
tags: [Jekyll, GitHub Pages, ブログ]
---

GitHub PagesとJekyllを使って技術ブログを構築する方法を紹介します。

## Jekyllとは

Jekyllは静的サイトジェネレーターで、Markdownファイルから美しいウェブサイトを生成できます。GitHub Pagesと統合されているため、無料でホスティングできます。

## 基本的な構成

Jekyllサイトの基本構成は以下の通りです：

```
.
├── _config.yml       # サイト設定
├── _layouts/         # レイアウトテンプレート
├── _posts/          # ブログ記事
├── assets/          # CSS、画像などの静的ファイル
└── index.md         # トップページ
```

## 記事の書き方

記事は `_posts` ディレクトリに配置します。ファイル名は `YYYY-MM-DD-title.md` の形式にする必要があります。

### Front Matter

各記事の先頭には、YAMLフロントマターを記述します：

```yaml
---
layout: post
title: "記事のタイトル"
date: 2025-12-28
categories: [カテゴリ1, カテゴリ2]
tags: [タグ1, タグ2]
---
```

### Markdown記法

Jekyllでは標準的なMarkdown記法が使えます：

- **太字**: `**太字**`
- *斜体*: `*斜体*`
- [リンク](https://example.com): `[リンク](URL)`
- コードブロック: バッククォート3つで囲む

## コードのシンタックスハイライト

```python
def hello_world():
    print("Hello, World!")
    return True
```

```javascript
const greeting = (name) => {
    console.log(`Hello, ${name}!`);
};
```

## 便利な機能

### カテゴリとタグ

記事にカテゴリとタグを設定することで、コンテンツを整理できます。

### パーマリンク

`_config.yml` でパーマリンクの形式をカスタマイズできます：

```yaml
permalink: /:year/:month/:day/:title/
```

### SEO対策

`jekyll-seo-tag` プラグインを使用すると、メタタグが自動的に生成されます。

## まとめ

Jekyllは学習コストが低く、すぐに技術ブログを始められます。Markdownで記事を書くだけなので、コンテンツ作成に集中できるのが魅力です。

次回は、カスタムテーマの作り方について解説します。

## 参考リンク

- [Jekyll公式ドキュメント](https://jekyllrb.com/)
- [GitHub Pages](https://pages.github.com/)
- [Markdown記法](https://www.markdownguide.org/)
