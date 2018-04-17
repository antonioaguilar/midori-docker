#!/bin/bash

# runs in Mac OS only
PORT=22000

for((index=1; index <= 5; index++)) do
  PORT=$(($PORT + 1));
  open vnc:password@localhost:$PORT
done
