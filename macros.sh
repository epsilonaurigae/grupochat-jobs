#!/bin/bash
# TO-DOS: meeting state, timers, moderation commands, or eventually replacing the polling with direct PHP hooks or WebSockets.

# 07-13-2026 adds logic to enforce membership in groups 3 or 6. 
# defined at line 420:               AND gm.group_role_id IN (3, 6)
# this takes steps towards restoring oldschool JFT_BOT features for chairing "meetings" or doing moderation tasks.
# !gong and !sober are .. just examples, there are currently no chairmeeting commands in this script
# please see https://github.com/epsilonaurigae/legacy-jftbot/blob/main/README.md for more info on 
# lost functionalities from moving off of an ircii/bx based IRC chat robot.

# 07-13-2026 changed hardcoded instances of sender=ptcruiser to sender=$SENDER
# 07-13-2026 changed hardcoded instances of --data-urlencode 'group=2' to --data-urlencode "group=$GROUP_ID"
# 07-13-2026 added cooldown timers for theoretical chairpersons command, using !gong and !sober as 
# test cases.

# getting down to business...
# horrible way of doing this, when it can be invoked directly from PHP when a message is sent
# until then, invoke from crontab:
# example
#* * * * * /home/nia/sqljobs/macros.sh
#* * * * * sleep 10; /home/nia/sqljobs/macros.sh
#* * * * * sleep 20; /home/nia/sqljobs/macros.sh
#* * * * * sleep 30; /home/nia/sqljobs/macros.sh
#* * * * * sleep 40; /home/nia/sqljobs/macros.sh
#* * * * * sleep 50; /home/nia/sqljobs/macros.sh

# lets get to the variables.

SQLPASS="xxxxxxx"
APIKEY="xxxxx"

DB="grupochat"
#default group is zero, this one's "2" change to suit your needs.
GROUP_ID="2"
DBUSER="nia"
SENDER="ptcruiser"
# static content: where are things like videos or pictures of your keytags hosted?
STATIC_URL="https://static.neveralonerc.org"

# should be a relative path like ~/tmp/chatbot.lck
# this is proving to be a pain in the ass, probably something trivial. fuck it. ship it.
# change to suit your needs if you dont want to use /tmp 

LOCK="/tmp/chatbot.lock"
# URL to server
# ie: http://127.0.0.1 if applicable
# for most people this will be your grupochat instance. its a remote (clustered) server in our case
URL="http://api.neveralonerc.org/api_request/"

if [[ $(find "$LOCK" -mmin +2 2>/dev/null) ]]; then
    rm -f "$LOCK"
fi

if [[ -f "$LOCK" ]]; then
	echo "lockfile exists, exiting"
    exit 0
fi

trap "rm -f $LOCK" EXIT
touch "$LOCK"

# should be a relative path like ~/tmp/lastread.txt
# this is proving to be a pain in the ass, probably something trivial. fuck it. ship it.
# change to suit your needs if you dont want to use /tmp 

COUNTFILE="/tmp/lastread.txt"

if [ ! -f "$COUNTFILE" ]; then
    echo "$COUNTFILE doesnt exist, creating it."
    echo "0" > "$COUNTFILE"
fi

LAST=$(cat "$COUNTFILE" 2>/dev/null || echo 0)

echo "DEBUG LAST=[$LAST]"

# adding a cooldown feature so a theoretical meetingchair doesnt spam the chat by running !start !readings 
# etc repeatedly.

# should be a relative path like ~/tmp/macro_cooldowns/
# this is proving to be a pain in the ass, probably something trivial. fuck it. ship it.
# change to suit your needs if you dont want to use /tmp 

COOLDOWN_DIR="/tmp/macro_cooldowns"
mkdir -p "$COOLDOWN_DIR"

