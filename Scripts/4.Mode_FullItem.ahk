���_�κ�_�ִ�:
{	   
	fPrintTitle("����κ��ִ�")
	fPrintStatus("��� �ִ��� ��Ȳ�Դϴ�.")
	if( funcSearchAndClickFolder( "6.���豸���ϱ�\��ư_����" ) = true ){
   
   }else{
      functionMoveTown()
   }
   
   if( GuiCheckSellEquip = true ){
      fPrintStatus("��� �ǸŸ� �����մϴ�.")
      sellcount = functionSellItem()   
      if ( sellcount = 0 ){
         BoolNeedSellItem:=false      
      }      
   }else{
      fPrintStatus("��� �ǸŸ� ������ �ʽ��ϴ�.")
      fPrintStatus("���  ���ĵ� ���� �մϴ�.")
      BoolNeedSellItem:=false      
   }
   functionMoveTown()
   fPrintStatus("�ٽ� �����մϴ�.")
   goto, ���۸���

   return
}

functionSellItem()
{
   global IntMonitorPointForByKey
   
   
   fPrintTitle("���豸��:��")
	fPrintStatus("���� ���踦 �����մϴ�.")	
      
   if( funcSearchAndClickFolder( "6.���豸���ϱ�\��ư_����" ) = true ){
      fPrintResult("������ ���Խ��ϴ�.")
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
                        if( funcIsExistImageFolder( "6.���豸���ϱ�\���ſϷ�" ) = true ){                               
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
