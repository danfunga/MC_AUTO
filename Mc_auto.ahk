#SingleInstance,force
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
