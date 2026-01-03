#!/bin/bash

# デプロイスクリプト
# ビルド → コミット → プッシュを一括実行

set -e  # エラーで停止

echo "🚀 デプロイプロセスを開始..."

# ルートディレクトリに移動
cd "$(dirname "$0")/.."

# 現在のブランチを確認
CURRENT_BRANCH=$(git branch --show-current)
echo "📍 現在のブランチ: $CURRENT_BRANCH"

# mainブランチ以外の場合は警告
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "⚠️  警告: mainブランチではありません"
    read -p "   続行しますか? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ デプロイをキャンセルしました"
        exit 0
    fi
fi

# 未コミットの変更を確認
if ! git diff-index --quiet HEAD --; then
    echo "⚠️  未コミットの変更があります"
    git status --short
    echo ""
    read -p "これらの変更を含めてデプロイしますか? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ デプロイをキャンセルしました"
        exit 0
    fi
fi

# ビルド
echo ""
./scripts/build.sh

# ビルド後の変更を確認
echo ""
echo "📊 変更内容を確認中..."
if git diff --quiet && git diff --cached --quiet; then
    echo "   変更はありません"
    echo "✅ デプロイする内容がないため、終了します"
    exit 0
fi

git status --short

# コミットメッセージの入力
echo ""
echo "📝 コミットメッセージを入力してください"
echo "   （空白の場合は自動生成されます）"
read -p "   メッセージ: " COMMIT_MESSAGE

if [ -z "$COMMIT_MESSAGE" ]; then
    COMMIT_MESSAGE="Update site: $(date +'%Y-%m-%d %H:%M:%S')"
fi

# コミット
echo ""
echo "💾 コミット中..."
git add -A
if git commit -m "$COMMIT_MESSAGE"; then
    echo "   ✓ コミット完了"
else
    echo "⚠️  コミット済みまたはコミットする変更がありません"
fi

# プッシュ確認
echo ""
echo "📤 プッシュの準備ができました"
echo "   ブランチ: $CURRENT_BRANCH"
echo "   コミット: $COMMIT_MESSAGE"
read -p "🔼 プッシュしますか? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git push origin $CURRENT_BRANCH
    echo "✅ デプロイ完了！"
    echo ""
    if [ "$CURRENT_BRANCH" = "main" ]; then
        echo "🌐 サイトは数分後に更新されます:"
        echo "   https://nmin70.github.io/knowledge/"
        echo ""
        echo "💡 ローカルで確認するには:"
        echo "   bundle exec jekyll serve"
        echo "   http://localhost:4000/knowledge/"
    else
        echo "⚠️  mainブランチではないため、サイトは更新されません"
        echo "   mainにマージするには:"
        echo "   git checkout main && git merge $CURRENT_BRANCH && git push"
    fi
else
    echo "❌ プッシュをキャンセルしました"
    echo "   コミットは完了しているので、後でプッシュできます:"
    echo "   git push origin $CURRENT_BRANCH"
fi