macro_ready() {
    local macro="$1"
    local seconds="${2:-300}"    # default: 5 minutes
    local stamp="$COOLDOWN_DIR/$macro"
    local now
    local last

    now=$(date +%s)

    if [[ -f "$stamp" ]]; then
        last=$(cat "$stamp")

        if (( now - last < seconds )); then
            return 1
        fi
    fi

    echo "$now" > "$stamp"
    return 0
}

TRIGGERED=0
TRIGGERED1=0
TRIGGERED2=0
TRIGGERED3=0
TRIGGERED4=0
TRIGGERED5=0
TRIGGERED6=0
TRIGGERED7=0
TRIGGERED8=0
TRIGGERED9=0
TRIGGERED10=0
TRIGGERED11=0
TRIGGERED12=0
TRIGGERED13=0
TRIGGERED14=0
TRIGGERED15=0
TRIGGERED16=0
TRIGGERED17=0
TRIGGERED18=0
TRIGGERED19=0
TRIGGERED20=0
TRIGGERED21=0
TRIGGERED22=0
TRIGGERED23=0
TRIGGERED24=0
TRIGGERED25=0
TRIGGERED26=0
TRIGGERED27=0
TRIGGERED28=0
TRIGGERED29=0
TRIGGERED30=0
TRIGGERED31=0
TRIGGERED32=0
TRIGGERED33=0
TRIGGERED34=0

MAXID=$LAST

