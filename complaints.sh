#!/bin/bash
# assumes your db name is grupochat
# customize home directory, sql username, sql pass if applicable
# see ntfy.sh for more info on how to use that for push notifications
# this can do whatever other commands you prefer to act on complaints including passing along to AI for
# automoderation, that will come later.
# sorry for first draft, this whole things for internal use so I dont lose these jobs but feel free to use/adapt.

COUNTFILE="/home/nia/tmp/old_complaints.txt"
QUEUEFILE="/home/nia/tmp/workqueue.tmp"

OLDVAR=$(cat "$COUNTFILE" 2>/dev/null || echo 0)

VAR=$(mysql -N -u USER -pYOUR_PASSWORD grupochat \
    -e "SELECT COUNT(*) FROM gr_complaints WHERE complaint_status = 0;")

if [ "$VAR" -lt "$OLDVAR" ]; then
echo "$VAR" > "$COUNTFILE"
exit
fi

if [ "$VAR" -gt "$OLDVAR" ]; then
	curl -d "A new complaint has been generated" ntfy.sh/YOUR_TOPIC_HERE
fi

echo "$VAR" > "$COUNTFILE"
