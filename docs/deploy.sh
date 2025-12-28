#!/bin/bash

# デプロイスクリプト
# ビルド → コミット → プッシュを一括実行

set -e  # エラーで停止

echo "🚀 デプロイプロセスを開始..."

# 現在のブランチを確認
CURRENT_BRANCH=$(git branch --show-current)
echo "📍 現在のブランチ: $CURRENT_BRANCH"

# ビルド
echo ""
./build.sh

# Gitの状態確認
echo ""
echo "📊 変更内容を確認中..."
git status

# コミットメッセージの入力
echo ""
read -p "📝 コミットメッセージを入力してください: " COMMIT_MESSAGE

if [ -z "$COMMIT_MESSAGE" ]; then
    COMMIT_MESSAGE="Update site: $(date +'%Y-%m-%d %H:%M:%S')"
fi

# コミット
echo ""
echo "💾 コミット中..."
git add .
git commit -m "$COMMIT_MESSAGE"

# プッシュ確認
echo ""
read -p "🔼 $CURRENT_BRANCH ブランチにプッシュしますか? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git push origin $CURRENT_BRANCH
    echo "✅ デプロイ完了！"
    echo ""
    if [ "$CURRENT_BRANCH" = "main" ]; then
        echo "🌐 サイトは数分後に更新されます:"
        echo "   https://n-has3.github.io/knowledge/"
    else
        echo "⚠️  mainブランチではないため、サイトは更新されません"
        echo "   mainにマージするには: git checkout main && git merge $CURRENT_BRANCH && git push"
    fi
else
    echo "❌ プッシュをキャンセルしました"
fi