#while IFS=$'\t' read -r MSGID MESSAGE
while IFS=$'\t' read -r MSGID USERID CHAIR_AUTHORIZED MESSAGE
do
    CLEAN_MESSAGE=$(echo "$MESSAGE" | sed 's/<[^>]*>//g')

    case "$CLEAN_MESSAGE" in

        "!nana247"*)
            if [[ $TRIGGERED -eq 0 ]]; then
                echo "test macro 1 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=For those who wish to join there is a 24-hour NA meeting in progress on nana247.org. Zoom: https://us02web.zoom.us/j/558544927 Password: 247247" --data-urlencode 'gif_url='

                TRIGGERED=1
            fi
            ;;
        "!24"*)
	   if [[ $TRIGGERED1 -eq 0 ]]; then
		 echo "test macro 2 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🏷️ E-Tag | 0–29 days / recommitting & staying clean for the next 24h | 🔁 Keep Coming Back | 🏷️ Hug 🤗 | 🤗🤗🤗🤗 $STATIC_URL/chips/24hour.jpg" --data-urlencode 'gif_url='
		 TRIGGERED1=1
	   fi
	   ;;

        "!report"*)
            if [[ $TRIGGERED2 -eq 0 ]]; then
                echo "test macro 3 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=To report confidential feedback about inappropriate or abusive messages please use the Complaint Review system by clicking the ▼ next to their nickname and selecting REPORT. $STATIC_URL/report.jpg" --data-urlencode 'gif_url='

                TRIGGERED2=1
            fi
            ;;
        "!30"*)
	   if [[ $TRIGGERED3 -eq 0 ]]; then
		 echo "test macro 4 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🏷️ E-Tag • 30 days • 1 month milestone • 🔁 Keep Coming Back • 🤗  $STATIC_URL/chips/30days.jpg" --data-urlencode 'gif_url='
		 TRIGGERED3=1
	
  	   fi
	   ;;

        "!60"*)
            if [[ $TRIGGERED4 -eq 0 ]]; then
                echo "test macro 5 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🏷️ E-Tag • 60 days • 2 months in • • 🔁 Keep Coming Back • 🎉 $STATIC_URL/chips/60days.jpg" --data-urlencode 'gif_url='

                TRIGGERED4=1
            fi
            ;;
        "!90"*)
	   if [[ $TRIGGERED5 -eq 0 ]]; then
		 echo "test macro 6 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🏷️ E-Tag • 90 days • 3 months • 🔁 Keep Coming Back • 🌱 $STATIC_URL/chips/90days.jpg" --data-urlencode 'gif_url='
		 TRIGGERED5=1
	   fi
	   ;;

        "!6m"*)
            if [[ $TRIGGERED6 -eq 0 ]]; then
                echo "test macro 7 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🏷️ E-Tag • 6 months • 🔁 Keep Coming Back • ⭐  $STATIC_URL/chips/6mo.jpg" --data-urlencode 'gif_url='

                TRIGGERED6=1
            fi
            ;;
        "!9m"*)
	   if [[ $TRIGGERED7 -eq 0 ]]; then
		 echo "test macro 8 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🏷️ E-Tag • 9 months • 🔁 Keep Coming Back • 🌊  $STATIC_URL/chips/9mo.jpg" --data-urlencode 'gif_url='
		 TRIGGERED7=1
	   fi
	   ;;

        "!1y"*)
            if [[ $TRIGGERED8 -eq 0 ]]; then
                echo "test macro 9 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🏷️ E-Tag • 1 year • 🔁 Keep Coming Back • 🎂  $STATIC_URL/chips/1year.jpg" --data-urlencode 'gif_url='

                TRIGGERED8=1
            fi
            ;;
        "!18"*)
	   if [[ $TRIGGERED9 -eq 0 ]]; then
		 echo "test macro 10 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🏷️ E-Tag • 18 months • 🔁 Keep Coming Back • 🧭  $STATIC_URL/chips/18mo.jpg" --data-urlencode 'gif_url='
		 TRIGGERED9=1
	   fi
	   ;;

        "!2y"*)
            if [[ $TRIGGERED10 -eq 0 ]]; then
                echo "test macro 11 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🏷️ E-Tag • 2 years • 🔁 Keep Coming Back • 🪶  $STATIC_URL/chips/2years.jpg" --data-urlencode 'gif_url='

                TRIGGERED10=1
            fi
            ;;
        "!3y"*)
	   if [[ $TRIGGERED11 -eq 0 ]]; then
		 echo "test macro 12 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🏷️ E-Tag • 3 years • 🔁 Keep Coming Back • 🔥 https:/static.neveralonerc.org/chips/3years.jpeg" --data-urlencode 'gif_url='
		 TRIGGERED11=1
	   fi
	   ;;

        "!4y"*)
            if [[ $TRIGGERED12 -eq 0 ]]; then
                echo "test macro 13 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🏷️ E-Tag • 4 years • 🔁 Keep Coming Back • 🪨 $STATIC_URL/chips/4years.jpg" --data-urlencode 'gif_url='

                TRIGGERED12=1
            fi
            ;;
        "!5y"*)
	   if [[ $TRIGGERED13 -eq 0 ]]; then
		 echo "test macro 14 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🏷️ E-Tag • 5 years • 🔁 Keep Coming Back • 🏆 $STATIC_URL/chips/5years.jpg" --data-urlencode 'gif_url='
		 TRIGGERED13=1
	   fi
	   ;;

        "!multi"*)
            if [[ $TRIGGERED14 -eq 0 ]]; then
                echo "test macro 15 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=Happy Sober Anniversary! 🏷️ E-Tag • multiple years • 🔁 Keep Coming Back • 🌟 $STATIC_URL/chips/multiples.jpg" --data-urlencode 'gif_url='

                TRIGGERED14=1
            fi
            ;;
        "!hug"*)
	   if [[ $TRIGGERED15 -eq 0 ]]; then
		 echo "test macro 16 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=❤️❤️❤️❤️❤️❤️❤️ 💙💙💙💙💙💙💙 💕💕💕💕💕💕💕💕 💙💙💙💙💙💙💙  💕💕💕💕💕💕💕💕 💙💙💙💙💙💙💙 ❤️❤️❤️❤️❤️❤️❤️" --data-urlencode 'gif_url='
		 TRIGGERED15=1
	   fi
	   ;;
	  # gong command only allowed by members of group roles 3 and 6
	  # This validates that the sender has group_role_id 3 or 6 in group 2. All other macros remain available to everyone.
        "!gong"*)
            if [[ "$CHAIR_AUTHORIZED" -eq 1 && "$TRIGGERED16" -eq 0 ]]; then
