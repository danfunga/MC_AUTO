INIT_TAB_MAIN:
{
	{	
		Gui,font,CPurple
		Gui, Add, GroupBox	    , x02 y030 w140 h120 , ���̵�/��
		Gui,font,
			  
		Gui, Add, Radio			, xp+10 	yp+16 w65 	h15 					vGuiRadioStageEasy, 				����
		Gui, Add, Radio			, xp 		yp+16 wp 		hp 					vGuiRadioStageNomal, 			����
		Gui, Add, Radio			, xp 		yp+16 wp 		hp Checked 	vGuiRadioStageHard, 				�����
		Gui, Add, Radio			, xp 		yp+16 wp 		hp 					vGuiRadioStageMoonIsland, 	�޺��Ǽ�
		Gui, Add, ListBox			, xp+70 	yp-48 w50 	h80 Choose4  vGuiStageList, 7-9|6-6|8-1|7-10|6-10|5-10|4-10|3-10|2-10|1-10|7-5|9-1|5-1|6-5|3-5|7-1|1-2|3-9|8-15
      Gui, Add, CheckBox	   , xp-70 	yp+65    w65 		h15 		vGuiCheckGoNextStage, 			����
      Gui, Add, CheckBox      , xp 	   y+2    h15     vGuiLoopMap ,�ݺ�		
      Gui, Add, Edit          , x+0    yp    w70 h15 right vLoopMapList, 2-10|6-6|7-9
         
	} 
	{
		Gui,font,CPurple
		Gui, Add, GroupBox, x145 		y30 w130 h120 , ������/�� ����	
		Gui,font,
				
		Gui, Add, CheckBox, xp+10 		yp+18 w65 h15   Checked Disabled, ������		
		Gui, Add, CheckBox, xp 				yp+25 wp hp Checked vGuiCheckContentsBattleField, ������
		Gui, Add, CheckBox, xp 				yp+25 wp hp Checked vGuiCheckContentsGoldRoom, Ȳ�ݹ�
		Gui, Add, CheckBox, xp 				yp+28 wp hp Checked vGuiCheckCallFriend, ģ����ȯ
		Gui, Add, DropDownList, x+5 y45 w40 h100  Choose1 vGuiListTeamAdvanture, 1��|2��|3��
		Gui, Add, DropDownList, xp yp+25 wp h100  Choose1 vGuiListTeamBattle, 1��|2��|3��
		Gui, Add, DropDownList, xp yp+25 wp h100  Choose1 vGuiListTeamGoldRoom, 1��|2��|3��	
	}
	{
		Gui,font,CPurple
		Gui, Add, GroupBox, x278 y30 w230 h120 , ���ӱ��
		gui,font,
		
		Gui, Add, Text, xp+10 yp+18 w65 h15  , ������Ƚ��:
		Gui, Add, Text, xp y+10 wp hp  , ����Ŭ����:
		Gui, Add, Text, xp y+2 wp hp  , ����   ����:
		Gui, Add, Text, xp y+10 wp hp  , ����   �Ϸ�:
		Gui, Add, Text, xp y+2 wp hp  , ����   ����:
		
		Gui, Add, Text, x+2 yp-84 w28 h15  right vCountTotalCount ,  0
		Gui, Add, Text, xp y+10 wp hp  right vCountClearCount ,  0		
		Gui, Add, Text, xp y+2 wp hp  right vCountFailCount ,  0		
		Gui, Add, Text, xp y+10 wp hp  right vCountMonsterChange,  0
		Gui, Add, Text, xp y+2 wp hp  right vGuiReceivePointCount,  0

		Gui, Add, Text, x+10 y48 w65 h15  , Ȳ�ݹ�Ƚ��:
		Gui, Add, Text, xp y+10 wp hp  , ������¸�:
		Gui, Add, Text, xp y+2 wp hp  , �������й�:
		Gui, Add, Text, xp y+10 wp hp  , ��üũ����:
		Gui, Add, Text, xp y+2 wp hp  , ����   ����:
		
		Gui, Add, Text, x+2 yp-84 w28 h15  right vCountGoldRoom ,  0
		Gui, Add, Text, xp y+10 wp hp  right vCountWinCount ,  0
		Gui, Add, Text, xp y+2 wp hp  right vCountLoseCount ,  0
		Gui, Add, Text, xp y+10 wp hp  right vNoLevelUp ,  0
		Gui, Add, Text, xp y+2 wp hp  right vGuiUsingPointCount,  0
	}
		{
			Gui,font,CPurple
			Gui, Add, GroupBox, x2 y155 w140 h65  , ������ �ݺ�
			gui,font,
			
			Gui, Add, Text, xp+10 yp+16 w58 h15 , Ȳ���ǹ� :
			Gui, Add, Text, xp yp+16 wp hp , �� ��  �� :
			Gui, Add, Text, xp yp+16 wp hp , �̾�Ȯ�� :
		  
			Gui, Add, Edit, x+0 yp-35 w20 h15 right vCountForGoldRoom, 10
			Gui, Add, Edit, xp yp+16 wp hp right vCountForBattle, 12
		   Gui, Add, Edit, xp yp+16 wp hp right   vCountForLevelupCheck, 3
		   Gui, Add, Text, x+1 yp-30 w40 h15 left, ȸ ����
			Gui, Add, Text, xp yp+16 wp hp left, ȸ ����
			Gui, Add, Text, xp yp+16 wp hp left, ȸ ����
		}


		{
			Gui,font,CPurple
			Gui, Add, GroupBox, x145 y155 w130 h65  , ���� ����
			gui,font,
			
			Gui, Add, CheckBox,  xp+10 yp+13 wp-15 h15 Disabled vGuiWantReceiveKey, ������ �ޱ�(��)
			Gui, Add, CheckBox,  xp  yp+16 wp hp Checked vGuiWantByKeyPoint, ������
			Gui, Add, CheckBox,  xp yp+16 wp hp Disabled vGuiWantByKeyRuby, ��� ����(��)
		}
		{
			gui,font,CPurple
			Gui, Add, GroupBox, x278 y155 w230 h110 , ����
			gui,font,
			
         Gui, Add, Radio			, xp+10  yp+15  w50  h15     Checked   vGuiRadioMonsterChangeCombine, ����
         Gui, Add, Radio			, x+5    yp     hp              vGuiRadioMonsterChangeLoop, ����
			
         Gui, Add, Text,xp-55 y+8 h15 , �巡��:			
			Gui, Add, Edit, x+5 yp-2 w20 h15 right vGuiDragCount, 3
         Gui, Add, CheckBox, xp-45 y+10 h15   Checked vGuiCheckFirstElement, ���Ҹ���
         Gui, Add, CheckBox, xp y+10 h15 vGuiBoolStopMonsterLevelUp, �̷����� ����
         
			gosub	INIT_TEAM_POSITION
			Gui, Add, CheckBox, x%��ȣ1X% y%��ȣ1Y% w30 h15 Disabled  vGuiCheckChangeTeam1, 1
			Gui, Add, CheckBox, x%��ȣ2X% y%��ȣ2Y%wp hp Disabled Checked vGuiCheckChangeTeam2, 2
			Gui, Add, CheckBox, x%��ȣ3X% y%��ȣ3Y% wp hp Disabled Checked vGuiCheckChangeTeam3, 3
			Gui, Add, CheckBox, x%��ȣ4X% y%��ȣ4Y% wp hp Disabled Checked vGuiCheckChangeTeam4, 4
			Gui, Add, CheckBox, x%��ȣ5X% y%��ȣ5Y% wp hp Disabled  vGuiCheckChangeTeam5, 5
			
			Gui, Add, DropDownList, xp-70 yp-3 w60 h90  Disabled Choose1 gGuiListTeamPosition vGuiListTeamPosition, ��ȣ|����|�⺻|�뷱��
		}
		{

			gui,font,CPurple
			Gui, Add, GroupBox, x2 y225 w273 h40  ,  ������ ���� ����
			gui,font,
			Gui, Add, CheckBox, xp+8  yp+15 w70 h15 vGuiBoolFirstGoldRoom, Ȳ�ݸ���
			Gui, Add, CheckBox, x+5  yp wp h15 vGuiBoolFirstBattleField, ��������
			Gui, Add, CheckBox, x+5  yp wp h15 +Disabled vGuiBooFirstlCastleBattle, ��������	
			Gui, Add, DropDownList, x+0 yp-3 w40 h100 Choose2 vGuilListCatleBattleTeam, 1��|2��|3��
			
			
		}
		{
			gui,font,CPurple
			Gui, Add, GroupBox, x2 y270 w140 h40  ,����Ǹ�(��)
			gui,font,
			
			Gui, Add, CheckBox, x13 yp+15 w70 h15  Disabled vGuiCheckSellEquip, ��� �Ǹ�
			Gui, Add, DropDownList, x+10 yp-3 w40 h70 Disabled Choose1 vGuiSellEquipLimit, 1��|2��|3��|4��
		}

		{
			gui,font,CPurple
			Gui, Add, GroupBox, x2 y315 w140 h40 , 1������ �Ǹ�
			gui,font,
			;~ Gui, Add, Edit, x10 yp+16 w20 h15 right vGui1LevelHappySave, 3
		   ;~ Gui, Add, Text, x+0 yp+2 w40 h15 left, �� ����
		   ;~ Gui, Add, CheckBox, x+5 yp+2 w70 h15  vGui30LevelHappySell, �����Ǹ�
		}
		{
			gui,font,CPurple
			Gui, Add, GroupBox, x145 y270 w130 h85  , ������ ����
			gui,font,  
			Gui, Add, Text,xp+10 yp+18 w60 h15 , �⺻���� :
			Gui, Add, Text, xp y+7 wp hp , Ŭ������ :
			Gui, Add, Text, xp y+7 wp hp , ���Ϸε� :
		  
		  ;~ Gui, Add, Text,xp+10 yp+18 w60 h15 , �⺻���� :
			Gui, Add, Edit, x+5 yp-47 w25 h15 right vGuiDelayForBattle, 20
			Gui, Add, Edit, xp y+7 wp hp right vGuiDelayForClickAfter, 2
		  Gui, Add, Edit, xp y+7 wp hp right vDelayForFileLoading, 3
		  Gui, Add, Text,  x+1 yp-43 w15 h15 left, ��
			Gui, Add, Text, xp y+7 wp hp left, ��
			Gui, Add, Text,  xp y+7 wp hp left, ��
		}
		{
			gui,font,CPurple
			Gui, Add, GroupBox, x278 y270 w230 h55 , ���̵� ���
			gui,font,  
			Gui, Add, CheckBox, xp+15  yp+18 h15 vGuiSelectRaidMod, ���̵� ���
         Gui, Add, Text, xp yp+18 h15  , ���谡 1~2�� ���� ��� ���̵�.
         
         ;Gui, Add, Edit, xp yp+18 w20 h15 Disabled right vGuiRaidMinKey, 2			
			;Gui, Add, Text, x+5 yp+2  h15 , �� ���� ->
			;Gui, Add, Edit, x+5 yp-2 w20 h15 Disabled right vGuiRaidMaxKey, 6
			;Gui, Add, Text, x+5 yp+2  h15 , �� -> ����
		}
		{
			Gui, Font, S8 CDefault Bold, Verdana
			Gui, Add, Button, x295 y330 w80 h25   vButton_Apply, ��������
			Gui, Font, , 
			gui,font,CDefault, �������
			;~ Gui, Add, Text, x+15 yp+8  hp , Made By Mukchik.
			Gui, Add, Text, x+15 yp+8  hp , MC_Auto Yosemite.
			Gui, Font, , 
			
		}
	return
}
funcChangeTab1Status(){	
	global BoolStarted

	
	GuiControl, hide%BoolStarted%, Button_Start
	GuiControl, show%BoolStarted%, Button_Stop
	
	GuiControl, show%BoolStarted%,PIC_PAUSE		
	
	GuiControl, disable%BoolStarted%, Button_Apply
  
	GuiControl, disable%BoolStarted%, GuiRadioStageEasy
	GuiControl, disable%BoolStarted%, GuiRadioStageNomal
	GuiControl,  disable%BoolStarted%, GuiRadioStageHard
	GuiControl,  disable%BoolStarted%, GuiRadioStageMoonIsland
	GuiControl,  disable%BoolStarted%, GuiStageList
	GuiControl,  disable%BoolStarted%, GuiCheckGoNextStage
   
   GuiControl,  disable%BoolStarted%, GuiLoopMap
	GuiControl,  disable%BoolStarted%, LoopMapList     
   
	GuiControl,  disable%BoolStarted%, GuiCheckContentsBattleField
	GuiControl,  disable%BoolStarted%, GuiCheckContentsGoldRoom
	GuiControl,  disable%BoolStarted%, GuiCheckCallFriend
	GuiControl,  disable%BoolStarted%, GuiListTeamAdvanture
	GuiControl,  disable%BoolStarted%, GuiListTeamBattle
	GuiControl,  disable%BoolStarted%, GuiListTeamGoldRoom
	
	GuiControl,  disable%BoolStarted%, CountForGoldRoom
	GuiControl,  disable%BoolStarted%, CountForBattle
	GuiControl,  disable%BoolStarted%, CountForLevelupCheck
	
	
	GuiControl,  disable%BoolStarted%, GuiDelayForBattle
   GuiControl,  disable%BoolStarted%, GuiDelayForClickAfter
   GuiControl,  disable%BoolStarted%, DelayForFileLoading

   GuiControl,  disable%BoolStarted%, GuiRadioMonsterChangeLoop
   GuiControl,  disable%BoolStarted%, GuiRadioMonsterChangeCombine
   
   if( BoolStarted = true ){
      goSub DisableLevelupCheckList   
   }else {
      goSub EnableLevelupCheckList
   }   
	;~ GuiControl,  disable%BoolStarted%, GuiWantReceiveKey
	GuiControl,  disable%BoolStarted%, GuiWantByKeyPoint
	;~ GuiControl,  disable%BoolStarted%, GuiWantByKeyRuby
   
 
	GuiControl,  disable%BoolStarted%, GuiBoolFirstGoldRoom
	GuiControl,  disable%BoolStarted%, GuiBoolStopMonsterLevelUp	
	GuiControl,  disable%BoolStarted%, GuiBoolFirstBattleField
	;~GuiControl,  disable%BoolStarted%, GuiBooFirstlCastleBattle
	GuiControl,  disable%BoolStarted%, GuilListCatleBattleTeam	
	
	GuiControl,  disable%BoolStarted%, GuiSelectRaidMod
	;GuiControl,  disable%BoolStarted%, GuiRaidMinKey
	;GuiControl,  disable%BoolStarted%, GuiRaidMaxKey	
   
   GuiControl,  disable%BoolStarted%, GuiDragCount	
   GuiControl,  disable%BoolStarted%, GuiCheckFirstElement	
     
}



