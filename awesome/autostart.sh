#!/usr/bin/env bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

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

run compton --config /home/br3athein/.compton.conf

# kick off apps in background
run gpmdp
run telegram-desktop
run slack
run unclutter -root  # doesn't play really well w/ awesome, thus xperimental
