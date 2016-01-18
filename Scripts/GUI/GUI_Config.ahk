INIT_GUI_CONFIG:

   CONFIG_TITLE:="Configuration"
    
   CONFIG_GUI_WIDTH:=510
   CONFIG_GUI_HEIGHT:=310

     
   CONFIG_BUTTON_POS_Y:=CONFIG_GUI_HEIGHT+10
   
   Gui, 2: Add, Button, x%xGuiStart% y%CONFIG_BUTTON_POS_Y% w80 h30   vButton_Apply, 설정저장
   Gui, 2: Add, DropDownList, x+10  yp+5 section w80 h100 vGuiConfigFiles       
   Gui, 2: Add, Button, x+0 ys h20  , 불러오기
   ;Gui, 2: +LastFound +AlwaysOnTop +ToolWindow


   Gui, 2: Add, Tab, x0 y0 w%CONFIG_GUI_WIDTH% h%CONFIG_GUI_HEIGHT% vGuiAutoTab , DEFAULT|모험스킬
   Gui, 2:Tab, DEFAULT
	      
   {	
      xGuiStart:=5
      xGroupWidth:=CONFIG_GUI_WIDTH-5
      yGuiStart:=30
      width_Difficult:=140
      height_Difficult:=80
      
		Gui,2:font,CPurple
		Gui,2: Add, GroupBox	    , x%xGuiStart% y%yGuiStart% w%width_Difficult% h%height_Difficult% , 난이도/맵
		Gui,2:font,
      
      Gui,2: Add, DropDownList  , x12    y45 section w60 h100  Choose3 vGuiStageDifficulty, 쉬움|보통|어려움
      
      Gui,2: Add, CheckBox	   , xs 	   y+5    Checked vGuiCheckCallFriend, 친구소환
      Gui,2: Add, CheckBox      , x+5    yp      vGuiCheckGoNextStage, 다음      
      Gui,2: Add, CheckBox      , xs 	   y+5    Checked vGuiLoopMap ,반복		         
      
      Gui,2:font,s7
      Gui,2: Add, Edit          , x+0    yp-1   w75 h15 right vLoopMapList, 6-6|7-9            
      Gui,2:font,
      
		Gui,2: Add, DropDownList	, xs+65 	ys w55 	h200 Choose2  vGuiStageList, 7-9|6-6|8-1|8-15|7-1|1-10|2-10|3-10|4-10|5-10|6-10|7-10|3-5|3-6|4-5|4-6|5-5|5-6|
	} 
	{
      
		Gui,2:font,CPurple
		Gui,2: Add, GroupBox,     x145 		y30 w180 h110 , 컨텐츠/팀 선택	
		Gui,2:font,
				
      Gui,2: Add, CheckBox,     xp+10    yp+18 section Checked Disabled, 모험팀		
      Gui,2: Add, DropDownList, x+5      yp-3 w42 h100  Choose1 vGuiListTeamAdvanture,  1팀|2팀|3팀
      Gui,2: Add, DropDownList, x+5      yp   w42 h100  Choose1 vGuiListSkillAdvanture, 1번|2번|3번
      
      Gui,2: Add, CheckBox,     xs 		   y+5   Checked vGuiCheckContentsGoldRoom, 황금방
      Gui,2: Add, DropDownList, x+5      yp-3 w42 h100  Choose1 vGuiListTeamGoldRoom,  1팀|2팀|3팀
      Gui,2: Add, DropDownList, x+5      yp   w42 h100  Choose1 vGuiListSkillGoldRoom, 1번|2번|3번      
      
      
		Gui,2: Add, CheckBox,     xs 		  y+5 Checked vGuiCheckContentsBattleField, 결투장
      Gui,2: Add, DropDownList, x+5      yp-3 w42 h100  Choose1 disabled vGuiListTeamBattle,  1팀|2팀|3팀
      Gui,2: Add, DropDownList, x+5      yp   w42 h100  Choose1 vGuiListSkillBattle, 1번|2번|3번
      
		
      
      Gui,2: Add, CheckBox,     xs 		   y+5   Checked Disabled vGuiCheckContentsCastle, 공성전
      Gui,2: Add, DropDownList, x+5      yp-3 w42 h100  Choose1 disabled vGuiListTeamCastle,  1팀|2팀|3팀
      Gui,2: Add, DropDownList, x+5      yp   w42 h100  Choose1 vGuiListSkillCastle, 1번|2번|3번
		
   }
 
   {
      Gui,2:font,CPurple
      Gui,2: Add, GroupBox, x%xGuiStart% y110 w140 h65  , 컨텐츠 반복
      gui,2:font,
      
      Gui,2: Add, Text, xp+10 yp+16 section  w58 h15 , 황금의방 :
      Gui,2: Add, Text, xp y+0 wp hp , 결 투  장 :
      Gui,2: Add, Text, xp y+0 wp hp , 쫄업확인 :
     
      Gui,2: Add, Edit, x+0 ys-2 w20 h15 right vCountForGoldRoom, 12
      Gui,2: Add, Edit, xp y+0 wp hp right vCountForBattle, 12
      Gui,2: Add, Edit, xp y+0 wp hp right   vCountForLevelupCheck, 3
      Gui,2: Add, Text, x+1 ys w40 h15 left, 회 마다
      Gui,2: Add, Text, xp y+0 wp hp left, 회 마다
      Gui,2: Add, Text, xp y+0 wp hp left, 회 마다
   }
   {
      Gui,2:font,CPurple
      Gui,2: Add, GroupBox, x%xGuiStart% y215 w140 h65  , 추가 기능
      gui,2:font,
      
      Gui,2: Add, CheckBox,  xp+10 yp+13 wp-15 h15 vGuiSelectRaidMod, 레이드 모드
      Gui,2: Add, CheckBox,  xp  yp+16 wp hp Checked vGuiWantByKeyPoint, 명예 구입
      Gui,2: Add, CheckBox,  xp yp+16 wp hp Disabled vGuiWantByKeyRuby, 루비 구입(미)
   }
   {
      gui,2:font,CPurple
      Gui,2: Add, GroupBox, x273 y175  w230 h40 , 스크린샷 설정
      gui,2:font,
      
      Gui,2: Add, CheckBox, xp+10 yp+18 section checked vGuiBoolScreenShotResult, 보상         
      Gui,2: Add, CheckBox, x+20  yp checked vGuiBoolScreenShotRaid, 레이드
      Gui,2: Add, CheckBox, x+20  yp checked vGuiBoolScreenShotError, 에러
      ;~ Gui, Add, Edit, x10 yp+16 w20 h15 right vGui1LevelHappySave, 3
      ;~ Gui, Add, Text, x+0 yp+2 w40 h15 left, 개 유지
      ;~ Gui, Add, CheckBox, x+5 yp+2 w70 h15  vGui30LevelHappySell, 만렙판매
   }
   {
      gui,2:font,CPurple
      Gui,2: Add, GroupBox, x273 y215  w230 h80 , 쫄작
      gui,2:font,
      
      Gui,2: Add, Text		, xp+10  yp+20  section h15,     드래그         
      Gui,2: Add, Edit    , x+5 yp-2 w20 h15 right vGuiDragCount, 3
      Gui,2: Add, CheckBox, xs y+5 h15   Checked vGuiCheckFirstElement, 원소먼저
      Gui,2: Add, CheckBox, xs y+5 h15 vGuiBoolStopMonsterLevelUp, 쫄렙업시 정지
      
      gosub	INIT_TEAM_POSITION
      Gui,2: Add, CheckBox, x%보호1X% y%보호1Y% w30 h15           vGuiCheckChangeTeam1, 1
      Gui,2: Add, CheckBox, x%보호2X% y%보호2Y% wp  hp  Checked   vGuiCheckChangeTeam2, 2
      Gui,2: Add, CheckBox, x%보호3X% y%보호3Y% wp  hp  Checked   vGuiCheckChangeTeam3, 3
      Gui,2: Add, CheckBox, x%보호4X% y%보호4Y% wp  hp  Checked   vGuiCheckChangeTeam4, 4
      Gui,2: Add, CheckBox, x%보호5X% y%보호5Y% wp  hp            vGuiCheckChangeTeam5, 5
      
      Gui,2: Add, DropDownList, xp-70 yp-3 w60 h90  Choose1 gGuiListTeamPosition vGuiListTeamPosition, 보호|공격|기본|밸런스
   }
  
   {
      gui,2:font,CPurple
      Gui,2: Add, GroupBox, x%xGuiStart% y175 w140 h40  ,장비판매(미)
      gui,2:font,
      
      Gui,2: Add, CheckBox, x13 yp+15 w70 h15  Disabled vGuiCheckSellEquip, 장비 판매
      Gui,2: Add, DropDownList, x+10 yp-3 w40 h70 Disabled Choose1 vGuiSellEquipLimit, 1성|2성|3성|4성
   }
   {
      Gui,2:font,CPurple
      Gui,2: Add, GroupBox, x145 y175 w125 h80  , 딜레이 설정
      Gui,2:font,  
      Gui,2: Add, Text,xp+10 yp+18 w60 h15 , 기본전투 :
      Gui,2: Add, Text, xp y+7 wp hp , 클릭이후 :
      Gui,2: Add, Text, xp y+7 wp hp , 파일로딩 :
     
     ;~ Gui, Add, Text,xp+10 yp+18 w60 h15 , 기본전투 :
      Gui,2: Add, Edit, x+5 yp-47 w25 h15 right vGuiDelayForBattle, 15
      Gui,2: Add, Edit, xp y+7 wp hp right vGuiDelayForClickAfter, 1.5
      Gui,2: Add, Edit, xp y+7 wp hp right vDelayForFileLoading, 3
      Gui,2: Add, Text,  x+1 yp-43 w15 h15 left, 초
      Gui,2: Add, Text, xp y+7 wp hp left, 초
      Gui,2: Add, Text,  xp y+7 wp hp left, 초
   }
   
   Gui, 2: Tab, 모험
	gosub INIT_TAB_ADVANTURE
   ;Gui, 2: Tab, 공성전
	;gosub INIT_TAB_CASTLEBATTLE
	;Gui, 2: Tab , 기타기능
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
	Loop, %A_ScriptDir%\Resource\Image\10.스킬이미지\*,1,0
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
   target:=mainConfig.loadValue("설정파일", "파일이름" )
   GuiControl , chooseString,GuiConfigFiles, % target

   return
}



