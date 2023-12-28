#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <target_ip> <port_range>"
    exit 1
fi

target_ip=$1
port_range=$2

echo "Scanning ports on $target_ip..."

for port in $(seq $port_range); do
    (echo >/dev/tcp/$target_ip/$port) &>/dev/null &&
        echo "Port $port is open" ||
        echo "Port $port is closed"
done

echo "Port scanning completed."
