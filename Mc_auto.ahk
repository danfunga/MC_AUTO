
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





#include Scripts\1.GlobalVariable.ahk

#include %A_ScriptDir%\Scripts\GUI\Mc_auto_Gui.ahk
#include Scripts\GUI\GUI_action.ahk

#Include Scripts\2.SearchPosition.ahk
#Include Scripts\AUTOMODE_CASTLEBATTLE.ahk
#Include Scripts\Automode_Raid.ahk
#Include Scripts\Round_Advanture.ahk
#Include Scripts\Round_StartUpGame.ahk
#Include Scripts\Round_HasNoKey.ahk
#Include Scripts\Round_BattlePassive.ahk
#Include Scripts\Round_BattleField.ahk
#Include Scripts\Round_GoldRoom.ahk
#Include Scripts\Auto_MonsterLevelupCheck.ahk

#Include Scripts\function_methods.ahk
#Include Scripts\function_waitAndDelay.ahk

#Include Scripts\function_ImageSearchAndClick.ahk

#Include Scripts\TestPoint.ahk
#Include Scripts\Util_PushBullet.ahk
#Include Scripts\Util_ScreenShot.ahk
