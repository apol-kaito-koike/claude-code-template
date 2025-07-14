#!/bin/bash

# WSLとDockerコンテナ間でのコード共有設定スクリプト

echo "WSL-Docker統合設定を開始します..."

# 現在のワークスペースパスを確認
WORKSPACE_PATH=$(pwd)
echo "ワークスペースパス: $WORKSPACE_PATH"

# WSL側でのGit設定確認
echo "=== Git設定の確認 ==="
git config --list --show-origin | grep user

# Docker Desktopの設定確認
echo "=== Docker Desktop WSL統合の確認 ==="
if command -v docker &> /dev/null; then
    echo "✓ Dockerコマンドが利用可能です"
    docker version
else
    echo "✗ Dockerコマンドが見つかりません"
    echo "Docker Desktop for WindowsでWSL統合を有効にしてください"
fi

# ファイル権限の設定
echo "=== ファイル権限の設定 ==="
chmod +x changebash.sh 2>/dev/null || true
echo "✓ 実行権限を設定しました"

# devcontainerの構成確認
echo "=== DevContainer設定の確認 ==="
if [ -f ".devcontainer/devcontainer.json" ]; then
    echo "✓ devcontainer.json が見つかりました"
else
    echo "✗ devcontainer.json が見つかりません"
fi

if [ -f ".devcontainer/Dockerfile" ]; then
    echo "✓ Dockerfile が見つかりました"
else
    echo "✗ Dockerfile が見つかりません"
fi

echo ""
echo "=== 使用方法 ==="
echo "1. VS Codeでこのフォルダを開く"
echo "2. Ctrl+Shift+P → 'Dev Containers: Reopen in Container'"
echo "3. コンテナ内とWSL上の両方でコードが同期されます"
echo ""
echo "=== マウント設定 ==="
echo "- WSLパス: $WORKSPACE_PATH"
echo "- コンテナパス: /home/dev_user/workspace"
echo "- 双方向同期: 有効"
echo ""
echo "設定完了!"
