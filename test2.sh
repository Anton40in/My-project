#!/bin/bash

#find all folders
LIST_DIR=$(find /root/backup -type d)
NEEDED_COUNT=$2

for i in $LIST_DIR
  do
   #count backups in each folder
   AMOUNT_BACKUPS=$(find $i -type f -name '*.tar.gz' -ctime +$1 | wc -l)
     #compare ampunt with needed $2
     if [[ "$AMOUNT_BACKUPS" -gt "$NEEDED_COUNT" ]]
        then
          #find "oldest and remove"
          CANDIDATE=$(ls -1t $i | tail -1)
          echo "removing $i/$CANDIDATE"
          find $i -type f -name "$CANDIDATE" -delete
        else
          echo "found $AMOUNT_BACKUPS files in $i less then $NEEDED_COUNT"
      fi
done