# if you want to change from default of 300 seconds, to .. say.. 600 seconds... change this to
#               if macro_ready gong 600; then
                if macro_ready gong; then
                    echo "gong macro triggered by authorized user_id $USERID"

                    curl -X POST "$URL" \
                        -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' \
                        --data-urlencode "api_secret_key=$APIKEY" \
                        --data-urlencode 'add=message' \
                        --data-urlencode "group=$GROUP_ID" \
                        --data-urlencode "sender=$SENDER" \
                        --data-urlencode "message=Alright alright alright lets change the subject $STATIC_URL/gong.mp4" \
                        --data-urlencode 'gif_url='

                    TRIGGERED16=1
                else
                    curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=Please wait 5 minutes before running this command again." --data-urlencode 'gif_url='
                fi

            elif [[ "$CHAIR_AUTHORIZED" -ne 1 ]]; then
               curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=This command may be used by a chairperson or group moderator. Highlight MP or contact us if you are interested in being of service." --data-urlencode 'gif_url='
            fi
            ;;
        "!trout"*)
	   if [[ $TRIGGERED17 -eq 0 ]]; then
		 echo "test macro 18 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=💥🐟 💥🐟💥🐟 💥🐟💥🐟 💥🐟  💥SLAP!💥 THWACK!💥 The effectiveness of one addict hitting another with a trout is unparalleled." --data-urlencode 'gif_url='
		 TRIGGERED17=1
	   fi
	   ;;

        "!pop"*)
            if [[ $TRIGGERED18 -eq 0 ]]; then
                echo "test macro 19 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=🍿🍿🍿🍿🍿🍿🍿🍿🍿🤪🍿🤪🍿🤪🍿🤪🍿🤪🍿🤪🍿🤪❤️🍿🤪🤪🤪🍿🍿🍿🍿🍿🤪🍿🤪🤪🍿🤪🤪" --data-urlencode 'gif_url='

                TRIGGERED18=1
            fi
            ;;
	 # sober command only allowed by members of group roles 3 and 6
	 # This validates that the sender has group_role_id 3 or 6 in group 2. All other macros remain available to everyone.
        "!sober"*)
            if [[ "$CHAIR_AUTHORIZED" -eq 1 && "$TRIGGERED19" -eq 0 ]]; then
