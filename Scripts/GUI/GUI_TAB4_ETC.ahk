INIT_TAB4:
{ 
	{	
        gui,font,CPurple
        Gui, Add, GroupBox,  x02 y030 w505 h100, 명예 포인트 보내기
        gui,font,
		Gui, Add, Text,x20 yp+18  h15 , 설명 : 설정된 사람 또는 2배이상 시도 하여 명예 보냅니다.
		
		Gui, Add, Text, x20 yp+18  h15 , 보내기 제한 :
		Gui, Add, Edit, x+5 yp-2 w30 h15 right vGuiSendFrindShipCount, 30
		Gui, Add, Text, x+5 yp+2  h15 , 명  ( Main 페이지에서 설정 저장 가능합니다. )
		
		Gui, Add, Checkbox, x21 y+3  h15 Checked vGuiSendingAfterAdventure, 보낸후 모험시작
		Gui, Add, Radio			, x+40			yp   		hp Checked 	vGuiCheckSendFriendsShipOnlyGame, 차단한 사람만 보내기
		Gui, Add, Radio			, x+10 			yp  		hp  	vGuiCheckSendFriendsShipAll, 전부 보내기
		{
			Gui, Add, Text, x20 yp+18  h15  , 보낸 명예수:
			Gui, Add, Text, x+0 yp  w30 h15 right vGuiSendHonorMoniotor , 0			
		}
		{
			Gui, Font, S8 CDefault Bold, Verdana
			Gui, Add, Button, x270 yp w100 h25   vBUTTON_START_SEND_FRIENDSHIP, 보내기
			Gui, Add, Button, x+30 yp wp hp   vBUTTON_STOP_SEND_FRIENDSHIP, 보내기 종료
			Gui, Font, , 
		}
	}
	{	
        gui,font,CPurple
        Gui, Add, GroupBox,  x02 y130 w505 h50, 레이드 반복하기
        gui,font,
		Gui, Add, Text,x20 yp+18  h15 , 설명 : 레이드를 반복적으로 돕니다.
		
	}
		{
			Gui, Font, S8 CDefault Bold, Verdana
			
			Gui, Add, Button, x270 yp w100 h25   vBUTTON_START_LOOP_RAID, 레이드시작
			Gui, Add, Button, x+30 yp wp hp   vBUTTON_END_LOOP_RAID, 레이드종료
			Gui, Font, , 
		}
{	
        gui,font,CPurple
        Gui, Add, GroupBox,  x02 yp+35 w505 h60, PushBullet 알림
        gui,font,
		Gui, Add, Text,x20 yp+18  h15 , 설명 : 열쇠가 없으면 알림합니다.
		
		Gui, Add, Text, x20 yp+18  h15 , ID :
		Gui, Add, Edit, x+5 yp-2 w450 h15 right vGuiPushBulletToken,  
	}
	
	return
}
fDragUpFriends(){	
	fPrintStatus("드래그 Up")	
	global DRAGUP_FRIENDS
	startingPosX=360
	endPosY=200
	if( DRAGUP_FRIENDS = false ){	
		startingPosY=447		
		DRAGUP_FRIENDS := true
	}else{
		startingPosY=446		
		DRAGUP_FRIENDS := false
	}
	
	
	funcSendMouseDragFixed(  startingPosX, startingPosY,startingPosX, endPosY )
	funcWaitingClick()
	return	
}