INIT_TEAM_POSITION:
{
		PositionX_FirstRow = 470
		PositionY_Top = 190
		PositionX_SeconRow:= PositionX_FirstRow - 30
		Diff_Y=15

		;~ ��ȣ����
		��ȣ1X:= PositionX_FirstRow
		��ȣ1Y:= PositionY_Top

		��ȣ2X:= PositionX_FirstRow
		��ȣ2Y:= ��ȣ1Y+Diff_Y

		��ȣ3X:= PositionX_FirstRow
		��ȣ3Y:= ��ȣ2Y+Diff_Y

		��ȣ4X:= PositionX_FirstRow
		��ȣ4Y:= ��ȣ3Y+Diff_Y

		��ȣ5X:= PositionX_SeconRow
		��ȣ5Y:= (��ȣ2Y + ��ȣ3Y ) /2


		����2X:= PositionX_SeconRow
		����2Y:= PositionY_Top

		����3X:= PositionX_SeconRow
		����3Y:= ����2Y+Diff_Y

		����4X:= PositionX_SeconRow
		����4Y:= ����3Y+Diff_Y

		����5X:= PositionX_SeconRow
		����5Y:= ����4Y+Diff_Y
			
		����1X:= PositionX_FirstRow
		����1Y:= (����3Y + ����4Y ) /2


		�⺻3X:= PositionX_SeconRow
		�⺻3Y:= PositionY_Top

		�⺻4X:= PositionX_SeconRow
		�⺻4Y:= �⺻3Y+Diff_Y*1.5

		�⺻5X:= PositionX_SeconRow
		�⺻5Y:= �⺻4Y+Diff_Y*1.5

		�⺻1X:= PositionX_FirstRow
		�⺻1Y:= (�⺻3Y + �⺻4Y ) /2

		�⺻2X:= PositionX_FirstRow
		�⺻2Y:= (�⺻4Y + �⺻5Y ) /2

		�뷱��1X:= PositionX_FirstRow
		�뷱��1Y:= PositionY_Top

		�뷱��2X:= PositionX_FirstRow
		�뷱��2Y:= �뷱��1Y +Diff_Y*1.5

		�뷱��3X:= PositionX_FirstRow
		�뷱��3Y:= �뷱��2Y +Diff_Y*1.5

		�뷱��4X:= PositionX_SeconRow
		�뷱��4Y:= (�뷱��1Y + �뷱��2Y ) /2

		�뷱��5X:= PositionX_SeconRow
		�뷱��5Y:= (�뷱��2Y + �뷱��3Y ) /2
	return
}


