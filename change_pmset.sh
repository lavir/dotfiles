#!bin/bash

# Power Management Settings
# http://computers.tutsplus.com/tutorials/how-to-hibernate-a-mac--cms-23235

# Default settings for El Capitan

#  standbydelay         86400
#  standby              1
#  womp                 1
#  halfdim              1
#  hibernatefile        /var/vm/sleepimage
#  powernap             1
#  networkoversleep     0
#  disksleep            10
#  sleep                0
#  autopoweroffdelay    14400
#  hibernatemode        3
#  autopoweroff         1
#  ttyskeepawake        1
#  displaysleep         10
#  acwake               0
#  lidwake              1

# You can set current setting by
# 	pmset -g

echo "Before changes"
pmset -g

sudo pmset -a standby 1

# standbydelay value in seconds 
sudo pmset -a standbydelay 1800
sudo pmset -a hibernatemode 3

echo "After changes"
pmset -g