funcChangeTab4Status(){	
	global BoolStarted

	GuiControl, disable%BoolStarted%, GuiSendFrindShipCount
	GuiControl, disable%BoolStarted%, GuiCheckSendFriendsShipOnlyGame
	GuiControl,  disable%BoolStarted%, GuiCheckSendFriendsShipAll
	GuiControl,  disable%BoolStarted%, BUTTON_START_SEND_FRIENDSHIP
	GuiControl,  disable%BoolStarted%, BUTTON_STOP_SEND_FRIENDSHIP

	return
}
BUTTON보내기:
{
	fPrintTitle("명예 보내기")
	fPrintStatus("명예 보내기를 수행합니다.")
	setUpBeforeStart()	
	fPrintStatus("카카오톡 친구 페이지로 이동합니다.")
	gotoKakaoFriends()
	
	fPrintTitle("명예 보내기")
	fPrintStatus("명예 보내기를 수행합니다.")
	
	gosub INIT_SEND_HONOR
	intCountTemp :=0
	intCountTry:=0
	loop
	{
		checkSendingHonorQuit()
		loop, 5
		{
			;~ stringTempTitle=명예보내기 %intCountTemp% / %intCountTry%
			;~ fPrintTitle(stringTempTitle)			
			checkSendingHonorQuit()
			if( intCountTry >= GuiSendFrindShipCount*2 )
					break
			intCountTry++
         stringTitle=%intCountTemp% / %intCountTry%
			funcPrintSubTitle(stringTitle)

			funcSendClickFixed( SEND_HONOR_BUTTON_X ,SEND_HONOR_BUTTON_Y_%a_index%, true)
			fPrintStatus("명예 버튼 클릭")
			if( funcIsExistImageFolder( "7.명예보내기\버튼_명예선물" ) = false ){
					continue
			}
			if( GuiCheckSendFriendsShipOnlyGame = true ) {
				if( funcIsExistImageFolder( "7.명예보내기\상?_수신차단" ) = true  ){
					IntMonitorSendingHonorCount++
					intCountTemp++
					GuiControl, ,GuiSendHonorMoniotor,%IntMonitorSendingHonorCount%
               
               stringTitle=%intCountTemp% / %intCountTry%
					funcPrintSubTitle(stringTitle)
					funcSearchAndClickFolder( "7.명예보내기\버튼_명예선물" )					
				}else{
					fPrintStatus("차단 하지 않은 사용자입니다.")
					funcSendESC()	
				}
			}else if( GuiCheckSendFriendsShipAll = true ){
				funcSearchAndClickFolder( "7.명예보내기\버튼_명예선물" )								
			}			
			if( intCountTemp >= GuiSendFrindShipCount )
				break			
		}
		if( intCountTry >= GuiSendFrindShipCount*2 )
				break
		if( intCountTemp >= GuiSendFrindShipCount )
			break			
		fDragUpFriends()
	}
	
	funcSendESC()
	functionMoveTown()
	if( GuiSendingAfterAdventure = true )
		goto BUTTON시작[F9]
	return
}
gotoKakaoFriends(){

   if( funcIsExistImageFolder("7.명예보내기\상태_카톡친구선택" ) = true ){
		funcSearchAndClickFolder( "7.명예보내기\버튼_접속일업" )
		return
	}else if( funcIsExistImageFolder( "7.명예보내기\상태_친구관리" ) = true  ){
		if ( funcSearchAndClickFolder("7.명예보내기\버튼_카톡친구") = true ){
			funcSearchAndClickFolder( "7.명예보내기\버튼_접속일업" )
			return
		}
	}else{
		functionMoveTown()
	}
	
	if ( funcSearchAndClickFolder("7.명예보내기\버튼_소셜") = true ){
		if ( funcSearchAndClickFolder("7.명예보내기\버튼_친구") = true ){
			if( funcIsExistImageFolder( "7.명예보내기\상태_친구관리" ) = true  ){
            if ( funcSearchAndClickFolder("7.명예보내기\버튼_카톡친구") = true ){
               funcSearchAndClickFolder( "7.명예보내기\버튼_접속일업" )
               return
            }
         }
		}
	}	
	fPrintStatus("카카오톡 친구 페이지로 이동을 실패하였습니다. ")
	gosub END_JOB
}

checkSendingHonorQuit(){
	global BOOLEAN_STOP_SENDING_HORNOR
	if ( BOOLEAN_STOP_SENDING_HORNOR = true ){		
		gosub END_JOB   
	}
}
END_JOB:
{
	fPrintStatus("명예 보내기를 종료합니다.")	
	exit
}

BUTTON보내기종료:
{
	BOOLEAN_STOP_SENDING_HORNOR:=true
	fPrintTitle("명예 보내기 종료")
	fPrintStatus("진행중인 과정이 끝나면 정상적으로 종료됩니다.")	
	return
}

INIT_SEND_HONOR:
{
	BOOLEAN_STOP_SENDING_HORNOR:=false
	SEND_HONOR_BUTTON_X=700
	SEND_HONOR_BUTTON_Y_1=225
	SEND_HONOR_BUTTON_Y_2=300
	SEND_HONOR_BUTTON_Y_3=375
	SEND_HONOR_BUTTON_Y_4=450
	SEND_HONOR_BUTTON_Y_5=525
   return
}

BUTTON레이드시작:
{
	fPrintTitle("레이드모드")
	fPrintStatus("레이드를 시작합니다..")
	
	goto 레이드모드시작
	return
}
BUTTON레이드종료:
{
	fPrintTitle("레이드모드")
	fPrintStatus("레이드를 종료합니다.")
	
	goto 레이드모드종료
	return
}


