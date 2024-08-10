local inputSide = "back"
local monitor = peripheral.find("monitor")
local channe_broadcast = 65535
local channel_repeat = 65535
local max_id_channels = 65500
local modem1 = peripheral.find("modem")

if modem1 then 
    rednet.open( "right" )
	rednet.host("redstonecoms", "redstoneserver")
end

while true do
    os.pullEvent("redstone")
    monitor.clear()
    monitor.setCursorPos(1, 1)
    local signalStrength = rs.getAnalogInput(inputSide)
    rednet.broadcast(signalStrength)
    monitor.write("redstone strenght")
    monitor.setCursorPos(1, 2)
    monitor.write(redstone.getAnalogInput("back"))
    print("Sent redstone signal strength: " .. signalStrength)
end
