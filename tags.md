---
layout: page
title: Tags
permalink: /tags/
---

<div class="tags-cloud">
  <h2>タグクラウド</h2>
    <div class="tag-cloud-items">
    {% assign sorted_tags = site.tags | sort %}
    {% for tag in sorted_tags %}
      {% assign tag_name = tag[0] %}
      {% assign tag_posts = tag[1] %}
      <a href="#{{ tag_name | slugify }}" class="tag-cloud-item"><span class="chip">{{ tag_name }} <span class="tag-count">({{ tag_posts.size }})</span></span></a>
    {% endfor %}
  </div>
</div>

<div class="tags-list">
  {% assign sorted_tags = site.tags | sort %}
  {% for tag in sorted_tags %}
    {% assign tag_name = tag[0] %}
    {% assign tag_posts = tag[1] %}
    
    <section class="tag-section" id="{{ tag_name | slugify }}">
      <h2 class="tag-title">
        <span class="tag-icon">#</span>{{ tag_name }}
        <span class="tag-count-badge">{{ tag_posts.size }}</span>
      </h2>
      
      <div class="tag-posts">
        {% for post in tag_posts %}
          <article class="tag-post-item">
            <h3>
              <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
            </h3>
            <div class="post-meta">
              <time datetime="{{ post.date | date_to_xmlschema }}">
                {{ post.date | date: site.date_format }}
              </time>
              {% if post.categories.size > 0 %}
                <span class="post-categories">
                  {% for category in post.categories %}
                    <span class="category">{{ category }}</span>
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

{% if site.tags.size == 0 %}
  <p class="no-content">まだタグが付けられた記事がありません。</p>
{% endif %}
