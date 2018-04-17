#!/bin/bash

command -v docker >/dev/null 2>&1 || { echo "docker command not installed" >&2; exit 1; }

if [ $# -eq 0 ]; then echo "No URL provided"; exit 1; fi

URL=$1
PORT=22000

for((index=1; index <= 5; index++)) do

  BROWSER_ID="chrome-$index"
  PORT=$(($PORT + 1));

  docker run -it -d --rm \
  --name=$BROWSER_ID \
  -m 128M \
  -p $PORT:5901 \
  aaguilar/midori $URL

done
