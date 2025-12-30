#!/bin/bash

# Jekyll ビルドスクリプト
# GitHub Pages用にローカルでビルドを実行

set -e  # エラーで停止

echo "🔨 Jekyll ビルドを開始..."

# ルートディレクトリに移動
cd "$(dirname "$0")/.."

# .nojekyllファイルの存在確認
if [ ! -f .nojekyll ]; then
    echo "⚠️  警告: .nojekyllファイルが見つかりません"
    echo "📝 作成中..."
    touch .nojekyll
fi

# クリーンアップ
echo "📦 既存のdocsディレクトリをクリーンアップ..."
rm -rf docs/

# Jekyllビルド（本番用: serveではなくbuild）
echo "🏗️  本番用ビルドを実行中..."
echo "   （GitHub Pages用のURLでビルドします）"
bundle exec jekyll build --config _config.yml

# .nojekyllファイルをdocsにコピー
echo "📄 .nojekyllファイルをコピー..."
if [ -f .nojekyll ]; then
    cp .nojekyll docs/.nojekyll
    echo "   ✓ コピー完了"
else
    echo "   ⚠️  .nojekyllファイルが見つかりません"
fi

# ビルド結果の確認
if [ -d "docs" ] && [ -f "docs/index.html" ]; then
    echo "✅ ビルド完了！"
    echo "📁 静的ファイルは docs/ ディレクトリに生成されました"
    echo ""
    echo "📊 生成されたファイル:"
    echo "   - ページ数: $(find docs -name 'index.html' | wc -l | tr -d ' ')"
    echo "   - CSSファイル: $(find docs -name '*.css' | wc -l | tr -d ' ')"
    echo "   - JSファイル: $(find docs -name '*.js' | wc -l | tr -d ' ')"
    echo ""
    echo "次のステップ:"
    echo "  1. ローカルで確認: bundle exec jekyll serve"
    echo "  2. デプロイ: ./scripts/deploy.sh"
else
    echo "❌ ビルドに失敗しました"
    exit 1
fi
