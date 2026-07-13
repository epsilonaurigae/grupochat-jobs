#!/bin/bash

# 07-13-2026 adds logic to enforce membership in groups 3 or 6. 
# defined at line 420:               AND gm.group_role_id IN (3, 6)
# this takes steps towards restoring oldschool JFT_BOT features for chairing "meetings" or doing moderation tasks.
# !gong and !sober are .. just examples, there are currently no chairmeeting commands in this script
# please see https://github.com/epsilonaurigae/legacy-jftbot/blob/main/README.md for more info on 
# lost functionalities from moving off of an ircii/bx based IRC chat robot.

# i suppose you may want to also change the sender name from ptcruiser, I will change some more of this stuff to variables on 
# a future iteration.

# getting down to business...
# horrible way of doing this, when it can be invoked directly from PHP when a message is sent
# until then
#* * * * * /home/nia/sqljobs/macros.sh
#* * * * * sleep 10; /home/nia/sqljobs/macros.sh
#* * * * * sleep 20; /home/nia/sqljobs/macros.sh
#* * * * * sleep 30; /home/nia/sqljobs/macros.sh
#* * * * * sleep 40; /home/nia/sqljobs/macros.sh
#* * * * * sleep 50; /home/nia/sqljobs/macros.sh
SQLPASS="sqlpass"
APIKEY="apikey"
DB="grupochat"
DBUSER="nia"
LOCK="/tmp/chatbot.lock"
# URL to server
# ie: http://127.0.0.1 if applicable
# its a remote server in our case
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
# doesnt work unless i hard code it. fuck it. ship it.
COUNTFILE="/home/nia/tmp/lastread.txt"

if [ ! -f "$COUNTFILE" ]; then
    echo "$COUNTFILE doesnt exist, creating it."
    echo "0" > "$COUNTFILE"
fi

LAST=$(cat "$COUNTFILE" 2>/dev/null || echo 0)

