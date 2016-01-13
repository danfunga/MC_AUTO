#SingleInstance,force
gosub INIT_GLOBAL_VARIABLES
gosub INIT_MCAUTO_GUI



fPrintTitle("구동  시작")
fPrintStatus("매크로가 구동")
fPrintResult( "매크로가 정상적으로 구동되었습니다." )	
setUpBeforeStart()
return


!F9::
BUTTON시작[F9]:
{
	fPrintStatus("매크로 동작을 시작합니다.")	
	setUpBeforeStart()		
	if( BoolStarted = false ){
		BoolStarted:= true
		loop 4
		{
			funcChangeTab%a_index%Status()	
		}		
		fPrintTitle("실행시작")		
		goto, 매크로시작
	}
	return
}

!F10::
BUTTON정지[F10]:
{
   
	if( BoolStarted = true ){
		BoolWantToStop := true
		fPrintTitle("매크로종료")
		fPrintStatus("진행중인 과정이 끝나면 정상적으로 종료됩니다.")	
	}
	return
}

!F12:: 
BUTTON다시[F12]:
{
	WinActivate Mc_auto.ahk
	Send, ^s  
	Reload
   
	return
}


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
