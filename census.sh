#!/bin/bash
# assumes your db name is grupochat
# customize home directory, sql username, sql pass if applicable
# see ntfy.sh for more info on how to use that for push notifications
# this can do whatever other commands you prefer to act on complaints including passing along to AI for
# automoderation, that will come later.
# sorry for first draft, this whole things for internal use so I dont lose these jobs but feel free to use/adapt.

COUNTFILE="/home/nia/tmp/old_census.txt"
QUEUEFILE="/home/nia/tmp/workqueue.tmp"

OLDVAR=$(cat "$COUNTFILE" 2>/dev/null || echo 0)

VAR=$(mysql -N -u USERNAME -pYOUR_PASSWORD_HERE grupochat \
    -e "SELECT COUNT(*) FROM gr_group_members WHERE group_id = 2;")

if [ "$VAR" -lt "$OLDVAR" ]; then
	echo "$VAR" > "$COUNTFILE" 
	exit
fi

if [ "$VAR" -ne "$OLDVAR" ]; then
    curl -d "census update! new visitor in room 2" ntfy.sh/YOUR-TOPIC-HERE
    fi

echo "$VAR" > "$COUNTFILE"

