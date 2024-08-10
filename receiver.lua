local modem = peripheral.find("modem")
local monitor = peripheral.find("monitor")
local receiveChannel = 5
local event, side, channel, replyChannel, message, distance

if modem then
    modem.open(receiveChannel)
    print("waiting for signal")
else 
    print("modem not found")
end

while true do
    monitor.setCursorPos(1, 1)
    repeat
      event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == 5
    monitor.clear()
    monitor.write("redstone signal strenght:" .. message)
    rs.setAnalogueOutput("front", tonumber(message))
end
