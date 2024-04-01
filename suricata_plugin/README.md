# How to Download the Dataset

- Install the [AWS CLI](https://aws.amazon.com/cli/), available on Mac, Windows and Linux
- Run: ***aws s3 sync --no-sign-request --region <your-region> "s3://cse-cic-ids2018/" dest-dir\*** (Where **your-region** is your region from the [AWS regions list](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html) and **dest-dir** is the name of the desired destination folder in your machine)

see [here](https://www.unb.ca/cic/datasets/ids-2018.html)

# How to Use Suricata-plugin?

## 1. Install and Config `Telegraf-suricata plugin` on CentOS 7

```
sudo nano /etc/telegraf/telegraf.conf

# Ctrl+W => search for suricata, change the file, and save exit.
[[inputs.suricata]]
	source = "/var/run/suricata/suricata-stats.sock"
	delimiter = "_"
	version = "2"
sudo nano /usr/lib/systemd/system/telegraf.service
	Group=suricatatelegraf
```



## 2. Install and Config `Suricata` on CentOS 7

```bash
# Install
sudo yum install epel-release yum-plugin-copr
sudo yum copr enable @oisf/suricata-7.0
sudo yum install suricata
# Run as systemctl
sudo systemctl start suricata
sudo systemctl enable suricata

# Check your ip
ip addr
===============get the output, write the name down("eth0" in this case)===========>
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc fq_codel state UP group default qlen 1000
    link/ether fa:16:3e:e3:e3:be brd ff:ff:ff:ff:ff:ff
    altname enp0s3
    altname ens3
    inet 10.254.1.12/24 brd 10.254.1.255 scope global dynamic noprefixroute eth0        
       valid_lft 70262sec preferred_lft 70262sec
    inet6 fe80::f816:3eff:fee3:e3be/64 scope link
       valid_lft forever preferred_lft forever

# Config
sudo nano /etc/suricata/suricata.yaml

# Ctrl + W => to find default-log-dir, and change it like below
default-log-dir:/var/log/suricata/

# Ctrl + W => to find af-packet, and change it like below
af-packet:
    - interface: enp1s0
      cluster-id: 99
      cluster-type: cluster_flow
      defrag: yes
      use-mmap: yes
      tpacket-v3: yes
# Ctrl + W => find `eve-log` and change
- eve-log:
    enabled: yes
    filetype: unix_stream
    filename: /var/run/suricata/suricata-stats.sock # Remember this one
    types:
      - stats:
         threads: yes
# Ctrl + W => find `run_as` and change
run_as:
  group: suricatatelegraf

 =====================================finished the config===================================
# Install the Rule-book, which store at /var/lib/suricata/rules/suricata.rules
sudo suricata-update
 
# Restart
sudo systemctl restart suricata
 
# Find the folder
ps aux | grep suricata
sudo mkdir -p /var/run/suricata
sudo chown suricata:suricata /var/run/suricata

# check if it's good
sudo tail /var/log/suricata/suricata.log
====================output should be like====>
<Notice> - all 4 packet processing threads, 4 management threads initialized, engine started.
```

## 3. Get into same group

```
sudo groupadd suricatatelegraf
sudo usermod -a -G suricatatelegraf suricata
sudo usermod -a -G suricatatelegraf telegraf
```

## 4. Get the Unix Socket

```
sudo chown suricata:suricatatelegraf /var/run/suricata
sudo chmod 775 /var/run/suricata
# just for test, dont do it in any case
sudo chmod 777 /var/run/suricata/suricata-stats.sock
sudo systemctl restart telegraf
sudo systemctl restart suricata
sudo systemctl status telegraf
sudo systemctl status suricata
```

