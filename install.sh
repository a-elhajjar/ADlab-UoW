#!/bin/sh
echo 'Please select from the server list:'
nl server.list
count="$(wc -l server.list | cut -f 1 -d' ')"
n=""
while true; do
    read -p 'Select option: ' n
    # If $n is an integer between one and $count...
    if [ "$n" -eq "$n" ] && [ "$n" -gt 0 ] && [ "$n" -le "$count" ]; then
        break
    fi
done
value="$(sed -n "${n}p" server.list)"
echo "The user selected option number $n: '$value'"