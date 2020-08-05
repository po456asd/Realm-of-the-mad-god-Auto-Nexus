#NoEnv
#MaxThreadsPerHotkey 2
#singleinstance force
#persistent
#IfWinActive, RotMGExalt

checkwin:
IfWinNotActive, RotMGExalt
{
	Tooltip, Game Window is not active,0,0
	sleep 200
	goto checkwin
}

Loop
{
	If (WarpCoordx = "")
	{
		Tooltip, Press Ctrl+Num5 at Warp HP (Around 30`%) to save coordinates,0,0
		sleep 500
	}
	Else
	{
		Tooltip, Saved,0,0
		sleep 1000
		Break
	}
}

Loop
{
	If (MaxHPCoordx = "")
	{
		Tooltip, Press Ctrl+Num6 at max HP (Around 90`%) to save coordinates,0,0
		sleep 500
	}
	Else
	{
		Tooltip, Saved,0,0
		sleep 1000
		Break
	}
}


loop2:
loop{
Tooltip , Auto Nexus is Idle... Press Ctrl+Num8 To Run Script,0,0
sleep 500
}
^Numpad8::
loop1:
makeitstop = 0
loop {
	loop3:
	Tooltip , Auto Nexus is working... Press Ctrl+Num9 to Stop Script,0,0
	PixelGetColor, color1, WarpCoordx, WarpCoordy, RGB
	if(color1 = 0x545454) {	
		loop
		{
			Tooltip , Panicking Press *R*...,0,0
			Send, {r}
			Sleep, 100
			PixelGetColor, color2, MaxHPCoordx, MaxHPCoordy, RGB
			if(color2 != 0x78C237)
			{	
				sleep 1
			} 
			else {
				Tooltip , Ok on nexus....
				sleep 1000
				Tooltip ,
				goto loop1
			}
		}
		break
	} 
	else {
		Sleep, 50
	}
	if (makeitstop = 1)
	{
		makeitstop = 0
		break
	}
}
Tooltip , Press Interact Key...,0,0
Send, {Space Down}
sleep 100
Send, {Space Up}
sleep 500
Loop
{
	PixelGetColor, color2, MaxHPCoordx, MaxHPCoordy, RGB
	if(color2 = 0x78C237)
	{	
		goto loop1
	}
	Else
	{
		Sleep 500
	}
}
return

space::
makeitstop := "1"
return

^Numpad9::
goto loop2
return

^Numpad5::
MouseGetPos , WarpCoordx, WarpCoordY
return

^Numpad6::
MouseGetPos , MaxHPCoordx, MaxHPCoordY
return

F11::
Tooltip ,reloading
sleep 1000
tooltip, 
Reload
return

F12::ExitApp