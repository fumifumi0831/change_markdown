# Markdown変換ツール

PDF、画像、PowerPointファイルをMarkdown形式に変換するツールです。Gemini APIを使用して、ファイルの内容を解析し、Markdown形式で出力します。


## 機能

- PDFファイルの変換
- 画像ファイル（JPG、PNG）の変換
- PowerPointファイル（PPTX）の変換
- 複数ファイルの一括処理
- 変換結果のJSON形式での保存
- 各ファイルの変換結果を個別のテキストファイルとして保存

## 必要条件

- Python 3.x
- conda環境（doc環境）
- Gemini APIキー
- 必要なPythonパッケージ：
  - requests
  - Pillow
  - python-dotenv
  - pymupdf（PDF処理用）
  - python-pptx（PowerPoint処理用）

## セットアップ

1. conda環境の作成と有効化：

```bash
conda create -n doc python=3.x
conda activate doc
```

2. 必要なパッケージのインストール：

```bash
pip install -r requirements.txt
```

3. 環境変数の設定：
   `.env`ファイルを作成し、Gemini APIキーを設定：

```
gemini_api_key=your_api_key_here
```

## 使用方法

### 1. 単一ファイルの変換

```bash
python converter.py input_file.pdf
```

### 2. 複数ファイルの一括変換

`batch_convert.sh`を使用して、ディレクトリ内のすべての対象ファイルを変換：

```bash
# 現在のディレクトリのファイルを変換
./batch_convert.sh

# 特定のディレクトリのファイルを変換
./batch_convert.sh /path/to/your/files
```

### 3. 出力

変換結果は以下の形式で保存されます：

- `output_data/output_data.json`: すべての変換結果とエラー情報を含むJSONファイル
- `output_data/[ファイル名].txt`: 各ファイルの変換結果を個別のテキストファイル

## サポートされているファイル形式

- PDFファイル（.pdf）
- 画像ファイル（.jpg, .jpeg, .png, .JPG, .PNG）
- PowerPointファイル（.ppt, .pptx）

## エラーハンドリング

- ファイルが見つからない場合
- 変換に失敗した場合
- APIキーが設定されていない場合
- その他のエラー

エラー情報は `output_data.json`に記録され、コンソールにも表示されます。

## 注意事項

- Gemini APIキーが必要です
- 大量のファイルを処理する場合は、APIの制限に注意してください
- 画像ファイルの処理には時間がかかる場合があります

## ライセンス

このプロジェクトはMITライセンスの下で公開されています。
