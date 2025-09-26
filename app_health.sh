#!/bin/bash
# Application Health Checker

APP_URL="http://localhost:4499"
STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" $APP_URL)

if [ "$STATUS" -eq 200 ]; then
    echo "Application is UP (status code: $STATUS)"
else
    echo "Application is DOWN (status code: $STATUS)"
fi
