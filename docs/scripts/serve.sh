#!/bin/bash

# Jekyll ローカルサーバー起動スクリプト
# 開発中のプレビュー用

set -e  # エラーで停止

echo "🚀 Jekyll ローカルサーバーを起動..."

# ルートディレクトリに移動
cd "$(dirname "$0")/.."

# ポート4000が使用中かチェック
if lsof -Pi :4000 -sTCP:LISTEN -t >/dev/null 2>&1; then
    echo "⚠️  ポート4000は既に使用されています"
    echo ""
    read -p "既存のプロセスを終了しますか? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🔄 既存のプロセスを終了中..."
        lsof -ti:4000 | xargs kill -9 2>/dev/null || true
        sleep 1
    else
        echo "❌ 起動をキャンセルしました"
        exit 0
    fi
fi

# Jekyllサーバー起動
echo "🌐 サーバーを起動中..."
echo "   URL: http://localhost:4000/knowledge/"
echo ""
echo "💡 ヒント:"
echo "   - ファイルを編集すると自動的に再生成されます"
echo "   - 停止するには Ctrl+C を押してください"
echo ""

bundle exec jekyll serve --livereload
