#!/bin/bash

# 设置脚本目录
script_dir="/home/cloud/unused_sh"

# 遍历目录中的每个文件
for script in "$script_dir"/*; do
    # 检查是否为文件
    if [ -f "$script" ]; then
        echo "running: $script"
        # 执行脚本
        bash "$script"
    fi
done
