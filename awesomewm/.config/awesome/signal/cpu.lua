-- cpu info
-----------

-- ("signal::cpu"), function(usage(int))

local awful = require("awful")

local update_interval = 6
local cpu_idle_script = [[
  sh -c "
  vmstat 1 2 | tail -1 | awk '{printf \"%d\", $15}'
  "]]

awful.widget.watch(cpu_idle_script, update_interval, function(widget, stdout)
    local cpu_idle = stdout
    cpu_idle = string.gsub(cpu_idle, '^%s*(.-)%s*$', '%1')
    awesome.emit_signal("signal::cpu", 100 - tonumber(cpu_idle))
end)