#!/bin/sh
PLUGIN_ICON=":sos:"
PLUGIN_USERNAME="Test"
PLUGIN_TITLE="Test"
PLUGIN_TEXT="Test"
PLUGIN_COLOR="#2DE0A5"
PLUGIN_WEBHOOK="https://rocketchat.shs-dev.dsa-notprod.homeoffice.gov.uk/hooks/ePytNRCpvGinTaLPP/RW4nT4sLEvt4wxEhbYar4brxdKGdsFf8DoH4gd5AvGSKgjAz"
# ROCKET_WEBHOOK=https://rocketchat.shs-dev.dsa-notprod.homeoffice.gov.uk/hooks/KsebptzxkYTvjg7Ji/QkwbaX3h3gNJ8gjiKRJx9RmgErvRtYA6pQ6XEEy3jy5DKpij
generate_data()
{
  cat <<EOF
  {
   "icon_emoji": ${PLUGIN_ICON},
   "username": ${PLUGIN_USERNAME},
   "attachments": [ {
    "title": ${PLUGIN_TITLE},
    "text": ${PLUGIN_TEXT},
    "color": ${PLUGIN_COLOR}
    } ]
  }
EOF
}

curl -k -X POST \
-H 'Content-type: application/json' \
--data "${generate_data}" ${PLUGIN_WEBHOOK}
