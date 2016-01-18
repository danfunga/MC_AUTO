INIT_GUI_CONFIG:

   CONFIG_TITLE:="Configuration"
    
   CONFIG_GUI_WIDTH:=510
   CONFIG_GUI_HEIGHT:=310

     
   CONFIG_BUTTON_POS_Y:=CONFIG_GUI_HEIGHT+10
   
   Gui, 2: Add, Button, x%xGuiStart% y%CONFIG_BUTTON_POS_Y% w80 h30   vButton_Apply, ��������
   Gui, 2: Add, DropDownList, x+10  yp+5 section w80 h100 vGuiConfigFiles       
   Gui, 2: Add, Button, x+0 ys h20  , �ҷ�����
   ;Gui, 2: +LastFound +AlwaysOnTop +ToolWindow


   Gui, 2: Add, Tab, x0 y0 w%CONFIG_GUI_WIDTH% h%CONFIG_GUI_HEIGHT% vGuiAutoTab , DEFAULT|���轺ų
   Gui, 2:Tab, DEFAULT
	      
   {	
      xGuiStart:=5
      xGroupWidth:=CONFIG_GUI_WIDTH-5
      yGuiStart:=30
      width_Difficult:=140
      height_Difficult:=80
      
		Gui,2:font,CPurple
		Gui,2: Add, GroupBox	    , x%xGuiStart% y%yGuiStart% w%width_Difficult% h%height_Difficult% , ���̵�/��
		Gui,2:font,
      
      Gui,2: Add, DropDownList  , x12    y45 section w60 h100  Choose3 vGuiStageDifficulty, ����|����|�����
      
      Gui,2: Add, CheckBox	   , xs 	   y+5    Checked vGuiCheckCallFriend, ģ����ȯ
      Gui,2: Add, CheckBox      , x+5    yp      vGuiCheckGoNextStage, ����      
      Gui,2: Add, CheckBox      , xs 	   y+5    Checked vGuiLoopMap ,�ݺ�		         
      
      Gui,2:font,s7
      Gui,2: Add, Edit          , x+0    yp-1   w75 h15 right vLoopMapList, 6-6|7-9            
      Gui,2:font,
      
		Gui,2: Add, DropDownList	, xs+65 	ys w55 	h200 Choose2  vGuiStageList, 7-9|6-6|8-1|8-15|7-1|1-10|2-10|3-10|4-10|5-10|6-10|7-10|3-5|3-6|4-5|4-6|5-5|5-6|
	} 
	{
      
		Gui,2:font,CPurple
		Gui,2: Add, GroupBox,     x145 		y30 w180 h110 , ������/�� ����	
		Gui,2:font,
				
      Gui,2: Add, CheckBox,     xp+10    yp+18 section Checked Disabled, ������		
      Gui,2: Add, DropDownList, x+5      yp-3 w42 h100  Choose1 vGuiListTeamAdvanture,  1��|2��|3��
      Gui,2: Add, DropDownList, x+5      yp   w42 h100  Choose1 vGuiListSkillAdvanture, 1��|2��|3��
      
      Gui,2: Add, CheckBox,     xs 		   y+5   Checked vGuiCheckContentsGoldRoom, Ȳ�ݹ�
      Gui,2: Add, DropDownList, x+5      yp-3 w42 h100  Choose1 vGuiListTeamGoldRoom,  1��|2��|3��
      Gui,2: Add, DropDownList, x+5      yp   w42 h100  Choose1 vGuiListSkillGoldRoom, 1��|2��|3��      
      
      
		Gui,2: Add, CheckBox,     xs 		  y+5 Checked vGuiCheckContentsBattleField, ������
      Gui,2: Add, DropDownList, x+5      yp-3 w42 h100  Choose1 disabled vGuiListTeamBattle,  1��|2��|3��
      Gui,2: Add, DropDownList, x+5      yp   w42 h100  Choose1 vGuiListSkillBattle, 1��|2��|3��
      
		
      
      Gui,2: Add, CheckBox,     xs 		   y+5   Checked Disabled vGuiCheckContentsCastle, ������
      Gui,2: Add, DropDownList, x+5      yp-3 w42 h100  Choose1 disabled vGuiListTeamCastle,  1��|2��|3��
      Gui,2: Add, DropDownList, x+5      yp   w42 h100  Choose1 vGuiListSkillCastle, 1��|2��|3��
		
   }
 
   {
      Gui,2:font,CPurple
      Gui,2: Add, GroupBox, x%xGuiStart% y110 w140 h65  , ������ �ݺ�
      gui,2:font,
      
      Gui,2: Add, Text, xp+10 yp+16 section  w58 h15 , Ȳ���ǹ� :
      Gui,2: Add, Text, xp y+0 wp hp , �� ��  �� :
      Gui,2: Add, Text, xp y+0 wp hp , �̾�Ȯ�� :
     
      Gui,2: Add, Edit, x+0 ys-2 w20 h15 right vCountForGoldRoom, 12
      Gui,2: Add, Edit, xp y+0 wp hp right vCountForBattle, 12
      Gui,2: Add, Edit, xp y+0 wp hp right   vCountForLevelupCheck, 3
      Gui,2: Add, Text, x+1 ys w40 h15 left, ȸ ����
      Gui,2: Add, Text, xp y+0 wp hp left, ȸ ����
      Gui,2: Add, Text, xp y+0 wp hp left, ȸ ����
   }
   {
      Gui,2:font,CPurple
      Gui,2: Add, GroupBox, x%xGuiStart% y215 w140 h65  , �߰� ���
      gui,2:font,
      
      Gui,2: Add, CheckBox,  xp+10 yp+13 wp-15 h15 vGuiSelectRaidMod, ���̵� ���
      Gui,2: Add, CheckBox,  xp  yp+16 wp hp Checked vGuiWantByKeyPoint, �� ����
      Gui,2: Add, CheckBox,  xp yp+16 wp hp Disabled vGuiWantByKeyRuby, ��� ����(��)
   }
   {
      gui,2:font,CPurple
      Gui,2: Add, GroupBox, x273 y175  w230 h40 , ��ũ���� ����
      gui,2:font,
      
      Gui,2: Add, CheckBox, xp+10 yp+18 section checked vGuiBoolScreenShotResult, ����         
      Gui,2: Add, CheckBox, x+20  yp checked vGuiBoolScreenShotRaid, ���̵�
      Gui,2: Add, CheckBox, x+20  yp checked vGuiBoolScreenShotError, ����
      ;~ Gui, Add, Edit, x10 yp+16 w20 h15 right vGui1LevelHappySave, 3
      ;~ Gui, Add, Text, x+0 yp+2 w40 h15 left, �� ����
      ;~ Gui, Add, CheckBox, x+5 yp+2 w70 h15  vGui30LevelHappySell, �����Ǹ�
   }
   {
      gui,2:font,CPurple
      Gui,2: Add, GroupBox, x273 y215  w230 h80 , ����
      gui,2:font,
      
      Gui,2: Add, Text		, xp+10  yp+20  section h15,     �巡��         
      Gui,2: Add, Edit    , x+5 yp-2 w20 h15 right vGuiDragCount, 3
      Gui,2: Add, CheckBox, xs y+5 h15   Checked vGuiCheckFirstElement, ���Ҹ���
      Gui,2: Add, CheckBox, xs y+5 h15 vGuiBoolStopMonsterLevelUp, �̷����� ����
      
      gosub	INIT_TEAM_POSITION
      Gui,2: Add, CheckBox, x%��ȣ1X% y%��ȣ1Y% w30 h15           vGuiCheckChangeTeam1, 1
      Gui,2: Add, CheckBox, x%��ȣ2X% y%��ȣ2Y% wp  hp  Checked   vGuiCheckChangeTeam2, 2
      Gui,2: Add, CheckBox, x%��ȣ3X% y%��ȣ3Y% wp  hp  Checked   vGuiCheckChangeTeam3, 3
      Gui,2: Add, CheckBox, x%��ȣ4X% y%��ȣ4Y% wp  hp  Checked   vGuiCheckChangeTeam4, 4
      Gui,2: Add, CheckBox, x%��ȣ5X% y%��ȣ5Y% wp  hp            vGuiCheckChangeTeam5, 5
      
      Gui,2: Add, DropDownList, xp-70 yp-3 w60 h90  Choose1 gGuiListTeamPosition vGuiListTeamPosition, ��ȣ|����|�⺻|�뷱��
   }
  
   {
      gui,2:font,CPurple
      Gui,2: Add, GroupBox, x%xGuiStart% y175 w140 h40  ,����Ǹ�(��)
      gui,2:font,
      
      Gui,2: Add, CheckBox, x13 yp+15 w70 h15  Disabled vGuiCheckSellEquip, ��� �Ǹ�
      Gui,2: Add, DropDownList, x+10 yp-3 w40 h70 Disabled Choose1 vGuiSellEquipLimit, 1��|2��|3��|4��
   }
   {
      Gui,2:font,CPurple
      Gui,2: Add, GroupBox, x145 y175 w125 h80  , ������ ����
      Gui,2:font,  
      Gui,2: Add, Text,xp+10 yp+18 w60 h15 , �⺻���� :
      Gui,2: Add, Text, xp y+7 wp hp , Ŭ������ :
      Gui,2: Add, Text, xp y+7 wp hp , ���Ϸε� :
     
     ;~ Gui, Add, Text,xp+10 yp+18 w60 h15 , �⺻���� :
      Gui,2: Add, Edit, x+5 yp-47 w25 h15 right vGuiDelayForBattle, 15
      Gui,2: Add, Edit, xp y+7 wp hp right vGuiDelayForClickAfter, 1.5
      Gui,2: Add, Edit, xp y+7 wp hp right vDelayForFileLoading, 3
      Gui,2: Add, Text,  x+1 yp-43 w15 h15 left, ��
      Gui,2: Add, Text, xp y+7 wp hp left, ��
      Gui,2: Add, Text,  xp y+7 wp hp left, ��
   }
   
   Gui, 2: Tab, ����
	gosub INIT_TAB_ADVANTURE
   ;Gui, 2: Tab, ������
	;gosub INIT_TAB_CASTLEBATTLE
	;Gui, 2: Tab , ��Ÿ���
	;gosub INIT_TAB4
    
   ;gosub Config
