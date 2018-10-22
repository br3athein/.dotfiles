#!/usr/bin/env bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

# pre-run
xrdb -merge ~/.Xresources

# exec once on boot
perWindowLayoutD

# Enter `sick bastard` mode by tossing key purposes across the kbd
# using physical Caps Lock where you normally should have used Esc is vital for
# Vim editing mode, IMO -- and, as Caps Lock is now on Esc and is a bit hard to
# reach, hitting both shifts simultaneously would enable it instead.
setxkbmap \
    -option grp:win_space_toggle \
    -option caps:swapescape \
    -option shift:both_capslock \
    -layout us,ru

run pulseaudio --start

run compton --config /home/a-kostyuk/.compton.conf

# kick off some apps in background
run spacemacs
run telegram
run rocketchat
run hipchat4
run firefox
run chrome
run gtimelog
run qutebrowser

# kick off apps in background
run telegram-desktop
run unclutter -root  # doesn't play really well w/ awesome, thus xperimental
run google-play-music-desktop-player