DisableLevelupCheckList:
{
	GuiControl, Disabled,GuiListTeamPosition
	loop, 5
	{
		GuiControl, Disabled,GuiCheckChangeTeam%A_index%
	}
	return
}
EnableLevelupCheckList:
{
	GuiControl, Enabled,GuiListTeamPosition
	loop, 5
	{
		GuiControl, Enabled,GuiCheckChangeTeam%A_index%
	}
	return
}

GuiListTeamPosition:
{
	guiControlGet, choice,,GuiListTeamPosition
		
	loop, 5
	{
		x:=%choice%%A_index%X
		y:=%choice%%A_index%Y		
		GuiControl, HideTrue,GuiCheckChangeTeam%A_index%
		GuiControl, move, GuiCheckChangeTeam%A_Index%, x%x%,y%y%
		GuiControl, ShowTrue,GuiCheckChangeTeam%A_index%
	}
	return
}



SaveConfig:
{
   Gui, Submit, NoHide
   
   IfNotExist, Logs
	{
		FileCreateDir, Logs
	}
	IfNotExist, Config
	{
		FileCreateDir, Config
	}

	fSaveFile( GuiListTeamAdvanture, "������", "������")
	fSaveFile( GuiListTeamBattle, "������", "������")
	fSaveFile( GuiListTeamGoldRoom, "������", "Ȳ����")
	
	fSaveFile( GuiCheckContentsBattleField, "������", "������" )
	fSaveFile( GuiCheckContentsGoldRoom, "������", "Ȳ�ݹ�" )
	fSaveFile( GuiCheckCallFriend, "������", "ģ����ȯ" )
	
	fSaveFile( GuiRadioStageEasy, "�ʼ���", "����" )
	fSaveFile( GuiRadioStageNomal, "�ʼ���", "����" )
	fSaveFile( GuiRadioStageHard, "�ʼ���", "�����" )
	fSaveFile( GuiRadioStageMoonIsland, "�ʼ���", "�޺��Ǽ�" )
	fSaveFile( GuiStageList, "�ʼ���", "��������" )
	fSaveFile( GuiCheckGoNextStage, "�ʼ���", "����" )
   
   fSaveFile( GuiLoopMap, "�ʼ���", "����" )
   fSaveFile( LoopMapList, "�ʼ���", "��������" )      
   
	fSaveFile(CountForGoldRoom, "�������ݺ�", "Ȳ�ݹ浹��" )
	fSaveFile(CountForBattle, "�������ݺ�", "�����嵹��" )	
	fSaveFile(CountForLevelupCheck, "�������ݺ�", "����Ȯ��" )
   
      
   fSaveFile(GuiDelayForBattle, "������", "�⺻����������" )
   fSaveFile(GuiDelayForClickAfter, "������", "Ŭ��������" )
   fSaveFile(DelayForFileLoading, "������", "�ε�������" )
   
	fSaveFile(GuiBoolFirstGoldRoom, "��������", "Ȳ�ݸ���" )
   fSaveFile(GuiBoolFirstBattleField, "��������", "��������" )
   fSaveFile(GuiBooFirstlCastleBattle, "��������", "��������" )
   fSaveFile(GuilListCatleBattleTeam, "��������", "������" )
	fSaveFile(GuiBoolStopMonsterLevelUp, "�߰����", "�̾�����" )

	fSaveFile(GuiCheckSellEquip, "������", "����Ǹ�" )
	fSaveFile(GuiSellEquipLimit, "������", " �Ǹŵ��" )
	
	fSaveFile(GuiWantReceiveKey, "����", "������")
	fSaveFile(GuiWantByKeyPoint, "����", "������" )
	fSaveFile(GuiWantByKeyRuby, "����", "�����" )
   
   
   fSaveFile(GuiListTeamPosition, "����", "��������" )
  
   fSaveFile(GuiRadioMonsterChangeLoop, "����", "������ü" )
   fSaveFile(GuiRadioMonsterChangeCombine, "����", "���ձ�ü" )
   fSaveFile(GuiDragCount, "����", "�巡��Ƚ��" )
   fSaveFile(GuiCheckFirstElement, "����", "���Ҹ���" )
   
   fSaveFile(GuiSelectRaidMod, "���̵���", "�����" )
   
   
   
   fSaveFile(GuiSendFrindShipCount, "��������", "����Ƚ��" )
   fSaveFile(GuiCheckSendFriendsShipAll, "��������", "���κ�����" )
   fSaveFile(GuiCheckSendFriendsShipOnlyGame, "��������", "���ܺ�����" )
   fSaveFile(GuiSendingAfterAdventure, "��������", "�����ĸ���" )
   
   fSaveFile(GuiPushBulletToken, "PushBullet", "Token" )

   loop, 5
   {
      Target =������ü%A_index%
      fSaveFile(GuiCheckChangeTeam%A_index%, "����", Target ) 
   }
	return
}


