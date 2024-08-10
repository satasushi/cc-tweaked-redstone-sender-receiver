local monitor = peripheral.find("monitor")
if monitor then
    term.redirect(monitor)
    term.clear()
    term.setCursorPos(1, 1)
    term.redirect(term.native())
else
    print("no monitor found.")
end
