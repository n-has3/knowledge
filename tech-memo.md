---
layout: page
title: 技術メモ
permalink: /tech-memo/
---

<div class="categories-list">
  {% assign tech_posts = site.posts | where_exp: "post", "post.categories contains '技術メモ'" %}
  {% if tech_posts.size > 0 %}
    <section class="category-section" id="{{ '技術メモ' | slugify }}">
      <h2 class="category-title">
        <span class="category-icon">📂</span>技術メモ
        <span class="category-count-badge">{{ tech_posts.size }}</span>
      </h2>
      <div class="category-posts">
        {% for post in tech_posts %}
          <article class="category-post-item clickable-card" data-href="{{ post.url | relative_url }}" role="link" tabindex="0" aria-label="{{ post.title | escape }}">
            <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
            <div class="post-meta">
              <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: site.date_format }}</time>
              {% if post.tags.size > 0 %}
                <span class="post-tags">
                  {% for tag in post.tags %}
                    <a class="chip" href="{{ '/tags' | relative_url }}#{{ tag | slugify }}">{{ tag }}</a>
                  {% endfor %}
                </span>
              {% endif %}
            </div>
            {% if post.excerpt %}
              <div class="post-excerpt">{{ post.excerpt | strip_html | truncate: 150 }}</div>
            {% endif %}
          </article>
        {% endfor %}
      </div>
    </section>
  {% else %}
    <p class="no-content">技術メモの投稿はまだありません。</p>
  {% endif %}
</div>
