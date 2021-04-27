local awful = require("awful")
local wibox = require("wibox")
local menubar = require("menubar")

-- menubar.utils.terminal = terminal

local module = {}

function module.new(args)
    local args = args or {}
    local client = args.client or nil

    local launcher_menu = setmetatable({}, menu)

    function launcher_menu:toggle()
        menu:toggle(
            {
                coords = {
                    x = 0,
                    y = 0
                }
            }
        )
    end
    function launcher_menu:show()
        menu:show(
            {
                coords = {
                    x = 0,
                    y = 0
                }
            }
        )
    end
    local margin = args.margin or 0
    return wibox.widget {
        wibox.container.margin(
            awful.widget.launcher(
                {
                    image = beautiful.awesome_icon,
                    menu = launcher_menu
                }
            ),
            margin + 4,
            margin + 4,
            margin,
            margin
        ),
        bg = beautiful.bg_focus,
        widget = wibox.container.background
    }
end

return module
