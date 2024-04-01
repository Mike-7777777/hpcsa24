#!/bin/bash

# 文件匹配模式
FILE_PATTERN="*.pcap"

# 合并后的文件名
MERGED_FILE="merge.pcap"

# 每批处理的文件数量
BATCH_SIZE=10

# 临时目录，用于存放每一批次的文件
TEMP_DIR="temp_batch_dir"

# 创建临时目录
mkdir -p "$TEMP_DIR"

# 初始化文件计数器和批次计数器
file_count=0
batch_count=0

# 找到所有符合模式的文件
find . -maxdepth 1 -name "$FILE_PATTERN" | while read file; do
    # 增加文件计数器
    ((file_count++))
    # 将文件移动到临时目录
    mv "$file" "$TEMP_DIR"

    # 检查是否达到批次大小
    if (( file_count % BATCH_SIZE == 0 )); then
        # 更新批次计数器
        ((batch_count++))
        
        # 执行合并操作
        if [ $batch_count -eq 1 ]; then
            # 第一批，直接合并到最终文件
            mergecap -w "$MERGED_FILE" $TEMP_DIR/$FILE_PATTERN
        else
            # 后续批次，合并到临时文件，然后替换原来的merge.pcap
            mergecap -w "${TEMP_DIR}/temp_merged.pcap" "$MERGED_FILE" $TEMP_DIR/$FILE_PATTERN
            mv "${TEMP_DIR}/temp_merged.pcap" "$MERGED_FILE"
        fi
        
        # 清理临时目录
        rm -rf "$TEMP_DIR"/*
    fi
done

# 处理最后一批，如果不足BATCH_SIZE
if (( file_count % BATCH_SIZE > 0 )); then
    # 执行合并操作
    mergecap -w "${TEMP_DIR}/temp_merged.pcap" "$MERGED_FILE" $TEMP_DIR/$FILE_PATTERN
    mv "${TEMP_DIR}/temp_merged.pcap" "$MERGED_FILE"
fi

# 删除临时目录
rm -rf "$TEMP_DIR"

