// 検索機能
(function() {
    let posts = [];
    let filteredPosts = [];
    
    const searchInput = document.getElementById('search-input');
    const searchClear = document.getElementById('search-clear');
    const searchResults = document.getElementById('search-results');
    const searchStats = document.getElementById('search-stats');
    const categoryFilter = document.getElementById('category-filter');
    const tagFilter = document.getElementById('tag-filter');
    const resetButton = document.getElementById('reset-filters');
    
    // 検索データの読み込み
    fetch('/knowledge/search.json')
        .then(response => response.json())
        .then(data => {
            posts = data;
            filteredPosts = posts;
        })
        .catch(error => {
            console.error('検索データの読み込みに失敗しました:', error);
            searchResults.innerHTML = '<p class="search-error">検索データの読み込みに失敗しました。</p>';
        });
    
    // 検索実行
    function performSearch() {
        const query = searchInput.value.toLowerCase().trim();
        const selectedCategory = categoryFilter.value;
        const selectedTag = tagFilter.value;
        
        // フィルタリング
        filteredPosts = posts.filter(post => {
            // キーワード検索
            const matchesQuery = !query || 
                post.title.toLowerCase().includes(query) ||
                post.content.toLowerCase().includes(query) ||
                post.excerpt.toLowerCase().includes(query) ||
                post.tags.some(tag => tag.toLowerCase().includes(query)) ||
                post.categories.some(cat => cat.toLowerCase().includes(query));
            
            // カテゴリフィルター
            const matchesCategory = !selectedCategory || 
                post.categories.includes(selectedCategory);
            
            // タグフィルター
            const matchesTag = !selectedTag || 
                post.tags.includes(selectedTag);
            
            return matchesQuery && matchesCategory && matchesTag;
        });
        
        displayResults();
        updateStats(query, selectedCategory, selectedTag);
    }

    function escapeAttr(text) {
        return String(text || '')
            .replace(/&/g, '&amp;')
            .replace(/"/g, '&quot;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;');
    }
    
    // 検索結果の表示
    function displayResults() {
        if (filteredPosts.length === 0) {
            searchResults.innerHTML = '<p class="no-results">検索結果が見つかりませんでした。</p>';
            return;
        }
        
        const query = searchInput.value.toLowerCase().trim();
        let html = '<div class="search-results-list">';
        
        filteredPosts.forEach(post => {
            let title = post.title;
            let excerpt = post.excerpt;
            
            // ハイライト処理
            if (query) {
                const regex = new RegExp(`(${escapeRegex(query)})`, 'gi');
                title = title.replace(regex, '<mark>$1</mark>');
                excerpt = excerpt.replace(regex, '<mark>$1</mark>');
            }
            
            html += `
                <article class="search-result-item clickable-card" data-href="${post.url}" role="link" tabindex="0" aria-label="${escapeAttr(post.title)}">
                    <h3><a href="${post.url}">${title}</a></h3>
                    <div class="post-meta">
                        <time>${post.date}</time>
                        ${post.categories.length > 0 ? `
                            <span class="post-categories">
                                ${post.categories.map(cat => {
                                    const slug = cat.toLowerCase() === '技術メモ' ? '技術メモ' : cat.toLowerCase() === '振り返り' ? '振り返り' : cat;
                                    const base = cat === '技術メモ' ? '/knowledge/tech-memo' : cat === '振り返り' ? '/knowledge/retrospective' : '/knowledge/archive';
                                    return `<a class="category" href="${base}#${slug}">${cat}</a>`;
                                }).join('')}
                            </span>
                        ` : ''}
                        ${post.tags.length > 0 ? `
                            <span class="post-tags">
                                ${post.tags.map(tag => `<span class="tag">${tag}</span>`).join('')}
                            </span>
                        ` : ''}
                    </div>
                    <div class="post-excerpt">${excerpt}</div>
                </article>
            `;
        });
        
        html += '</div>';
        searchResults.innerHTML = html;
    }
    
    // 統計情報の更新
    function updateStats(query, category, tag) {
        const total = posts.length;
        const filtered = filteredPosts.length;
        
        let statsText = `${filtered} / ${total} 件の記事`;
        
        const filters = [];
        if (query) filters.push(`キーワード: "${query}"`);
        if (category) filters.push(`カテゴリ: ${category}`);
        if (tag) filters.push(`タグ: ${tag}`);
        
        if (filters.length > 0) {
            statsText += ` (${filters.join(', ')})`;
        }
        
        searchStats.innerHTML = statsText;
    }
    
    // 正規表現のエスケープ
    function escapeRegex(str) {
        return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    }
    
    // クリアボタンの表示/非表示
    function toggleClearButton() {
        searchClear.style.display = searchInput.value ? 'block' : 'none';
    }
    
    // フィルターのリセット
    function resetFilters() {
        searchInput.value = '';
        categoryFilter.value = '';
        tagFilter.value = '';
        toggleClearButton();
        performSearch();
    }
    
    // イベントリスナー
    searchInput.addEventListener('input', () => {
        toggleClearButton();
        performSearch();
    });
    
    searchClear.addEventListener('click', () => {
        searchInput.value = '';
        toggleClearButton();
        performSearch();
        searchInput.focus();
    });
    
    categoryFilter.addEventListener('change', performSearch);
    tagFilter.addEventListener('change', performSearch);
    resetButton.addEventListener('click', resetFilters);
    
    // Enterキーでの検索
    searchInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            performSearch();
        }
    });
    
    // 初期表示
    toggleClearButton();
})();
