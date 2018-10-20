#!/usr/bin/env bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

# exec once on boot
run kbdd && sleep 1
urxvtd --quiet --fork
run setxkbmap -layout us,ru -option 'grp:win_space_toggle' -option caps:swapescape
run pulseaudio --start

run compton --config /home/br3athein/.compton.conf

# kick off apps in background
run gpmdp
run telegram-desktop
run skypeforlinux
