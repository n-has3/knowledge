---
layout: page
title: 記事
permalink: /tech-memo/
---

<div class="post-list">
	<div class="post-grid">
		{% for post in site.posts %}
			<article class="post-item post-card clickable-card" data-href="{{ post.url | relative_url }}" role="link" tabindex="0" aria-label="{{ post.title | escape }}">
				<h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
				<div class="post-meta-row">
					<p class="post-meta">
						<span class="meta-block"><i class="ri-calendar-2-line"></i>
							<time datetime="{{ post.date | date_to_xmlschema }}">
								{{ post.date | date: site.date_format }}
							</time>
						</span>
					</p>
				</div>
				{% if post.excerpt %}
					<div class="post-excerpt">
						{{ post.excerpt }}
					</div>
				{% endif %}
				{% if post.tags.size > 0 %}
					<div class="post-tags-inline">
						{% for tag in post.tags limit:5 %}
							<span class="tag"><a class="chip" href="{{ '/tags' | relative_url }}#{{ tag | slugify }}">{{ tag }}</a></span>
						{% endfor %}
					</div>
				{% endif %}
			</article>
		{% endfor %}
	</div>
</div>
