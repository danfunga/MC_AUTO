
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


���۸���_��������:
{
	fPrintTitle("�� ������")
	fPrintStatus("�� �����⸦ �����մϴ�.")	
	fPrintStatus("īī���� ģ�� �������� �̵��մϴ�.")
	gotoKakaoFriends()
	
	fPrintTitle("�� ������")
	fPrintStatus("�� �����⸦ �����մϴ�.")
	
	gosub INIT_SEND_HONOR
	intCountTemp :=0
	intCountTry:=0
	loop
	{
		checkExit()
		loop, 5
		{
			checkExit()
         if( intCountTry >= GuiSendFrindShipCount*2 ){
				break
         }
			funcPrintSubTitle( intCountTemp " / " intCountTry)
         intCountTry++ 
         GuiControl, ,GuiCountSendTry,%intCountTry%
         
			funcSendClickFixed( SEND_HONOR_BUTTON_X ,SEND_HONOR_BUTTON_Y_%a_index%, true)
			fPrintStatus("�� ��ư Ŭ��")
			if( funcIsExistImageFolder( "7.��������\��ư_������" ) = false ){
            continue
			}
         
			if( GuiCheckSendFriendsShipOnlyGame = true ) {
				if( funcIsExistImageFolder( "7.��������\����_��������" ) = true  ){
					IntMonitorSendingHonorCount++
					intCountTemp++
               GuiControl, ,GuiCountSendComplete,%IntMonitorSendingHonorCount%
               funcPrintSubTitle( intCountTemp " / " intCountTry)
					funcSearchAndClickFolder( "7.��������\��ư_������" )					
				}else{
					fPrintStatus("���� ���� ���� ������Դϴ�.")
					funcSendESC()	
				}
			}else if( GuiCheckSendFriendsShipAll = true ){
            IntMonitorSendingHonorCount++
            intCountTemp++            
            GuiControl, ,GuiCountSendComplete,%IntMonitorSendingHonorCount%
            funcPrintSubTitle( intCountTemp " / " intCountTry)
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
	BoolNeedSendHonor:=false
	funcSendESC()
	functionMoveTown()
	if( GuiSendingAfterAdventure = true )
		goto, ���۸���    
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


