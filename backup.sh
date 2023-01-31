# backuping two directories defined from commandline
#!/bin/bash

#set -o errexit
#make variables  defined
#set -o nounset
#set -o pipefail

readonly SD="${1}"
readonly BD="${2}"
readonly DATETIME="$(date '+%Y-%m-%d_%H:%M:%S')"
readonly BACKUP_PATH="${BD}/"
# creation time of this file shows when was last syncronization
readonly LATEST_LINK="${BD}/latest"

# checking for source directory
if [ -d ${SD} ]
then
    echo "Source directory located."
else
    echo "Error: source directory does not exists. Exit script."
    
    exit
fi

# cheking for destination directory
if [ -d ${BD} ]
then
    echo "Destination directory exists. Processing..."
else
    echo "Error: destinaton directory does not exist."
    echo "Creating..."
    mkdir -p "${BD}"
    echo "Processing..."
fi

rsync --info=COPY,DEL,NAME,BACKUP,REMOVE,SKIP,STATS --log-file=log.txt -q -a --delete "${SD}/" "${BD}"

rm -rf "${LATEST_LINK}"
ln -s "${BD}" "${LATEST_LINK}"

