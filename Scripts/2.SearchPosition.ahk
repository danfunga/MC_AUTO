��ġã��:
 
checkExit()
if( GuiBoolScreenShotError = true )  {
   fPrintStatus("��ġ ã�� ù ������")
   fPrintStatus( funcCaptureErrorScreen() )
}

��ũ�ν���:
{
   fPrintTitle("��ġ  ã��")
   fPrintStatus("���� ������� Ȯ���մϴ�.")
   
   
    If( funcIsExistImageFolder( "9.������\����_���" ) = true ){      
      funcSearchAndClickFolder( "9.������\��ư_�ڷ�" )
      funcWaitingForLoad()
   }
   
   fPrintStatus("���۸������� Ȯ���մϴ�" )
   If( funcIsExistImage( "���۸���\���������ư.bmp" ) = true ){
      goto, ���۸���
   }
   
   fPrintStatus("�����غ� ȭ�� ���� Ȯ���մϴ�.")
   If( funcIsExistImage( "2.���赹��\Button_�����غ�.bmp" ) = true ){
      goto, ��������_�����غ�
   }
      
   fPrintStatus("����ȭ������ Ȯ��")   
   if( funcSearchAndClickFolder( "1.���ӽ���\����������" ) = true ){
      fPrintStatus(" ����ȭ�鿡�� ���� �������� Ŭ���Ͽ����ϴ�. (ERROR - Ȯ�ο�)")
      Waiting := GuiDelayForBattle*2 
      vStatus=���� �ε��� ����  %Waiting%�ʰ� ����մϴ�.
      fPrintResult(vStatus)
      funcSleep(Waiting)          
      goto ��������
   }
   
   fPrintStatus("�����˾����� Ȯ���մϴ�. ")
   if( funcIsExistImageFolder( "11.����ȭ��\�����˾�" ) = true ){
      fPrintStatus("ERROR_���� Screen�� ���")
      fPrintStatus( funcCaptureErrorScreen() )
      funcSearchAndClickFolder("11.����ȭ��\�����˾�Ȯ��" )     
      goto ��ġã��
   }
   
   fPrintStatus("�������� ȭ�� ���� Ȯ���մϴ�.")
   If( funcIsExistImage( "2.���赹��\��������\��������ȭ��.bmp" ) = true ){      
      goto, ��������
   }
  

      
   fPrintStatus("������� ȭ�� ���� Ȯ���մϴ�.")
   If( funcIsExistImage( "2.���赹��\Button_����_�����ϱ�.bmp" ) = true ){
     fPrintStatus("��������ϱ� ��Ȳ���� ��ȯ")
      goto, �������_�������
   }
   fPrintStatus("���̵� ���������� Ȯ���մϴ�.")
   if( funcIsExistImageFolder("4.���̵嵹��\����_������") = true ){		
      goto ���̵���_������
   }
   if( funcIsExistImageFolder( "4.���̵嵹��\����_��������" ) = true ){		
      fPrintStatus("���̵� ������ ����Ǿ����ϴ�.")	
      goto ���̵�_����_����	
   }
   fPrintStatus("���������� Ȯ���մϴ�.")
   If( funcIsExistImageFolder( "������\����������" ) = true ){
      goto, ������_Ȯ��
   }
   fPrintStatus("������ ���� Ȯ���մϴ�.")
   If( funcIsExistImage( "������\����������.bmp" ) = true ){
      goto, ������_������_������
   }
   
   fPrintStatus("���� ���� �Ϸ� ȭ�� ���� Ȯ���մϴ�.")
   If( funcIsExistImage( "10.��������̹���\����\����W.bmp" ) = true ){
      fPrintStatus("�������_����� �̵�")
      goto, �������_����
   }
   If( funcIsExistImage( "10.��������̹���\����\����F.bmp" ) = true ){
      fPrintStatus("�������_����� �̵�")
      goto, �������_����
   }
   fPrintStatus("Ȳ�ݹ�  �Ϸ� ȭ�� ���� Ȯ���մϴ�.")
   If( funcIsExistImage( "10.��������̹���\Ȳ�ݹ�\������ž.bmp" ) = true ){
      fPrintStatus("�������_����� �̵�")
      goto, �������_Ȳ�ݹ�
   }
   fPrintStatus("������ �Ϸ� ȭ�� ���� Ȯ���մϴ�.")
   If( funcIsExistImage( "10.��������̹���\������\����W�ٽ�.bmp" ) = true ){
      fPrintStatus("�������_������� �̵�")
      goto, �������_������
   }
   If( funcIsExistImage( "10.��������̹���\������\����L.bmp" ) = true ){
      fPrintStatus("�������_������ ���� �̵�")
      goto, �������_������
   }
   
   fPrintStatus("���̵尡 �߰ߵƴ����� Ȯ���մϴ�.")
   if( funcIsExistImageFolder(  "10.�˾����̺�Ʈ\���̵�߰�" ) = true ){		
      fPrintStatus("���̵尡 �߰ߵǾ����ϴ�.")
      gosub �̺�Ʈ_���̵�߰�
   }
   
   fPrintStatus("����â�� ��������� Ȯ���մϴ�.")
   If( funcIsExistImageFolder( "10.�˾����̺�Ʈ\����Ȯ��â" ) = true ){
      fPrintStatus("����Ȯ������ �̵�")
      goto, ����Ȯ��_Ȯ��
   }
   fPrintStatus("����â�� ��������� Ȯ���մϴ�.")
   If( funcIsExistImageFolder( "10.�˾����̺�Ʈ\����Ȯ��â" ) = true ){
      fPrintStatus("����Ȯ������ �̵�")
      goto, ����Ȯ��_Ȯ��
   }
   
   fPrintStatus("������ �±��� Ȯ���մϴ�.")
   if( funcIsExistImageFolder("10.�˾����̺�Ʈ\�±޼���") = true ){
      fPrintStatus("�±� ��� ����ó��!!")
      fPrintStatus( funcCaptureErrorScreen() )
      funcSearchAndClickFolder("10.�˾����̺�Ʈ\�±޼���")      
      goto ��ġã��
   }
   
   fPrintStatus("���� ���������� Ȯ���մϴ�.")
   If( funcIsExistImage( "��������\��������ȭ��.bmp" ) = true ){
      fPrintStatus("������ ���ư��ϴ�.")
      funcSendESC()
      goto, ���۸���
   }
   fPrintStatus("������ ž���� Ȯ���մϴ�.")
   If( funcIsExistImage( "��������\Ȳ�ݼ���.bmp" ) = true ){
      goto, ��������_������ž
   }
   fPrintStatus("������ �غ� ȭ������ Ȯ���մϴ�.")
   if( funcIsExistImage( "��������\Button_�غ��ϱ�.bmp" ) = true )	{
      goto ��������_������
   }	
   if( funcIsExistImage( "��������\������\Button_�������غ�.png" ) = true ){
      goto AUTOMODE_CASTLEBATTLE
   }
   if( funcIsExistImage( "��������\������\Button_����������.png" ) = true ){
      goto AUTOMODE_CASTLEBATTLE1
   }
   
   if( funcIsExistImage( "��������\������\Status_����_����.png" ) = true ){
      goto AUTOMODE_CASTLEBATTLE_RESULT
   }
   
   if( funcIsExistImage( "4.���̵嵹��\���̵�_��������_����ȷ��̵�.bmp" ) = true ){		
      fPrintStatus("�̹� ����� ���̵��� �մϴ�.")	
      funcSearchAndClick( "4.���̵嵹��\Button_����ȷ��̵�_Ȯ��.bmp" )
      goto, ���۸���
   }
   fPrintStatus("���� ȭ������ ã��.")
   if( funcIsExistImageFolder( "1.���ӽ���\�����ݱ�" ) = true 
      or funcIsExistImageFolder( "1.���ӽ���\�����Ȯ��" ) = true
      or funcIsExistImageFolder( "1.���ӽ���\������ġ" ) = true ){
      goto ��������
   }		

    
   if( funcIsExistImageFolder("4.���̵嵹��\����_������") = true ){		
      goto ���̵���_������
   }else if( funcIsExistImageFolder( "4.���̵嵹��\����_��������" ) = true ){		
      fPrintStatus("���̵� ������ ����Ǿ����ϴ�.")	
      goto, ���̵�_����_����
   }

   if( GuiBoolScreenShotError = true )  {
      fPrintStatus("ERROR_������� �˼� �����ϴ�")
      fPrintStatus( funcCaptureErrorScreen() )
   }
   funcSendESC()

   goto ��ġã��
   return
}

return