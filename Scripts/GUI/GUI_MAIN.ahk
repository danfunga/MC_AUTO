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
      Gui, Add, GroupBox, x%xGuiStart% y%yPos% w%width_RunFirst% h%height_RunFirst%  , 먼저 돌기
      gui, font,         
           
      Gui, Add, CheckBox, xp+10  yp+20 section  vGuiBoolFirstGoldRoom, 황금방
      Gui, Add, CheckBox, xp     y+10           vGuiBoolFirstBattleField, 결투장
      Gui, Add, CheckBox, xp     y+10           disabled vGuiBooFirstlCastleBattle, 공성전

   }
   {
      y_Raid:=yPos+height_RunFirst
      height_RunRaid:=height_stasts-height_RunFirst
      gui, font,CPurple
      Gui, Add, GroupBox, x%xGuiStart% y%y_Raid% w%width_RunFirst% h%height_RunRaid%  , 레이드만
      gui, font,         
           
      Gui, Add, CheckBox, xp+10  yp+20 section  disabled vGuiRunOnlyRaid, 반복
            
   }
	{
      yPos=10
      width_stats:=xGroupWidth-width_RunFirst
      x_stats:=xGuiStart+width_RunFirst
		Gui,font,CPurple      
		Gui, Add, GroupBox, x%x_stats% y%yPos%  w%width_stats% h%height_stasts% section , 게임기록
		gui,font,
		
      Gui, Add, Button, x%button_pos% yp-5  g기록리셋하기 , 리셋
      
      Gui, Add, Text, xs+10   ys+18 w65   h15 , 모험총횟수:
		Gui, Add, Text, xp      y+2   wp    hp  , 모험클리어:
		Gui, Add, Text, xp      y+2   wp    hp  , 모험   실패:
		Gui, Add, Text, xp      y+10  wp    hp  , 쫄작   완료:
		Gui, Add, Text, xp      y+2   wp    hp  , 업적   수령:
      Gui, Add, Text, xp      y+10  wp    hp  , 레이드횟수:
      Gui, Add, Text, xp      y+10  wp    hp  , 명예트라이:
		
		Gui, Add, Text, x+2     ys+18    w28   h15  right vCountTotalCount ,  0
		Gui, Add, Text, xp      y+2   wp    hp   right vCountClearCount ,  0		
		Gui, Add, Text, xp      y+2   wp    hp   right vCountFailCount ,  0		
		Gui, Add, Text, xp      y+10  wp    hp   right vCountMonsterChange,  0
		Gui, Add, Text, xp      y+2   wp    hp   right vGuiReceivePointCount,  0      
      Gui, Add, Text, xp      y+10  wp    hp   right vGuiCountRaidConsume,  0
      Gui, Add, Text, xp      y+10  wp    hp   right VGuiCountSendTry,  0

		Gui, Add, Text, x+10    ys+18 w65      h15 , 황금방횟수:
		Gui, Add, Text, xp      y+2  wp    hp  , 결투장승리:
		Gui, Add, Text, xp      y+2   wp    hp  , 결투장패배:
		Gui, Add, Text, xp      y+10  wp    hp  , 쫄체크없음:
		Gui, Add, Text, xp      y+2   wp    hp  , 열쇠   구입:
      Gui, Add, Text, xp      y+10  wp    hp  , 레이드보상:
      Gui, Add, Text, xp      y+10  wp    hp  , 전송   완료:
		
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
		Gui, Add, GroupBox, x%xGuiStart% y%yPos%  w%xGroupWidth% h%heidht_runs% section , 실행창
		gui,font,
      
		Gui, Font, S8 CDefault Bold, Verdana
      vIcon_resume=%A_ScriptDir%\Resource\Image\resume.png
		vIcon_pause  =%A_ScriptDir%\Resource\Image\pause.png
      
		Gui, Add, Button, xp+5 	yp+15 section w80 h30  vButton_Start   , 시작[F9]
      Gui, Add, Button, xs ys w80 h30  +Hidden vButton_Stop   , 정지[F10]
      
      Gui, Add, Picture, x+5 yp+4 w24 h24  gICON_RESUME  +Hidden vPIC_RESUME, %vIcon_resume%
		Gui, Add, Picture, xp yp w24 h24  gICON_PAUSE  +Hidden   vPIC_PAUSE, %vIcon_pause%
		
		Gui, Add, Button, x+5 ys w80 h30  , 다시[F12]
      Gui, Add, Button, x+5 ys h30 w80 gConfig vButton_Config, 설정
      Gui, Add, Button, x+5 ys h30  ,  임시
      gui,font,  
	} 
	
   {
      yPos:=yPos+heidht_runs+5          
      height_logs:=120
		gui,font,CPurple
		Gui, Add, GroupBox, x%xGuiStart% y%yPos%  w%xGroupWidth% h%height_logs% , 게임로그
		gui,font,

		Gui, Add, Text, xp+10 	yp+20 section w70  vBottomTitle, 런칭		
      Gui, Add, Text, x+15 	yp w200  vSubTitle, 좋은 하루 되세요
      Gui, Font, S8 CDefault Bold, Verdana

		Gui, Font, ,
      logWidth:=xGroupWidth-30
		Gui, Add, Text, xs 	   y+10 w%logWidth%  v상태창, Macro Version 0.95
		Gui, Add, Text, +wrap xs-2	y+10 wp R2 v결과창  ,  '결과창'	
	}
   {
      yPos:=yPos+height_logs+5          
      height_Etc:=110
		gui,font,CPurple
		Gui, Add, GroupBox, x%xGuiStart% y%yPos%  w%xGroupWidth% h%height_Etc% section , ETC
		gui,font,
      width_id:=xGroupWidth-50

      Gui, Add, Button, x%button_pos% yp+10 gSAVE_MAIN_CONFIG_BUTTON, 저장
      
      Gui, Add, Checkbox, xs+10 	ys+18  h15 section vGuiSendPushBullet disabled , Pushbullet :
      Gui, Add, CheckBox, x+5  yp  vGuiBoolRaidStart, 레이드 모드 시작
      Gui, Add, CheckBox, x+0  yp  vGuiBoolNoKey, 열쇠 소진
  
      
		Gui, Add, Text, xs y+8 h15 , ID :
		Gui, Add, Edit, x+5 yp-2  w%width_id% h15 right vGuiPushBulletToken,  


      Gui, Add, Checkbox, xs  y+20  h15 section vGuiSending, 명예 보내기 : 횟수 -      
		Gui, Add, Edit, x+0 yp w30 h15 right vGuiSendFrindShipCount, 30
		Gui, Add, Text, x+0 yp+2  h15 , 명( x2배만 시도 )
		
		Gui, Add, Checkbox, xs y+3  h15 Checked vGuiSendingAfterAdventure, 보낸후 모험계속  
		Gui, Add, Radio			, x+5			yp   		hp Checked 	vGuiCheckSendFriendsShipOnlyGame, 차단자
		Gui, Add, Radio			, x+10 			yp  		hp  	vGuiCheckSendFriendsShipAll, 전부
      
      Gui, Add, Button, x%button_pos% yp-8 , 채팅
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
   funcLoadConfig( mainConfig, GuiBoolFirstGoldRoom, false, "먼저돌기", "황금먼저" )
   funcLoadConfig( mainConfig, GuiBoolFirstBattleField, false, "먼저돌기", "결투먼저" )
   funcLoadConfig( mainConfig, GuiBooFirstlCastleBattle, false, "먼저돌기", "공성먼저" )
   
   funcLoadConfig( mainConfig, GuiRunOnlyRaid, false, "레이드만", "사용" )
   
   funcLoadConfig( mainConfig, GuiSendPushBullet, false, "PushBullet", "사용" )
   funcLoadConfig( mainConfig, GuiPushBulletToken, false, "PushBullet", "Token" )
   funcLoadConfig( mainConfig, GuiBoolRaidStart, false, "PushBullet", "레이드" )
   funcLoadConfig( mainConfig, GuiBoolNoKey, false, "PushBullet", "열쇠" )
   
   funcLoadConfig( mainConfig, GuiSending, false, "명예보내기", "사용" )
   funcLoadConfig( mainConfig, GuiSendFrindShipCount, false, "명예보내기", "인원" )
   funcLoadConfig( mainConfig, GuiSendingAfterAdventure, false, "명예보내기", "모험계속" )
   funcLoadConfig( mainConfig, GuiCheckSendFriendsShipOnlyGame, false, "명예보내기", "차단자" )
   funcLoadConfig( mainConfig, GuiCheckSendFriendsShipAll, false, "명예보내기", "전부" )
   
   return 
}
SAVE_MAIN_CONFIG_BUTTON:
SAVE_MAIN_CONFIG:
{   
   Gui, Submit, NoHide
   funcSaveConfig( mainConfig, GuiBoolFirstGoldRoom, false, "먼저돌기", "황금먼저" )
   funcSaveConfig( mainConfig, GuiBoolFirstBattleField, false, "먼저돌기", "결투먼저" )
   funcSaveConfig( mainConfig, GuiBooFirstlCastleBattle, false, "먼저돌기", "공성먼저" )
   
   funcSaveConfig( mainConfig, GuiRunOnlyRaid, false, "레이드만", "사용" )
   
   funcSaveConfig( mainConfig, GuiSendPushBullet, false, "PushBullet", "사용" )
   funcSaveConfig( mainConfig, GuiPushBulletToken, false, "PushBullet", "Token" )
   funcSaveConfig( mainConfig, GuiBoolRaidStart, false, "PushBullet", "레이드" )
   funcSaveConfig( mainConfig, GuiBoolNoKey, false, "PushBullet", "열쇠" )
   
   funcSaveConfig( mainConfig, GuiSending, false, "명예보내기", "사용" )
   funcSaveConfig( mainConfig, GuiSendFrindShipCount, false, "명예보내기", "인원" )
   funcSaveConfig( mainConfig, GuiSendingAfterAdventure, false, "명예보내기", "모험계속" )
   funcSaveConfig( mainConfig, GuiCheckSendFriendsShipOnlyGame, false, "명예보내기", "차단자" )
   funcSaveConfig( mainConfig, GuiCheckSendFriendsShipAll, false, "명예보내기", "전부" )
   
   MsgBox, ,,Main 설정을 저장하였습니다.,0.5
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
   
   ; 실행창 부분
	
	GuiControl, hide%BoolStarted%, Button_Start
	GuiControl, show%BoolStarted%, Button_Stop
	
	GuiControl, show%BoolStarted%,PIC_PAUSE		
   GuiControl, disable%BoolStarted%, Button_Config  
;   if( BoolStarted )
      ;Gui, 2: Hide
   
   ; 먼저 돌기 부분 
   GuiControl,  disable%BoolStarted%, GuiBoolFirstGoldRoom
	GuiControl,  disable%BoolStarted%, GuiBoolFirstBattleField
   ;GuiControl,  disable%BoolStarted%, GuiBooFirstlCastleBattle
  
   ; 레이드만 
   ;GuiControl,  disable%BoolStarted%, GuiRunOnlyRaid

      
   ; ETC 부분
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

기록리셋하기:
   fPrintStatus(" 게임 기록을 리셋합니다.")   
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

BUTTON채팅:
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
BUTTON시작[F9]:
   goto 매크로시작
return 


!F10::
BUTTON정지[F10]:
   if( BoolStarted = true ){
		BoolWantToStop := true
		fPrintTitle("매크로종료")
		fPrintStatus("진행중인 과정이 끝나면 정상적으로 종료됩니다.")	
	}	
return 

^F12:: 
BUTTON다시[F12]:
   goto 매크로리로드
return 
