---
layout: page
title: Categories
permalink: /categories/
---

{% assign allowed_categories = "技術メモ|振り返り" | split: "|" %}

<div class="categories-grid">
  <div class="category-card" style="grid-column: 1 / -1;">
    <div class="category-header">
      <h2 class="category-name">カテゴリを選択</h2>
    </div>
    <div class="filter-chips" id="category-filter-list">
      {% for category_name in allowed_categories %}
        {% assign category_posts = site.categories[category_name] %}
        {% assign category_slug = category_name | slugify %}
        <a class="filter-chip" href="#{{ category_slug }}" data-category="{{ category_slug }}">
          <span class="chip-label">{{ category_name }}</span>
          <span class="tag-count">({{ category_posts | default: empty | size }})</span>
        </a>
      {% endfor %}
    </div>
  </div>
</div>

<div class="categories-list">
  <p class="no-content" id="category-empty">カテゴリを選択してください。</p>

  {% for category_name in allowed_categories %}
    {% assign category_posts = site.categories[category_name] %}
    {% assign category_slug = category_name | slugify %}
    <section class="category-section" id="category-{{ category_slug }}" data-category="{{ category_slug }}" style="display:none;">
      <h2 class="category-title">
        <span class="category-icon">📂</span>{{ category_name }}
        <span class="category-count-badge">{{ category_posts | default: empty | size }}</span>
      </h2>
      <div class="category-posts">
        {% if category_posts and category_posts.size > 0 %}
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
                      <a class="chip" href="{{ '/tags' | relative_url }}#{{ tag | slugify }}">{{ tag }}</a>
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
        {% else %}
          <p class="no-content">まだ記事がありません。</p>
        {% endif %}
      </div>
    </section>
  {% endfor %}
</div>

<script>
(function() {
  const chips = document.querySelectorAll('[data-category]');
  const sections = document.querySelectorAll('.category-section');
  const empty = document.getElementById('category-empty');

  function activate(cat) {
    let found = false;
    sections.forEach(section => {
      const match = section.dataset.category === cat;
      section.style.display = match ? 'block' : 'none';
      if (match) found = true;
    });
    chips.forEach(chip => {
      const match = chip.dataset.category === cat;
      chip.classList.toggle('is-active', match);
    });
    empty.style.display = found ? 'none' : 'block';
  }

  function handleHash() {
    const hash = window.location.hash.replace('#', '');
    activate(hash);
  }

  window.addEventListener('hashchange', handleHash);
  handleHash();
})();
</script>
