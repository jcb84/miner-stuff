#!/bin/bash

APP_TOKEN=""
USER_TOKEN=""
MESSAGE=$(hostname)

/usr/bin/curl -s \
	      --form-string "token=${APP_TOKEN}" \
	      --form-string "user=${USER_TOKEN}" \
	      --form-string "message=Miner is down on ${MESSAGE}" \
	        https://api.pushover.net/1/messages.json
