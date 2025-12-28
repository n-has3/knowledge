---
layout: page
title: インタラクションテスト
permalink: /test-interactions/
---

このページではカード全体クリック・タグ/カテゴリフィルタの挙動を確認できます。

## カード全体クリック
<div class="post-list">
  <article class="post-item post-card" data-href="/knowledge/2025/12/28/demo/">
    <h3><a href="/knowledge/2025/12/28/demo/">デモ記事 (サンプル)</a></h3>
    <p class="post-meta">
      <time datetime="2025-12-28">2025年12月28日</time>
      <span class="post-categories">
        <a class="category" href="/knowledge/categories/#%E6%8A%80%E8%A1%93%E3%83%A1%E3%83%A2">技術メモ</a>
      </span>
    </p>
    <div class="post-excerpt">カード内のどこをクリックしても記事に遷移するか確認してください。タグリンクは従来通り個別に遷移します。</div>
    <div class="post-tags-inline">
      <span class="tag"><a class="chip" href="/knowledge/tags/#demo">demo</a></span>
      <span class="tag"><a class="chip" href="/knowledge/tags/#sample">sample</a></span>
    </div>
  </article>
</div>

## タグ選択表示（例）
<p>タグページ <a href="/knowledge/tags/#demo">/tags/#demo</a> で demo タグだけ表示されるか確認してください。</p>

## カテゴリ選択表示（例）
<p>カテゴリページ <a href="/knowledge/categories/#%E6%8A%80%E8%A1%93%E3%83%A1%E3%83%A2">/categories/#技術メモ</a> で 技術メモ のみ表示されるか確認してください。</p>

## 画像の載せ方
1. 画像を `assets/img/` に保存（例: `assets/img/sample.png`）。
2. 記事の Markdown で:
   ```markdown
   ![代替テキスト]({{ '/assets/img/sample.png' | relative_url }})
   ```
3. 同ディレクトリに置く場合は相対パス `![alt](sample.png)` でも可。
4. 幅調整例: `![alt]({{ '/assets/img/sample.png' | relative_url }}){: width="640" }`

<script>
(function() {
  var cards = document.querySelectorAll('.post-card');
  cards.forEach(function(card) {
    card.addEventListener('click', function(e) {
      if (e.target.closest('a, button')) return;
      var href = card.dataset.href;
      if (href) window.location = href;
    });
  });
})();
</script>