# if you want to change from default of 300 seconds, to .. say.. 600 seconds... change this to
#               if macro_ready sober 600; then
                if macro_ready sober; then
                    echo "sober-talk macro triggered by authorized user_id $USERID"

                    curl -X POST "$URL" \
                        -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' \
                        --data-urlencode "api_secret_key=$APIKEY" \
                        --data-urlencode 'add=message' \
                        --data-urlencode "group=$GROUP_ID" \
                        --data-urlencode "sender=$SENDER" \
                        --data-urlencode "message=Sober talk is currently in progress. Please temporarily pause chatter. Thanks!!" \
                        --data-urlencode 'gif_url='

                    TRIGGERED19=1
                else
                      curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=Please wait 5 minutes before running this command again." --data-urlencode 'gif_url='

                fi

            elif [[ "$CHAIR_AUTHORIZED" -ne 1 ]]; then
                                   curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=This command may be used by a chairperson or group moderator. Highlight MP or contact us if you are interested in being of service." --data-urlencode 'gif_url='

            fi
            ;;
        "!testl"*)
            if [[ $TRIGGERED20 -eq 0 ]]; then
                echo "test macro 21 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 21" --data-urlencode 'gif_url='

                TRIGGERED20=1
            fi
            ;;
        "!testm"*)
	   if [[ $TRIGGERED21 -eq 0 ]]; then
		 echo "test macro 22 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 22" --data-urlencode 'gif_url='
		 TRIGGERED21=1
	   fi
	   ;;

        "!testn"*)
            if [[ $TRIGGERED22 -eq 0 ]]; then
                echo "test macro 23 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 23" --data-urlencode 'gif_url='

                TRIGGERED22=1
            fi
            ;;
        "!testo"*)
	   if [[ $TRIGGERED23 -eq 0 ]]; then
		 echo "test macro 24 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 24" --data-urlencode 'gif_url='
		 TRIGGERED23=1
	   fi
	   ;;

        "!testp"*)
            if [[ $TRIGGERED24 -eq 0 ]]; then
                echo "test macro 25 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 25" --data-urlencode 'gif_url='

                TRIGGERED24=1
            fi
            ;;
        "!testq"*)
	   if [[ $TRIGGERED25 -eq 0 ]]; then
		 echo "test macro 26 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 26" --data-urlencode 'gif_url='
		 TRIGGERED25=1
	   fi
	   ;;

        "!testr"*)
            if [[ $TRIGGERED26 -eq 0 ]]; then
                echo "test macro 27 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 27" --data-urlencode 'gif_url='

                TRIGGERED26=1
            fi
            ;;
        "!tests"*)
	   if [[ $TRIGGERED27 -eq 0 ]]; then
		 echo "test macro 28 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 28" --data-urlencode 'gif_url='
		 TRIGGERED27=1
	   fi
	   ;;

        "!testt"*)
            if [[ $TRIGGERED28 -eq 0 ]]; then
                echo "test macro 29 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 29" --data-urlencode 'gif_url='

                TRIGGERED28=1
            fi
            ;;
        "!testu"*)
	   if [[ $TRIGGERED29 -eq 0 ]]; then
		 echo "test macro 30 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 30" --data-urlencode 'gif_url='
		 TRIGGERED29=1
	   fi
	   ;;

        "!testv"*)
            if [[ $TRIGGERED30 -eq 0 ]]; then
                echo "test macro 31 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 31" --data-urlencode 'gif_url='

                TRIGGERED30=1
            fi
            ;;
        "!testw"*)
	   if [[ $TRIGGERED31 -eq 0 ]]; then
		 echo "test macro 32 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 32" --data-urlencode 'gif_url='
		 TRIGGERED31=1
	   fi
	   ;;

        "!testx"*)
            if [[ $TRIGGERED32 -eq 0 ]]; then
                echo "test macro 33 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 33" --data-urlencode 'gif_url='

                TRIGGERED32=1
            fi
            ;;
        "!testy"*)
	   if [[ $TRIGGERED33 -eq 0 ]]; then
		 echo "test macro 34 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 34" --data-urlencode 'gif_url='
		 TRIGGERED33=1
	   fi
	   ;;

        "!testz"*)
            if [[ $TRIGGERED34 -eq 0 ]]; then
                echo "test macro 35 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode "group=$GROUP_ID" --data-urlencode "sender=$SENDER" --data-urlencode "message=triggered test macro 35" --data-urlencode 'gif_url='

                TRIGGERED34=1
            fi
            ;;
 

    esac

    if (( MSGID > MAXID )); then
        MAXID=$MSGID
    fi

done < <(
#mysql -B -N -u "$DBUSER" -p$SQLPASS $DB \
#-e "SELECT group_message_id, original_message
#FROM gr_group_messages
#WHERE group_message_id > $LAST
#ORDER BY group_message_id;"
#)
mysql -B -N -u "$DBUSER" -p"$SQLPASS" "$DB" \
-e "SELECT
        m.group_message_id,
        m.user_id,
        EXISTS (
            SELECT 1
            FROM gr_group_members gm
            WHERE gm.group_id = m.group_id
              AND gm.user_id = m.user_id
              AND gm.group_role_id IN (3, 6)
              AND gm.approved = 1
        ) AS chair_authorized,
        m.original_message
    FROM gr_group_messages m
    WHERE m.group_id = 2
      AND m.group_message_id > $LAST
    ORDER BY m.group_message_id;"
)

echo "$MAXID" > "$COUNTFILE"
