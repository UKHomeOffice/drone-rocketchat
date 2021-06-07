#!/bin/sh

generate_data() {
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
output=$(generate_data)
echo "Invoking webhook"
curl -k -X POST \
-H 'Content-type: application/json' \
--data "$(output)" ${PLUGIN_WEBHOOK}