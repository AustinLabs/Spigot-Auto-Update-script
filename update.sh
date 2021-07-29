#!/bin/sh
/usr/bin/screen -S "screename" -X stuff "`echo -ne \"say Updating and restarting the server. please reconnect shortly!\r"`"
java -jar BuildTools.jar
find . -type f -name 'spigot-*' -execdir mv {} spigot.jar ';'
/usr/bin/screen -S "screename" -X stuff "`echo -ne \"stop\r\exit\r"`"
sleep 60
screen -d -m -S "screename" java -Xms6G -Xmx6G -XX:+UseG1GC -jar spigot.jar nogui
