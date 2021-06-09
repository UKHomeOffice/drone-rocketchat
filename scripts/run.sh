#!/bin/sh
set -x

if [[ "${DRONE_BUILD_STATUS}" == "success" ]]; then
  ICON=":white_check_mark:"
  COLOR="#2DE0A5"
else
  ICON=":x:"
  TEXT="*Stages Failed:* ${DRONE_FAILED_STAGES}\n"
  COLOR="#e30d0d"
fi

TITLE="Build Number #${DRONE_BUILD_NUMBER} ${DRONE_BUILD_STATUS}"
DRONE_COMMIT_MESSAGE=$( echo "${DRONE_COMMIT_MESSAGE}" | sed -e 's/ $//' )
TEXT="${TEXT}*Commit Author:* ${DRONE_COMMIT_AUTHOR_NAME} \n *Branch:* ${DRONE_COMMIT_BRANCH} \n *Commit Message:* ${DRONE_COMMIT_MESSAGE}\n\n ${DRONE_BUILD_LINK}"

generate_data() {
  cat <<EOF
{
    "icon_emoji": "$ICON",
    "username": "${CI_REPO_NAME}",
    "attachments": [ {
    "title": "$TITLE",
    "title_link": "${DRONE_BUILD_LINK}",
    "text": "$TEXT",
    "color": "$COLOR"
    } ]
}
EOF
}
output=$(generate_data)
echo "Invoking webhook" >&2
#set -x

curl -k -X POST \
 -H 'Content-type: application/json' \
 --data "${output}" ${PLUGIN_WEBHOOK}