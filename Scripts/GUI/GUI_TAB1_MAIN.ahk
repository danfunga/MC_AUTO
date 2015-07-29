INIT_TAB_MAIN:
{
	{	
		Gui,font,CPurple
		Gui, Add, GroupBox	    , x02 y030 w140 h80 , 난이도/맵
		Gui,font,
      
      Gui, Add, DropDownList  , x12    y45 section w60 h100  Choose3 vGuiStageDifficulty, 쉬움|보통|어려움
      
      Gui, Add, CheckBox	   , xs 	   y+5    Checked vGuiCheckCallFriend, 친구소환
      Gui, Add, CheckBox      , x+5    y      vGuiCheckGoNextStage, 다음      
      Gui, Add, CheckBox      , xs 	   y+5    Checked gSelectGuiLoopMap vGuiLoopMap ,반복		         
      Gui,font,s7
      Gui, Add, Edit          , x+0    yp-1   w75 h15 right vLoopMapList, 6-6|7-9            
      Gui,font,
		Gui, Add, DropDownList	, xs+65 	ys w55 	h200 Choose2  vGuiStageList, 7-9|6-6|8-1|7-10|6-10|5-10|4-10|3-10|2-10|1-10|7-5|9-1|5-1|6-5|3-5|7-1|1-2|3-9|8-15         
	} 
	{
		Gui,font,CPurple
		Gui, Add, GroupBox,     x145 		y30 w125 h80 , 컨텐츠/팀 선택	
		Gui,font,
				
      Gui, Add, CheckBox,     xp+10    yp+18 section Checked Disabled, 모험팀		
		Gui, Add, CheckBox,     xs 		y+9 wp hp Checked vGuiCheckContentsBattleField, 결투장
		Gui, Add, CheckBox,     xs 		y+9 wp hp Checked vGuiCheckContentsGoldRoom, 황금방

		Gui, Add, DropDownList, x+5      ys-3 w42 h100  Choose1 vGuiListTeamAdvanture, 1팀|2팀|3팀
		Gui, Add, DropDownList, xp       y+0 wp h100  Choose1 vGuiListTeamBattle, 1팀|2팀|3팀
		Gui, Add, DropDownList, xp       y+0 wp h100  Choose1 vGuiListTeamGoldRoom, 1팀|2팀|3팀	
	}
	{
		Gui,font,CPurple
		Gui, Add, GroupBox, x273 y30  w230 h145 , 게임기록
		gui,font,
		
      Gui, Add, Text, xp+10   yp+18 section w65   h15 , 모험총횟수:
		Gui, Add, Text, xp      y+2   wp    hp   , 모험클리어:
		Gui, Add, Text, xp      y+2   wp    hp  , 모험   실패:
		Gui, Add, Text, xp      y+10  wp    hp  , 쫄작   완료:
		Gui, Add, Text, xp      y+2   wp    hp  , 업적   수령:
      Gui, Add, Text, xp      y+10  wp    hp  , 레이드횟수:
		
		Gui, Add, Text, x+2     ys    w28   h15  right vCountTotalCount ,  0
		Gui, Add, Text, xp      y+2   wp    hp   right vCountClearCount ,  0		
		Gui, Add, Text, xp      y+2   wp    hp   right vCountFailCount ,  0		
		Gui, Add, Text, xp      y+10  wp    hp   right vCountMonsterChange,  0
		Gui, Add, Text, xp      y+2   wp    hp   right vGuiReceivePointCount,  0      
      Gui, Add, Text, xp      y+10  wp    hp   right vGuiCountRaidConsume,  0

		Gui, Add, Text, x+10    ys w65      h15 , 황금방횟수:
		Gui, Add, Text, xp      y+2  wp    hp  , 결투장승리:
		Gui, Add, Text, xp      y+2   wp    hp  , 결투장패배:
		Gui, Add, Text, xp      y+10  wp    hp  , 쫄체크없음:
		Gui, Add, Text, xp      y+2   wp    hp  , 열쇠   구입:
      Gui, Add, Text, xp      y+10  wp    hp  , 레이드보상:
		
		Gui, Add, Text, x+2     ys    w28   h15   right vCountGoldRoom ,  0
		Gui, Add, Text, xp      y+2  wp    hp    right vCountWinCount ,  0
		Gui, Add, Text, xp      y+2   wp    hp    right vCountLoseCount ,  0
		Gui, Add, Text, xp      y+10  wp    hp    right vNoLevelUp ,  0
		Gui, Add, Text, xp      y+2   wp    hp    right vGuiUsingPointCount,  0
      Gui, Add, Text, xp      y+10  wp    hp    right vGuiCountRaidPrize,  0
	}
		{
			Gui,font,CPurple
			Gui, Add, GroupBox, x2 y110 w140 h65  , 컨텐츠 반복
			gui,font,
			
			Gui, Add, Text, xp+10 yp+16 section  w58 h15 , 황금의방 :
			Gui, Add, Text, xp y+0 wp hp , 결 투  장 :
			Gui, Add, Text, xp y+0 wp hp , 쫄업확인 :
		  
			Gui, Add, Edit, x+0 ys-2 w20 h15 right vCountForGoldRoom, 12
			Gui, Add, Edit, xp y+0 wp hp right vCountForBattle, 12
		   Gui, Add, Edit, xp y+0 wp hp right   vCountForLevelupCheck, 3
		   Gui, Add, Text, x+1 ys w40 h15 left, 회 마다
			Gui, Add, Text, xp y+0 wp hp left, 회 마다
			Gui, Add, Text, xp y+0 wp hp left, 회 마다
		}


		{
			Gui,font,CPurple
			Gui, Add, GroupBox, x145 y110 w125 h65  , 추가 기능
			gui,font,
			Gui, Add, CheckBox,  xp+10 yp+13 wp-15 h15 vGuiSelectRaidMod, 레이드 모드
			Gui, Add, CheckBox,  xp  yp+16 wp hp Checked vGuiWantByKeyPoint, 명예 구입
			Gui, Add, CheckBox,  xp yp+16 wp hp Disabled vGuiWantByKeyRuby, 루비 구입(미)
		}
		{
			gui,font,CPurple
			Gui, Add, GroupBox, x273 y175  w230 h80 , 쫄작
			gui,font,
			
         Gui, Add, Text		, xp+10  yp+20  section h15,     드래그         
			Gui, Add, Edit    , x+5 yp-2 w20 h15 right vGuiDragCount, 3
         Gui, Add, CheckBox, xs y+5 h15   Checked vGuiCheckFirstElement, 원소먼저
         Gui, Add, CheckBox, xs y+5 h15 vGuiBoolStopMonsterLevelUp, 쫄렙업시 정지
         
			gosub	INIT_TEAM_POSITION
			Gui, Add, CheckBox, x%보호1X% y%보호1Y% w30 h15           vGuiCheckChangeTeam1, 1
			Gui, Add, CheckBox, x%보호2X% y%보호2Y% wp  hp  Checked   vGuiCheckChangeTeam2, 2
			Gui, Add, CheckBox, x%보호3X% y%보호3Y% wp  hp  Checked   vGuiCheckChangeTeam3, 3
			Gui, Add, CheckBox, x%보호4X% y%보호4Y% wp  hp  Checked   vGuiCheckChangeTeam4, 4
			Gui, Add, CheckBox, x%보호5X% y%보호5Y% wp  hp            vGuiCheckChangeTeam5, 5
			
			Gui, Add, DropDownList, xp-70 yp-3 w60 h90  Choose1 gGuiListTeamPosition vGuiListTeamPosition, 보호|공격|기본|밸런스
		}
		{
			gui,font,CPurple
			Gui, Add, GroupBox, x2 y175 w268 h40  ,  모험 시작 전 먼저 돌기
			gui,font,         
         
			Gui, Add, CheckBox, xp+6  yp+18 section vGuiBoolFirstGoldRoom, 황금방
			Gui, Add, CheckBox, x+10  yp  vGuiBoolFirstBattleField, 결투장
			Gui, Add, CheckBox, x+10  yp  +Disabled vGuiBooFirstlCastleBattle, 공성전
			Gui, Add, DropDownList, x+0 yp-3 w40 h100 Choose2 vGuilListCatleBattleTeam, 1팀|2팀|3팀
		}
		{
			gui,font,CPurple
			Gui, Add, GroupBox, x2 y215 w140 h40  ,장비판매(미)
			gui,font,
			
			Gui, Add, CheckBox, x13 yp+15 w70 h15  Disabled vGuiCheckSellEquip, 장비 판매
			Gui, Add, DropDownList, x+10 yp-3 w40 h70 Disabled Choose1 vGuiSellEquipLimit, 1성|2성|3성|4성
		}

		{
			gui,font,CPurple
			Gui, Add, GroupBox, x2 y255 w140 h40 , 1성해피 판매
			gui,font,
			;~ Gui, Add, Edit, x10 yp+16 w20 h15 right vGui1LevelHappySave, 3
		   ;~ Gui, Add, Text, x+0 yp+2 w40 h15 left, 개 유지
		   ;~ Gui, Add, CheckBox, x+5 yp+2 w70 h15  vGui30LevelHappySell, 만렙판매
		}
		{
			gui,font,CPurple
			Gui, Add, GroupBox, x145 y215 w125 h80  , 딜레이 설정
			gui,font,  
			Gui, Add, Text,xp+10 yp+18 w60 h15 , 기본전투 :
			Gui, Add, Text, xp y+7 wp hp , 클릭이후 :
			Gui, Add, Text, xp y+7 wp hp , 파일로딩 :
		  
		  ;~ Gui, Add, Text,xp+10 yp+18 w60 h15 , 기본전투 :
			Gui, Add, Edit, x+5 yp-47 w25 h15 right vGuiDelayForBattle, 15
			Gui, Add, Edit, xp y+7 wp hp right vGuiDelayForClickAfter, 1.5
		  Gui, Add, Edit, xp y+7 wp hp right vDelayForFileLoading, 3
		  Gui, Add, Text,  x+1 yp-43 w15 h15 left, 초
			Gui, Add, Text, xp y+7 wp hp left, 초
			Gui, Add, Text,  xp y+7 wp hp left, 초
		}
		{

         
         ;Gui, Add, Edit, xp yp+18 w20 h15 Disabled right vGuiRaidMinKey, 2			
			;Gui, Add, Text, x+5 yp+2  h15 , 개 시작 ->
			;Gui, Add, Edit, x+5 yp-2 w20 h15 Disabled right vGuiRaidMaxKey, 6
			;Gui, Add, Text, x+5 yp+2  h15 , 개 -> 모험
		}
			;~ gui,font,CDefault, 맑은고딕
			;~ Gui, Add, Text, x+15 yp+8  hp , Made By Mukchik.
			;~ Gui, Add, Text, x+15 yp+8  hp , MC_Auto Yosemite.
			;~ Gui, Font, , 
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
	
	
	GuiControl,  disable%BoolStarted%, GuiDelayForBattle
   GuiControl,  disable%BoolStarted%, GuiDelayForClickAfter
   GuiControl,  disable%BoolStarted%, DelayForFileLoading
   
   if( BoolStarted ){
      GuiControl, disable%BoolStarted%, GuiStageDifficulty   
      GuiControl,  disable%BoolStarted%, GuiStageList
      GuiControl,  disable%BoolStarted%, LoopMapList     
      goSub DisableLevelupCheckList   
   }else {
      gosub SelectGuiLoopMap
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
		PositionY_Top = 190
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

SelectGuiLoopMap:
{	
    guiControlGet, booleanValue,,GuiLoopMap
    selectMapEnable( booleanValue )
    return
}
selectMapEnable( boolEnable )
{
   GuiControl, Disable%boolEnable%,GuiStageDifficulty
   GuiControl, Disable%boolEnable%,GuiStageList
   
   GuiControl, Enable%boolEnable%,LoopMapList
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
	fLoadFile( vValue, "팀선택", "모험팀")
	if( vValue <> "" )
		GuiControl,Choose,GuiListTeamAdvanture,%vValue%	
	fLoadFile( vValue, "팀선택", "결투팀")
	if( vValue <> "" )
		GuiControl,Choose,GuiListTeamBattle ,%vValue%
	fLoadFile( vValue, "팀선택", "황금팀")
	if( vValue <> "" )
		GuiControl,Choose,GuiListTeamGoldRoom ,%vValue%
	
	fLoadFile(vValue, "컨텐츠", "결투장" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckContentsBattleField,%vValue%
	fLoadFile(vValue, "컨텐츠", "황금방" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckContentsGoldRoom,%vValue%
	
	
	fLoadFile(vValue, "컨텐츠", "친구소환" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckCallFriend,%vValue%
	;~ GuiControl, , ,%vValue%
	
   
 	fLoadFile( vValue, "맵선택", "난이도")
	if( vValue <> "" )
		GuiControl,Choose,GuiStageDifficulty,%vValue%	

	fLoadFile(vValue, "맵선택", "다음" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckGoNextStage,%vValue%
	
	fLoadFile(vValue, "맵선택", "스테이지" )	
	if( vValue <> "" )
		GuiControl, Choose,GuiStageList,%vValue%
      
   fLoadFile(vValue, "맵선택", "반복" )
	if( vValue <> "" )
		GuiControl, ,GuiLoopMap,%vValue%      
   selectMapEnable( vValue )
	
	fLoadFile(vValue, "맵선택", "반복지역" )	
	if( vValue <> "" )
		GuiControl, ,LoopMapList,%vValue%
   
	
	fLoadFile(vValue, "컨텐츠반복", "황금방돌기" )
	if( vValue <> "" )
		GuiControl, ,CountForGoldRoom,%vValue%
	fLoadFile(vValue, "컨텐츠반복", "결투장돌기" )
	if( vValue <> "" )
		GuiControl, ,CountForBattle,%vValue%
  	fLoadFile(vValue, "컨텐츠반복", "렙업확인" )
	if( vValue <> "" )
		GuiControl, ,CountForLevelupCheck,%vValue%
   
    fLoadFile(vValue, "딜레이", "기본전투딜레이" )
	if( vValue <> "" )
		GuiControl, ,GuiDelayForBattle,%vValue%
	fLoadFile(vValue, "딜레이", "클릭딜레이" )
	if( vValue <> "" )
		GuiControl, ,GuiDelayForClickAfter,%vValue%
	fLoadFile(vValue, "딜레이", "로딩딜레이" )
	if( vValue <> "" )
		GuiControl, ,DelayForFileLoading,%vValue%

	fLoadFile(vValue, "장비관리", "장비판매" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckSellEquip,%vValue%	
	fLoadFile(vValue, "장비관리", "판매등급" )
	if( vValue <> "" )
		GuiControl,Choose,GuiSellEquipLimit ,%vValue%
      	
           
	fLoadFile(vValue, "추가기능", "열쇠명예구입" )
	if( vValue <> "" )
		GuiControl, ,GuiWantByKeyPoint,%vValue%
	
	fLoadFile(vValue, "추가기능", "열쇠루비구입" )
	if( vValue <> "" )
		GuiControl, ,GuiWantByKeyRuby,%vValue%   
      
 	fLoadFile(vValue, "추가기능", "레이드모드" )
	if( vValue <> "" )
      GuiControl, ,GuiSelectRaidMod,%vValue%   
      
      
   fLoadFile(vValue, "먼저돌기", "황금먼저" )
	if( vValue <> "" )
		GuiControl, ,GuiBoolFirstGoldRoom,%vValue%
   fLoadFile(vValue, "먼저돌기", "결투먼저" )
	if( vValue <> "" )
		GuiControl, ,GuiBoolFirstBattleField,%vValue%
   fLoadFile(vValue, "먼저돌기", "공성먼저" )
	if( vValue <> "" )
		GuiControl, ,GuiBooFirstlCastleBattle,%vValue%      
   fLoadFile(vValue, "먼저돌기", "공성팀" )
	if( vValue <> "" )
		GuiControl, Choose,GuilListCatleBattleTeam,%vValue%

      
	fLoadFile(vValue, "추가기능", "쫄업정지" )
	if( vValue <> "" )
		GuiControl, ,GuiBoolStopMonsterLevelUp,%vValue%
      
   fLoadFile(vValue, "쫄작", "쫄작진형" )
	if( vValue <> "" ){
		GuiControl, Choose,GuiListTeamPosition,%vValue%
      gosub GuiListTeamPosition
   }
      
   fLoadFile(vValue, "쫄작", "드래그횟수" )
	if( vValue <> "" )
		GuiControl, ,GuiDragCount,%vValue%     
   fLoadFile(vValue, "쫄작", "원소먼저" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckFirstElement,%vValue%           
	
        


	;~ 명예 보내는 부분 추가
	fLoadFile(vValue, "명예보내기", "전송횟수" )
	if( vValue <> "" )
		GuiControl, ,GuiSendFrindShipCount,%vValue%     
	fLoadFile(vValue, "명예보내기", "전부보내기" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckSendFriendsShipAll,%vValue%     
	fLoadFile(vValue, "명예보내기", "차단보내기" )
	if( vValue <> "" )
		GuiControl, ,GuiCheckSendFriendsShipOnlyGame,%vValue%     
	
	fLoadFile(vValue, "명예보내기", "전송후모험" )
	if( vValue <> "" )
		GuiControl, ,GuiSendingAfterAdventure,%vValue%     
	
	fLoadFile(vValue, "PushBullet", "Token" )
	if( vValue <> "" )
		GuiControl, ,GuiPushBulletToken,%vValue%     

   loop, 5
   {
      Target =렙업교체%A_index%
      fLoadFile(vValue, "쫄작", Target )
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
