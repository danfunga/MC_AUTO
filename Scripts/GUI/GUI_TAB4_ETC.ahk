INIT_TAB4:
{ 
	{	
        gui,font,CPurple
        Gui, Add, GroupBox,  x02 y030 w505 h100, �� ����Ʈ ������
        gui,font,
		Gui, Add, Text,x20 yp+18  h15 , ���� : ������ ��� �Ǵ� 2���̻� �õ� �Ͽ� �� �����ϴ�.
		
		Gui, Add, Text, x20 yp+18  h15 , ������ ���� :
		Gui, Add, Edit, x+5 yp-2 w30 h15 right vGuiSendFrindShipCount, 30
		Gui, Add, Text, x+5 yp+2  h15 , ��  ( Main ���������� ���� ���� �����մϴ�. )
		
		Gui, Add, Checkbox, x21 y+3  h15 Checked vGuiSendingAfterAdventure, ������ �������
		Gui, Add, Radio			, x+40			yp   		hp Checked 	vGuiCheckSendFriendsShipOnlyGame, ������ ����� ������
		Gui, Add, Radio			, x+10 			yp  		hp  	vGuiCheckSendFriendsShipAll, ���� ������
		{
			Gui, Add, Text, x20 yp+18  h15  , ���� ����:
			Gui, Add, Text, x+0 yp  w30 h15 right vGuiSendHonorMoniotor , 0			
		}
		{
			Gui, Font, S8 CDefault Bold, Verdana
			Gui, Add, Button, x270 yp w100 h25   vBUTTON_START_SEND_FRIENDSHIP, ������
			Gui, Add, Button, x+30 yp wp hp   vBUTTON_STOP_SEND_FRIENDSHIP, ������ ����
			Gui, Font, , 
		}
	}
	{	
        gui,font,CPurple
        Gui, Add, GroupBox,  x02 y130 w505 h50, ���̵� �ݺ��ϱ�
        gui,font,
		Gui, Add, Text,x20 yp+18  h15 , ���� : ���̵带 �ݺ������� ���ϴ�.
		
	}
		{
			Gui, Font, S8 CDefault Bold, Verdana
			
			Gui, Add, Button, x270 yp w100 h25   vBUTTON_START_LOOP_RAID, ���̵����
			Gui, Add, Button, x+30 yp wp hp   vBUTTON_END_LOOP_RAID, ���̵�����
			Gui, Font, , 
		}
{	
        gui,font,CPurple
        Gui, Add, GroupBox,  x02 yp+35 w505 h60, PushBullet �˸�
        gui,font,
		Gui, Add, Text,x20 yp+18  h15 , ���� : ���谡 ������ �˸��մϴ�.
		
		Gui, Add, Text, x20 yp+18  h15 , ID :
		Gui, Add, Edit, x+5 yp-2 w450 h15 right vGuiPushBulletToken,  
	}
	
	return
}
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


funcChangeTab4Status(){	
	global BoolStarted

	GuiControl, disable%BoolStarted%, GuiSendFrindShipCount
	GuiControl, disable%BoolStarted%, GuiCheckSendFriendsShipOnlyGame
	GuiControl,  disable%BoolStarted%, GuiCheckSendFriendsShipAll
	GuiControl,  disable%BoolStarted%, BUTTON_START_SEND_FRIENDSHIP
	GuiControl,  disable%BoolStarted%, BUTTON_STOP_SEND_FRIENDSHIP

	return
}
BUTTON������:
{
	fPrintTitle("�� ������")
	fPrintStatus("�� �����⸦ �����մϴ�.")
	setUpBeforeStart()	
	fPrintStatus("īī���� ģ�� �������� �̵��մϴ�.")
	gotoKakaoFriends()
	
	fPrintTitle("�� ������")
	fPrintStatus("�� �����⸦ �����մϴ�.")
	
	gosub INIT_SEND_HONOR
	intCountTemp :=0
	intCountTry:=0
	loop
	{
		checkSendingHonorQuit()
		loop, 5
		{
			;~ stringTempTitle=�������� %intCountTemp% / %intCountTry%
			;~ fPrintTitle(stringTempTitle)			
			checkSendingHonorQuit()
			if( intCountTry >= GuiSendFrindShipCount*2 )
					break
			intCountTry++
         stringTitle=%intCountTemp% / %intCountTry%
			funcPrintSubTitle(stringTitle)

			funcSendClickFixed( SEND_HONOR_BUTTON_X ,SEND_HONOR_BUTTON_Y_%a_index%, true)
			fPrintStatus("�� ��ư Ŭ��")
			if( funcIsExistImage( "7.��������\button_������.png" ) = false ){
					continue
			}
			if( GuiCheckSendFriendsShipOnlyGame = true ) {
				if( funcIsExistImage( "7.��������\status_�������ܻ����.png" ) = true  ){
					IntMonitorSendingHonorCount++
					intCountTemp++
					GuiControl, ,GuiSendHonorMoniotor,%IntMonitorSendingHonorCount%
               
               stringTitle=%intCountTemp% / %intCountTry%
					funcPrintSubTitle(stringTitle)
					funcSearchAndClick( "7.��������\button_������.png" )					
				}else{
					fPrintStatus("���� ���� ���� ������Դϴ�.")
					funcSendESC()	
				}
			}else if( GuiCheckSendFriendsShipAll = true ){
				funcSearchAndClick( "7.��������\button_������.png" )								
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
		goto BUTTON����[F9]
	return
}
gotoKakaoFriends(){
	if( funcIsExistImage( "7.��������\status_ī��ģ������.png" ) = true  ){
		funcSearchAndClick( "7.��������\button_������Up.png" )
		return
	}else if( funcIsExistImage( "10.�������üũ\page_ģ������.png" ) = true  ){
		if ( funcSearchAndClick("7.��������\button_ī��ģ��.png") = true ){
			funcSearchAndClick( "7.��������\button_������Up.png" )
			return
		}
	}else{
		functionMoveTown()
	}
	
	if ( funcSearchAndClick("7.��������\button_ģ��.png") = true ){
		if ( funcSearchAndClick("7.��������\button_ī��ģ��.png") = true ){
			funcSearchAndClick( "7.��������\button_������Up.png" )
			return
		}
	}	
	fPrintStatus("īī���� ģ�� �������� �̵��� �����Ͽ����ϴ�. ")
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


