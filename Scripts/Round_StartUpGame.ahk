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
   fPrintStatus("�⼮ üũ ���θ� Ȯ���մϴ�.")	
   funcSearchAndClickFolder( "1.���ӽ���\�⼮üũ" )
   
   
   fPrintStatus("ģ�� ��뿡 ���� ����̸� Ȯ���մϴ�...")	
   funcSearchAndClickFolder( "1.���ӽ���\�����Ȯ��" )
    
    
   fPrintStatus("Event �˾��� �����մϴ�.")	
   loop, 3
   {     
      if( funcSearchAndClickFolder( "1.���ӽ���\��Ÿ�˾�X" ) = false )      
         break
   }
   
   fPrintStatus("��� ���� �� ��Ű�� ������ ����մϴ�.")	
   loop, 3
   {
      if( funcSearchAndClickFolder( "1.���ӽ���\�������" ) = false )      
         break      
   }
	
	If( funcIsExistImage( "���۸���\���������ư.bmp" ) = true ){
		fPrintStatus("���������� ���۸����� �����߽��ϴ�.")	
		goto ���۸���
	}
	
	fPrintStatus("ERROR_���������� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
	return
}
