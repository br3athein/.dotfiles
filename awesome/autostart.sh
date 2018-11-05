#!/usr/bin/env bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

# exec once on boot
perWindowLayoutD

# Engage `sick bastard` mode by tossing key purposes across the whole keyboard
# Using something handy in terms of reachability (physical Caps Lock, for instance),
# where you should normally have used Esc is vital for Vim editing mode, IMO --
# and, as Caps Lock is now bound to Esc and is somewhat hard to reach, hitting
# both shifts simultaneously also will activate Caps Lock mode from now on.
setxkbmap \
    -option grp:win_space_toggle \
    -option caps:swapescape \
    -option shift:both_capslock \
    -layout us,ru

run pulseaudio --start

run compton --config /home/br3athein/.compton.conf

# kick off apps in background
run gpmdp
run telegram-desktop
run slack
run unclutter -root  # doesn't play really well w/ awesome, thus xperimental
