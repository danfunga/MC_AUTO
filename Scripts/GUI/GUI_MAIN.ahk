INIT_GUI_MAINPAGE:
{
   MAIN:= { start_x:5, total_width:350 }
   xGuiStart:=MAIN.start_x
   xGroupWidth:=MAIN.total_width-5
   button_pos:=xGroupWidth-35
  
   {
      yPos=10
      width_RunFirst:=80
      height_stasts:=165
      height_RunFirst:=90
      
      gui, font,CPurple
      Gui, Add, GroupBox, x%xGuiStart% y%yPos% w%width_RunFirst% h%height_RunFirst%  , ���� ����
      gui, font,         
           
      Gui, Add, CheckBox, xp+10  yp+20 section  vGuiBoolFirstGoldRoom, Ȳ�ݹ�
      Gui, Add, CheckBox, xp     y+10           vGuiBoolFirstBattleField, ������
      Gui, Add, CheckBox, xp     y+10           disabled vGuiBooFirstlCastleBattle, ������

   }
   {
      y_Raid:=yPos+height_RunFirst
      height_RunRaid:=height_stasts-height_RunFirst
      gui, font,CPurple
      Gui, Add, GroupBox, x%xGuiStart% y%y_Raid% w%width_RunFirst% h%height_RunRaid%  , ���̵常
      gui, font,         
           
      Gui, Add, CheckBox, xp+10  yp+20 section  disabled vGuiRunOnlyRaid, �ݺ�
            
   }
	{
      yPos=10
      width_stats:=xGroupWidth-width_RunFirst
      x_stats:=xGuiStart+width_RunFirst
		Gui,font,CPurple      
		Gui, Add, GroupBox, x%x_stats% y%yPos%  w%width_stats% h%height_stasts% section , ���ӱ��
		gui,font,
		
      Gui, Add, Button, x%button_pos% yp-5  g��ϸ����ϱ� , ����
      
      Gui, Add, Text, xs+10   ys+18 w65   h15 , ������Ƚ��:
		Gui, Add, Text, xp      y+2   wp    hp  , ����Ŭ����:
		Gui, Add, Text, xp      y+2   wp    hp  , ����   ����:
		Gui, Add, Text, xp      y+10  wp    hp  , ����   �Ϸ�:
		Gui, Add, Text, xp      y+2   wp    hp  , ����   ����:
      Gui, Add, Text, xp      y+10  wp    hp  , ���̵�Ƚ��:
      Gui, Add, Text, xp      y+10  wp    hp  , ��Ʈ����:
		
		Gui, Add, Text, x+2     ys+18    w28   h15  right vCountTotalCount ,  0
		Gui, Add, Text, xp      y+2   wp    hp   right vCountClearCount ,  0		
		Gui, Add, Text, xp      y+2   wp    hp   right vCountFailCount ,  0		
		Gui, Add, Text, xp      y+10  wp    hp   right vCountMonsterChange,  0
		Gui, Add, Text, xp      y+2   wp    hp   right vGuiReceivePointCount,  0      
      Gui, Add, Text, xp      y+10  wp    hp   right vGuiCountRaidConsume,  0
      Gui, Add, Text, xp      y+10  wp    hp   right VGuiCountSendTry,  0

		Gui, Add, Text, x+10    ys+18 w65      h15 , Ȳ�ݹ�Ƚ��:
		Gui, Add, Text, xp      y+2  wp    hp  , ������¸�:
		Gui, Add, Text, xp      y+2   wp    hp  , �������й�:
		Gui, Add, Text, xp      y+10  wp    hp  , ��üũ����:
		Gui, Add, Text, xp      y+2   wp    hp  , ����   ����:
      Gui, Add, Text, xp      y+10  wp    hp  , ���̵庸��:
      Gui, Add, Text, xp      y+10  wp    hp  , ����   �Ϸ�:
		
		Gui, Add, Text, x+2     ys+18    w28   h15   right vCountGoldRoom ,  0
		Gui, Add, Text, xp      y+2  wp    hp    right vCountWinCount ,  0
		Gui, Add, Text, xp      y+2   wp    hp    right vCountLoseCount ,  0
		Gui, Add, Text, xp      y+10  wp    hp    right vNoLevelUp ,  0
		Gui, Add, Text, xp      y+2   wp    hp    right vGuiUsingPointCount,  0
      Gui, Add, Text, xp      y+10  wp    hp    right vGuiCountRaidPrize,  0
      Gui, Add, Text, xp      y+10  wp    hp   right VGuiCountSendComplete,  0
	}
	
   {
      yPos:=yPos+height_stasts+5          
      heidht_runs:=55
		Gui,font,CPurple      
		Gui, Add, GroupBox, x%xGuiStart% y%yPos%  w%xGroupWidth% h%heidht_runs% section , ����â
		gui,font,
      
		Gui, Font, S8 CDefault Bold, Verdana
      vIcon_resume=%A_ScriptDir%\Resource\Image\resume.png
		vIcon_pause  =%A_ScriptDir%\Resource\Image\pause.png
      
		Gui, Add, Button, xp+5 	yp+15 section w80 h30  vButton_Start   , ����[F9]
      Gui, Add, Button, xs ys w80 h30  +Hidden vButton_Stop   , ����[F10]
      
      Gui, Add, Picture, x+5 yp+4 w24 h24  gICON_RESUME  +Hidden vPIC_RESUME, %vIcon_resume%
		Gui, Add, Picture, xp yp w24 h24  gICON_PAUSE  +Hidden   vPIC_PAUSE, %vIcon_pause%
		
		Gui, Add, Button, x+5 ys w80 h30  , �ٽ�[F12]
      Gui, Add, Button, x+5 ys h30 w80 gConfig vButton_Config, ����
      Gui, Add, Button, x+5 ys h30  ,  �ӽ�
      gui,font,  
	} 
	
   {
      yPos:=yPos+heidht_runs+5          
      height_logs:=120
		gui,font,CPurple
		Gui, Add, GroupBox, x%xGuiStart% y%yPos%  w%xGroupWidth% h%height_logs% , ���ӷα�
		gui,font,

		Gui, Add, Text, xp+10 	yp+20 section w70  vBottomTitle, ��Ī		
      Gui, Add, Text, x+15 	yp w200  vSubTitle, ���� �Ϸ� �Ǽ���
      Gui, Font, S8 CDefault Bold, Verdana

		Gui, Font, ,
      logWidth:=xGroupWidth-30
		Gui, Add, Text, xs 	   y+10 w%logWidth%  v����â, Macro Version 0.95
		Gui, Add, Text, +wrap xs-2	y+10 wp R2 v���â  ,  '���â'	
	}
   {
      yPos:=yPos+height_logs+5          
      height_Etc:=110
		gui,font,CPurple
		Gui, Add, GroupBox, x%xGuiStart% y%yPos%  w%xGroupWidth% h%height_Etc% section , ETC
		gui,font,
      width_id:=xGroupWidth-50

      Gui, Add, Button, x%button_pos% yp+10 gSAVE_MAIN_CONFIG_BUTTON, ����
      
      Gui, Add, Checkbox, xs+10 	ys+18  h15 section vGuiSendPushBullet disabled , Pushbullet :
      Gui, Add, CheckBox, x+5  yp  vGuiBoolRaidStart, ���̵� ��� ����
      Gui, Add, CheckBox, x+0  yp  vGuiBoolNoKey, ���� ����
  
      
		Gui, Add, Text, xs y+8 h15 , ID :
		Gui, Add, Edit, x+5 yp-2  w%width_id% h15 right vGuiPushBulletToken,  


      Gui, Add, Checkbox, xs  y+20  h15 section vGuiSending, �� ������ : Ƚ�� -      
		Gui, Add, Edit, x+0 yp w30 h15 right vGuiSendFrindShipCount, 30
		Gui, Add, Text, x+0 yp+2  h15 , ��( x2�踸 �õ� )
		
		Gui, Add, Checkbox, xs y+3  h15 Checked vGuiSendingAfterAdventure, ������ ������  
		Gui, Add, Radio			, x+5			yp   		hp Checked 	vGuiCheckSendFriendsShipOnlyGame, ������
		Gui, Add, Radio			, x+10 			yp  		hp  	vGuiCheckSendFriendsShipAll, ����
      
      Gui, Add, Button, x%button_pos% yp-8 , ä��
   }
   {
      yPos:=yPos+height_Etc+5 
      height_Chat:=150
      height_without_chat:=yPos
      height_with_chat:=yPos+height_Chat
      

      URL = http://www.gagalive.kr/livechat1.swf?chatroom=MC_AUTO&position=1
      Gui Add, ActiveX, x%xGuiStart% y%yPos% h%height_Chat% w%xGroupWidth% vWB, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
      WB.Navigate(URL)     
   }
      
   
	return
}
LOAD_MAIN_CONFIG:
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
   IfNotExist, Config\Users
	{
		FileCreateDir, Config\Users
	}
   funcLoadConfig( mainConfig, GuiBoolFirstGoldRoom, false, "��������", "Ȳ�ݸ���" )
   funcLoadConfig( mainConfig, GuiBoolFirstBattleField, false, "��������", "��������" )
   funcLoadConfig( mainConfig, GuiBooFirstlCastleBattle, false, "��������", "��������" )
   
   funcLoadConfig( mainConfig, GuiRunOnlyRaid, false, "���̵常", "���" )
   
   funcLoadConfig( mainConfig, GuiSendPushBullet, false, "PushBullet", "���" )
   funcLoadConfig( mainConfig, GuiPushBulletToken, false, "PushBullet", "Token" )
   funcLoadConfig( mainConfig, GuiBoolRaidStart, false, "PushBullet", "���̵�" )
   funcLoadConfig( mainConfig, GuiBoolNoKey, false, "PushBullet", "����" )
   
   funcLoadConfig( mainConfig, GuiSending, false, "��������", "���" )
   funcLoadConfig( mainConfig, GuiSendFrindShipCount, false, "��������", "�ο�" )
   funcLoadConfig( mainConfig, GuiSendingAfterAdventure, false, "��������", "������" )
   funcLoadConfig( mainConfig, GuiCheckSendFriendsShipOnlyGame, false, "��������", "������" )
   funcLoadConfig( mainConfig, GuiCheckSendFriendsShipAll, false, "��������", "����" )
   
   return 
}
SAVE_MAIN_CONFIG_BUTTON:
SAVE_MAIN_CONFIG:
{   
   Gui, Submit, NoHide
   funcSaveConfig( mainConfig, GuiBoolFirstGoldRoom, false, "��������", "Ȳ�ݸ���" )
   funcSaveConfig( mainConfig, GuiBoolFirstBattleField, false, "��������", "��������" )
   funcSaveConfig( mainConfig, GuiBooFirstlCastleBattle, false, "��������", "��������" )
   
   funcSaveConfig( mainConfig, GuiRunOnlyRaid, false, "���̵常", "���" )
   
   funcSaveConfig( mainConfig, GuiSendPushBullet, false, "PushBullet", "���" )
   funcSaveConfig( mainConfig, GuiPushBulletToken, false, "PushBullet", "Token" )
   funcSaveConfig( mainConfig, GuiBoolRaidStart, false, "PushBullet", "���̵�" )
   funcSaveConfig( mainConfig, GuiBoolNoKey, false, "PushBullet", "����" )
   
   funcSaveConfig( mainConfig, GuiSending, false, "��������", "���" )
   funcSaveConfig( mainConfig, GuiSendFrindShipCount, false, "��������", "�ο�" )
   funcSaveConfig( mainConfig, GuiSendingAfterAdventure, false, "��������", "������" )
   funcSaveConfig( mainConfig, GuiCheckSendFriendsShipOnlyGame, false, "��������", "������" )
   funcSaveConfig( mainConfig, GuiCheckSendFriendsShipAll, false, "��������", "����" )
   
   MsgBox, ,,Main ������ �����Ͽ����ϴ�.,0.5
   return 
}
return 



