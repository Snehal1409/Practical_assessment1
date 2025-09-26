#!/bin/bash
# System Health Monitoring

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# CPU Check
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d "." -f1)
if [ "$CPU" -gt "$CPU_THRESHOLD" ]; then
    echo "ALERT: CPU usage high! ($CPU%)"
fi

# Memory Check
MEM=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100.0}')
if [ "$MEM" -gt "$MEM_THRESHOLD" ]; then
    echo "ALERT: Memory usage high! ($MEM%)"
fi

# Disk Check
DISK=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$DISK" -gt "$DISK_THRESHOLD" ]; then
    echo "ALERT: Disk usage high! ($DISK%)"
fi
