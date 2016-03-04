; Macro Start Point

ACTIVE_ID:="BlueStacks App Player"
GUI_TITLE:="MC_AUTO Ver 1.0"

; System Variable   
SysGet, IntWinCapHeight, 4 ; 캡션Height
SysGet, IntWinBorderWidth, 32 ; 보더Width
SysGet, IntWinBorderHeight, 33 ; 보더Height

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

fPrintTitle("구동  시작")
fPrintStatus("매크로가 구동")
fPrintResult( "매크로가 정상적으로 구동되었습니다." )	
setUpBeforeStart()
return


매크로시작:
{
	fPrintStatus("매크로 동작을 시작합니다.")	
	setUpBeforeStart()		
	if( BoolStarted = false ){
      BoolStarted:= true	
      funcChangeGuiStatus()			
		fPrintTitle("실행시작")		
		goto, 매크로MAIN
	}
	return
}
매크로종료:
{
   fPrintTitle("매크로종료")
	fPrintStatus("매크로를 정지합니다.")
	fPrintResult("매크로 종료")
	BoolStarted:=false
	BoolWantToStop:=false
   
	funcChangeGuiStatus()
	
	exit
}
매크로리로드:
{
	WinActivate Mc_auto.ahk
	Send, ^s  
	Reload   
	return   
}

checkExit(){
	global BoolWantToStop
	if ( BoolWantToStop = true ){		
		gosub 매크로종료   
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
