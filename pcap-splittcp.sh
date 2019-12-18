#!/bin/bash

END=$(tshark -r "$1" -T fields -e tcp.stream | sort -n | tail -1)

for ((i=0;i<=END;i++)); do
    outputFile="stream-$i.txt"
    echo "$outputFile"
    tshark -r "$1" -qz follow,tcp,ascii,$i > "$outputFile"
done
