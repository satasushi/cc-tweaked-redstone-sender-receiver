local inputSide = "back"
local modem = peripheral.find("modem")
local monitor = peripheral.find("monitor")
local sendChannel = 5
local receiveChannel = 10

if modem then
    modem.open(sendChannel)
else
    print("Required peripherals not found.")
end

while true do
    os.pullEvent("redstone")
    monitor.clear()
    monitor.setCursorPos(1, 1)
    local signalStrength = rs.getAnalogInput(inputSide)
    modem.transmit(sendChannel, receiveChannel, signalStrength)
    monitor.write("redstone strenght")
    monitor.setCursorPos(1, 2)
    monitor.write(redstone.getAnalogInput("back"))
    print("Sent redstone signal strength: " .. signalStrength)
end
