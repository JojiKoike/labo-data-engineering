#!/bin/bash

# 01から75までのループ
for i in {01..75}
do
    # 元のファイル名
    original_filename="パズル${i}.txt"
    # 新しいファイル名
    new_filename="puzzle_${i}.txt"

    # Shift JIS から UTF-8 に変換して新しい名前で保存
    iconv -f SHIFT_JIS -t UTF-8 "$original_filename" -o "$new_filename"
done
