
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

checkNeedToSend(){
   global GuiSendFrindShipCount
   guiControlGet, sendCount,,GuiCountSendComplete
   guiControlGet, tryCount,,GuiCountSendTry   
   
   msgbox % "sending" sendCount " tryCount " tryCount "Config  " GuiSendFrindShipCount
   if( tryCount >= GuiSendFrindShipCount*2 )
		return false
   return true
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