INIT_TEAM_POSITION:
{
		PositionX_FirstRow = 470
		PositionY_Top = 227
		PositionX_SeconRow:= PositionX_FirstRow - 30
		Diff_Y=15

		;~ 보호진형
		보호1X:= PositionX_FirstRow
		보호1Y:= PositionY_Top

		보호2X:= PositionX_FirstRow
		보호2Y:= 보호1Y+Diff_Y

		보호3X:= PositionX_FirstRow
		보호3Y:= 보호2Y+Diff_Y

		보호4X:= PositionX_FirstRow
		보호4Y:= 보호3Y+Diff_Y

		보호5X:= PositionX_SeconRow
		보호5Y:= (보호2Y + 보호3Y ) /2


		공격2X:= PositionX_SeconRow
		공격2Y:= PositionY_Top

		공격3X:= PositionX_SeconRow
		공격3Y:= 공격2Y+Diff_Y

		공격4X:= PositionX_SeconRow
		공격4Y:= 공격3Y+Diff_Y

		공격5X:= PositionX_SeconRow
		공격5Y:= 공격4Y+Diff_Y
			
		공격1X:= PositionX_FirstRow
		공격1Y:= (공격3Y + 공격4Y ) /2


		기본3X:= PositionX_SeconRow
		기본3Y:= PositionY_Top

		기본4X:= PositionX_SeconRow
		기본4Y:= 기본3Y+Diff_Y*1.5

		기본5X:= PositionX_SeconRow
		기본5Y:= 기본4Y+Diff_Y*1.5

		기본1X:= PositionX_FirstRow
		기본1Y:= (기본3Y + 기본4Y ) /2

		기본2X:= PositionX_FirstRow
		기본2Y:= (기본4Y + 기본5Y ) /2

		밸런스1X:= PositionX_FirstRow
		밸런스1Y:= PositionY_Top

		밸런스2X:= PositionX_FirstRow
		밸런스2Y:= 밸런스1Y +Diff_Y*1.5

		밸런스3X:= PositionX_FirstRow
		밸런스3Y:= 밸런스2Y +Diff_Y*1.5

		밸런스4X:= PositionX_SeconRow
		밸런스4Y:= (밸런스1Y + 밸런스2Y ) /2

		밸런스5X:= PositionX_SeconRow
		밸런스5Y:= (밸런스2Y + 밸런스3Y ) /2
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

	fSaveFile( GuiListTeamAdvanture, "팀선택", "모험팀")
	fSaveFile( GuiListTeamBattle, "팀선택", "결투팀")
	fSaveFile( GuiListTeamGoldRoom, "팀선택", "황금팀")
	
	fSaveFile( GuiCheckContentsBattleField, "컨텐츠", "결투장" )
	fSaveFile( GuiCheckContentsGoldRoom, "컨텐츠", "황금방" )
	fSaveFile( GuiCheckCallFriend, "컨텐츠", "친구소환" )
   
	fSaveFile( GuiStageDifficulty, "맵선택", "난이도" )

	fSaveFile( GuiStageList, "맵선택", "스테이지" )
	fSaveFile( GuiCheckGoNextStage, "맵선택", "다음" )
   
   fSaveFile( GuiLoopMap, "맵선택", "반복" )
   fSaveFile( LoopMapList, "맵선택", "반복지역" )      
   
	fSaveFile(CountForGoldRoom, "컨텐츠반복", "황금방돌기" )
	fSaveFile(CountForBattle, "컨텐츠반복", "결투장돌기" )	
	fSaveFile(CountForLevelupCheck, "컨텐츠반복", "렙업확인" )
   
      
   fSaveFile(GuiDelayForBattle, "딜레이", "기본전투딜레이" )
   fSaveFile(GuiDelayForClickAfter, "딜레이", "클릭딜레이" )
   fSaveFile(DelayForFileLoading, "딜레이", "로딩딜레이" )
   
	fSaveFile(GuiBoolFirstGoldRoom, "먼저돌기", "황금먼저" )
   fSaveFile(GuiBoolFirstBattleField, "먼저돌기", "결투먼저" )
   fSaveFile(GuiBooFirstlCastleBattle, "먼저돌기", "공성먼저" )
   fSaveFile(GuilListCatleBattleTeam, "먼저돌기", "공성팀" )
	fSaveFile(GuiBoolStopMonsterLevelUp, "추가기능", "쫄업정지" )

	fSaveFile(GuiCheckSellEquip, "장비관리", "장비판매" )
	fSaveFile(GuiSellEquipLimit, "장비관리", " 판매등급" )
	
	fSaveFile(GuiWantByKeyPoint, "추가기능", "열쇠명예구입" )
	fSaveFile(GuiWantByKeyRuby, "추가기능", "열쇠루비구입" )
   fSaveFile(GuiSelectRaidMod, "추가기능", "레이드모드" )
    
   fSaveFile(GuiBoolScreenShotResult,  "스크린샷", "모험보상" )
   fSaveFile(GuiBoolScreenShotRaid,    "스크린샷", "레이드결과" )
   fSaveFile(GuiBoolScreenShotError,   "스크린샷", "에러화면" )
   
   fSaveFile(GuiSkillFileName,   "스킬파일", "파일이름" )
   
   fSaveFile(GuiListTeamPosition, "쫄작", "쫄작진형" )
   fSaveFile(GuiDragCount, "쫄작", "드래그횟수" )
   fSaveFile(GuiCheckFirstElement, "쫄작", "원소먼저" )
   
   fSaveFile(GuiSendFrindShipCount, "명예보내기", "전송횟수" )
   fSaveFile(GuiCheckSendFriendsShipAll, "명예보내기", "전부보내기" )
   fSaveFile(GuiCheckSendFriendsShipOnlyGame, "명예보내기", "차단보내기" )
   fSaveFile(GuiSendingAfterAdventure, "명예보내기", "전송후모험" )
   
   fSaveFile(GuiPushBulletToken, "PushBullet", "Token" )

   loop, 5
   {
      Target =렙업교체%A_index%
      fSaveFile(GuiCheckChangeTeam%A_index%, "쫄작", Target ) 
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
	fLoadConfig( GuiListTeamAdvanture, true, "팀선택", "모험팀" )
   
   fLoadConfig( GuiListTeamBattle, true, "팀선택", "결투팀" )
   
   fLoadConfig( GuiListTeamGoldRoom, true, "팀선택", "황금팀" )
   
   fLoadConfig( GuiCheckContentsBattleField, false, "컨텐츠", "결투장" )
   fLoadConfig( GuiCheckContentsGoldRoom, false, "컨텐츠", "황금방" )
   fLoadConfig( GuiCheckCallFriend, false, "컨텐츠", "친구소환" )
   
   fLoadConfig( GuiStageDifficulty, true, "맵선택", "난이도" )
   fLoadConfig( GuiStageList, true, "맵선택", "스테이지" )
   
   fLoadConfig( GuiCheckGoNextStage, false, "맵선택", "다음" )
   
   fLoadConfig( GuiLoopMap, false, "맵선택", "반복" )
   ;selectMapEnable( vValue )
   fLoadConfig( LoopMapList, false, "맵선택", "반복지역" )
   
   fLoadConfig( CountForGoldRoom, false, "컨텐츠반복", "황금방돌기" )
   fLoadConfig( CountForBattle, false, "컨텐츠반복", "결투장돌기" )
   fLoadConfig( CountForLevelupCheck, false, "컨텐츠반복", "렙업확인" )
   
   fLoadConfig( GuiDelayForBattle, false, "딜레이", "기본전투딜레이" )
   fLoadConfig( GuiDelayForClickAfter, false, "딜레이", "클릭딜레이" )
   fLoadConfig( DelayForFileLoading, false, "딜레이", "로딩딜레이" )
   
   fLoadConfig( GuiCheckSellEquip, false, "장비관리", "장비판매" )
   fLoadConfig( GuiSellEquipLimit, true, "장비관리", "판매등급" )
   
      	
   fLoadConfig( GuiWantByKeyPoint, false, "추가기능", "열쇠명예구입" )
   fLoadConfig( GuiWantByKeyRuby, false, "추가기능", "열쇠루비구입" )
   fLoadConfig( GuiSelectRaidMod, false, "추가기능", "레이드모드" )
   fLoadConfig( GuiBoolStopMonsterLevelUp, false, "추가기능", "쫄업정지" )
   
      
   fLoadConfig( GuiBoolFirstGoldRoom, false, "먼저돌기", "황금먼저" )
   fLoadConfig( GuiBoolFirstBattleField, false, "먼저돌기", "결투먼저" )
   fLoadConfig( GuiBooFirstlCastleBattle, false, "먼저돌기", "공성먼저" )
   fLoadConfig( GuilListCatleBattleTeam, true, "먼저돌기", "공성팀" )


   fLoadConfig( GuiBoolScreenShotResult, false, "스크린샷", "모험보상" )
   fLoadConfig( GuiBoolScreenShotRaid, false, "스크린샷", "레이드결과" )
   fLoadConfig( GuiBoolScreenShotError, false, "스크린샷", "에러화면" )
   
      
   
	;~ 명예 보내는 부분 추가   
   fLoadConfig( GuiSendFrindShipCount, false, "명예보내기", "전송횟수" )      
   fLoadConfig( GuiCheckSendFriendsShipAll, false, "명예보내기", "전부보내기" )      
   fLoadConfig( GuiCheckSendFriendsShipOnlyGame, false, "명예보내기", "차단보내기" )      
   fLoadConfig( GuiSendingAfterAdventure, false, "명예보내기", "전송후모험" )      
   
   fLoadConfig( GuiPushBulletToken, false, "PushBullet", "Token" )         
   
   fLoadConfig( GuiListTeamPosition, true, "쫄작", "쫄작진형" )     
   gosub GuiListTeamPosition	
   fLoadConfig( GuiDragCount, false, "쫄작", "드래그횟수" )      
   fLoadConfig( GuiCheckFirstElement, false, "쫄작", "원소먼저" )      
   loop, 5
   {
      Target =렙업교체%A_index%
      fLoadConfig( GuiCheckChangeTeam%A_index%, false, "쫄작", Target )      
   }
   
   fLoadConfig( GuiSkillFileName, false, "스킬파일", "파일이름" )
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