echo "DEBUG LAST=[$LAST]"

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
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=For those who wish to join there is a 24-hour NA meeting in progress on nana247.org. Zoom: https://us02web.zoom.us/j/558544927 Password: 247247" --data-urlencode 'gif_url='

                TRIGGERED=1
            fi
            ;;
        "!24"*)
	   if [[ $TRIGGERED1 -eq 0 ]]; then
		 echo "test macro 2 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🏷️ E-Tag | 0–29 days / recommitting & staying clean for the next 24h | 🔁 Keep Coming Back | 🏷️ Hug 🤗 | 🤗🤗🤗🤗 https://static.neveralonerc.org/chips/24hour.jpg" --data-urlencode 'gif_url='
		 TRIGGERED1=1
	   fi
	   ;;

        "!report"*)
            if [[ $TRIGGERED2 -eq 0 ]]; then
                echo "test macro 3 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=To report confidential feedback about inappropriate or abusive messages please use the Complaint Review system by clicking the ▼ next to their nickname and selecting REPORT. https://static.neveralonerc.org/report.jpg" --data-urlencode 'gif_url='

                TRIGGERED2=1
            fi
            ;;
        "!30"*)
	   if [[ $TRIGGERED3 -eq 0 ]]; then
		 echo "test macro 4 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🏷️ E-Tag • 30 days • 1 month milestone • 🔁 Keep Coming Back • 🤗  https://static.neveralonerc.org/chips/30days.jpg" --data-urlencode 'gif_url='
		 TRIGGERED3=1
	
  	   fi
	   ;;

        "!60"*)
            if [[ $TRIGGERED4 -eq 0 ]]; then
                echo "test macro 5 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🏷️ E-Tag • 60 days • 2 months in • • 🔁 Keep Coming Back • 🎉 https://static.neveralonerc.org/chips/60days.jpg" --data-urlencode 'gif_url='

                TRIGGERED4=1
            fi
            ;;
        "!90"*)
	   if [[ $TRIGGERED5 -eq 0 ]]; then
		 echo "test macro 6 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🏷️ E-Tag • 90 days • 3 months • 🔁 Keep Coming Back • 🌱 https://static.neveralonerc.org/chips/90days.jpg" --data-urlencode 'gif_url='
		 TRIGGERED5=1
	   fi
	   ;;

        "!6m"*)
            if [[ $TRIGGERED6 -eq 0 ]]; then
                echo "test macro 7 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🏷️ E-Tag • 6 months • 🔁 Keep Coming Back • ⭐  https://static.neveralonerc.org/chips/6mo.jpg" --data-urlencode 'gif_url='

                TRIGGERED6=1
            fi
            ;;
        "!9m"*)
	   if [[ $TRIGGERED7 -eq 0 ]]; then
		 echo "test macro 8 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🏷️ E-Tag • 9 months • 🔁 Keep Coming Back • 🌊  https://static.neveralonerc.org/chips/9mo.jpg" --data-urlencode 'gif_url='
		 TRIGGERED7=1
	   fi
	   ;;

        "!1y"*)
            if [[ $TRIGGERED8 -eq 0 ]]; then
                echo "test macro 9 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🏷️ E-Tag • 1 year • 🔁 Keep Coming Back • 🎂  https://static.neveralonerc.org/chips/1year.jpg" --data-urlencode 'gif_url='

                TRIGGERED8=1
            fi
            ;;
        "!18"*)
	   if [[ $TRIGGERED9 -eq 0 ]]; then
		 echo "test macro 10 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🏷️ E-Tag • 18 months • 🔁 Keep Coming Back • 🧭  https://static.neveralonerc.org/chips/18mo.jpg" --data-urlencode 'gif_url='
		 TRIGGERED9=1
	   fi
	   ;;

        "!2y"*)
            if [[ $TRIGGERED10 -eq 0 ]]; then
                echo "test macro 11 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🏷️ E-Tag • 2 years • 🔁 Keep Coming Back • 🪶  https://static.neveralonerc.org/chips/2years.jpg" --data-urlencode 'gif_url='

                TRIGGERED10=1
            fi
            ;;
        "!3y"*)
	   if [[ $TRIGGERED11 -eq 0 ]]; then
		 echo "test macro 12 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🏷️ E-Tag • 3 years • 🔁 Keep Coming Back • 🔥 https:/static.neveralonerc.org/chips/3years.jpeg" --data-urlencode 'gif_url='
		 TRIGGERED11=1
	   fi
	   ;;

        "!4y"*)
            if [[ $TRIGGERED12 -eq 0 ]]; then
                echo "test macro 13 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🏷️ E-Tag • 4 years • 🔁 Keep Coming Back • 🪨 https://static.neveralonerc.org/chips/4years.jpg" --data-urlencode 'gif_url='

                TRIGGERED12=1
            fi
            ;;
        "!5y"*)
	   if [[ $TRIGGERED13 -eq 0 ]]; then
		 echo "test macro 14 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🏷️ E-Tag • 5 years • 🔁 Keep Coming Back • 🏆 https://static.neveralonerc.org/chips/5years.jpg" --data-urlencode 'gif_url='
		 TRIGGERED13=1
	   fi
	   ;;

        "!multi"*)
            if [[ $TRIGGERED14 -eq 0 ]]; then
                echo "test macro 15 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=Happy Sober Anniversary! 🏷️ E-Tag • multiple years • 🔁 Keep Coming Back • 🌟 https://static.neveralonerc.org/chips/multiples.jpg" --data-urlencode 'gif_url='

                TRIGGERED14=1
            fi
            ;;
        "!hug"*)
	   if [[ $TRIGGERED15 -eq 0 ]]; then
		 echo "test macro 16 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=❤️❤️❤️❤️❤️❤️❤️ 💙💙💙💙💙💙💙 💕💕💕💕💕💕💕💕 💙💙💙💙💙💙💙  💕💕💕💕💕💕💕💕 💙💙💙💙💙💙💙 ❤️❤️❤️❤️❤️❤️❤️" --data-urlencode 'gif_url='
		 TRIGGERED15=1
	   fi
	   ;;
	  # gong command only allowed by members of group roles 3 and 6
	  # This validates that the sender has group_role_id 3 or 6 in group 2. All other macros remain available to everyone.
         "!gong"*)
            if [[ "$CHAIR_AUTHORIZED" -eq 1 && "$TRIGGERED16" -eq 0 ]]; then
                echo "gong macro triggered by authorized user_id $USERID"

                curl -X POST "$URL" \
                    -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' \
                    --data-urlencode "api_secret_key=$APIKEY" \
                    --data-urlencode 'add=message' \
                    --data-urlencode 'group=2' \
                    --data-urlencode 'sender=ptcruiser' \
                    --data-urlencode "message=Alright alright alright lets change the subject https://static.neveralonerc.org/gong.mp4" \
                    --data-urlencode 'gif_url='

                TRIGGERED16=1
            elif [[ "$CHAIR_AUTHORIZED" -ne 1 ]]; then
                echo "ignored unauthorized !gong from user_id $USERID"
            fi
            ;;
        "!trout"*)
	   if [[ $TRIGGERED17 -eq 0 ]]; then
		 echo "test macro 18 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=💥🐟 💥🐟💥🐟 💥🐟💥🐟 💥🐟  💥SLAP!💥 THWACK!💥 The effectiveness of one addict hitting another with a trout is unparalleled." --data-urlencode 'gif_url='
		 TRIGGERED17=1
	   fi
	   ;;

        "!pop"*)
            if [[ $TRIGGERED18 -eq 0 ]]; then
                echo "test macro 19 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=🍿🍿🍿🍿🍿🍿🍿🍿🍿🤪🍿🤪🍿🤪🍿🤪🍿🤪🍿🤪🍿🤪❤️🍿🤪🤪🤪🍿🍿🍿🍿🍿🤪🍿🤪🤪🍿🤪🤪" --data-urlencode 'gif_url='

                TRIGGERED18=1
            fi
            ;;
	 # sober command only allowed by members of group roles 3 and 6
	 # This validates that the sender has group_role_id 3 or 6 in group 2. All other macros remain available to everyone.
	        "!sober"*)
            if [[ "$CHAIR_AUTHORIZED" -eq 1 && "$TRIGGERED19" -eq 0 ]]; then
                echo "sober-talk macro triggered by authorized user_id $USERID"

                curl -X POST "$URL" \
                    -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' \
                    --data-urlencode "api_secret_key=$APIKEY" \
                    --data-urlencode 'add=message' \
                    --data-urlencode 'group=2' \
                    --data-urlencode 'sender=ptcruiser' \
                    --data-urlencode "message=Sober talk is currently in progress. Please temporarily pause chatter. Thanks!!" \
                    --data-urlencode 'gif_url='

                TRIGGERED19=1
            elif [[ "$CHAIR_AUTHORIZED" -ne 1 ]]; then
                echo "ignored unauthorized !sober from user_id $USERID"
            fi
            ;; 

        "!testl"*)
            if [[ $TRIGGERED20 -eq 0 ]]; then
                echo "test macro 21 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 21" --data-urlencode 'gif_url='

                TRIGGERED20=1
            fi
            ;;
        "!testm"*)
	   if [[ $TRIGGERED21 -eq 0 ]]; then
		 echo "test macro 22 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 22" --data-urlencode 'gif_url='
		 TRIGGERED21=1
	   fi
	   ;;

        "!testn"*)
            if [[ $TRIGGERED22 -eq 0 ]]; then
                echo "test macro 23 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 23" --data-urlencode 'gif_url='

                TRIGGERED22=1
            fi
            ;;
        "!testo"*)
	   if [[ $TRIGGERED23 -eq 0 ]]; then
		 echo "test macro 24 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 24" --data-urlencode 'gif_url='
		 TRIGGERED23=1
	   fi
	   ;;

        "!testp"*)
            if [[ $TRIGGERED24 -eq 0 ]]; then
                echo "test macro 25 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 25" --data-urlencode 'gif_url='

                TRIGGERED24=1
            fi
            ;;
        "!testq"*)
	   if [[ $TRIGGERED25 -eq 0 ]]; then
		 echo "test macro 26 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 26" --data-urlencode 'gif_url='
		 TRIGGERED25=1
	   fi
	   ;;

        "!testr"*)
            if [[ $TRIGGERED26 -eq 0 ]]; then
                echo "test macro 27 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 27" --data-urlencode 'gif_url='

                TRIGGERED26=1
            fi
            ;;
        "!tests"*)
	   if [[ $TRIGGERED27 -eq 0 ]]; then
		 echo "test macro 28 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 28" --data-urlencode 'gif_url='
		 TRIGGERED27=1
	   fi
	   ;;

        "!testt"*)
            if [[ $TRIGGERED28 -eq 0 ]]; then
                echo "test macro 29 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 29" --data-urlencode 'gif_url='

                TRIGGERED28=1
            fi
            ;;
        "!testu"*)
	   if [[ $TRIGGERED29 -eq 0 ]]; then
		 echo "test macro 30 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 30" --data-urlencode 'gif_url='
		 TRIGGERED29=1
	   fi
	   ;;

        "!testv"*)
            if [[ $TRIGGERED30 -eq 0 ]]; then
                echo "test macro 31 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 31" --data-urlencode 'gif_url='

                TRIGGERED30=1
            fi
            ;;
        "!testw"*)
	   if [[ $TRIGGERED31 -eq 0 ]]; then
		 echo "test macro 32 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 32" --data-urlencode 'gif_url='
		 TRIGGERED31=1
	   fi
	   ;;

        "!testx"*)
            if [[ $TRIGGERED32 -eq 0 ]]; then
                echo "test macro 33 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 33" --data-urlencode 'gif_url='

                TRIGGERED32=1
            fi
            ;;
        "!testy"*)
	   if [[ $TRIGGERED33 -eq 0 ]]; then
		 echo "test macro 34 triggered" 
		 curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 34" --data-urlencode 'gif_url='
		 TRIGGERED33=1
	   fi
	   ;;

        "!testz"*)
            if [[ $TRIGGERED34 -eq 0 ]]; then
                echo "test macro 35 triggered"
		curl -X POST "$URL" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0' --data-urlencode "api_secret_key=$APIKEY" --data-urlencode 'add=message' --data-urlencode 'group=2' --data-urlencode 'sender=ptcruiser' --data-urlencode "message=triggered test macro 35" --data-urlencode 'gif_url='

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