ICON_PAUSE:
{
	if( BoolStarted = true ){
		if( BoolPaused = false ){
			BoolPaused:= true
			GuiControl, hide%BoolPaused%, PIC_PAUSE
			GuiControl, show%BoolPaused%, PIC_RESUME
			pause
		}
	}
	return
}

ICON_RESUME:
{	
	if( BoolStarted = true ){
		if( BoolPaused = true ){
			BoolPaused:=false
			GuiControl, hide%BoolPaused%, PIC_PAUSE
			GuiControl, show%BoolPaused%, PIC_RESUME
			pause
		}
	}
	return
}

funcChangeGuiStatus(){	
	global BoolStarted
   
   ; ����â �κ�
	
	GuiControl, hide%BoolStarted%, Button_Start
	GuiControl, show%BoolStarted%, Button_Stop
	
	GuiControl, show%BoolStarted%,PIC_PAUSE		
   GuiControl, disable%BoolStarted%, Button_Config  
;   if( BoolStarted )
      ;Gui, 2: Hide
   
   ; ���� ���� �κ� 
   GuiControl,  disable%BoolStarted%, GuiBoolFirstGoldRoom
	GuiControl,  disable%BoolStarted%, GuiBoolFirstBattleField
   ;GuiControl,  disable%BoolStarted%, GuiBooFirstlCastleBattle
  
   ; ���̵常 
   ;GuiControl,  disable%BoolStarted%, GuiRunOnlyRaid

      
   ; ETC �κ�
   ;GuiControl,  disable%BoolStarted%, GuiSendPushBullet   
   GuiControl,  disable%BoolStarted%, GuiBoolRaidStart   
   GuiControl,  disable%BoolStarted%, GuiBoolNoKey
   GuiControl,  disable%BoolStarted%, vGuiPushBulletToken
   
   
   GuiControl,  disable%BoolStarted%, GuiSending
   GuiControl,  disable%BoolStarted%, GuiSendFrindShipCount
   GuiControl,  disable%BoolStarted%, GuiSendingAfterAdventure
   GuiControl,  disable%BoolStarted%, GuiCheckSendFriendsShipOnlyGame
   GuiControl,  disable%BoolStarted%, GuiCheckSendFriendsShipAll

     
}

