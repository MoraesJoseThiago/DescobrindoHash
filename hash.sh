#!/bin/bash
hash="806825f0827b628e81620f0d83922fb2c52c7136"

for seq in $(cat /usr/share/john/password.lst); do 
    hashmd5=$(echo -n "$seq" | md5sum | awk '{print $1}')
    hashbase64=$(echo -n "$hashmd5" | base64 | awk '{print $1}')
    hashsha1=$(echo -n "$hashbase64" | sha1sum | awk '{print $1}')
    if [ "$hashsha1" == "$hash" ]; then
        echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
        echo "Senha encontrada:" "$seq"
        echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
        break
    else
        echo "Senha vista: " "$seq"
        echo "Ela em hashmd5: " "$hashmd5"
        echo "Ela em hashbase64: " "$hashbase64"
        echo "Ela em hashsha1: " "$hashsha1"
    fi
done
