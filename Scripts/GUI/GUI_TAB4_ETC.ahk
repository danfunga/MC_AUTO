INIT_TAB4:
{ 
	
   {	
     gui, 2: font,CPurple
     Gui, 2: Add, GroupBox,  x02 y130 w505 h50, ���̵� �ݺ��ϱ�
     gui, 2: font,
     Gui, 2: Add, Text,x20 yp+18  h15 , ���� : ���̵带 �ݺ������� ���ϴ�.

   }
		{
			Gui, 2: Font, S8 CDefault Bold, Verdana
			
			Gui, 2: Add, Button, x270 yp w100 h25   vBUTTON_START_LOOP_RAID, ���̵����
			Gui, 2: Add, Button, x+30 yp wp hp   vBUTTON_END_LOOP_RAID, ���̵�����
			Gui, 2: Font, , 
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


funcChangePage4Status(){	
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
			if( funcIsExistImageFolder( "7.��������\��ư_������" ) = false ){
					continue
			}
			if( GuiCheckSendFriendsShipOnlyGame = true ) {
				if( funcIsExistImageFolder( "7.��������\����_��������" ) = true  ){
					IntMonitorSendingHonorCount++
					intCountTemp++
					GuiControl, ,GuiSendHonorMoniotor,%IntMonitorSendingHonorCount%
               
               stringTitle=%intCountTemp% / %intCountTry%
					funcPrintSubTitle(stringTitle)
					funcSearchAndClickFolder( "7.��������\��ư_������" )					
				}else{
					fPrintStatus("���� ���� ���� ������Դϴ�.")
					funcSendESC()	
				}
			}else if( GuiCheckSendFriendsShipAll = true ){
				funcSearchAndClickFolder( "7.��������\��ư_������" )								
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

   if( funcIsExistImageFolder("7.��������\����_ī��ģ������" ) = true ){
		funcSearchAndClickFolder( "7.��������\��ư_�����Ͼ�" )
		return
	}else if( funcIsExistImageFolder( "7.��������\����_ģ������" ) = true  ){
		if ( funcSearchAndClickFolder("7.��������\��ư_ī��ģ��") = true ){
			funcSearchAndClickFolder( "7.��������\��ư_�����Ͼ�" )
			return
		}
	}else{
		functionMoveTown()
	}
	
	if ( funcSearchAndClickFolder("7.��������\��ư_�Ҽ�") = true ){
		if ( funcSearchAndClickFolder("7.��������\��ư_ģ��") = true ){
			if( funcIsExistImageFolder( "7.��������\����_ģ������" ) = true  ){
            if ( funcSearchAndClickFolder("7.��������\��ư_ī��ģ��") = true ){
               funcSearchAndClickFolder( "7.��������\��ư_�����Ͼ�" )
               return
            }
         }
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


