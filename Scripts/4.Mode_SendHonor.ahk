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

SendHonorToFriend:
   fPrintTitle("�� ������")
	fPrintStatus("���� ģ������ ���� �����ϴ�..")	

      
   loop{
      gotoGameFriends()
      if( sendToFriend() = true ){
         break
      }
      functionMoveTown()
      functionByKeyByPoint()      
   }
   functionMoveTown()
return
   sendToFriend(){
      if( funcIsExistImageFolder("7.��������\��ư_����ģ��\����_NEW") = true ){
         if( funcSearchAndClickFolder("7.��������\��ư_����ģ��\����_NEW\��ư_��κ�����" ) =  true ){
            if( funcSearchAndClickFolder("7.��������\��ư_����ģ��\����_NEW\��ư_��κ�����\��ư_������" ) = true ){ 
               if( funcWaitAndReturn("7.��������\��ư_����ģ��\�˾�_���ۿϷ�", 5, 60 , true ) = true ){
                  if( funcIsExistImageFolder("7.��������\��ư_����ģ��\�˾�_���ۿϷ�\����_��������") = true ){
                     funcSearchAndClickFolder("7.��������\��ư_����ģ��\�˾�_���ۿϷ�\����_��������\��ư_Ȯ��")
                     return false
                  }else{
                     funcSearchAndClickFolder("7.��������\��ư_����ģ��\�˾�_���ۿϷ�\��ư_Ȯ��")
                     return true            
                  }
         
               }
            }
         }
   
      }
      return true
   }
   

gotoGameFriends(){
   if( funcSearchAndClickFolder( "7.��������\��ư_����ģ��" ) = true  ){
      return
   }
   functionMoveTown()
	if ( funcSearchAndClickFolder("7.��������\��ư_�Ҽ�") = true ){
		if ( funcSearchAndClickFolder("7.��������\��ư_ģ��") = true ){
			funcSearchAndClickFolder("7.��������\��ư_����ģ��") 
         return         
      }
   }	
	fPrintStatus("īī���� ģ�� �������� �̵��� �����Ͽ����ϴ�. ")
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
