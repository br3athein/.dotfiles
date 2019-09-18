------------------------------
-- "Midnight" awesome theme --
--       by br3athein       --
-- based on "zenburn" theme --
--   by Adrian C. (anrxc)   --
------------------------------

-- Still got a load of stuff to do with this.

-- Alternative icon sets and widget icons:
--  * https://gabriela2400.deviantart.com/art/Arch-Linux-Start-Icons-175557586

local gears = require("gears")

-- {{{ Main
theme = {}
theme.wallpaper = "/home/br3athein/Pictures/Wallpapers/current"
-- }}}

-- {{{ Styles
theme.font      = "Terminus (TTF)"

-- {{{ Colors
theme.fg_normal  = "#1f3d6d"
theme.fg_focus   = "#9ab3e2"
theme.fg_urgent  = "#f3f4f5"
theme.bg_normal  = "#030e21"
theme.bg_focus   = "#030e21"
theme.bg_urgent  = "#690f0f"
theme.bg_systray = theme.bg_normal
-- unused for now
theme.fg_systray = theme.fg_focus
-- }}}

-- {{{ Borders
theme.border_width  = 1
theme.border_normal = "#1f3d6d"
theme.border_focus  = "#1f3d6d"
theme.border_marked = "#1f3d6d"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#030e21"
theme.titlebar_bg_normal = "#030e21"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 18
theme.menu_width  = 120
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = ".config/awesome/themes/midnight/taglist/squarefz.png"
theme.taglist_squares_unsel = ".config/awesome/themes/midnight/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = ".config/awesome/themes/midnight/archlinux-light-icon.png" -- src: https://gabriela2400.deviantart.com/art/Arch-Linux-Start-Icons-175557586
theme.menu_submenu_icon      = ".config/awesome/themes/midnight/submenu.png" -- default one
-- }}}

-- {{{ Layout
theme.layout_tile       = "/usr/share/awesome/themes/zenburn/layouts/tile.png"
theme.layout_tileleft   = "/usr/share/awesome/themes/zenburn/layouts/tileleft.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/zenburn/layouts/tilebottom.png"
theme.layout_tiletop    = "/usr/share/awesome/themes/zenburn/layouts/tiletop.png"
theme.layout_fairv      = "/usr/share/awesome/themes/zenburn/layouts/fairv.png"
theme.layout_fairh      = "/usr/share/awesome/themes/zenburn/layouts/fairh.png"
theme.layout_spiral     = "/usr/share/awesome/themes/zenburn/layouts/spiral.png"
theme.layout_dwindle    = "/usr/share/awesome/themes/zenburn/layouts/dwindle.png"
theme.layout_max        = "/usr/share/awesome/themes/zenburn/layouts/max.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/zenburn/layouts/fullscreen.png"
theme.layout_magnifier  = "/usr/share/awesome/themes/zenburn/layouts/magnifier.png"
theme.layout_floating   = "/usr/share/awesome/themes/zenburn/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/zenburn/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

-- {{{ Taglist
-- just in time, thx
theme.taglist_font = "Font Awesome 5 Free Regular"
-- }}}

-- {{{ Notifications
theme.notification_shape = gears.shape.rounded_rect
theme.notification_fg = theme.fg_focus
theme.notification_height = 150
theme.notification_width = 700
theme.notification_border_color = "#8b008b"

-- documented features, but having no effect whatsoever
theme.notification_margin = 10
theme.notification_border_width = 30
-- }}}

return theme
