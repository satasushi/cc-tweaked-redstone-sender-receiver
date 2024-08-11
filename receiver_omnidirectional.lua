local inputSides = {"back", "front", "left", "right", "top", "bottom"}
local outputValues = {}
local modem = peripheral.find("modem")
local monitor = peripheral.find("monitor")
local receiveChannel = 5
local event, side, channel, replyChannel, message, distance

if modem then
    modem.open(receiveChannel)
	monitor.setTextScale(0.5)
    print("waiting for signal")
else 
    print("modem not found")
end

local function split(text)
    local t = {}
    for i = 1, #text do
        t[i] = string.sub(text, i, i)
    end
    return t
end

while true do
    monitor.setCursorPos(1, 1)
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    monitor.clear()
    until channel == 5
    monitor.clear()
    outputValues = split(message)
    for k,v in pairs(outputValues) do
        monitor.setCursorPos(1, k)
        monitor.write(inputSides[k].." redstone signal strenght:" .. tonumber(v, 16))
        rs.setAnalogueOutput(inputSides[k], tonumber(v, 16))
    end
end