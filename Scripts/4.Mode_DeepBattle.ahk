���۸���_�ɿ�������:
{	
	fPrintTitle("�ɿ�����")
	fPrintStatus("�ɿ��� ž�� ���ڽ��ϴ�.")
	
	 If( funcSearchAndClickFolder( "3.��������\��ư_��������"  ) = true )
		goto ��������_�ɿ���ž_����	
	fPrintStatus("ERROR_���۸���_�ɿ��������� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
} 

��������_�ɿ���ž_����:
{	
	fPrintTitle("�ɿ�����")
	fPrintStatus("�������� ȭ�鿡 �����Ͽ����ϴ�.")
	
	If( funcSearchAndClickFolder(  "3.��������\��ư_��������\��ư_�ɿ���ž" ) = true )	{
		fPrintStatus("�ɿ��� ž�� �����մϴ�..")
		goto ��������_�ɿ���ž	
	}
	
	fPrintStatus("ERROR_��������_�ɿ���ž_���� �� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
	return
}

��������_�ɿ���ž:
{
	fPrintTitle("�ɿ���ž")
	fPrintStatus("�ɿ��� ž�� �����Ͽ����ϴ�.")
   if( funcSearchAndClickFolder( "3.��������\4.�ɿ�ž����\��ư_�غ��ϱ�" ) = true )	{       
      if( funcSearchAndClickFolder("3.��������\4.�ɿ�ž����\��ư_�����ϱ�") = true ){
         if( funcSearchAndClickFolder("3.��������\4.�ɿ�ž����\��ư_�����ϱ�\�˾�_�������") = true ){         
            BoolNeedDeepBattle:=false
            funcSearchAndClickFolder("3.��������\4.�ɿ�ž����\��ư_�����ϱ�\�˾�_�������\��ư_Ȯ��")
            functionMoveTown()
            goto ���۸���            
         }else{
            funcWaitingForLoad()   
            goto �ɿ���ž_�����غ�
         }         
      }
	}	
   fPrintStatus("ERROR_��������_�ɿ���ž �� ��ġã��� �̵��մϴ�.")
	goto ��ġã��

}   

�ɿ���ž_�����غ�:
{ 
   fPrintTitle("�ɿ���ž")
	fPrintStatus("�ɿ��� ž ���� ���� ��� ȭ���Դϴ�.")
   
   If( funcSearchAndClickFolder( "3.��������\4.�ɿ�ž����\��ư_�����ϱ�" ) = true )
		goto �ɿ���ž_��������
	fPrintStatus("ERROR_������ ���� �� ��ġã��� �̵��մϴ�.")
	goto ��ġã��

   return   
}
�ɿ���ž_��������:
{
   fPrintTitle("�ɿ�����")
	fPrintStatus("�ɿ���ž ������ �����մϴ�..")
	 if ( funcSearchAndClickFolder("3.��������\4.�ɿ�ž����\��ư_�����ϱ�") = true ){
      ;~ �ٽ� �ѹ� Ŭ������
		goto �ɿ���ž_��������
	}
	
   fPrintStatus("�ɿ���ž ������ �����Ͽ����ϴ�. ���� ������ ��ٸ��ϴ�.")		
	funcWaitingForLoad()   
   loop 3
   {
      if( funcIsExistImageFolder( "3.��������\3.����������\��ư_����_2��_ON" ) = true ){		
         fPrintStatus("�ɿ���ž�� ���������� ���۵Ǿ����ϴ�.")
         goto �ɿ���ž_��������_��
      }		
      funcWaitingClick()
   }
   fPrintStatus("ERROR_�ɿ���ž_���������� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
	return
}
�ɿ���ž_��������_��:
{
   if( funcIsExistImageFolder( "������\�ڵ���ų\On" ) = false ){
      funcSearchAndClickFolder( "������\�ڵ���ų\Off" )         
   }         
   fPrintStatus("5�ʾ� ���������� ���Ḧ Ȯ���մϴ�.")
	loop{      
		if( funcIsExistImageFolder( "3.��������\4.�ɿ�ž����\����_��������" ) = true ){		
			break	
		}      
      funcWaitingForBattleCheck()
      fPrintStatus( "�ɿ� ������ : " A_index " / 120 ( " BATTLE_CHECK_DELAY "sec )")				
		if( A_index > 120 ){
			fPrintStatus("120 ȸ ��ٷ����� ������ ���� ���� �ʽ��ϴ�.")	
			fPrintStatus("Error�� �Ǵ��մϴ�.")				
			fPrintStatus("ERROR_�ɿ���ž_��������_�� ��ġã��� �̵��մϴ�. ")
			goto ��ġã��
		}		
           
	}
	fPrintStatus("�ɿ��� ���� ���ᰡ Ȯ�εǾ����ϴ�.")				
	goto, �ɿ���ž_��������
}
�ɿ���ž_��������:
{
   fPrintTitle("�ɿ���ž")
	fPrintStatus("�ɿ���ž ������ �����մϴ�.")

   BoolNeedDeepBattle:=false
   functionMoveTown()
   goto ���۸���       
   return
}