��ϸ����ϱ�:
   fPrintStatus(" ���� ����� �����մϴ�.")   
   gosub INIT_MONITORING
   GuiControl, ,CountTotalCount,       0
   GuiControl, ,CountClearCount,       0
   GuiControl, ,CountFailCount,        0
   GuiControl, ,CountMonsterChange,    0
   GuiControl, ,GuiReceivePointCount,  0
   GuiControl, ,GuiCountRaidConsume,   0
   GuiControl, ,CountGoldRoom,         0
   GuiControl, ,CountWinCount,         0
   GuiControl, ,CountLoseCount,        0
   GuiControl, ,NoLevelUp,             0
   GuiControl, ,GuiUsingPointCount,    0
   GuiControl, ,GuiCountRaidPrize,     0
return

BUTTONä��:
   if( BoolShowChat = false ){
      BoolShowChat:=true
      SHOW_GUI_HEIGHT:=height_with_chat         
   }else{
      BoolShowChat:=false   
      SHOW_GUI_HEIGHT:=height_without_chat
   }
   GuiControl, show%BoolShowChat%, WB
   Gui, Show, h%SHOW_GUI_HEIGHT%,%GUI_TITLE%

return 

!F9::
BUTTON����[F9]:
   goto ��ũ�ν���
return 


!F10::
BUTTON����[F10]:
   if( BoolStarted = true ){
		BoolWantToStop := true
		fPrintTitle("��ũ������")
		fPrintStatus("�������� ������ ������ ���������� ����˴ϴ�.")	
	}	
return 

^F12:: 
BUTTON�ٽ�[F12]:
   goto ��ũ�θ��ε�
return 
