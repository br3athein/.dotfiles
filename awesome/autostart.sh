#!/usr/bin/env bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

# exec once on boot
run kbdd && sleep 1
run setxkbmap -layout us,ru -option 'grp:win_space_toggle'
run pulseaudio --start

run compton --config /home/br3athein/.compton.conf &

# kick off apps in background
run spotifywm
run telegram-desktop
run skypeforlinux
