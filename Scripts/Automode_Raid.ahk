���̵������:
{
	fPrintTitle("���̵���")
	fPrintStatus("���̵带 �ݺ������� �����ϰڽ��ϴ�.")
	BoolNeedRaidBattle:=true
    
	if( funcIsExistImage(  "4.���̵嵹��\status_���̵�_������.bmp" ) = true ){		
	   goto ���̵���_������
	}else if( funcIsExistImage( "4.���̵嵹��\���̵�_��������.bmp" ) = true ){		
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
   
   If( funcSearchAndClick( "4.���̵嵹��\����_��ų��ư.bmp" ) = true ){
      funcSelectRaidSkill()
   }
   
	If( funcSearchAndClick( "���۸���\���������ư.bmp" ) = true ){
      If( funcSearchAndClick( "4.���̵嵹��\��������_���̵��ư.bmp" ) = true  or funcSearchAndClick( "4.���̵嵹��\��������_���̵��ư2.bmp" ) = true){
         goto ���̵�_����ȭ��
      }
      
   }
   goto ��ġã��
   return
}

funcSelectRaidSkill()
{
   teamName:=2
   
   StringReplace,skillNum,teamName,��,,All  
   
   result="�÷��̾� ��ų%skillNum%�� ����ϰڽ��ϴ�."
   fPrintStatus(result)
   
 
   Loop, %A_ScriptDir%\Image\10.�������ϱ�\playerSkill\skill%skillNum%*.bmp
   {
      choicedFile=10.�������ϱ�\playerSkill\%A_LoopFileName%
      if ( funcSearchAndClick(choicedFile) = true ){
         result="�ý�%skillNum%�� �����Ͽ����ϴ�."
         fPrintResult(result)     
         break                  
      }
   }
   funcSearchAndClick("10.�������ϱ�\playerSkill\exitX.bmp")
   return    
}

���̵���_������:
���̵�_����_������:
 {
	fPrintStatus("5�ʾ� ���������� ���Ḧ Ȯ���մϴ�.")
   
   total := 240*5
   
	loop{          
      during:=a_index*5      
	  stringTitle=%during%�� / %total%��
     funcPrintSubTitle(stringTitle )
		if( funcIsExistImage( "4.���̵嵹��\���̵�_��������.bmp" ) = true ){		
         fPrintStatus("���̵� ������ ����Ǿ����ϴ�.")	
			break	
		}
      if( funcIsExistImage( "4.���̵嵹��\���̵�_��������_����ȷ��̵�.bmp" ) = true ){		
         fPrintStatus("�̹� ����� ���̵��� �մϴ�.")	
         If( funcSearchAndClick( "4.���̵嵹��\Button_����ȷ��̵�_Ȯ��.bmp" ) = true )
            goto ���̵�_�����ϱ�
			break	
		}
      funcWaitingForBattleCheck()
	
	if( A_index > 360 ){
			fPrintStatus("30�а� ��ٷ����� ������ ���� ���� �ʽ��ϴ�.")	
			fPrintStatus("Error�� �Ǵ��մϴ�.")				
			fPrintStatus("ERROR_������_����_�������� ��ġã��� �̵��մϴ�. ")
			goto ��ġã��
		}		
	}	
	;gosub CaptureScreen
	
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
		gosub ���̵�_�������
   }
	
   functionMoveTown()
   goto ���۸���
   return
}
���̵�_�������:
{
   funcPrintSubTitle("���� ����")
   If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_����ȷ��̵�.bmp" ) = true ){
      ; ����� ���̵� ������??
      If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_����_����.bmp" ) = true ){
         ; ������ ��������!
         If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_����_�ޱ�.bmp" ) = true ){
            If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_����_�ޱ�_Ȯ��.bmp" ) = true ){
               fPrintStatus("���� ���� �Ϸ�!!.")		
            }        
            If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_����_�ޱ�_���¾ƴ�.bmp" ) = true ){
               fPrintStatus("�̹� ���� ������ ���ݾ�!!.")		
            }        
            
            If( funcSearchAndClick( "4.���̵嵹��\Button_���̵�ȭ��_�ڷΰ���.bmp" ) = true ){
               fPrintStatus("���� ����ȭ������ �̵�")		
            } 
         }
      }
   }
   
   If( funcSearchAndClick( "4.���̵嵹��\Button_���̵�ȭ��_�ڷΰ���.bmp" ) = true ){
      fPrintStatus("���̵� ȭ�鿡�� �����ϴ�.")		
   }  
   
   return
}
	
���̵�_����ȭ��:
{
   fPrintTitle("���̵���")
  	fPrintStatus("����� ���̵带 Ȯ���մϴ�.")		
   If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_����ȷ��̵�.bmp" ) = false ){
      BoolNeedRaidBattle:=false      
      fPrintStatus("ERROR_���̵�_��ư_����ȷ��̵带 ã�� ���ؼ� ������ ���� �ʰڴ�.")
      fPrintStatus( funcCaptureErrorScreen() )
      goto ��ġã��
   }
   
   
   ;����� ���̵� ȭ�� --> ���� ������ �Ѵ�.
   If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_����_����.bmp" ) = true ){
      ; ������ ��������!
      If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_����_�ޱ�.bmp" ) = true ){
         If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_����_�ޱ�_Ȯ��.bmp" ) = true ){
            fPrintStatus("���� ���� �Ϸ�!!.")		
         }        
         If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_����_�ޱ�_���¾ƴ�.bmp" ) = true ){
            fPrintStatus("�̹� ���� ������ ���ݾ�!!.")		
         }        
         
         If( funcSearchAndClick( "4.���̵嵹��\Button_���̵�ȭ��_�ڷΰ���.bmp" ) = true ){
            fPrintStatus("�ڷ� ���ư�")		
         } 
         If( funcSearchAndClick( "4.���̵嵹��\Button_���̵�ȭ��_�ڷΰ���.bmp" ) = true ){
            fPrintStatus("�ڷ� ���ư�")		
         }             
      }
      ;���� ���� ������ �ϴ� ȭ������ �����ٰ� �´�. ( reset --> �ߺ��ǰ� ������ �������� ���� )
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
      If( funcIsExistImage( "4.���̵嵹��\���̵�_��ư_���������̵�_����.bmp" ) = false ){
         fPrintStatus("���ο� ���̵尡 ������ ���� ���̵带 ���ϴ�.")
         funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_�������̵�.bmp" )
      }            
      If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_���������̵�_����.bmp" ) = true ){
         If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_���������̵�_����_���̵�����.bmp" ) = true ){
            If( funcSearchAndClick( "4.���̵嵹��\���̵�_��ư_���������̵�_����_���̵�����_����.bmp" ) = true ){
               if( funcIsExistImage(  "4.���̵嵹��\���̵�_�������.bmp" ) = true ){		
                  BoolNeedRaidBattle:=false
                  funcSearchAndClick( "4.���̵嵹��\���̵�_�������_�ƴϿ�.bmp" )                        
                  functionMoveTown()
                  fPrintStatus("���谡 ���� ���̵带 ���� �ʰڽ��ϴ�.")
                  goto ���۸���                     
               }else if( funcIsExistImage(  "4.���̵嵹��\����_�߰�_�����˾�.bmp" ) = true ){		
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
               if( funcIsExistImage(  "4.���̵嵹��\status_���̵�_������.bmp" ) = true ){		
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