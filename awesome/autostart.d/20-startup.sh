#!/usr/bin/env bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

# exec once on boot
fcpl
perWindowLayoutD

run pulseaudio --start

run compton --config /home/br3athein/.compton.conf

# kick off apps in background
run gpmdp
run telegram-desktop
run slack
run spacemacs
run unclutter -root  # doesn't play really well w/ awesome, thus xperimental
