local monitor = peripheral.find("monitor")
local channe_broadcast = 65535
local channel_repeat = 65535
local max_id_channels = 65500
local modem1 = peripheral.find("modem")
local id, message = rednet.receive(nil, 5)

if modem1 then
    print("waiting for signal")
else 
    print("modem not found")
end

while true do
    monitor.setCursorPos(1, 1)
    monitor.clear()
    monitor.write("redstone signal strenght:" .. message)
    rs.setAnalogueOutput("front", tonumber(message))
end
