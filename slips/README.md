Example

- `/home/user/dataset/merge.pcap`

Workflow

- Put `.pcap` files into the folder called `dataset`

- Merge them use `merge.sh` to merge all `.pcap` files into one file.

- Go to `/home/user/`

- Use docker to run Slips, replay the `merge.pcap`. You should do this in the 

  ```
  sudo docker run --rm -it -p 55000:55000 --net=host --cap-add=NET_ADMIN -v $(pwd)/output:/StratosphereLinuxIPS/output -v $(pwd)/dataset:/StratosphereLinuxIPS/dataset --name slips stratosphereips/slips:latest /StratosphereLinuxIPS/slips.py -f dataset/merge.pcap
  ```

Files

- `output_slips`: the output I got from Slips. (3.94GB)
  - /metadata
  - /zeek_files: this folder is 3.19GB originally, we delete all files larger than 100MB for the limitation of GitHub
    - conn.log
    - dns.log
    - ssl.log
    - arp.log
    - files.log
    - http.log
    - rdp.log

  - alerts.json
  - alerts.log
  - errors.log
  - flows.sqlite
  - slips.log

- `merge.sh`: make all `.pcap` files into one big file. (2KB)
- `merge.pcap`: the `pcap` data from the CIC-IDS2018 (day 2018-Feb-14) dataset. (34GB)

Output Example

```
Slips. Version 1.0.12 (d697955f)
https://stratosphereips.org
---------------------------
[Main] Using redis server on port: 6379
Started Main process [PID 16]
Started PBar process [PID 29]
Starting modules
                Starting the module ARP (Detect ARP attacks) [PID 39]
                Starting the module Flow Alerts (Alerts about flows: long connection, successful ssh, password guessing, self-signed certificate, data exfiltration, etc.) [PID 41]
                Starting the module Flow ML Detection (Train or test a Machine Learning model to detect malicious flows) [PID 43]
                Starting the module HTTP Analyzer (Analyze HTTP flows) [PID 44]
                Starting the module IP Info (Get different info about an IP/MAC address) [PID 45]
                Starting the module Network Discovery (Detect Horizonal, Vertical Port scans, ICMP, and DHCP scans) [PID 46]
                Starting the module Risk IQ (Module to get passive DNS info about IPs from RiskIQ) [PID 47]
                Starting the module RNN C&C Detection (Detect C&C channels based on behavioral letters) [PID 48]
                Starting the module Threat Intelligence (Check if the source IP or destination IP are in a malicious list of IPs) [PID 49]
                Starting the module Timeline (Creates kalipso timeline of what happened in the network based on flows and available data) [PID 50]
                Starting the module Update Manager (Update Threat Intelligence files) [PID 61]
                Starting the module Virustotal (IP, domain and file hash lookup on Virustotal) [PID 62]
---------------------------
[Main] Disabled Modules: ['template', 'ensembling', 'exporting_alerts', 'p2ptrust', 'cesnet', 'blocking', 'leak_detector', 'cyst']
[Evidence] Storing Slips logs in output_dir
Started Evidence Process [PID 63]
Started Profiler Process [PID 64]
[Main] Metadata added to output_dir/metadata
Started Input Process [PID 65]
[Main] Warning: Slips may generate a large amount of traffic by querying TI sites.
[Input] Storing zeek log files in output_dir/zeek_files
[Evidence] 2018/03/09 20:58:04.781627+0000 IP 192.168.2.16 detected as malicious in timewindow 1 (start 2018/03/09 20:49:16, stop 2018/03/09 21:49:16) 
given the following evidence:
        - Detected Connecting to private IP: 10.243.26.217 on destination port: 8080 threat level: info.
        - Detected Horizontal port scan to port  8080/TCP. From 192.168.2.16 to 15 unique destination IPs. Total packets sent: 113. Confidence: 1. by Slips threat le
          vel: high.
        - Detected Horizontal port scan to port  8080/TCP. From 192.168.2.16 to 5 unique destination IPs. Total packets sent: 19. Confidence: 1. by Slips threat leve
          l: high.
        - Detected Horizontal port scan to port  2323/TCP. From 192.168.2.16 to 5 unique destination IPs. Total packets sent: 22. Confidence: 1. by Slips threat leve
          l: high.
        - Detected Horizontal port scan to port  2323/TCP. From 192.168.2.16 to 10 unique destination IPs. Total packets sent: 44. Confidence: 1. by Slips threat lev
          el: high.
        - Detected Connecting to private IP: 241.180.10.126 on destination port: 19741 threat level: info.
        - Detected Connecting to private IP: 192.168.2.1 on destination port: 67 threat level: info.
        - Detected Connecting to private IP: 192.168.2.1 on destination port: 67 threat level: info.
        - Detected Connecting to private IP: 192.168.2.1 on destination port: 67 threat level: info.
        - Detected Horizontal port scan to port  9527/TCP. From 192.168.2.16 to 5 unique destination IPs. Total packets sent: 25. Confidence: 1. by Slips threat leve
          l: high.
        - Detected Connecting to private IP: 242.71.13.157 on destination port: 52238 threat level: info.
        - Detected Horizontal port scan to port  8080/TCP. From 192.168.2.16 to 30 unique destination IPs. Total packets sent: 351. Confidence: 1. by Slips threat le
          vel: high.
        - Detected Horizontal port scan to port  23/TCP. From 192.168.2.16 to 5 unique destination IPs. Total packets sent: 25. Confidence: 1. by Slips threat level:
           high.
        - Detected Horizontal port scan to port  23/TCP. From 192.168.2.16 to 20 unique destination IPs. Total packets sent: 221. Confidence: 1. by Slips threat leve
          l: high.
        - Detected Connecting to private IP: 10.35.25.41 on destination port: 7292 threat level: info.

[Input] We read everything. No more input. Stopping input process. Sent 541 linesst 1 hr: 4. (2024/03/31 08:17:10)
[Input] Stopping. Total lines read: 541
Total analyzed IPs so far: 16. Evidence Added: 237. IPs sending traffic in the last 1 hr: 1. (2024/03/31 08:17:15)
---------------------------
[Main] Stopping Slips
[Main] Analysis of dataset/test7-malicious.pcap finished in 0.72 minutes
[Main]  Profiler                Stopped. 13 left.
[Main]  Threat Intelligence     Stopped. 12 left.
[Main]  RNN C&C Detection       Stopped. 11 left.
[Main]  HTTP Analyzer           Stopped. 10 left.
[Main]  IP Info                 Stopped. 9 left.
[Main]  Input                   Stopped. 8 left.
[Main]  ARP                     Stopped. 7 left.
[Main]  Flow ML Detection       Stopped. 6 left.
[Main]  Network Discovery       Stopped. 5 left.
[Main]  Timeline                Stopped. 4 left.
[Main]  Progress Bar            Stopped. 3 left.
[Main] The following modules are busy working on your data.

['Update Manager', 'Flow Alerts', 'Evidence']

You can wait for them to finish, or you can press CTRL-C again to force-kill.

[Main] Update Manager may take several minutes to finish updating 45+ TI files.
[Main]  Flow Alerts             Stopped. 2 left.
```

