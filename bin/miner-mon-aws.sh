#!/bin/bash

APP_TOKEN=""
USER_TOKEN=""
MESSAGE=$(hostname)

FILE_TO_MONITOR="/var/log/xmrig"

function send_pushover_message()
{
    /usr/bin/curl -s \
	      --form-string "token=${APP_TOKEN}" \
	      --form-string "user=${USER_TOKEN}" \
	      --form-string "message=Miner is down on ${MESSAGE}" \
	        https://api.pushover.net/1/messages.json
}

FOUND_FILE=$(/usr/bin/find /var/log -name xmrig -mmin 5)

foreach file in ${FOUND_FILE}; do send_pushover_message; done

