���̵������:
{
	fPrintTitle("���̵���")
	fPrintStatus("���̵带 �ݺ������� �����ϰڽ��ϴ�.")
   
	BoolNeedRaidBattle:=true   

   
   if ( bFirstRaidMode != true ){         
      PushNote(GuiPushBulletToken, "MC_Auto:RaidMode", "StartRaidMode")
      bFirstRaidMode:=true
   }
   
   
	if( funcIsExistImageFolder("4.���̵嵹��\����_������") = true ){		
	   goto ���̵���_������
	}else if( funcIsExistImageFolder( "4.���̵嵹��\����_��������" ) = true ){		
		fPrintStatus("���̵� ������ ����Ǿ����ϴ�.")	
      goto, ���̵�_����_����
	}else if( funcIsExistImage( "���۸���\���������ư.bmp" ) = true ){		
		fPrintStatus("���� �����Դϴ�.")	
      goto, ���̵�_�����ϱ�
	}else{
      functionMoveTown()          
      goto ���̵�_�����ϱ�
   }
   
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
���̵�_�����ϱ�:
{
   fPrintTitle("���̵�����")
	fPrintStatus("���̵带 �ݺ������� �����ϰڽ��ϴ�.")
   
   gosub ����⼮üũ
	If( funcSearchAndClick( "���۸���\���������ư.bmp" ) = true ){      
      if( funcSearchAndClickFolder( "4.���̵嵹��\��ư_�����_���̵�" ) = true ){
         goto ���̵�_����ȭ��
      }      
   }
   goto ��ġã��
   return
}


���̵���_������:
if( funcIsExistImageFolder( "������\�ڵ���ų\On" ) = false ){
   funcSearchAndClickFolder( "������\�ڵ���ų\Off" )         
}

if( GuiCheckCallFriend = true ) {
   gosub ������_���ģ����ȯ
}

���̵�_����_������:
 {
   fPrintTitle("���̵�������")
	fPrintStatus("5�ʾ� ���������� ���Ḧ Ȯ���մϴ�.")
   
   total := 360*5
   
	loop{          
      during:=a_index*5      
	  stringTitle=%during%�� / %total%��
     funcPrintSubTitle(stringTitle )
		if( funcIsExistImageFolder( "4.���̵嵹��\����_��������" ) = true ){		
         fPrintStatus("���̵� ������ ����Ǿ����ϴ�.")
         IntMonitorRaidConsume++
         GuiControl, ,GuiCountRaidConsume,%IntMonitorRaidConsume%
         if( GuiBoolScreenShotRaid = true )
            funcCaptureSubScreen("Raid")
			break	
		}
      if( funcIsExistImage( "4.���̵嵹��\���̵�_��������_����ȷ��̵�.bmp" ) = true ){		
         IntMonitorRaidConsume++
         GuiControl, ,GuiCountRaidConsume,%IntMonitorRaidConsume%
         if( GuiBoolScreenShotRaid = true )
            funcCaptureSubScreen("Raid")
         fPrintStatus("�̹� ����� ���̵��� �մϴ�.")	
         If( funcSearchAndClick( "4.���̵嵹��\Button_����ȷ��̵�_Ȯ��.bmp" ) = true )
            goto ���̵�_�����ϱ�
			break	
		}
      if( funcSearchAndClickFolder( "1.���ӽ���\����������" ) = true ){
         fPrintStatus(" ���̵� ���� ���� ȭ������ ƨ�峪 ���ϴ�. (ERROR - Ȯ�ο� ���� �߰�)")
         fPrintStatus( funcCaptureErrorScreen() )
         Waiting := GuiDelayForBattle*2 
         vStatus=���� �ε��� ����  %Waiting%�ʰ� ����մϴ�.
         fPrintResult(vStatus)
         funcSleep(Waiting)          
         goto ��������
      }
      funcWaitingForBattleCheck()
	
      if( A_index > 360 ){
            fPrintStatus("30�а� ��ٷ����� ������ ���� ���� �ʽ��ϴ�.")	
            fPrintStatus("Error�� �Ǵ��մϴ�.")				
            fPrintStatus("ERROR_������_����_�������� ��ġã��� �̵��մϴ�. ")
            if( funcSearchAndClickFolder( "4.���̵嵹��\�Ͻ�����" ) = true ){
               funcSearchAndClickFolder("4.���̵嵹��\��ư_���̵庹��" )     
               funcSearchAndClickFolder("4.���̵嵹��\��" )     
               funcWaitingForLoad()
               goto ���̵�_�����ϱ�
            }
            goto ��ġã��
         }		
      }			
	fPrintStatus("����Ʈ ���� ���ᰡ Ȯ�εǾ����ϴ�.")		
   
   
   BoolNeedGoldRoomStage:=true
   BoolNeedBattleStage:=true
   
	goto, ���̵�_����_����
   
	return
}
���̵�_����_����:
{
   fPrintTitle("���̵���")
   If( funcSearchAndClick( "4.���̵嵹��\���̵�_��������_���̵��ư.bmp" ) = true ){
      funcWaitingForLoad()
      
      If( funcSearchAndClickFolder( "4.���̵嵹��\��ư_����ȷ��̵�" ) = true ){
         If( funcSearchAndClickFolder( "4.���̵嵹��\��ư_���̵�����" ) = true ){
            gosub ���̵�_�������
         }
      }
      If( funcSearchAndClickFolder( "4.���̵嵹��\��ư_�ڷΰ���" ) = true ){
         fPrintStatus("���̵� ȭ�鿡�� �����ϴ�.")		
      }  
   }
	
   functionMoveTown()
   goto ���۸���
   return
}
���̵�_�������:
{
 ; ������ ��������!
   funcPrintSubTitle("���� ����")
   If( funcSearchAndClickFolder( "4.���̵嵹��\��ư_����ޱ�" ) = true ){

      if( funcIsExistImageFolder( "4.���̵嵹��\����_����ޱ�_������" ) = true ){
         funcSearchAndClickFolder("4.���̵嵹��\��ư_������_Ȯ��" )  
         IntMonitorRaidPrize++
         GuiControl, ,GuiCountRaidPrize,%IntMonitorRaidPrize%
         fPrintStatus("Raid ���� ���� �Ϸ�!!.")		
      }else if( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_����_�ޱ�_���¾ƴ�.bmp" ) = true ){
         fPrintStatus("�̹� ���� ������ ���ݾ�!!.")		
      }        
      
                
      If( funcSearchAndClick( "4.���̵嵹��\Button_���̵�ȭ��_�ڷΰ���.bmp" ) = true ){
         fPrintStatus("���� ����ȭ������ �̵�")		
      } 
   }
   return
}
	
���̵�_����ȭ��:
{
   fPrintTitle("���̵���")
  	fPrintStatus("����� ���̵带 Ȯ���մϴ�.")	

   If( funcSearchAndClickFolder( "4.���̵嵹��\��ư_����ȷ��̵�" ) = false ){
      BoolNeedRaidBattle:=false      
      fPrintStatus("ERROR_���̵�_��ư_����ȷ��̵带 ã�� ���ؼ� ������ ���� �ʰڴ�.")
      fPrintStatus( funcCaptureErrorScreen() )
      goto ��ġã��
   }
   
   
   ;����� ���̵� ȭ�� --> ���� ������ �Ѵ�.
   If( funcSearchAndClickFolder( "4.���̵嵹��\��ư_���̵�����" ) = true ){
      gosub ���̵�_�������
      ;���� ���� ������ �ϴ� ȭ������ �����ٰ� �´�. ( reset --> �ߺ��ǰ� ������ �������� ��� )
      functionMoveTown()
      goto ���̵�_�����ϱ�         
   }
   
   ;����� ���̵� ȭ���� �����ϱ⿡ ���̵带 ���� 
   
   ;���̵� �׸� ���� üũ --> ���� 6���� �Ǹ� ���̵� ���ٴ� ����..
   if( funcIsExistImage( "4.���̵嵹��\����\status_����_6��_raid.bmp" ) = true ){
      fPrintStatus("���谡 6���� �Ǿ� ������ �����մϴ�.")	
      BoolNeedRaidBattle:=false
   }
   
   
   if( BoolNeedRaidBattle = false ){
      functionMoveTown()
      goto ���۸���	
   }
   
   
   If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_���������̵�.bmp" ) = true ){
      If( funcIsExistImageFolder( "4.���̵嵹��\��ư_���̵�����" ) = false ){
         fPrintStatus("���ο� ���̵尡 ������ ���� ���̵带 ���ϴ�.")
         funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_�������̵�.bmp" )
      }            
      If( funcSearchAndClickFolder( "4.���̵嵹��\��ư_���̵�����" ) = true ){
         If( funcSearchAndClickFolder( "4.���̵嵹��\��ư_���̵��غ��ϱ�" ) = true ){
            funcChoicePlayerSkill( 2 )
            If( funcSearchAndClickFolder( "4.���̵嵹��\��ư_���̵����" ) = true ){
               if( funcIsExistImage(  "4.���̵嵹��\���̵�_�������.bmp" ) = true ){		
                  BoolNeedRaidBattle:=false
                  funcSearchAndClick( "4.���̵嵹��\���̵�_�������_�ƴϿ�.bmp" )                        
                  functionMoveTown()
                  fPrintStatus("���谡 ���� ���̵带 ���� �ʰڽ��ϴ�.")
                  goto ���۸���                     
               }else if( funcIsExistImageFolder(  "4.���̵嵹��\����_�߰�_�����˾�" ) = true ){		
                  BoolNeedRaidBattle:=false
                  if( funcSearchAndClick( "4.���̵嵹��\���̵�_�������_�ƴϿ�.bmp" ) = false ){
                     fPrintStatus( funcCaptureErrorScreen() )
                     fPrintStatus("�ƴϿ� ��ư�� �ٸ��� ����")
                     funcSendESC()
                  }                        
                  functionMoveTown()
                  fPrintStatus("�����̳� ���ҳ׿�..���ο� ���̵�� ������, �׳� �����̳� ���ô�.")
                  goto ���۸���                     
               }
               
               funcWaitingForBattleCheck()                    
               if( funcIsExistImageFolder("4.���̵嵹��\����_������") = true ){		
                  goto ���̵���_������
               }
               fPrintStatus("ERROR_���̵� ���µ� ������ ����̴�.")
               fPrintStatus( funcCaptureErrorScreen() )
               BoolNeedRaidBattle:=false
               functionMoveTown()
               fPrintStatus("���̵� ���� ���� ��ġ ã��� �̵��մϴ�...")
               goto ��ġã��          
            }            
         }
      }
      fPrintStatus("���̵� ��ü�� ���� ���ϴ�.")
      BoolNeedRaidBattle:=false
      functionMoveTown()      
      goto ���۸���        
   }    
   ;���̵� ��� ����

   fPrintStatus("ERROR_����ϳ� ��ġ ã��� ���� �������� ���� ó���ϴ� �ɷ� ����~")
   fPrintStatus( funcCaptureErrorScreen() )
   BoolNeedRaidBattle:=false
   functionMoveTown()
   goto ���۸���         

   return
}
���̵�������:
{
   fPrintStatus("������ ���� �غ� �����մϴ�.")
   
   if( funcIsExistImage( "��������\������\Status_��������_full.png" ) = true ){
      fPrintTitle("������ ���� �Ϸ�")
      fPrintStatus("�������� Ƚ���� ��� �����Ͽ����ϴ�.")
      funcWaitingClick()
      functionMoveTown()
      goto ��ġã��
   }
   vLine=������ ������ ����  %GuilListCatleBattleTeam%�Դϴ�.
	fPrintStatus(vLine)   
	funcChoiceTeam( GuilListCatleBattleTeam )
	funcChoicePlayerSkill( GuilListCatleBattleTeam )
   goto AUTOMODE_CASTLEBATTLE_STARTBATTLE  
     
  return
}