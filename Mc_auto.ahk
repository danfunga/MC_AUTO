
gosub INIT_GLOBAL_VARIABLES
gosub INIT_MCAUTO_GUI



fPrintTitle("����  ����")
fPrintStatus("��ũ�ΰ� ����")
fPrintResult( "��ũ�ΰ� ���������� �����Ǿ����ϴ�." )	
setUpBeforeStart()
return


!F9::
BUTTON����[F9]:
{
	fPrintStatus("��ũ�� ������ �����մϴ�.")	
	setUpBeforeStart()		
	if( BoolStarted = false ){
		BoolStarted:= true
		loop 4
		{
			funcChangeTab%a_index%Status()	
		}		
		fPrintTitle("�������")		
		goto, ��ũ�ν���
	}
	return
}

!F10::
BUTTON����[F10]:
{
   
	if( BoolStarted = true ){
		BoolWantToStop := true
		fPrintTitle("��ũ������")
		fPrintStatus("�������� ������ ������ ���������� ����˴ϴ�.")	
	}
	return
}

!F12:: 
BUTTON�ٽ�[F12]:
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