return

Config:	
   WinGetPos, posx, posy, width, height, %GUI_TITLE%
   
   xPos:= mainConfig.loadValue("GUI_POSITION", "CONFIG_X")
   yPos:= mainConfig.loadValue("GUI_POSITION", "CONFIG_Y")
   (xPos = "") ? (xPos:=posx+100):(xPos)
   (yPos = "") ? (yPos:=posy+100):(yPos)
   
   if( BoolShowConfig = true ){
      BoolShowConfig:=false   
      Gui, 2: hide
   }else{
      BoolShowConfig:=true
      Gui, 2: Show, x%xPos% y%yPos%   , %CONFIG_TITLE%      
   }
   ;Gui, 2: Show%BoolShowConfig%, x%xPos% y%yPos%   , %CONFIG_TITLE%

return 

LOAD_CONFIG_CONFIG:
{
   funcLoadConfigFileList()
   funcGuiLoadCharactors()
           
   gosub LoadConfig	
   
   
	
   gosub LoadSkillConfig
	gosub LoadAutoSkillConfig

   return 
}
   
   

2GuiClose:
   if( BoolShowConfig = true ){
      BoolShowConfig:=false   
   }else{
      BoolShowConfig:=true
   }
   WinGetPos, posx, posy, width, height, %CONFIG_TITLE%
   
   mainConfig.saveValue("GUI_POSITION", "CONFIG_X", posx)
   mainConfig.saveValue("GUI_POSITION", "CONFIG_Y", posy)
   
   Gui, 2: Hide
   
   
