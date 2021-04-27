-------------------------------------------------
-- Volume Arc Widget for Awesome Window Manager
-- Shows the current volume level
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/volumearc-widget

-- @author Pavel Makhov
-- @copyright 2018 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local beautiful = require("beautiful")
local spawn = require("awful.spawn")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")

local GET_VOLUME_CMD = "amixer sget Master"
local INC_VOLUME_CMD = "amixer sset Master 5%+"
local DEC_VOLUME_CMD = "amixer sset Master 5%-"
local TOG_VOLUME_CMD = "amixer sset Master toggle"

local widget = {}

function widget.new(args)
    local args = args or {}

    local main_color = args.main_color or beautiful.fg_normal
    local mute_color = args.mute_color or beautiful.fg_normal .. '88'
    local thickness = args.thickness or xresources.apply_dpi(2)
    local height = args.height or xresources.apply_dpi(18)

    -- gears.debug.dump(args.main_color,'Mute',1)

    local get_volume_cmd = args.get_volume_cmd or GET_VOLUME_CMD
    local inc_volume_cmd = args.inc_volume_cmd or INC_VOLUME_CMD
    local dec_volume_cmd = args.dec_volume_cmd or DEC_VOLUME_CMD
    local tog_volume_cmd = args.tog_volume_cmd or TOG_VOLUME_CMD

    local volumearc =
        wibox.widget {
        max_value = 1,
        thickness = thickness,
        start_angle = 4.71238898, -- 2pi*3/4
        forced_height = height,
        forced_width = height,
        bg = main_color .. "44",
        paddings = 2,
        widget = wibox.container.arcchart
    }

    local update_graphic = function(widget, stdout, _, _, _)
        local mute = string.match(stdout, "%[(o%D%D?)%]") -- \[(o\D\D?)\] - [on] or [off]
        local volume = string.match(stdout, "(%d?%d?%d)%%") -- (\d?\d?\d)\%)
        volume = tonumber(string.format("% 3d", volume))

        widget.value = volume / 100
        widget.colors = mute == "off" and {mute_color} or {main_color}
       
    end

    volumearc:connect_signal(
        "button::press",
        function(_, _, _, button)
            if (button == 4) then
                awful.spawn(inc_volume_cmd, false)
            elseif (button == 5) then
                awful.spawn(dec_volume_cmd, false)
            elseif (button == 1) then
                awful.spawn(tog_volume_cmd, false)
            end

            spawn.easy_async(
                get_volume_cmd,
                function(stdout, stderr, exitreason, exitcode)
                    update_graphic(volumearc, stdout, stderr, exitreason, exitcode)
                end
            )
        end
    )

    watch(get_volume_cmd, 1, update_graphic, volumearc)

    return wibox.widget {
        volumearc,
        margins = xresources.apply_dpi(0),
        widget = wibox.container.margin
    }
end

return setmetatable(
    widget,
    {
        __call = function(_, ...)
            return widget.new(...)
        end
    }
)
