���۸���_����������:
{	
	fPrintTitle("����������")
	fPrintStatus("���������� �մϴ�.")
	
	 If( funcSearchAndClickFolder( "3.��������\��ư_��������"  ) = true )
		goto ��������_����������	
	fPrintStatus("ERROR_���۸���_������������ ��ġã��� �̵��մϴ�.")
	goto ��ġã��
} 

��������_����������:
{	
	fPrintTitle("����������")
	fPrintStatus("�������� ȭ�鿡 �����Ͽ����ϴ�.")
	
	If( funcSearchAndClickFolder(  "3.��������\��ư_��������\��ư_������" ) = true )	{
		fPrintStatus("�������� ���մϴ�.")
		goto ��������_������	
	}
	
	fPrintStatus("ERROR_��������_���������� �� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
	return
}

��������_������:
{
	fPrintTitle("������")
	fPrintStatus("������ ���� ���� ȭ���Դϴ�..")
   if( funcIsExistImageFolder( "3.��������\3.����������\ȭ��_��������" ) = true )	{      
      fPrintStatus("������ �����մϴ�. ")
      
      xPos:=funcLoadConstants( vValue, "CastleBattle", A_WDay "_X" )       
      yPos:=funcLoadConstants( vValue, "CastleBattle", A_WDay "_Y" )       
      funcSendClickFixed( xPos, yPos , true)
		goto AUTOMODE_CASTLEBATTLE
      
	}	
   fPrintStatus("ERROR_��������_������ �� ��ġã��� �̵��մϴ�.")
	goto ��ġã��

}   
	



AUTOMODE_CASTLEBATTLE:
{ 
   fPrintTitle("������ ����")
	fPrintStatus("������ ������ �����մϴ�.")
   
   fPrintStatus("������ �߻��Ͽ����� Ȯ���մϴ�.")
	if( funcIsExistImageFolder(  "10.�˾����̺�Ʈ\����Ȯ��â" ) = true ){		
		fPrintStatus("���� Ȯ���� �����մϴ�.")
		gosub �������_����Ȯ��
	}
   
   If( funcSearchAndClickFolder( "3.��������\3.����������\��ư_�غ��ϱ�" ) = true )
		goto AUTOMODE_CASTLEBATTLE1
	fPrintStatus("ERROR_������ ���� �� ��ġã��� �̵��մϴ�.")
	goto ��ġã��

   return   
}
AUTOMODE_CASTLEBATTLE1:
{
   fPrintStatus("������ ���� �غ� �����մϴ�.")
   
   if( funcIsExistImageFolder( "3.��������\3.����������\����_����FULL" ) = true ){
      BoolNeedCastleBattle:=false
      fPrintTitle("������ ���� �Ϸ�")
      fPrintStatus("�������� Ƚ���� ��� �����Ͽ����ϴ�.")
      funcWaitingClick()
      functionMoveTown()
      goto ���۸���
   }   
	fPrintStatus( "������ ������ ��ų�� " GuiListSkillCastle "�Դϴ�")   
	funcChoicePlayerSkill( GuiListSkillCastle )
   goto AUTOMODE_CASTLEBATTLE_STARTBATTLE  
     
  return
}
AUTOMODE_CASTLEBATTLE_STARTBATTLE:
{
   fPrintTitle("������ ����")
	fPrintStatus("�������� �����մϴ�.")
	
	if ( funcSearchAndClickFolder("3.��������\3.����������\��ư_�����ϱ�") = true ){
		goto, AUTOMODE_CASTLEBATTLE_CHECK_START
	}
	fPrintStatus("ERROR_������ ������ ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}

AUTOMODE_CASTLEBATTLE_CHECK_START:
{	
	fPrintTitle("������ ����")
   
   if ( funcSearchAndClickFolder("3.��������\3.����������\��ư_�����ϱ�") = true ){
      ;~ �ٽ� �ѹ� Ŭ������
		goto, AUTOMODE_CASTLEBATTLE_CHECK_START
	}
   if ( funcIsExistImageFolder("3.��������\3.����������\�˾�_�߰�����") = true ){
      BoolNeedCastleBattle:=false
      fPrintStatus("�������� ��� ���ҽ��ϴ�.")
      funcSearchAndClickFolder("3.��������\3.����������\�˾�_�߰�����\��ư_�ƴϿ�")
		functionMoveTown()
      goto ��ġã��
	}
   fPrintStatus("������ ������ �����Ͽ����ϴ�. ���� ������ ��ٸ��ϴ�.")		
	funcWaitingForLoad()   
   loop 3
   {
      if( funcIsExistImageFolder( "3.��������\3.����������\��ư_����_2��_ON" ) = true ){		
         fPrintStatus("�������� ���������� ���۵Ǿ����ϴ�.")
         goto AUTOMODE_CASTLEBATTLE_CHECK_END
      }		
      funcWaitingClick()
   }
   fPrintStatus("ERROR_������ ����üũ�� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
	return
}
AUTOMODE_CASTLEBATTLE_CHECK_END:
{
   if( funcIsExistImageFolder( "������\�ڵ���ų\On" ) = false ){
      funcSearchAndClickFolder( "������\�ڵ���ų\Off" )         
   }    
   funcWaitingBattleBasicDuration()   
   fPrintStatus("5�ʾ� ���������� ���Ḧ Ȯ���մϴ�.")
	loop{
      
		if( funcIsExistImageFolder( "3.��������\3.����������\����_��������" ) = true ){		
			break	
		}      
      if( funcIsExistImage( "10.��������̹���\����\����W�ٽ�.bmp" ) = true  or funcIsExistImage( "10.��������̹���\����\����F�ٽ�.bmp" ) = true ){		
         fPrintTitle("����������")
         fPrintStatus("���������ΰ����� Ȯ���� �˴ϴ�. ���¸� �����մϴ�.")
         goto ������_����_������			
		}
      funcWaitingForBattleCheck()
		if( A_index > 60 ){
			fPrintStatus("6�а� ��ٷ����� ������ ���� ���� �ʽ��ϴ�.")	
			fPrintStatus("Error�� �Ǵ��մϴ�.")				
			fPrintStatus("ERROR_������_����_�������� ��ġã��� �̵��մϴ�. ")
			goto ��ġã��
		}		
      
      
      
      funcWaitingForBattleCheck()
		if( A_index > 360 ){
			fPrintStatus("30�а� ��ٷ����� �������� ���� ���� �ʽ��ϴ�.")	
			fPrintStatus("Error�� �Ǵ��մϴ�.")				
         functionMoveTown()
         goto ��ġã��
		}		
	}
	fPrintStatus("������ ������ Ȯ�εǾ����ϴ�.")				
	goto, AUTOMODE_CASTLEBATTLE_RESULT
}
AUTOMODE_CASTLEBATTLE_RESULT:
{
   fPrintTitle("������ ����")
	fPrintStatus("�������� Ŭ���մϴ�.")
	if ( funcSearchAndClickFolder("3.��������\3.����������\��ư_����_������") = true ){
		funcWaitingForLoad()
		goto, AUTOMODE_CASTLEBATTLE
	}
	fPrintStatus("ERROR_������ ������ ��ġã��� �̵��մϴ�. ")
	goto ��ġã��   
   return
}