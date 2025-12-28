---
layout: page
title: Categories
permalink: /categories/
---

<div class="categories-grid">
  {% assign sorted_categories = site.categories | sort %}
  {% for category in sorted_categories %}
    {% assign category_name = category[0] %}
    {% assign category_posts = category[1] %}
    
    <div class="category-card">
      <div class="category-header">
        <h2 class="category-name">
          <a href="#{{ category_name | slugify }}">{{ category_name }}</a>
        </h2>
        <span class="category-count">{{ category_posts.size }} 記事</span>
      </div>
      <div class="category-preview">
        {% for post in category_posts limit:3 %}
          <a href="{{ post.url | relative_url }}" class="category-preview-item">
            {{ post.title }}
          </a>
        {% endfor %}
      </div>
    </div>
  {% endfor %}
</div>

<div class="categories-list">
  {% assign sorted_categories = site.categories | sort %}
  {% for category in sorted_categories %}
    {% assign category_name = category[0] %}
    {% assign category_posts = category[1] %}
    
    <section class="category-section" id="{{ category_name | slugify }}">
      <h2 class="category-title">
        <span class="category-icon">📂</span>{{ category_name }}
        <span class="category-count-badge">{{ category_posts.size }}</span>
      </h2>
      
      <div class="category-posts">
        {% for post in category_posts %}
          <article class="category-post-item">
            <h3>
              <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
            </h3>
            <div class="post-meta">
              <time datetime="{{ post.date | date_to_xmlschema }}">
                {{ post.date | date: site.date_format }}
              </time>
              {% if post.tags.size > 0 %}
                <span class="post-tags">
                  {% for tag in post.tags %}
                    <a href="{{ '/tags' | relative_url }}#{{ tag | slugify }}" class="chip">{{ tag }}</a>
                  {% endfor %}
                </span>
              {% endif %}
            </div>
            {% if post.excerpt %}
              <div class="post-excerpt">
                {{ post.excerpt | strip_html | truncate: 150 }}
              </div>
            {% endif %}
          </article>
        {% endfor %}
      </div>
    </section>
  {% endfor %}
</div>

{% if site.categories.size == 0 %}
  <p class="no-content">まだカテゴリが付けられた記事がありません。</p>
{% endif %}
