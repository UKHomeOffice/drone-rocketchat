#!/bin/sh
set -x
generate_data() {
  cat <<EOF
 {
    "icon_emoji": "${PLUGIN_ICON}",
    "username": "${PLUGIN_USERNAME}",
    "attachments": [ {
    "title": "${PLUGIN_TITLE}",
    "text": "${PLUGIN_TEXT}",
    "color": "${PLUGIN_COLOR}"
    } ]
 }
EOF
}
data=$(generate_data)
echo $data >&2

echo "Invoking webhook" >&2

curl -k -X POST \
-H 'Content-type: application/json' \
--data "${data}" ${PLUGIN_WEBHOOK}
