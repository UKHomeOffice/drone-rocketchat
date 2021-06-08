#!/bin/sh
set -x

env
echo "DRONE_BUILD_STATUS:${DRONE_BUILD_STATUS}" >&2
echo "DRONE_STAGE_STATUS:${DRONE_STAGE_STATUS}" >&2
echo "DRONE_JOB_STATUS:${DRONE_JOB_STATUS}" >&2
echo "CI_BUILD_STATUS:${CI_BUILD_STATUS}" >&2
echo "CI_JOB_STATUS:${CI_JOB_STATUS}" >&2
echo "BUILD_STATUS: ${BUILD_STATUS}" >&2

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
