
fDragUpFriends(){	
	fPrintStatus("�巡�� Up")	
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
	fPrintStatus("�� �����⸦ �����մϴ�.")	
	exit
}

BUTTON����������:
{
	BOOLEAN_STOP_SENDING_HORNOR:=true
	fPrintTitle("�� ������ ����")
	fPrintStatus("�������� ������ ������ ���������� ����˴ϴ�.")	
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

BUTTON���̵����:
{
	fPrintTitle("���̵���")
	fPrintStatus("���̵带 �����մϴ�..")
	
	goto ���̵������
	return
}
BUTTON���̵�����:
{
	fPrintTitle("���̵���")
	fPrintStatus("���̵带 �����մϴ�.")
	
	goto ���̵�������
	return
}


