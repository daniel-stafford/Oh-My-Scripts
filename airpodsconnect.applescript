set AirPodsName to "YOUR AIRPODS NAME"
tell application "System Events"
	tell application process "ControlCenter"
		set btMenu to menu bar item "Bluetooth" of menu bar 1
		tell btMenu to click
		set btCheckbox to checkbox 1 of scroll area 1 of group 1 of window "Control Centre" whose title contains AirPodsName
		set btCheckboxValue to value of btCheckbox
		tell btCheckbox to click
		tell btMenu to click
	end tell
end tell