���۸���_Ȳ�ݹ����:
{	
	fPrintTitle("Ȳ�ݹ�����")
	fPrintStatus("���������� �մϴ�.")
	
	 If( funcSearchAndClick( "���۸���\��������.bmp"  ) = true )
		goto ��������_Ȳ�ݹ浹��	
	fPrintStatus("ERROR_���۸���_��������� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
} 

��������_Ȳ�ݹ浹��:
{	
	fPrintTitle("Ȳ�ݹ�����")
	fPrintStatus("�������� ȭ�鿡 �����Ͽ����ϴ�.")
	
	If( funcSearchAndClick(  "��������\��ž����.bmp", -20, 60 ) = true )	{
		fPrintStatus("������ ž�� �����մϴ�.")
		goto ��������_������ž	
	}
	
	fPrintStatus("ERROR_���۸���_Ȳ�ݹ� �� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
	return
}

��������_������ž:
{	
	fPrintTitle("������  ž")
	fPrintStatus("������ž ȭ�鿡 �����Ͽ����ϴ�.")
   if ( funcIsExistImage("��������\Status_����ž_�������.bmp") = true ){
      BoolNeedGoldRoomStage:=false
      functionMoveTown()
      goto, ���۸���
   }
   
	if( funcSearchAndClick( "��������\Ȳ�ݼ���.bmp" ) = true )	{
		goto ��������_Ȳ���ǹ�
	}	
	fPrintStatus("ERROR_��������_������ž �� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
	return
}

��������_Ȳ���ǹ�:
{
	fPrintTitle("Ȳ���� ��")
	fPrintStatus("Ȳ���ǹ� �������� �Խ��ϴ�.")
	
   fPrintStatus("Ȳ�ݹ� ���� �����մϴ�.")
	vLine=������ Ȳ������ %GuiListTeamGoldRoom%�Դϴ�.
	fPrintStatus(vLine)   
   funcChoiceTeam( GuiListTeamGoldRoom )
   funcChoicePlayerSkill( GuiListTeamGoldRoom )
   
	goto,Ȳ���ǹ�_��������	

	fPrintStatus("ERROR_��������� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
	return
}
Ȳ���ǹ�_��������:
{	
	fPrintTitle("Ȳ�ݹ����")
	fPrintStatus("Ȳ�ݹ���  �����մϴ�.")
   if ( funcIsExistImage("��������\Status_����ž_�������.bmp") = true ){
      BoolNeedGoldRoomStage:=false
      functionMoveTown()
      goto, ���۸���
   }
   if( funcIsExistImageFolder("10.�˾����̺�Ʈ\����Ȯ��â"  ) = true ){
      gosub �������_����Ȯ��
   }
  
	if ( funcSearchAndClick("3.Ȳ�ݹ浹��\Button_Ȳ��_�����ϱ�.bmp") = true ){
		goto, Ȳ���ǹ�_��������_����üũ
	}


	fPrintStatus("ERROR_Ȳ���ǹ�_���������� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}
Ȳ���ǹ�_��������_����üũ:
{
	fPrintStatus("Ȳ�ݹ� ������ üũ�մϴ�.")	   
   if( funcSearchAndClick("��������\��žŰ����.bmp") = true ){
			BoolNeedGoldRoomStage:=false
			fPrintStatus("��žŰ�� �����ϱ⿡ �����ϴ�.")
			funcSendESC()
         If( funcIsExistImage( "��������\Ȳ�ݼ���.bmp"  ) = true ){
				fPrintStatus("������ž ȭ�� �Դϴ�. ")
				funcSendESC()            
			}
         If( funcIsExistImage( "��������\��������ȭ��.bmp"  ) = true ){
				fPrintStatus("���� ���� ȭ�� �Դϴ�. ")
				funcSendESC()           
			}
         If( funcIsExistImage( "���۸���\���������ư.bmp"  ) = true ){
				fPrintStatus("���� ������ ���ƿԽ��ϴ�.")
				goto, ���۸���
			}
			fPrintStatus("������ ž�ΰ� �����ϴ�.")
			funcSendESC()
			goto, ���۸���
   }else{     
       funcWaitingForLoad()
       if( funcWaitAndReturn(  "������\����������" ) = true ){
          fPrintStatus("Ȳ�ݹ� ������ ���������� Ȯ�εǾ����ϴ�..")
          if( GuiGoldRoomAutoSkill = true ){
            fPrintStatus("Ȳ�ݹ� ��ų ��ũ�� ����� �����Ͽ����ϴ�.")	
            goto Ȳ�ݹ潺ų��ũ�λ��	
          }else{
            goto ������_Ȳ�ݹ�
          }
       }      
	}
  
	fPrintStatus("ERROR_Ȳ���ǹ�_��������_����üũ�� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}
Ȳ�ݹ潺ų��ũ�λ��:
{	
	Gui, Submit, NoHide
	fPrintTitle("Ȳ�ݹ潺ų")
	fPrintStatus("������ ��ų�� ����մϴ�.")	
	Loop, 3
	{        
		if( GuiCheckGoldChar%a_index% = true ) {		
			strCharName:=GuiGoldChar%a_index%
			if( GuiSkill1GoldChar%a_index% = true ){
				guiControlGet, skillName,,GuiSkill1GoldChar%a_index%,text
			}else if (  GuiSkill2GoldChar%a_index% = true ){
				guiControlGet, skillName,,GuiSkill2GoldChar%a_index%,text
			}else{
				fPrintStatus("�� ��ų ��� ������� �������� �����Ǿ� �ֽ��ϴ�.")
				continue
			}
         funcWaitingBeforeGoldSkill( a_index )
	
   
         skillFolder=10.��ų�̹���\%strCharName%\%skillName%
			delayFolder=10.��ų�̹���\%strCharName%\%skillName%\delay
		
			vStatus=%a_index%�� ��ų�� %strCharName%�� %skillName%(��)�� ����մϴ�.				
			fPrintStatus(vStatus)			
			funcUsingSkillAndWaitDelay( skillFolder, delayFolder, skillName)  
			
		}else{
			vStatus=%a_index%�� ��ų�� �������� �ʾҽ��ϴ�.		
			fPrintStatus(vStatus)
		}	
   }
    fPrintStatus("��ų ����� �����մϴ�.")
   goto ������_Ȳ�ݹ�_������
	return
}
funcWaitingBeforeGoldSkill( skillIndex ){   
   guiControlGet,skillDelay,,GuiGoldSkillDelay%skillIndex%,text
   vStatus= %skillIndex%�� ��ų ����� %skillDelay%�ʰ� ����մϴ�.
   if( skillDelay = 0 )
   {
      vStatus= %skillIndex%�� ��ų ����� ������ ���� �����մϴ�.
      fPrintResult(vStatus) 
      return
   }
   fPrintResult(vStatus)
   funcSleep(skillDelay)   
   return 
}

������_Ȳ�ݹ�:
 {
	funcWaitingBattleBasicDuration()
	goto, ������_Ȳ�ݹ�_������	
}
������_Ȳ�ݹ�_������:
 {
	fPrintTitle("Ȳ�ݹ�����")
	fPrintStatus("5�ʾ� ���������� ���Ḧ Ȯ���մϴ�.")
	loop{
		if( funcIsExistImage( "10.��������̹���\Ȳ�ݹ�\������ž�ٽ�.bmp" ) = true ){		
			IntMonitorGoldRoomClearCount++			
			GuiControl, ,CountGoldRoom,%IntMonitorGoldRoomClearCount%
			fPrintStatus("Ȳ�ݹ� ���� �Ϸᰡ Ȯ�εǾ����ϴ�.")	
			goto, �������_Ȳ�ݹ�
		}
		funcWaitingForBattleCheck()
		if( A_index > 120 ){
			fPrintStatus("������ �ʹ� ���� �ɸ��°� �����ϴ�.")	
			fPrintStatus("Error�� �Ǵ��մϴ�.")				
			break
		}		
	}
	fPrintStatus("ERROR_������_Ȳ�ݹ�_�������� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}


�������_Ȳ�ݹ�:
{
	fPrintTitle("Ȳ�ݹ���")		
	fPrintStatus("�ٽ� �ϱ⸦ Ŭ���մϴ�.")
	if( funcSearchAndClick( "10.��������̹���\Ȳ�ݹ�\������ž�ٽ�.bmp" ) = true ){				
		funcWaitingForLoad()
		goto Ȳ���ǹ�_��������
	}
	
	fPrintStatus("ERROR_�������_Ȳ�ݹ��� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
	return
}
