tell application "System Events" to tell process "SystemUIServer"
    set bt to (first menu bar item whose description is "bluetooth") of menu bar 1
    click bt
    tell (first menu item whose title is "SBKP 1 A1") of menu of bt
        click
        tell menu 1
            if exists menu item "Connect" then
                click menu item "Connect"
            else
                click bt
            end if
        end tell
    end tell
end tell