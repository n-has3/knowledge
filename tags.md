---
layout: page
title: Tags
permalink: /tags/
---

<div class="tags-cloud">
	<h2>タグを選択</h2>
	<div class="filter-chips" id="tag-filter-list">
		{% assign sorted_tags = site.tags | sort %}
		{% for tag in sorted_tags %}
			{% assign tag_name = tag[0] %}
			{% assign tag_slug = tag_name | slugify %}
			<a class="filter-chip" href="#{{ tag_slug }}" data-tag="{{ tag_slug }}">
				<span class="chip-label">{{ tag_name }}</span>
				<span class="tag-count">({{ tag[1].size }})</span>
			</a>
		{% endfor %}
	</div>

	<div id="tag-results">
		<p class="no-content" id="tag-empty">タグを選択してください。</p>

		{% for tag in sorted_tags %}
			{% assign tag_name = tag[0] %}
			{% assign tag_slug = tag_name | slugify %}
			<section class="category-section tag-result" id="tag-{{ tag_slug }}" data-tag="{{ tag_slug }}" style="display:none;">
				<h2 class="category-title">
					<span class="category-icon">🏷️</span>{{ tag_name }}
					<span class="category-count-badge">{{ tag[1].size }}</span>
				</h2>
				<div class="category-posts">
					{% for post in tag[1] %}
						<article class="category-post-item clickable-card" data-href="{{ post.url | relative_url }}" role="link" tabindex="0" aria-label="{{ post.title | escape }}">
							<h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
							<div class="post-meta">
								<time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: site.date_format }}</time>
								{% if post.categories.size > 0 %}
									<span class="post-categories">
										{% for category in post.categories %}
											{% assign cat_slug = category | slugify %}
											{% assign cat_path = '/archive' %}
											{% if category == '技術メモ' %}
												{% assign cat_path = '/tech-memo' %}
											{% elsif category == '振り返り' %}
												{% assign cat_path = '/retrospective' %}
											{% endif %}
											<a class="category" href="{{ cat_path | relative_url }}#{{ cat_slug }}">{{ category }}</a>
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
	</div>
</div>

<script>
(function() {
	const chips = document.querySelectorAll('[data-tag]');
	const results = document.querySelectorAll('.tag-result');
	const empty = document.getElementById('tag-empty');

	function activate(tag) {
		let found = false;
		results.forEach(section => {
			const match = section.dataset.tag === tag;
			section.style.display = match ? 'block' : 'none';
			if (match) found = true;
		});
		chips.forEach(chip => {
			chip.classList.toggle('is-active', chip.dataset.tag === tag);
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
