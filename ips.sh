#looking for ips
#!/bin/bash
awk '{print $1}' apache_logs.txt > ips.out
sort ips.out | uniq -c | sort -n -r -k1,1 | head -1
