��������:
{	
	fPrintTitle("��������")
	fPrintStatus("�������� �������Դϴ�.")	
   
	fPrintStatus("������ ���� ���������� �ݽ��ϴ�.")
	Loop
	{
      if( funcSearchAndClickFolder( "1.���ӽ���\�����ݱ�" ) = false ){
         break
      }
		if( A_Index > 8 ){
			break
		}
	} 
	
	fPrintStatus("������ ���� Ŭ���մϴ�..")	
   
   if( funcSearchAndClickFolder( "1.���ӽ���\������ġ" ) = true ){
      funcWaitingForLoad2()
   }
   
    
   fPrintStatus("�⼮üũ, �̺�Ʈ �˾� �� ��Ű�� ������ ����մϴ�.")	
   loop, 4
   {     
      funcSearchAndClickFolder( "1.���ӽ���\�⼮üũ" )  
      funcSearchAndClickFolder( "1.���ӽ���\�̺�Ʈ_�˾�" )  
      funcSearchAndClickFolder( "1.���ӽ���\�����Ȯ��" )
      funcSearchAndClickFolder( "1.���ӽ���\��Ÿ�˾�X" )
      funcSearchAndClickFolder( "1.���ӽ���\�������" )
      
      If( funcIsExistImageFolder( "2.���赹��\��ư_��������" ) = true ){
         fPrintStatus("���������� ���۸����� �����߽��ϴ�.")	
         goto ���۸���
      }
   }
   
	If( funcIsExistImageFolder( "2.���赹��\��ư_��������" ) = true ){
		fPrintStatus("���������� ���۸����� �����߽��ϴ�.")	
		goto ���۸���
	}
	
	fPrintStatus("ERROR_���������� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
	return
}
