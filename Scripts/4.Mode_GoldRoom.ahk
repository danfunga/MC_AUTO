���۸���_Ȳ�ݹ����:
{	
	fPrintTitle("Ȳ�ݹ�����")
	fPrintStatus("���������� �մϴ�.")
	
	 If( funcSearchAndClickFolder( "3.��������\��ư_��������"  ) = true )
		goto ��������_Ȳ�ݹ浹��	
	fPrintStatus("ERROR_���۸���_��������� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
} 

��������_Ȳ�ݹ浹��:
{	
	fPrintTitle("Ȳ�ݹ�����")
	fPrintStatus("�������� ȭ�鿡 �����Ͽ����ϴ�.")
	
	If( funcSearchAndClickFolder(  "3.��������\��ư_��������\��ư_������ž" ) = true )	{
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
   if ( funcIsExistImageFolder("3.��������\1.Ȳ�ݹ浹��\����_�������") = true ){
      BoolNeedGoldRoomStage:=false
      functionMoveTown()
      goto, ���۸���
   }
   
	if( funcSearchAndClickFolder( "3.��������\1.Ȳ�ݹ浹��\��ư_Ȳ���ǹ�" ) = true )	{
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
	fPrintStatus("������ Ȳ������ " GuiListTeamGoldRoom " �÷��̾ų�� " GuiListSkillGoldRoom " �Դϴ�.")   
   funcChoiceTeam( GuiListTeamGoldRoom )
   funcChoicePlayerSkill( GuiListSkillGoldRoom )
   
	goto,Ȳ���ǹ�_��������	

	fPrintStatus("ERROR_��������� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
	return
}
Ȳ���ǹ�_��������:
{	
	fPrintTitle("Ȳ�ݹ����")
	fPrintStatus("Ȳ�ݹ���  �����մϴ�.")
   if ( funcIsExistImageFolder("3.��������\1.Ȳ�ݹ浹��\����_�������") = true ){
      BoolNeedGoldRoomStage:=false
      functionMoveTown()
      goto, ���۸���
   }
   if( funcIsExistImageFolder("10.�˾����̺�Ʈ\����Ȯ��â"  ) = true ){
      gosub �������_����Ȯ��
   }
  
	if ( funcSearchAndClickFolder("3.��������\1.Ȳ�ݹ浹��\��ư_Ȳ�ݹ�_�����ϱ�") = true ){
		goto, Ȳ���ǹ�_��������_����üũ
	}


	fPrintStatus("ERROR_Ȳ���ǹ�_���������� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}
Ȳ���ǹ�_��������_����üũ:
{
	fPrintStatus("Ȳ�ݹ� ������ üũ�մϴ�.")	   
   if ( funcSearchAndClickFolder("3.��������\1.Ȳ�ݹ浹��\�˾�_��žŰ����") = true ){
			BoolNeedGoldRoomStage:=false
			fPrintStatus("��žŰ�� �����ϱ⿡ �����ϴ�.")
			funcSendESC()
         if( funcIsExistImageFolder( "3.��������\1.Ȳ�ݹ浹��\��ư_Ȳ���ǹ�" ) = true ){
				fPrintStatus("������ž ȭ�� �Դϴ�. ")
				funcSendESC()            
			}
         If( funcIsExistImageFolder( "3.��������\��ư_��������\ȭ��_��������" )  = true ){
				fPrintStatus("���� ���� ȭ�� �Դϴ�. ")
				funcSendESC()           
			}
         If( funcIsExistImageFolder( "2.���赹��\��ư_��������" ) = true ){
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
         if( funcIsExistImageFolder( "������\�ڵ���ų\On" ) = false ){
            funcSearchAndClickFolder( "������\�ڵ���ų\Off" )         
         }    
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
	;Gui, Submit, NoHide
   ;Gui, 2: Submit, NoHide
   
	fPrintTitle("Ȳ�ݹ潺ų")
	fPrintStatus("������ ��ų�� ����մϴ�.")	
	Loop, 3
	{        
		if( GuiCheckGoldChar%a_index% = true ) {		
			strCharName:=GuiGoldChar%a_index%
			if( GuiSkill1GoldChar%a_index% = true ){
				guiControlGet, skillName, 2: ,GuiSkill1GoldChar%a_index%,text
			}else if (  GuiSkill2GoldChar%a_index% = true ){
				guiControlGet, skillName, 2: ,GuiSkill2GoldChar%a_index%,text
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
   guiControlGet,skillDelay, 2:,GuiGoldSkillDelay%skillIndex%,text
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
