---
layout: page
title: Search
permalink: /search/
---

<div class="search-container">
  <div class="search-box-wrapper">
    <input type="text" id="search-input" class="search-input" placeholder="検索キーワードを入力..." autocomplete="off">
    <button id="search-clear" class="search-clear" style="display: none;">×</button>
  </div>
  
  <div class="search-filters">
    <div class="filter-group">
      <label>カテゴリ:</label>
      <select id="category-filter" class="filter-select">
        <option value="">すべて</option>
        {% assign sorted_categories = site.categories | sort %}
        {% for category in sorted_categories %}
          <option value="{{ category[0] }}">{{ category[0] }} ({{ category[1].size }})</option>
        {% endfor %}
      </select>
    </div>
    
    <div class="filter-group">
      <label>タグ:</label>
      <select id="tag-filter" class="filter-select">
        <option value="">すべて</option>
        {% assign sorted_tags = site.tags | sort %}
        {% for tag in sorted_tags %}
          <option value="{{ tag[0] }}">{{ tag[0] }} ({{ tag[1].size }})</option>
        {% endfor %}
      </select>
    </div>
    
    <button id="reset-filters" class="reset-button">フィルターをリセット</button>
  </div>
  
  <div id="search-stats" class="search-stats"></div>
  
  <div id="search-results" class="search-results">
    <p class="search-instruction">キーワードを入力するか、カテゴリ・タグでフィルタリングしてください</p>
  </div>
</div>

<script src="{{ '/assets/js/search.js' | relative_url }}"></script>
