���۸���_���������:
{
   fPrintTitle("����������")
	fPrintStatus("���� ������ �մϴ�.")
   If( funcSearchAndClick( "���۸���\��������.bmp"  ) = true )
		goto ��������_�����嵹��

	fPrintStatus("ERROR_���۸���_��������� �� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
} 

��������_�����嵹��:
{
   fPrintTitle("����������")
	fPrintStatus("�������� ȭ�鿡 �����Ͽ����ϴ�.")
   If( funcSearchAndClick( "��������\���弱��.bmp", 0, 60 ) = true )	{
		goto ��������_������
	}	
   
   fPrintStatus("ERROR_���۸���_�����嵹�� �� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
}

��������_������:
{
	fPrintTitle("��  ��  ��")
	fPrintStatus("������  ȭ�鿡 �����Ͽ����ϴ�.")
   if( funcIsExistImageFolder( "��������\���帶��" ) = true )	{      
		fPrintStatus("�������� ���� �Ȱ� �����ϴ�. ESC")
      funcSendESC()
	}	   
	if( funcIsExistImageFolder( "��������\�����˾�" ) = true )	{      
		fPrintStatus("�˾��� �����մϴ�., ESC")
      funcSendESC()
	}	
   If( funcIsExistImage( "��������\����Ű_����.bmp"  ) = true ){
      BoolNeedBattleStage:=false
      functionMoveTown()
      goto, ���۸���
   }
   
	if( funcSearchAndClick( "��������\Button_�غ��ϱ�.bmp" ) = true )	{
		goto ������_��������
	}	
		
	fPrintStatus("ERROR_��������_������ �� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
	
}
;~ ��������_�������غ�:
;~ {
	;~ fPrintTitle("�������غ�")
	;~ fPrintStatus("������ �غ� �������� �Խ��ϴ�.")
	
	;~ fPrintStatus("������ ���� �����մϴ�.")
	;~ vLine=������ �������� %GuiListTeamBattle%�Դϴ�.
	;~ fPrintStatus(vLine)   
	;~ funcChoiceTeam( GuiListTeamBattle )
	;~ goto,������_��������	

	;~ fPrintStatus("ERROR_��������_�������غ��� ��ġã��� �̵��մϴ�. ")
	;~ goto ��ġã��
;~ }


������_��������:
{	
	fPrintTitle("���������")
	fPrintStatus("��������  �����մϴ�.")
	
	funcChoicePlayerSkill( GuiListTeamBattle )
	
	if ( funcSearchAndClick("��������\Button_����_�����ϱ�.bmp") = true ){
		goto, ����������_����üũ
	}else{
		gosub �������_����Ȯ��
	}
	if ( funcSearchAndClick("��������\Button_����_�����ϱ�.bmp") = true )
		goto, ����������_����üũ
	else{
		BoolNeedBattleStage:= false
		funcSendESC()
		If( funcIsExistImage( "��������\Button_�غ��ϱ�.bmp"  ) = true ){
			fPrintStatus("������ ȭ�� �Դϴ�.")
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
	}

	fPrintStatus("ERROR_Ȳ���ǹ�_���������� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}
����������_����üũ:
{
	fPrintStatus("���� ������ üũ�մϴ�.")	

if( funcIsExistImage("��������\���ִ�.bmp") = true ){
      if( funcSearchAndClick("��������\���ִ뿹.bmp") = true ){
			fPrintStatus("�ִ� �������� ������ �����մϴ�.")
      }
   }
   if( funcSearchAndClick("��������\����Ű����.bmp") = true or  funcSearchAndClick("��������\���帶��.bmp") = true ){
		BoolNeedBattleStage:= false
		funcSendESC()
		If( funcIsExistImage( "��������\Button_����_�����ϱ�.bmp"  ) = true ){
			fPrintStatus("���� ���� ȭ�� �Դϴ�.")
			funcSendESC()
		}
      If( funcIsExistImage( "��������\Button_�غ��ϱ�.bmp"  ) = true ){
			fPrintStatus("������ ȭ�� �Դϴ�.")
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
        fPrintStatus("�̰��� �� �ɷȴ��� �𸨴ϴ�.")
		funcSendESC()
		goto, ���۸���
	}
   
	funcWaitingForLoad2()
	if( funcIsExistImage(  "������\2��Ӱ���.bmp" ) = true ){		
		fPrintStatus("������ ������ ���������� Ȯ�εǾ����ϴ�..")
		goto ������_������
	}else{
		fPrintStatus("ERROR_����� �ȵ��Ծ�� �ϴ� �����ε�.... �ϴ� ���� ������ �ȵǾ����ϴ�.")
		BoolNeedBattleStage:=false
		funcSendESC()
		If( funcIsExistImage( "��������\Button_����_�����ϱ�.bmp"  ) = true ){
			fPrintStatus("���� ���� ȭ�� �Դϴ�.")
			funcSendESC()
		}
		If( funcIsExistImage( "��������\Button_�غ��ϱ�.bmp"  ) = true ){
			fPrintStatus("������ ȭ�� �Դϴ�.")
			funcSendESC()
		}
		If( funcIsExistImage( "��������\��������ȭ��.bmp"  ) = true ){
         fPrintStatus("���� ���� ȭ�� �Դϴ�.")
			funcSendESC()
		}
      If( funcIsExistImage( "���۸���\���������ư.bmp"  ) = true ){
         fPrintStatus("���� ������ ���ƿԽ��ϴ�.")
			goto, ���۸���
		}
       fPrintStatus("���� �̰��� �� �ɸ��ž�")
		funcSendESC()
		goto, ���۸���		
	}
		
	fPrintStatus("ERROR_����������_����üũ�� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}
������_������:
{	
   funcWaitingBattleBasicDuration()
	goto, ������_������_������	
}

������_������_������:
 {
	fPrintTitle("����������")
	fPrintStatus("5�ʾ� ���������� ���Ḧ Ȯ���մϴ�.")
	loop{
		if( funcIsExistImage( "10.��������̹���\������\����L.bmp" ) = true ){				
			fPrintStatus("������ �й谡 Ȯ�εǾ����ϴ�" )	
			IntMonitorBattleLoseCount++
			GuiControl, ,CountLoseCount,%IntMonitorBattleLoseCount%			
			goto, �������_������
		}else if( funcIsExistImage( "10.��������̹���\������\����W.bmp" ) = true ){		         
			fPrintStatus("������ �¸��� Ȯ�εǾ����ϴ�")	
			IntMonitorBattleWinCount++
			GuiControl, ,CountWinCount,%IntMonitorBattleWinCount%			
			goto, �������_������
		} 
		funcWaitingForBattleCheck()
		if( A_index > 150 ){
			fPrintStatus("������ �ʹ� ���� �ɸ��°� �����ϴ�.")	
			fPrintStatus("Error�� �Ǵ��մϴ�.")				
			break
		}		
	}
	fPrintStatus("ERROR_������_������_�������� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}

�������_������:
{
	fPrintTitle("��������")		
	fPrintStatus("�ٽ� �ϱ⸦ Ŭ���մϴ�.")
	if( funcSearchAndClick( "10.��������̹���\������\����W�ٽ�.bmp" ) = false ){
      funcSearchAndClick( "10.��������̹���\������\����L�ٽ�.bmp" )
	}
   funcWaitingForLoad()
	goto ��������_������
}