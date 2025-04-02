#!/bin/bash

# ディレクトリの指定（引数がない場合は現在のディレクトリを使用）
TARGET_DIR=${1:-.}

# 処理対象のファイルを配列に格納
files=()
for file in "$TARGET_DIR"/*.pdf "$TARGET_DIR"/*.png "$TARGET_DIR"/*.pptx "$TARGET_DIR"/*.JPG "$TARGET_DIR"/*.PNG "$TARGET_DIR"/*.jpg
do
  # ファイルが存在する場合のみ配列に追加
  if [ -f "$file" ]; then
    files+=("$file")
  fi
done

# ファイルが存在する場合のみ処理を実行
if [ ${#files[@]} -gt 0 ]; then
  # input_dataの形式でJSONを作成
  input_data=$(printf '{"files": %s}' "$(printf '%s\n' "${files[@]}" | jq -R . | jq -s .)")
  # すべてのファイルを一度に処理
  echo "$input_data" | python converter.py
else
  echo "処理対象のファイルが見つかりません。"
  echo "使用方法: $0 [対象ディレクトリ]"
  echo "例: $0 /path/to/your/files"
fi
