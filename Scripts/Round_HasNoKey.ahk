�������_����Ű����:
{	
	fPrintTitle("����Ű����")
	fPrintStatus("����Ű�� ���� �۾��� �����մϴ�.")
	
   functionMoveTown()
   ;~setUpBeforeStart()
   ;MsgBox, %GuiWantByKeyPoint% + %GuiWantByKeyRuby%+ %GuiWantReceiveKey%
   
   if( GuiWantReceiveKey = true ){
      fPrintStatus("���� �ޱ⸦ �����Ͽ��⿡ ������ �����մϴ�.")
       functionReiceiveKey()   
   }
   if( GuiWantByKeyPoint = true ){
      fPrintStatus("�� ������ �����Ͽ� ������ �����մϴ�.")
      functionByKeyByPoint()   
   }
   
   if( GuiWantByKeyRuby = true ){
      fPrintStatus("��� ������ �����Ͽ� ������� �����մϴ�.")
      functionByKeyByRuby()   
   }
     
   if( funcIsExistImage(  "2.���赹��\�������\����Ű����1.bmp" ) = true ){	
      if ( bFirstTimeCheck != true ){
         
        PushNote(GuiPushBulletToken, "MC_Auto_Keys", "NoKeys")
        bFirstTimeCheck:=true
     }

      fPrintStatus("���谡 �����Ƿ� ��ٸ��ڽ��ϴ�.")
      fPrintStatus("�ܼ��� 2�� ������ Ȯ���մϴ�.")
   	Loop, 5
      {
         funcWaitingForNoKeyDelay()
         if( funcIsExistImage(  "2.���赹��\�������\����Ű����2.bmp" ) = true ){		
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

functionReiceiveKey()
{
   fPrintStatus("���� ������ ���� ������ �ȵǾ����ϴ�.")
}

functionByKeyByPoint()
{
   global IntMonitorPointForByKey
   
   
   fPrintTitle("���豸��:��")
	fPrintStatus("���� ���踦 �����մϴ�.")	
      
   if( funcSearchAndClick( "6.���豸���ϱ�\1_��������.bmp" ) = true ){
      fPrintResult("������ ���Խ��ϴ�.")
      if( funcIsExistImage( "6.���豸���ϱ�\2_�����˾�.bmp" ) = true ){             
         fPrintResult("���� �˾��� ���ִ°� �����ϴ�.")
         funcSendESC()
      }
      if( funcIsExistImage( "6.���豸���ϱ�\����ȭ��.bmp" ) = false ){
         fPrintStatus( funcCaptureErrorScreen() )
         fPrintResult("ERROR �˾�ȭ�� ���� ���� �ʿ� --> ���� �˾��� ���ִ°� �����ϴ�.")
         funcSendESC()
      }
      if( funcIsExistImage( "6.���豸���ϱ�\����ȭ��.bmp" ) = true ){             
         fPrintStatus("���� ������ �����մϴ�")
         if( funcSearchAndClick( "6.���豸���ϱ�\����������.bmp" ) = true ){
            
            fPrintStatus("�� 100¥�� ������ �õ��մϴ�.")
            loop
            {
               if( funcSearchAndClick( "6.���豸���ϱ�\��100.bmp" ) = true ){
                  if(  funcSearchAndClick( "6.���豸���ϱ�\���Ź�ư.bmp" ) = true ){
                        if( funcIsExistImage( "6.���豸���ϱ�\���ſϷ�.bmp" ) = true ){                               
                           IntMonitorPointForByKey:=IntMonitorPointForByKey+100
                           GuiControl, ,GuiUsingPointCount,%IntMonitorPointForByKey%
                           funcSendESC()                     
                           fPrintResult("�� 100���� ���踦 �����߽��ϴ�.")                    
                        }else{
                           fPrintResult("ERROR_Ȯ�ο�- ���������� ���ſϷᰡ �ȶߴµ�")                    
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
               ;~ if( funcSearchAndClick( "6.���豸���ϱ�\��10.bmp" ) = true ){
                  ;~ if(  funcSearchAndClick( "6.���豸���ϱ�\���Ź�ư.bmp" ) = true ){
                        ;~ if( funcIsExistImage( "6.���豸���ϱ�\���ſϷ�.bmp" ) = true ){                               
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
            funcSendESC()
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

   fPrintStatus("�� ���� ������ �����մϴ�.")	
}
functionByKeyByRuby()   
{
   fPrintStatus("���� ���� ��������")
}