#! /bin/bash
 
for file in "$@"
do
nohup xdg-open "$file" &
done
sleep 1