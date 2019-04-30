#!/usr/bin/env bash

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

# salvaged from /etc/X11/xorg.conf.d/00-kbd
# Option "XkbOptions" "grp:win_space_toggle,caps:swapescape,shift:both_capslock"
