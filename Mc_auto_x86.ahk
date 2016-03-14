; Macro Start Point

ACTIVE_ID:="BlueStacks App Player"
GUI_TITLE:="MC_AUTO Ver 1.0"

; System Variable   
SysGet, IntWinCapHeight, 4 ; ĸ��Height
SysGet, IntWinBorderWidth, 32 ; ����Width
SysGet, IntWinBorderHeight, 33 ; ����Height

;~ Status
BoolStarted:=false
BoolPaused:=false
BoolWantToStop:=false

BoolReSized := false
BooleanDebugMode:=false

;~ MsgBox, %DEFAULT_WIDTH% %DEFAULT_HEIGHT% "DEFAULT"
;~WinGetPos, , , winW, winH, %ACTIVE_ID%
DEFAULT_WIDTH:=966
DEFAULT_HEIGHT:=628
RUN_WIDTH:=644
RUN_HEIGHT:=428

gosub INIT_GLOBAL_VARIABLES   
   
   
mainConfig := new IniController( A_ScriptDir "\Config\main.ini" )

gosub INIT_GUI

fPrintTitle("����  ����")
fPrintStatus("��ũ�ΰ� ����")
fPrintResult( "��ũ�ΰ� ���������� �����Ǿ����ϴ�." )	
setUpBeforeStart()
return


��ũ�ν���:
{
	fPrintStatus("��ũ�� ������ �����մϴ�.")	
	setUpBeforeStart()		
	if( BoolStarted = false ){
      BoolStarted:= true	
      funcChangeGuiStatus()			
		fPrintTitle("�������")		
		goto, ��ũ��MAIN
	}
	return
}
��ũ������:
{
   fPrintTitle("��ũ������")
	fPrintStatus("��ũ�θ� �����մϴ�.")
	fPrintResult("��ũ�� ����")
	BoolStarted:=false
	BoolWantToStop:=false
   
	funcChangeGuiStatus()
	
	exit
}
��ũ�θ��ε�:
{
	WinActivate Mc_auto.ahk
	Send, ^s  
	Reload   
	return   
}

checkExit(){
	global BoolWantToStop
	if ( BoolWantToStop = true ){		
		gosub ��ũ������   
	}
}


#if WinActive( GUI_TITLE )
Enter::  send {tab 4}{space}+{tab 4}
NumPadEnter::  send {tab 4}{space}+{tab 4}
#if


#include %A_ScriptDir%\Scripts\GUI\Mc_auto_Gui.ahk
#include Scripts\GUI\GUI_action.ahk
#Include Scripts\1.Function_Macro.ahk
#Include Scripts\1.Launch_Macro.ahk
#Include Scripts\2.Function_Game.ahk
#Include Scripts\2.Launch_Game.ahk

#Include Scripts\3.SearchPosition.ahk
#Include Scripts\4.Mode_CASTLEBATTLE.ahk
#Include Scripts\4.Mode_Raid.ahk
#Include Scripts\4.Mode_Advanture.ahk
#Include Scripts\4.Mode_HasNoKey.ahk
#Include Scripts\4.Mode_BattlePassive.ahk
#Include Scripts\4.Mode_BattleField.ahk
#Include Scripts\4.Mode_GoldRoom.ahk
#Include Scripts\4.Mode_MonsterLevelupCheck.ahk
#Include Scripts\5.Util_PushBullet.ahk
#Include Scripts\5.Util_ScreenShot.ahk
#Include Scripts\6.TestPoint.ahk
#Include Scripts\MC_LIBRARY.ahk

#include %A_ScriptDir%\Scripts\GUI\GUI_BOTTOM_CONTROL.ahk
#include %A_ScriptDir%\Scripts\GUI\GUI_MAIN.ahk
#include %A_ScriptDir%\Scripts\GUI\GUI_TAB2_ADVANTURE.ahk
#include %A_ScriptDir%\Scripts\GUI\GUI_TAB3_CASTLEBATTLE.ahk
#include %A_ScriptDir%\Scripts\GUI\GUI_TAB4_ETC.ahk
#include %A_ScriptDir%\Scripts\GUI\GUI_Config.ahk
