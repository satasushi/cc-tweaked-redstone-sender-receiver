local inputSides = {"back", "front", "left", "right", "top", "bottom"}
local modem = peripheral.find("modem")
local monitor = peripheral.find("monitor")
local sendChannel = 5
local receiveChannel = 10
local linepos = 1
local hexString = ""

if modem then
    modem.open(sendChannel)
else
    print("Required peripherals not found.")
end

while true do
    os.pullEvent("redstone")
    monitor.setTextScale(0.5)
    monitor.clear()
    monitor.setCursorPos(1, 1)
    hexString = ""
    for k,v in pairs(inputSides) do
        if linepos > 6 then
            linepos = 1
        end
        monitor.setCursorPos(1, linepos)
        local signalStrength = rs.getAnalogInput(v)
        hexString = hexString .. string.format("%X", signalStrength)
        monitor.write(v.." redstone strenght:")
        monitor.write(signalStrength)
        linepos = linepos + 1
        print(v.." side ".."Sent redstone signal strength: " .. signalStrength)
    end
    modem.transmit(sendChannel, receiveChannel, hexString)
end