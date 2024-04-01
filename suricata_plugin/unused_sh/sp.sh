#!/bin/bash

# 定义pcap文件的目录路径
PCAP_DIR="/mnt/vdb/pcap_sliced"
# 定义要使用的网络接口
INTERFACE="eth0"
# 定义mbps，默认值为100
SPEED="1000"
# 定义日志文件名，包含速度参数和日期时间
LOG_FILE="/home/cloud/send_pcap_log_${SPEED}_$(date '+%Y%m%d_%H%M%S').txt"

# 检查是否以root用户运行
if [ "$(id -u)" -ne 0 ]; then
  echo "error: root required" 1>&2
  exit 1
fi

# 检查tcpreplay是否安装
if ! command -v tcpreplay &> /dev/null; then
  echo "error: tcpreplay required" 1>&2
  exit 1
fi

# 确保PCAP_DIR变量不为空
if [ -z "$PCAP_DIR" ]; then
  echo "error: PCAP_DIR required" 1>&2
  exit 1
fi

# 获取总文件数，用于进度显示
total_files=$(find "$PCAP_DIR" -type f | wc -l)
current_file=0
total_duration=0
exec_start_time=$(date +%s)

# 转到包含pcap文件的目录
cd "$PCAP_DIR" || exit

# 遍历目录中的所有文件，并发送它们
for pcap in *; do
  if [[ -f "$pcap" ]]; then
    current_file=$((current_file + 1))
    percentage=$((current_file * 100 / total_files))
    # 在终端显示进度
    printf "\rSending PCAP files: %d%% (%d/%d)" "$percentage" "$current_file" "$total_files"
    # 将详细信息记录到日志文件中
    {
      echo "Sending: $pcap"
      sudo tcpreplay --intf1="$INTERFACE" -M "$SPEED" "$pcap"
      echo "--------------------------------"
    } >> "$LOG_FILE" 2>&1
  fi
done

TOTAL_END_TIME=$(date +%s)
SCRIPT_DURATION=$((TOTAL_END_TIME - exec_start_time))
if [ $current_file -gt 0 ]; then
  AVERAGE_DURATION=$((SCRIPT_DURATION / current_file))
fi

echo -e "Total execution time: ${SCRIPT_DURATION}s for $current_file files.\nAverage execution time per file: ${AVERAGE_DURATION}s." >> "$LOG_FILE"
echo -e "\nAll PCAP files have been sent successfully."
