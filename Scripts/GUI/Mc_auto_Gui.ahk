INIT_MCAUTO_GUI:
{
	CoordMode, Pixel, Screen
	Gui, +LastFound  
	
	guiWidth:=511 , guiHeight:=400
	gosub INIT_BOTTOM_CONTROL
   Gui, Add, Edit, x200  y4  w110  h15 center ,  %TICKET_NAME%
   
	Gui, Add, Tab, x0 y0 w%guiWidth% h%guiHeight% vGuiAutoTab , Main|���轺ų|��Ÿ���   
	Gui, Tab, Main
	gosub INIT_TAB_MAIN 
	Gui, Tab, ����
	gosub INIT_TAB_ADVANTURE
	;~ Gui, Tab, ������
	;~ gosub INIT_TAB_CASTLEBATTLE
	Gui, Tab , ��Ÿ���
	gosub INIT_TAB4

	funcGuiLoadCharactors()
	gosub LoadConfig
   gosub LoadSkillConfig
	gosub LoadAutoSkillConfig
	
	;~ guiControl, ,GuiAutoTab, |Main|���轺ų||��Ÿ���|
	Gui, Show, x+1150 y w%guiWidth% h%guiHeight%   ,  MC_Auto Ver 0.95
	return 
}


funcGuiLoadCharactors(){
	Loop, %A_ScriptDir%\Image\10.��ų�̹���\*,1,0
	{
		strCharList=%strCharList%|%A_LoopFileName%
	}
	Loop 5
	{
		GuiControl, ,GuiChar%A_Index%,%strCharList%
		GuiControl, ,GuiWarChar%A_Index%,%strCharList%
		GuiControl, ,GuiGoldChar%A_Index%,%strCharList%
	}
	return
}

GuiClose:
ExitApp
#include %A_ScriptDir%\Scripts\GUI\GUI_BOTTOM_CONTROL.ahk
#include %A_ScriptDir%\Scripts\GUI\GUI_TAB1_MAIN.ahk
#include %A_ScriptDir%\Scripts\GUI\GUI_TAB2_ADVANTURE.ahk
#include %A_ScriptDir%\Scripts\GUI\GUI_TAB3_CASTLEBATTLE.ahk
#include %A_ScriptDir%\Scripts\GUI\GUI_TAB4_ETC.ahk


