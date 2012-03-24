#!/bin/sh
# Requires watchr: https://github.com/mynyml/watchr
watchr -e 'watch(".*\.less$") { system("sless=`find -name style.less` && scss=`echo \"$sless\" | sed -e\"s/style.less/style.css/g\"` && rm -rf \"$scss\" && lessc --compress \"$sless\" > \"$scss\" && notify-send \"Watchr Less\" \" Just compiled style.less > style.css\" -t 1 -i notification-message-im ") }'
