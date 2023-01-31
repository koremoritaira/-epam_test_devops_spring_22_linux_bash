# looking for the bots and write them into bots.txt
#!/bin/bash
awk '{print $1 "\t" $14 "\t" $15}' apache_logs.txt | sed -n /bot/p | tr -d '+' | sort -u | tee bots.txt
