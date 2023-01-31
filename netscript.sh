#!/bin/bash
echo
#	while [--n "$1"]
#	do
		case "$1" in
		--all) nmap -sn 192.168.31.1/24 -oG - | awk '/Up$/';;
		--target) nmap -p0-6553 192.168.31.*;;
		*) echo "Use --all to scan network to get IP and hostnames, use --target to scan network for opened ports.";;
		esac
		shift
