AUTOMODE_CASTLEBATTLE:
{ 
   fPrintTitle("������ ����")
	fPrintStatus("������ ������ �����մϴ�.")
   
   fPrintStatus("������ �߻��Ͽ����� Ȯ���մϴ�.")
	if( funcIsExistImageFolder(  "10.�˾����̺�Ʈ\����Ȯ��â" ) = true ){		
		fPrintStatus("���� Ȯ���� �����մϴ�.")
		gosub �������_����Ȯ��
	}
   
   If( funcSearchAndClick( "��������\������\Button_�������غ�.png" ) = true )
		goto AUTOMODE_CASTLEBATTLE1
	fPrintStatus("ERROR_������ ���� �� ��ġã��� �̵��մϴ�.")
	goto ��ġã��

   return   
}
AUTOMODE_CASTLEBATTLE1:
{
   fPrintStatus("������ ���� �غ� �����մϴ�.")
   
   if( funcIsExistImage( "��������\������\Status_��������_full.png" ) = true ){
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
	
	if ( funcSearchAndClick("��������\������\Button_����������.png") = true ){
		goto, AUTOMODE_CASTLEBATTLE_CHECK_START
	}
	fPrintStatus("ERROR_������ ������ ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}

AUTOMODE_CASTLEBATTLE_CHECK_START:
{	
	fPrintTitle("������ ����")
   
   if ( funcSearchAndClick("��������\������\Button_����������.png") = true ){
      ;~ �ٽ� �ѹ� Ŭ������
		goto, AUTOMODE_CASTLEBATTLE_CHECK_START
	}
   if ( funcIsExistImage("��������\������\Status_�����߰�����.png") = true ){
   
      fPrintStatus("�������� ��� ���ҽ��ϴ�.")
      funcSearchAndClick("��������\������\Button_������_�߰�����_�ƴϿ�.png")
		functionMoveTown()
      goto ��ġã��
	}
   fPrintStatus("������ ������ �����Ͽ����ϴ�. ���� ������ ��ٸ��ϴ�.")		
	funcWaitingForLoad()   
   loop 3
   {
      if( funcIsExistImage( "��������\������\Button_������_2��_ON.png" ) = true ){		
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
   funcWaitingBattleBasicDuration()
   
   fPrintStatus("5�ʾ� ���������� ���Ḧ Ȯ���մϴ�.")
	loop{
      
		if( funcIsExistImage( "��������\������\Status_����_����.png" ) = true ){		
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
	if ( funcSearchAndClick("��������\������\Button_��������_������.png") = true ){
		funcWaitingForLoad()
		goto, AUTOMODE_CASTLEBATTLE
	}
	fPrintStatus("ERROR_������ ������ ��ġã��� �̵��մϴ�. ")
	goto ��ġã��   
   return
}