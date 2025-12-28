---
layout: page
title: Archive
permalink: /archive/
---

<div class="archive-list">
{% assign postsByYear = site.posts | group_by_exp: "post", "post.date | date: '%Y'" %}
{% for year in postsByYear %}
  <div class="year-section">
    <h2>{{ year.name }}</h2>
    <div class="archive-year-grid">
    {% for post in year.items %}
      <article class="archive-item clickable-card" data-href="{{ post.url | relative_url }}" role="link" tabindex="0" aria-label="{{ post.title | escape }}">
        <h3 class="archive-title"><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
        <div class="archive-date">
          {{ post.date | date: site.date_format }}
          {% if post.categories.size > 0 %}
            - {{ post.categories | join: ", " }}
          {% endif %}
        </div>
      </article>
    {% endfor %}
    </div>
  </div>
{% endfor %}
</div>

{% if site.posts.size == 0 %}
<p>まだ記事がありません。</p>
{% endif %}
