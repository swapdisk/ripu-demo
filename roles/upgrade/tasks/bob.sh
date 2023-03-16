#!/bin/bash

  # Calculate total space required for snapshots (assume 32k PE size)
  printf '%-15s%10s\n' LOGVOL KB_NEEDED
  for rootvg_lv in $(df -lP | grep ^/ | awk '{print $1}' ); do
    fsreq=$(($(df -lP $rootvg_lv | tail -1 | awk '{print $3}')/2))
    fsmp=$(df -lP $rootvg_lv | tail -1 | awk '{print $6}')
    [[ $fsmp =~ ^/$|^/var && $fsreq -lt 4194304 ]] && fsreq=4194304
    printf '%-15s%10s\n' ${rootvg_lv#*-} $fsreq
    ((totalreq+=fsreq-fsreq%32768+32768))
  done
  printf '%-15s%10s\n' TOTAL $totalreq

