INIT_TAB_MAIN:
{
	{	
		Gui,font,CPurple
		Gui, Add, GroupBox	    , x02 y030 w140 h80 , ���̵�/��
		Gui,font,
      
      Gui, Add, DropDownList  , x12    y45 section w60 h100  Choose3 vGuiStageDifficulty, ����|����|�����
      
      Gui, Add, CheckBox	   , xs 	   y+5    Checked vGuiCheckCallFriend, ģ����ȯ
      Gui, Add, CheckBox      , x+5    y      vGuiCheckGoNextStage, ����      
      Gui, Add, CheckBox      , xs 	   y+5    Checked vGuiLoopMap ,�ݺ�		         
      Gui,font,s7
      Gui, Add, Edit          , x+0    yp-1   w75 h15 right vLoopMapList, 6-6|7-9            
      Gui,font,
		Gui, Add, DropDownList	, xs+65 	ys w55 	h200 Choose2  vGuiStageList, 7-9|6-6|8-1|7-10|6-10|5-10|4-10|3-10|2-10|1-10|7-5|9-1|5-1|6-5|3-5|7-1|1-2|3-9|8-15         
	} 
	{
		Gui,font,CPurple
		Gui, Add, GroupBox,     x145 		y30 w125 h80 , ������/�� ����	
		Gui,font,
				
      Gui, Add, CheckBox,     xp+10    yp+18 section Checked Disabled, ������		
		Gui, Add, CheckBox,     xs 		y+9 wp hp Checked vGuiCheckContentsBattleField, ������
		Gui, Add, CheckBox,     xs 		y+9 wp hp Checked vGuiCheckContentsGoldRoom, Ȳ�ݹ�

		Gui, Add, DropDownList, x+5      ys-3 w42 h100  Choose1 vGuiListTeamAdvanture, 1��|2��|3��
		Gui, Add, DropDownList, xp       y+0 wp h100  Choose1 vGuiListTeamBattle, 1��|2��|3��
		Gui, Add, DropDownList, xp       y+0 wp h100  Choose1 vGuiListTeamGoldRoom, 1��|2��|3��	
	}
	{
		Gui,font,CPurple
		Gui, Add, GroupBox, x273 y30  w230 h145 , ���ӱ��
		gui,font,
		
      Gui, Add, Text, xp+10   yp+18 section w65   h15 , ������Ƚ��:
		Gui, Add, Text, xp      y+2   wp    hp   , ����Ŭ����:
		Gui, Add, Text, xp      y+2   wp    hp  , ����   ����:
		Gui, Add, Text, xp      y+10  wp    hp  , ����   �Ϸ�:
		Gui, Add, Text, xp      y+2   wp    hp  , ����   ����:
      Gui, Add, Text, xp      y+10  wp    hp  , ���̵�Ƚ��:
		
		Gui, Add, Text, x+2     ys    w28   h15  right vCountTotalCount ,  0
		Gui, Add, Text, xp      y+2   wp    hp   right vCountClearCount ,  0		
		Gui, Add, Text, xp      y+2   wp    hp   right vCountFailCount ,  0		
		Gui, Add, Text, xp      y+10  wp    hp   right vCountMonsterChange,  0
		Gui, Add, Text, xp      y+2   wp    hp   right vGuiReceivePointCount,  0      
      Gui, Add, Text, xp      y+10  wp    hp   right vGuiCountRaidConsume,  0

		Gui, Add, Text, x+10    ys w65      h15 , Ȳ�ݹ�Ƚ��:
		Gui, Add, Text, xp      y+2  wp    hp  , ������¸�:
		Gui, Add, Text, xp      y+2   wp    hp  , �������й�:
		Gui, Add, Text, xp      y+10  wp    hp  , ��üũ����:
		Gui, Add, Text, xp      y+2   wp    hp  , ����   ����:
      Gui, Add, Text, xp      y+10  wp    hp  , ���̵庸��:
		
		Gui, Add, Text, x+2     ys    w28   h15   right vCountGoldRoom ,  0
		Gui, Add, Text, xp      y+2  wp    hp    right vCountWinCount ,  0
		Gui, Add, Text, xp      y+2   wp    hp    right vCountLoseCount ,  0
		Gui, Add, Text, xp      y+10  wp    hp    right vNoLevelUp ,  0
		Gui, Add, Text, xp      y+2   wp    hp    right vGuiUsingPointCount,  0
      Gui, Add, Text, xp      y+10  wp    hp    right vGuiCountRaidPrize,  0
	}
		{
			Gui,font,CPurple
			Gui, Add, GroupBox, x2 y110 w140 h65  , ������ �ݺ�
			gui,font,
			
			Gui, Add, Text, xp+10 yp+16 section  w58 h15 , Ȳ���ǹ� :
			Gui, Add, Text, xp y+0 wp hp , �� ��  �� :
			Gui, Add, Text, xp y+0 wp hp , �̾�Ȯ�� :
		  
			Gui, Add, Edit, x+0 ys-2 w20 h15 right vCountForGoldRoom, 12
			Gui, Add, Edit, xp y+0 wp hp right vCountForBattle, 12
		   Gui, Add, Edit, xp y+0 wp hp right   vCountForLevelupCheck, 3
		   Gui, Add, Text, x+1 ys w40 h15 left, ȸ ����
			Gui, Add, Text, xp y+0 wp hp left, ȸ ����
			Gui, Add, Text, xp y+0 wp hp left, ȸ ����
		}


		{
			Gui,font,CPurple
			Gui, Add, GroupBox, x145 y110 w125 h65  , �߰� ���
			gui,font,
			Gui, Add, CheckBox,  xp+10 yp+13 wp-15 h15 vGuiSelectRaidMod, ���̵� ���
			Gui, Add, CheckBox,  xp  yp+16 wp hp Checked vGuiWantByKeyPoint, �� ����
			Gui, Add, CheckBox,  xp yp+16 wp hp Disabled vGuiWantByKeyRuby, ��� ����(��)
		}
      {
			gui,font,CPurple
			Gui, Add, GroupBox, x273 y175  w230 h40 , ��ũ���� ����
			gui,font,
         
         Gui, Add, CheckBox, xp+10 yp+18 section checked vGuiBoolScreenShotResult, ����         
         Gui, Add, CheckBox, x+20  yp checked vGuiBoolScreenShotRaid, ���̵�
         Gui, Add, CheckBox, x+20  yp checked disabled vGuiBoolScreenShotError, ����
			;~ Gui, Add, Edit, x10 yp+16 w20 h15 right vGui1LevelHappySave, 3
		   ;~ Gui, Add, Text, x+0 yp+2 w40 h15 left, �� ����
		   ;~ Gui, Add, CheckBox, x+5 yp+2 w70 h15  vGui30LevelHappySell, �����Ǹ�
		}
		{
			gui,font,CPurple
			Gui, Add, GroupBox, x273 y215  w230 h80 , ����
			gui,font,
			
         Gui, Add, Text		, xp+10  yp+20  section h15,     �巡��         
			Gui, Add, Edit    , x+5 yp-2 w20 h15 right vGuiDragCount, 3
         Gui, Add, CheckBox, xs y+5 h15   Checked vGuiCheckFirstElement, ���Ҹ���
         Gui, Add, CheckBox, xs y+5 h15 vGuiBoolStopMonsterLevelUp, �̷����� ����
         
			gosub	INIT_TEAM_POSITION
			Gui, Add, CheckBox, x%��ȣ1X% y%��ȣ1Y% w30 h15           vGuiCheckChangeTeam1, 1
			Gui, Add, CheckBox, x%��ȣ2X% y%��ȣ2Y% wp  hp  Checked   vGuiCheckChangeTeam2, 2
			Gui, Add, CheckBox, x%��ȣ3X% y%��ȣ3Y% wp  hp  Checked   vGuiCheckChangeTeam3, 3
			Gui, Add, CheckBox, x%��ȣ4X% y%��ȣ4Y% wp  hp  Checked   vGuiCheckChangeTeam4, 4
			Gui, Add, CheckBox, x%��ȣ5X% y%��ȣ5Y% wp  hp            vGuiCheckChangeTeam5, 5
			
			Gui, Add, DropDownList, xp-70 yp-3 w60 h90  Choose1 gGuiListTeamPosition vGuiListTeamPosition, ��ȣ|����|�⺻|�뷱��
		}
		{
			gui,font,CPurple
			Gui, Add, GroupBox, x2 y175 w268 h40  ,  ���� ���� �� ���� ����
			gui,font,         
         
			Gui, Add, CheckBox, xp+6  yp+18 section vGuiBoolFirstGoldRoom, Ȳ�ݹ�
			Gui, Add, CheckBox, x+10  yp  vGuiBoolFirstBattleField, ������
			Gui, Add, CheckBox, x+10  yp  +Disabled vGuiBooFirstlCastleBattle, ������
			Gui, Add, DropDownList, x+0 yp-3 w40 h100 Choose2 vGuilListCatleBattleTeam, 1��|2��|3��
		}
		{
			gui,font,CPurple
			Gui, Add, GroupBox, x2 y215 w140 h40  ,����Ǹ�(��)
			gui,font,
			
			Gui, Add, CheckBox, x13 yp+15 w70 h15  Disabled vGuiCheckSellEquip, ��� �Ǹ�
			Gui, Add, DropDownList, x+10 yp-3 w40 h70 Disabled Choose1 vGuiSellEquipLimit, 1��|2��|3��|4��
		}
      
      {
			gui,font,CPurple
			Gui, Add, GroupBox, x2 y250 w140 h45  ,����(��)
			gui,font,
         Gui, Add, DropDownList, xp+6  yp+15 section w90 h100 vGuiConfigFiles       
         Gui, Add, Button, x+10 ys h20  , L
		}
		{
			gui,font,CPurple
			Gui, Add, GroupBox, x145 y215 w125 h80  , ������ ����
			gui,font,  
			Gui, Add, Text,xp+10 yp+18 w60 h15 , �⺻���� :
			Gui, Add, Text, xp y+7 wp hp , Ŭ������ :
			Gui, Add, Text, xp y+7 wp hp , ���Ϸε� :
		  
		  ;~ Gui, Add, Text,xp+10 yp+18 w60 h15 , �⺻���� :
			Gui, Add, Edit, x+5 yp-47 w25 h15 right vGuiDelayForBattle, 15
			Gui, Add, Edit, xp y+7 wp hp right vGuiDelayForClickAfter, 1.5
		  Gui, Add, Edit, xp y+7 wp hp right vDelayForFileLoading, 3
		  Gui, Add, Text,  x+1 yp-43 w15 h15 left, ��
			Gui, Add, Text, xp y+7 wp hp left, ��
			Gui, Add, Text,  xp y+7 wp hp left, ��
		}
      
      funcLoadConfigFileList()
      
	return
}
funcLoadConfigFileList( ){		
   Loop, %A_ScriptDir%\Config\*.ini
   {		
     StringReplace, configName, A_LoopFileName, .ini, , All
     configFileList=%configFileList%|%configName%
   }
   GuiControl,,GuiConfigFiles,%configFileList%
   GuiControl,chooseString,GuiConfigFiles, config
   return
}
funcChangeTab1Status(){	
	global BoolStarted
	
	GuiControl, hide%BoolStarted%, Button_Start
	GuiControl, show%BoolStarted%, Button_Stop
	
	GuiControl, show%BoolStarted%,PIC_PAUSE		
	
	GuiControl, disable%BoolStarted%, Button_Apply  
	GuiControl,  disable%BoolStarted%, GuiCheckGoNextStage   
   GuiControl,  disable%BoolStarted%, GuiLoopMap
   
	GuiControl,  disable%BoolStarted%, GuiCheckContentsBattleField
	GuiControl,  disable%BoolStarted%, GuiCheckContentsGoldRoom
	GuiControl,  disable%BoolStarted%, GuiCheckCallFriend
	GuiControl,  disable%BoolStarted%, GuiListTeamAdvanture
	GuiControl,  disable%BoolStarted%, GuiListTeamBattle
	GuiControl,  disable%BoolStarted%, GuiListTeamGoldRoom
	
	GuiControl,  disable%BoolStarted%, CountForGoldRoom
	GuiControl,  disable%BoolStarted%, CountForBattle
	GuiControl,  disable%BoolStarted%, CountForLevelupCheck
	
   
   GuiControl,  disable%BoolStarted%, GuiBoolScreenShotResult
	GuiControl,  disable%BoolStarted%, GuiBoolScreenShotRaid          
	
	GuiControl,  disable%BoolStarted%, GuiDelayForBattle
   GuiControl,  disable%BoolStarted%, GuiDelayForClickAfter
   GuiControl,  disable%BoolStarted%, DelayForFileLoading
   
   GuiControl, disable%BoolStarted%, GuiStageDifficulty   
   GuiControl,  disable%BoolStarted%, GuiStageList
   GuiControl,  disable%BoolStarted%, LoopMapList     
   if( BoolStarted ){
      goSub DisableLevelupCheckList   
   }else {
      goSub EnableLevelupCheckList
   }   
	GuiControl,  disable%BoolStarted%, GuiWantByKeyPoint
   
 
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
		PositionY_Top = 227
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
   
	fSaveFile( GuiStageDifficulty, "�ʼ���", "���̵�" )

	fSaveFile( GuiStageList, "�ʼ���", "��������" )
	fSaveFile( GuiCheckGoNextStage, "�ʼ���", "����" )
   
   fSaveFile( GuiLoopMap, "�ʼ���", "�ݺ�" )
   fSaveFile( LoopMapList, "�ʼ���", "�ݺ�����" )      
   
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
	
	fSaveFile(GuiWantByKeyPoint, "�߰����", "���������" )
	fSaveFile(GuiWantByKeyRuby, "�߰����", "��������" )
   fSaveFile(GuiSelectRaidMod, "�߰����", "���̵���" )
    
   fSaveFile(GuiBoolScreenShotResult,  "��ũ����", "���躸��" )
   fSaveFile(GuiBoolScreenShotRaid,    "��ũ����", "���̵���" )
   fSaveFile(GuiBoolScreenShotError,   "��ũ����", "����ȭ��" )
   
   fSaveFile(GuiSkillFileName,   "��ų����", "�����̸�" )
   
   fSaveFile(GuiListTeamPosition, "����", "��������" )
   fSaveFile(GuiDragCount, "����", "�巡��Ƚ��" )
   fSaveFile(GuiCheckFirstElement, "����", "���Ҹ���" )
   
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
	fLoadConfig( GuiListTeamAdvanture, true, "������", "������" )
   
   fLoadConfig( GuiListTeamBattle, true, "������", "������" )
   
   fLoadConfig( GuiListTeamGoldRoom, true, "������", "Ȳ����" )
   
   fLoadConfig( GuiCheckContentsBattleField, false, "������", "������" )
   fLoadConfig( GuiCheckContentsGoldRoom, false, "������", "Ȳ�ݹ�" )
   fLoadConfig( GuiCheckCallFriend, false, "������", "ģ����ȯ" )
   
   fLoadConfig( GuiStageDifficulty, true, "�ʼ���", "���̵�" )
   fLoadConfig( GuiStageList, true, "�ʼ���", "��������" )
   
   fLoadConfig( GuiCheckGoNextStage, false, "�ʼ���", "����" )
   
   fLoadConfig( GuiLoopMap, false, "�ʼ���", "�ݺ�" )
   ;selectMapEnable( vValue )
   fLoadConfig( LoopMapList, false, "�ʼ���", "�ݺ�����" )
   
   fLoadConfig( CountForGoldRoom, false, "�������ݺ�", "Ȳ�ݹ浹��" )
   fLoadConfig( CountForBattle, false, "�������ݺ�", "�����嵹��" )
   fLoadConfig( CountForLevelupCheck, false, "�������ݺ�", "����Ȯ��" )
   
   fLoadConfig( GuiDelayForBattle, false, "������", "�⺻����������" )
   fLoadConfig( GuiDelayForClickAfter, false, "������", "Ŭ��������" )
   fLoadConfig( DelayForFileLoading, false, "������", "�ε�������" )
   
   fLoadConfig( GuiCheckSellEquip, false, "������", "����Ǹ�" )
   fLoadConfig( GuiSellEquipLimit, true, "������", "�Ǹŵ��" )
   
      	
   fLoadConfig( GuiWantByKeyPoint, false, "�߰����", "���������" )
   fLoadConfig( GuiWantByKeyRuby, false, "�߰����", "��������" )
   fLoadConfig( GuiSelectRaidMod, false, "�߰����", "���̵���" )
   fLoadConfig( GuiBoolStopMonsterLevelUp, false, "�߰����", "�̾�����" )
   
      
   fLoadConfig( GuiBoolFirstGoldRoom, false, "��������", "Ȳ�ݸ���" )
   fLoadConfig( GuiBoolFirstBattleField, false, "��������", "��������" )
   fLoadConfig( GuiBooFirstlCastleBattle, false, "��������", "��������" )
   fLoadConfig( GuilListCatleBattleTeam, true, "��������", "������" )


   fLoadConfig( GuiBoolScreenShotResult, false, "��ũ����", "���躸��" )
   fLoadConfig( GuiBoolScreenShotRaid, false, "��ũ����", "���̵���" )
   fLoadConfig( GuiBoolScreenShotError, false, "��ũ����", "����ȭ��" )
   
      
   
   
   
   
	;~ �� ������ �κ� �߰�   
   fLoadConfig( GuiSendFrindShipCount, false, "��������", "����Ƚ��" )      
   fLoadConfig( GuiCheckSendFriendsShipAll, false, "��������", "���κ�����" )      
   fLoadConfig( GuiCheckSendFriendsShipOnlyGame, false, "��������", "���ܺ�����" )      
   fLoadConfig( GuiSendingAfterAdventure, false, "��������", "�����ĸ���" )      
   
   fLoadConfig( GuiPushBulletToken, false, "PushBullet", "Token" )         
   
   fLoadConfig( GuiListTeamPosition, true, "����", "��������" )     
   gosub GuiListTeamPosition	
   fLoadConfig( GuiDragCount, false, "����", "�巡��Ƚ��" )      
   fLoadConfig( GuiCheckFirstElement, false, "����", "���Ҹ���" )      
   loop, 5
   {
      Target =������ü%A_index%
      fLoadConfig( GuiCheckChangeTeam%A_index%, false, "����", Target )      
   }
	return
}
fSaveFile(  vValue, vTitle, vKey  ){
   guiControlGet, tempFileName,,GuiConfigFiles
   targetFileName = %A_ScriptDir%\Config\%tempFileName%.ini
	IniWrite, %vValue%,  %targetFileName%, %vTitle%, %vKey%
	return
}
fLoadConfig(  ByRef targetGuiValue, isListGui , vTitle, vKey  ){

   guiControlGet, tempFileName,,GuiConfigFiles
   targetFileName = %A_ScriptDir%\Config\%tempFileName%.ini
   IniRead, value, %targetFileName% ,%vTitle%, %vKey%
	IfEqual value, ERROR
	{
		value:=""
	}
   
   if( value <> "" ){
      if( isListGui = false ){
         GuiControl, ,targetGuiValue,%value%   
      }else{
         GuiControl, choose ,targetGuiValue,%value%   
      }
      
   }
	return
}
