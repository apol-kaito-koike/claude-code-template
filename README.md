# Claude Code DevContainer テンプレート

このリポジトリは、Claude Codeを使用した開発環境を素早くセットアップするためのDevContainerテンプレートです。

## 概要

- **目的**: Claude CodeとGitHub Copilotを統合した開発環境の提供
- **ベースイメージ**: Python 3.12-slim
- **主な機能**: 
  - Claude Code統合
  - Node.js環境
  - Gitブランチ表示付きカスタムプロンプト
  - 日本語対応設定

## 使い方

### 1. このテンプレートをクローン

```bash
git clone [このテンプレートのURL] my-project-env
cd my-project-env
```

### 2. 実際のプロジェクトをクローン

DevContainer内で作業したいプロジェクトをworkspace内にクローンします：

```bash
# 例: プロジェクトをprojectディレクトリにクローン
git clone https://github.com/[your-username]/[your-project].git project
```

### 3. DevContainerを起動

VSCodeでこのディレクトリを開き、以下のいずれかの方法でDevContainerを起動：

- コマンドパレット（F1）から「Dev Containers: Reopen in Container」を選択
- 左下の「><」アイコンをクリックして「Reopen in Container」を選択

### 4. 開発開始

DevContainer起動後、クローンしたプロジェクトディレクトリで開発を開始できます。

## ディレクトリ構成

```
.
├── .devcontainer/
│   └── devcontainer.json    # DevContainer設定
├── .github/
│   └── copilot-instructions.md  # Copilot日本語設定
├── .claude/
│   └── settings.local.json  # Claude Code権限設定
├── devcontainer.json        # DevContainer設定（ルート版）
├── Dockerfile              # コンテナイメージ定義
├── changebash.sh          # bashプロンプトカスタマイズスクリプト
├── .bashrc                # Gitブランチ表示プロンプト設定
├── CLAUDE.md              # Claude Code向けプロジェクト説明
└── README.md              # このファイル
```

## カスタマイズ

### ユーザー名の変更

#### デフォルト設定を使用する場合（推奨）

デフォルトでは`dev_user`/`devgroup`が使用されます。特別な理由がない限り、この設定をそのまま使用することを推奨します。

#### カスタムユーザー名を使用する場合

ユーザー名とグループ名をカスタマイズする場合は、`devcontainer.json`を以下のように修正します：

```json
{
    "name": "Claude Code Container",
    "build": {
        "dockerfile": "Dockerfile",
        "context": ".",
        "args": {
            "USERNAME": "myuser",
            "GROUPNAME": "mygroup",
            "UID": "1000",
            "GID": "1000"
        }
    },
    "features": {
        "ghcr.io/devcontainers/features/node:1": {},
        "ghcr.io/anthropics/devcontainer-features/claude-code:1.0": {}
    },
    "remoteUser": "myuser",
    "workspaceFolder": "/home/myuser/workspace",
    "postCreateCommand": "chmod +x ./changebash.sh && ./changebash.sh"
}
```

**重要**: `args`でユーザー名を変更する場合は、必ず`remoteUser`と`workspaceFolder`も同じユーザー名に変更してください。

### 追加の開発ツール

必要な開発ツールは`Dockerfile`に追加するか、DevContainerのfeaturesを使用して追加できます：

```json
"features": {
    "ghcr.io/devcontainers/features/node:1": {},
    "ghcr.io/anthropics/devcontainer-features/claude-code:1.0": {},
    // 追加のfeatureをここに
}
```

### bashプロンプトのカスタマイズ

`.bashrc`ファイルを編集してプロンプトの表示をカスタマイズできます。現在はGitブランチ名を赤色で表示する設定になっています。

## 注意事項

1. **DevContainer設定ファイル**: 
   - 2つのdevcontainer.jsonファイルがあります（ルートと.devcontainer/内）
   - どちらも同じ設定を使用し、デフォルトでは`dev_user`ユーザーを使用します
   - VSCodeは通常.devcontainer/内のファイルを優先します

2. **changebash.shの動作**:
   - スクリプトは`$HOME`環境変数を使用するため、どのユーザーでも動作します

3. **Claude Code権限**:
   - デフォルトで`find`と`tree`コマンドのみ許可されています
   - 追加のコマンドが必要な場合は`.claude/settings.local.json`を編集してください

## トラブルシューティング

### DevContainerが起動しない場合

1. Docker Desktopが起動していることを確認
2. VSCodeのDev Containers拡張機能がインストールされていることを確認
3. `devcontainer.json`のパスが正しいことを確認

### bashプロンプトが変更されない場合

```bash
# 手動でスクリプトを実行
chmod +x ./changebash.sh
./changebash.sh
source ~/.bashrc
```

## ライセンス

このテンプレートは自由に使用・改変できます。