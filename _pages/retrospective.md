---
layout: page
title: 振り返り
permalink: /retrospective/
---

<div class="categories-list">
  {% assign retro_posts = site.posts | where_exp: "post", "post.categories contains '振り返り'" %}
  {% if retro_posts.size > 0 %}
    <section class="category-section" id="{{ '振り返り' | slugify }}">
      <div class="category-posts">
        {% for post in retro_posts %}
          <article class="category-post-item clickable-card" data-href="{{ post.url | relative_url }}" role="link" tabindex="0" aria-label="{{ post.title | escape }}">
            <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
            <div class="post-meta-row">
              <div class="post-meta">
                <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: site.date_format }}</time>
              </div>
              {% if post.tags.size > 0 %}
                <div class="post-tags-inline">
                  {% for tag in post.tags %}
                    <span class="tag"><a class="chip" href="{{ '/tags' | relative_url }}#{{ tag | slugify }}">{{ tag }}</a></span>
                  {% endfor %}
                </div>
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
    <p class="no-content">振り返りの投稿はまだありません。</p>
  {% endif %}
</div>
