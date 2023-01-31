# lets look  for time with most requests to site
#!/bin/bash
awk '{a[$4]++;} END {for (i in a) print a[i],i | "sort -rnk1"}' apache_logs.txt | tr -d '['
