�������_����Ű����:
{	
	fPrintTitle("����Ű����")
	fPrintStatus("����Ű�� ���� �۾��� �����մϴ�.")
	
   functionMoveTown()
   ;~setUpBeforeStart()
   ;MsgBox, %GuiWantByKeyPoint% + %GuiWantByKeyRuby%+ %GuiWantReceiveKey%
   
   if( GuiWantByKeyPoint = true ){
      fPrintStatus("�� ������ �����Ͽ� ������ �����մϴ�.")
      functionByKeyByPoint()   
   }
   
   if( GuiWantByKeyRuby = true ){
      fPrintStatus("��� ������ �����Ͽ� ������� �����մϴ�.")
      functionByKeyByRuby()   
   }
     
   if( funcIsExistImageFolder(  "2.���赹��\�������\����_0" ) = true ){	
      if ( bFirstTimeCheck != true ){         
       ; PushNote(GuiPushBulletToken, "MC_Auto_Keys", "NoKeys")
        bFirstTimeCheck:=true
      }
      
      fPrintTitle("10�д��")
      fPrintStatus("���谡 �����Ƿ� ��ٸ��ڽ��ϴ�.")
      fPrintStatus("�ܼ��� 2�� ������ Ȯ���մϴ�.")
   	Loop, 5
      {
         funcWaitingForNoKeyDelay()
         if( funcIsExistImageFolder(  "4.���̵嵹��\����_����\���̵����" ) = true ){		
            goto, ���۸���
         }         
      }
   }else{
      fPrintStatus("���谡 ������ �ٽ� �����մϴ�.")
      goto, ���۸���
   }

	fPrintStatus("ERROR_�������_����Ű������ ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
   return
}
����⼮üũ:
   fPrintTitle("�⼮üũ")
   fPrintStatus("���̵� ������ �⼮ Ȯ���մϴ�.")

   if( funcSearchAndClickFolder( "9.����⼮\��ư_���" ) = true ){
      if( funcSearchAndClickFolder( "9.����⼮\��ư_�⼮" ) = true ){
         fPrintStatus(" �⼮�Ͽ����ϴ�. ^^")      
      }else{
         if( funcIsExistImageFolder( "9.����⼮\��ư_�ڱ�湮" ) = true ){
            fPrintStatus("�⼮�� Ȯ�εǾ����ϴ�.")      
         }else{         
            fPrintStatus("ERROR_�⼮�� �������� �湮ǥ�õ� ���� �ʽ��ϴ�. ")      
         }
      }
      funcSearchAndClickFolder( "9.����⼮\��ư_�ڷ�" )
   }else{
      fPrintStatus("ERROR_����ư�� ����Ǿ��� ���ϴ�. Ȯ���ϼ���")
   }
return

functionByKeyByPoint()
{
   global IntMonitorPointForByKey
   
   
   fPrintTitle("���豸��:��")
	fPrintStatus("���� ���踦 �����մϴ�.")	
      
   if( funcSearchAndClickFolder( "6.���豸���ϱ�\��ư_����" ) = true ){
      if( funcSearchAndClickFolder( "6.���豸���ϱ�\��ư_����\��ư_2������" ) = true ){
         
         if( funcIsExistImageFolder( "6.���豸���ϱ�\�˾�_�����˾�" ) = true ){             
            fPrintResult("���� �˾��� ���ִ°� �����ϴ�.")
            funcSendESC()
         }
         fPrintResult("������ ���ϴ�..")
         if( funcWaitAndReturn("6.���豸���ϱ�\����_����ȭ��", 6, 20 , true ) = true ){
            fPrintResult("���� ȭ�鿡 ��� �Խ��ϴ�.")
         }else{
            fPrintResult("ERROR_ 2�е��� ��ٷ��� ������ ������ ���Ͽ����ϴ�. '����_����ȭ��'�� Ȯ���ϼ��� ")
         }
      }
      
      if( funcIsExistImageFolder( "6.���豸���ϱ�\�˾�_�����˾�" ) = true ){             
         fPrintResult("���� �˾��� ���ִ°� �����ϴ�.")
         funcSendESC()
      }
      if( funcIsExistImageFolder( "6.���豸���ϱ�\����_����ȭ��" ) = false ){
         fPrintStatus( funcCaptureErrorScreen() )
         fPrintResult("ERROR �˾�ȭ�� ���� ���� �ʿ� --> ���� �˾��� ���ִ°� �����ϴ�.")
         funcSendESC()
      }
      if( funcIsExistImageFolder( "6.���豸���ϱ�\����_����ȭ��" ) = true ){             
         fPrintStatus("���� ������ �����մϴ�")
         if( funcSearchAndClickFolder( "6.���豸���ϱ�\����_����ȭ��\��ư_������" ) = true ){
            
            fPrintStatus("�� 100¥�� ������ �õ��մϴ�.")
            loop
            {
               if( funcSearchAndClickFolder( "6.���豸���ϱ�\����_����ȭ��\��ư_��100" ) = true ){
                  if(  funcSearchAndClickFolder( "6.���豸���ϱ�\��ư_�����ϱ�" ) = true ){
                        if( funcIsExistImageFolder( "6.���豸���ϱ�\����_���ſϷ�" ) = true ){                               
                           IntMonitorPointForByKey:=IntMonitorPointForByKey+100
                           GuiControl, ,GuiUsingPointCount,%IntMonitorPointForByKey%
                           funcSendESC()                     
                           fPrintResult("�� 100���� ���踦 �����߽��ϴ�.")                    
                        }else{                           
                           fPrintResult("ERROR_Ȯ�ο�- ���������� ���ſϷᰡ �ȶߴµ�")     
                           fPrintStatus( funcCaptureErrorScreen() )                           
                           funcSendESC()                                               
                        }
                  }else{
                     fPrintResult("�� 100¥�� �����ϱ⿡ ���� �����Ͽ����ϴ�..")
                     funcSendESC()                     
                     break                  
                  }
               }else{
                  fPrintStatus("ERROR ���� ������ �߸��Ǿ����ϴ�. ��100�� Ŭ�� ���մϴ�.")
                  break
               }
            }
            ;~ fPrintStatus("�� 10���� ���� ������ �õ��մϴ�.")
            ;~ loop
            ;~ {
               ;~ if( funcSearchAndClickFolder( "6.���豸���ϱ�\����_����ȭ��\��ư_��10" ) = true ){
                  ;~ if(  funcSearchAndClick( "6.���豸���ϱ�\���Ź�ư.bmp" ) = true ){
                        ;~ if( funcIsExistImageFolder( "6.���豸���ϱ�\����_���ſϷ�" ) = true ){                               
                           ;~ INT_POINT_FOR_BUY_KEY:=INT_POINT_FOR_BUY_KEY+10
                           ;~ GuiControl, ,GuiUsingPointCount,%INT_POINT_FOR_BUY_KEY%
                           ;~ funcSendESC()                     
                           ;~ fPrintStatus("�� 10���� ���踦 �����߽��ϴ�.")
                        ;~ }
                  ;~ }else if( funcIsExistImage( "6.���豸���ϱ�\������.bmp" ) = true ){    
                     ;~ funcSendESC()
                     ;~ fPrintStatus("�� 10¥�� �����ϱ⿡ ���� �����Ͽ����ϴ�..")
                     ;~ break
                  ;~ }      
               ;~ }else{
                  ;~ fPrintStatus("ERROR ���� ������ �߸��Ǿ����ϴ�. ��10�� Ŭ�� ���մϴ�.")
                  ;~ break
               ;~ }
            ;~ }
            
            functionMoveTown()
            fPrintStatus("�� ���� ������ �����մϴ�.")
            return
         }else{
            fPrintStatus("���踦 ���������� �������� ���߽��ϴ�...")      
            funcSendESC()
         }
      }  
   }else{
      fPrintStatus("���� ���� ���ϰ� �����մϴ�.")	
   }
   functionMoveTown()
   fPrintStatus("�� ���� ������ �����մϴ�.")	
}
functionByKeyByRuby()   
{
   fPrintStatus("���� ���� ��������")
}

