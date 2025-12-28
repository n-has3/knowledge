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
    {% for post in year.items %}
      <div class="archive-item">
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        <div class="archive-date">
          {{ post.date | date: site.date_format }}
          {% if post.categories.size > 0 %}
            - {{ post.categories | join: ", " }}
          {% endif %}
        </div>
      </div>
    {% endfor %}
  </div>
{% endfor %}
</div>

{% if site.posts.size == 0 %}
<p>まだ記事がありません。</p>
{% endif %}