return
funcGuiLoadCharactors(){
	Loop, %A_ScriptDir%\Resource\Image\10.��ų�̹���\*,1,0
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


funcLoadConfigFileList( ){		
   global mainConfig
   
   Loop, %A_ScriptDir%\Config\Users\*.ini
   {		
     StringReplace, configName, A_LoopFileName, .ini, , All
     configFileList=%configFileList%|%configName%
   }
   
   GuiControl  , ,GuiConfigFiles,%configFileList%
   target:=mainConfig.loadValue("��������", "�����̸�" )
   GuiControl , chooseString,GuiConfigFiles, % target

   return
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
   
   fLoadConfig( GuiSkillFileName, false, "��ų����", "�����̸�" )
   guiControlGet, tempString,,GuiSkillFileName
   funcGuiLoadConfigList( tempString )
   
	return

}
fSaveFile(  vValue, vTitle, vKey  ){
   guiControlGet, tempFileName,,GuiConfigFiles
   targetFileName = %A_ScriptDir%\Config\Users\%tempFileName%.ini
	IniWrite, %vValue%,  %targetFileName%, %vTitle%, %vKey%
	return
}
fLoadConfig(  ByRef targetGuiValue, isListGui , vTitle, vKey  ){

   guiControlGet, tempFileName,,GuiConfigFiles
   targetFileName = %A_ScriptDir%\Config\Users\%tempFileName%.ini
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

