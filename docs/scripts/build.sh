#!/bin/bash

# Jekyll ビルドスクリプト
# GitHub Pages用にローカルでビルドを実行

set -e  # エラーで停止

echo "🔨 Jekyll ビルドを開始..."

# クリーンアップ
echo "📦 既存のdocsディレクトリをクリーンアップ..."
rm -rf docs/

# Jekyllビルド
echo "🏗️  Jekyllビルドを実行中..."
bundle exec jekyll build

# .nojekyllファイルをdocsにコピー
echo "📄 .nojekyllファイルをコピー..."
cp .nojekyll docs/.nojekyll

# 完了
echo "✅ ビルド完了！"
echo "📁 静的ファイルは docs/ ディレクトリに生成されました"
echo ""
echo "次のステップ:"
echo "  1. ローカルで確認: bundle exec jekyll serve"
echo "  2. コミット: git add docs/ && git commit -m 'Build site'"
echo "  3. プッシュ: git push origin dev"
