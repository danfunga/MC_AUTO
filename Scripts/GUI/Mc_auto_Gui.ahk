INIT_GUI:
{
	CoordMode, Pixel, Screen
   

   gosub INIT_GUI_MAINPAGE     
   gosub LOAD_MAIN_CONFIG
   
   	
   
   xPos:= mainConfig.loadValue("GUI_POSITION", "MAIN_X")
   yPos:= mainConfig.loadValue("GUI_POSITION", "MAIN_Y")
   (xPos = "") ? (xPos:=1150):
   (yPos = "") ? (yPos:=0):   
   Gui, Show, x%xPos% y%yPos%  ,%GUI_TITLE%
  
   gui 2: default
   gosub	INIT_GUI_CONFIG
   gui 1: default
   gui 2: default
   gosub LOAD_CONFIG_CONFIG
   gui 1: default
	return 
}

GuiClose:
   
   WinGetPos, posx, posy, width, height, %GUI_TITLE%   
   mainConfig.saveValue("GUI_POSITION", "MAIN_X", posx)
   mainConfig.saveValue("GUI_POSITION", "MAIN_Y", posy)
   ExitApp






