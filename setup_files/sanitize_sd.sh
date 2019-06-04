#!/bin/sh
#
# To be executed as root
cd /var/log
rm -f *.log.* syslog.* messages.* debug.*
cat /dev/null > messages
cat /dev/null > syslog
cat /dev/null > debug
cat /dev/null > dpkg.log
cat /dev/null > kern.log
cat /dev/null > user.log
cat /dev/null > daemon.log
cat /dev/null > auth.log
cat /dev/null > lastlog

cat /dev/null > /home/pi/.bash_history
cat /dev/null > /root/.bash_history

rm -f /home/pi/.xsession-errors.old
