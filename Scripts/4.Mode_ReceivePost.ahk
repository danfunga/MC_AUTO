
ReceivePost:
   fPrintTitle("���� ����")
	fPrintStatus("���̵� ���� �� ������ �����մϴ�.")
   
	if( funcSearchAndClickFolder( "9.����ޱ�\��ư_��������" ) = true ){
     functionReceivePost()
     fPrintStatus("������ ���ư��ϴ�.")
     funcSearchAndClickFolder("9.����ޱ�\����_����ޱ�\��ư_�ڷ�")     
   }else{
      fPrintStatus("������ ������ ���ų�, ���� ��ư�� �����ϴ�.(ERROR) ")
   }
   
   
return

functionReceivePost(){
   global ReceiveHonor, ReceiveKey, ReceiveGold, ReceiveRuby, ReceiveItem
;   msgbox,  % "��"ReceiveHonor "����"ReceiveKey "���"ReceiveGold "���"ReceiveRuby "������"ReceiveItem
   if( ReceiveHonor = true ){
      functionReceive("��")
   }
   if( ReceiveKey = true ){
      functionReceive("����")      
   }
   if( ReceiveGold = true ){
      functionReceive("���")
   }
   
   if( ReceiveRuby = true ){
      functionReceive("���")
   }
   
   if( ReceiveItem = true ){
      functionReceive("��ȯ��")
   }
   return 
}

functionReceive( target ){
; 9.����ޱ�\����_����ޱ�\��\��_��
   if( funcSearchAndClickFolder("9.����ޱ�\����_����ޱ�\��\��_"target ) =  true ){   
      if( functionReceiveAll() = false ){
         fPrintStatus( target " ������ �ߴ� �Ǿ����ϴ�.")	
         if( target = "��" ){         
            ; ���� �̰��� �ɸ� ���̴�. ���� ���� �������� .
            
            loop{
               fPrintStatus( target "�� ���ѿ� �ɷȽ��ϴ�. ")	
               functionMoveTown()
               functionByKeyByPoint() 
               if( funcSearchAndClickFolder( "9.����ޱ�\��ư_��������" ) = true ){
                  if( funcSearchAndClickFolder("9.����ޱ�\����_����ޱ�\��\��_��" ) = true ){
                     if( functionReceiveAll() = true ){
                        fPrintStatus( "���� ��� �����Ͽ����ϴ�.")	
                        return
                     }else{
                        continue
                     }                     
                  }
               }
            
            }                        
         }                 
         
      }else{
         fPrintStatus( target "�� �����Ͽ����ϴ�.")	
         return 
      }
   }
   fPrintStatus( target " ������ ���׿�")	
   return   
}

functionReceiveAll(){
   if( funcSearchAndClickFolder("9.����ޱ�\����_����ޱ�\��ư_��ιޱ�" ) =  true ){
      if( funcWaitAndReturn("9.����ޱ�\����_����ޱ�\�˾�_������", 5, 60 , true ) = true ){
         if( funcIsExistImageFolder("9.����ޱ�\����_����ޱ�\�˾�_������\����_�����ߴ�") = true ){
            funcSearchAndClickFolder("9.����ޱ�\����_����ޱ�\�˾�_������\��ư_Ȯ��")
            return false
         }else{
            funcSearchAndClickFolder("9.����ޱ�\����_����ޱ�\�˾�_������\��ư_Ȯ��")
            return true            
         }
      }else{
         
         fPrintStatus("ERROR - ������ �ʹ� ���ų� '9.����ޱ�\����_����ޱ�\�˾�_������'�� �ٲ�����ϴ�. Ȯ���ϼ���")	
         funcSearchAndClickFolder("9.����ޱ�\����_����ޱ�\�˾�_������\��ư_Ȯ��")
         ; skip�� ���� true�� return 
         return true
      }
   }
}