LoadConfig:
{
	IfNotExist, Logs
	{
		FileCreateDir, Logs
	}
	IfNotExist, Config
	{
		FileCreateDir, Config
	}
	IfNotExist, Config\Skill
	{
		FileCreateDir, Config\Skill
	}
	fLoadFile( vValue, "������", "������")
	if( vValue <> "" )
		GuiControl,Choose,GuiListTeamAdvanture,%vValue%	
	fLoadFile( vValue, "������", "������")
	if( vValue <> "" )
		GuiControl,Choose,GuiListTeamBattle ,%vValue%
	fLoadFile( vValue, "������", "Ȳ����")
	if( vValue <> "" )
		GuiControl,Choose,GuiListTeamGoldRoom ,%vValue%
	
	fLoadFile(vValue, "������", "������" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckContentsBattleField,%vValue%
	fLoadFile(vValue, "������", "Ȳ�ݹ�" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckContentsGoldRoom,%vValue%
	
	
	fLoadFile(vValue, "������", "ģ����ȯ" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckCallFriend,%vValue%
	;~ GuiControl, , ,%vValue%
	
	fLoadFile(vValue, "�ʼ���", "����" )
	if( vValue <> "" )
		GuiControl, ,GuiRadioStageEasy,%vValue%
	fLoadFile(vValue, "�ʼ���", "����" )
	if( vValue <> "" )
		GuiControl, ,GuiRadioStageNomal,%vValue%
	fLoadFile(vValue, "�ʼ���", "�����" )
	if( vValue <> "" )
		GuiControl, ,GuiRadioStageHard,%vValue%
	fLoadFile(vValue, "�ʼ���", "�޺��Ǽ�" )
	if  vValue 
		GuiControl, ,GuiRadioStageMoonIsland,%vValue%
	fLoadFile(vValue, "�ʼ���", "����" )
	if  vValue 
		GuiControl, ,GuiCheckGoNextStage,%vValue%
	
	fLoadFile(vValue, "�ʼ���", "��������" )	
	if  vValue 
		GuiControl, Choose,GuiStageList,%vValue%
      
   fLoadFile(vValue, "�ʼ���", "����" )
	if  vValue 
		GuiControl, ,GuiLoopMap,%vValue%
	
	fLoadFile(vValue, "�ʼ���", "��������" )	
	if  vValue 
		GuiControl, ,LoopMapList,%vValue%
   
	
	fLoadFile(vValue, "�������ݺ�", "Ȳ�ݹ浹��" )
	if( vValue <> "" )
		GuiControl, ,CountForGoldRoom,%vValue%
	fLoadFile(vValue, "�������ݺ�", "�����嵹��" )
	if( vValue <> "" )
		GuiControl, ,CountForBattle,%vValue%
  	fLoadFile(vValue, "�������ݺ�", "����Ȯ��" )
	if( vValue <> "" )
		GuiControl, ,CountForLevelupCheck,%vValue%
   
    fLoadFile(vValue, "������", "�⺻����������" )
	if( vValue <> "" )
		GuiControl, ,GuiDelayForBattle,%vValue%
	fLoadFile(vValue, "������", "Ŭ��������" )
	if( vValue <> "" )
		GuiControl, ,GuiDelayForClickAfter,%vValue%
	fLoadFile(vValue, "������", "�ε�������" )
	if( vValue <> "" )
		GuiControl, ,DelayForFileLoading,%vValue%

	fLoadFile(vValue, "������", "����Ǹ�" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckSellEquip,%vValue%	
	fLoadFile(vValue, "������", "�Ǹŵ��" )
	if( vValue <> "" )
		GuiControl,Choose,GuiSellEquipLimit ,%vValue%
      
	fLoadFile(vValue, "����", "������" )	
	if( vValue <> "" )
		GuiControl, ,GuiWantReceiveKey,%vValue%
	fLoadFile(vValue, "����", "������" )
	if( vValue <> "" )
		GuiControl, ,GuiWantByKeyPoint,%vValue%
	
	fLoadFile(vValue, "����", "�����" )
	if( vValue <> "" )
		GuiControl, ,GuiWantByKeyRuby,%vValue%   
      
   fLoadFile(vValue, "��������", "Ȳ�ݸ���" )
	if( vValue <> "" )
		GuiControl, ,GuiBoolFirstGoldRoom,%vValue%
   fLoadFile(vValue, "��������", "��������" )
	if( vValue <> "" )
		GuiControl, ,GuiBoolFirstBattleField,%vValue%
   fLoadFile(vValue, "��������", "��������" )
	if( vValue <> "" )
		GuiControl, ,GuiBooFirstlCastleBattle,%vValue%      
   fLoadFile(vValue, "��������", "������" )
	if( vValue <> "" )
		GuiControl, Choose,GuilListCatleBattleTeam,%vValue%

      
	fLoadFile(vValue, "�߰����", "�̾�����" )
	if( vValue <> "" )
		GuiControl, ,GuiBoolStopMonsterLevelUp,%vValue%
      
   fLoadFile(vValue, "����", "��������" )
	if( vValue <> "" ){
		GuiControl, Choose,GuiListTeamPosition,%vValue%
      gosub GuiListTeamPosition
   }
   
   fLoadFile(vValue, "����", "������ü" )
	if( vValue <> "" ){
		GuiControl, ,GuiRadioMonsterChangeLoop,%vValue%
      if( vValue = true )
         goSub EnableLevelupCheckList
   }
   fLoadFile(vValue, "����", "���ձ�ü" )
	if( vValue <> "" ){
		GuiControl, ,GuiRadioMonsterChangeCombine,%vValue%     
      if( vValue = true )
         goSub EnableLevelupCheckList
   }
   
   fLoadFile(vValue, "����", "�巡��Ƚ��" )
	if( vValue <> "" )
		GuiControl, ,GuiDragCount,%vValue%     
   fLoadFile(vValue, "����", "���Ҹ���" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckFirstElement,%vValue%           
	
	fLoadFile(vValue, "���̵���", "�����" )
	if( vValue <> "" )
		GuiControl, ,GuiSelectRaidMod,%vValue%           


	;~ �� ������ �κ� �߰�
	fLoadFile(vValue, "��������", "����Ƚ��" )
	if( vValue <> "" )
		GuiControl, ,GuiSendFrindShipCount,%vValue%     
	fLoadFile(vValue, "��������", "���κ�����" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckSendFriendsShipAll,%vValue%     
	fLoadFile(vValue, "��������", "���ܺ�����" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckSendFriendsShipOnlyGame,%vValue%     
	
	fLoadFile(vValue, "��������", "�����ĸ���" )
	if( vValue <> "" )
		GuiControl, ,GuiSendingAfterAdventure,%vValue%     
	
	fLoadFile(vValue, "PushBullet", "Token" )
	if( vValue <> "" )
		GuiControl, ,GuiPushBulletToken,%vValue%     

   loop, 5
   {
      Target =������ü%A_index%
      fLoadFile(vValue, "����", Target )
      if( vValue <> "" ){
         GuiControl, ,GuiCheckChangeTeam%A_index%,%vValue%
      }
   }
	return
}
fSaveFile(  vValue, vTitle, vKey  ){
	IniWrite, %vValue%,  %A_ScriptDir%\Config\config.ini, %vTitle%, %vKey%
	return
}

fLoadFile(  ByRef value, vTitle, vKey ){
	IniRead, value, %A_ScriptDir%\Config\config.ini ,%vTitle%, %vKey%
	IfEqual value, ERROR
	{
			value:=""
	}
	return
}
