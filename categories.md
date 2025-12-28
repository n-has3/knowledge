---
layout: page
title: Categories
permalink: /categories/
---

<div class="categories-list">
	{% assign sorted_categories = site.categories | sort %}

	{% if sorted_categories.size > 0 %}
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
		{% endfor %}
	{% else %}
		<p class="no-content">カテゴリに紐づく投稿はまだありません。</p>
	{% endif %}
</div>
