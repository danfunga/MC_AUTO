���۸���:
{	
	fPrintTitle("����  ����")	
	fPrintStatus("���� �������� �����մϴ�.")	
   loop,3
   { 
	     if( boolNeedCheckAchievement = true ){
			fPrintStatus("������ �ִ��� Ȯ���մϴ�.")
			if( funcSearchAndClickFolder("8.����Ȯ��\����_��������") = true ) {
				funcReceiveAchievement()
			}else{
				fPrintResult("������ �����ϴ�.")
				break
			}
		}else{
			fPrintStatus("������ �ִ��� Ȯ������ �ʽ��ϴ�.")
			break
		}
   }	
   
   if( BoolNeedSendHonor = true ){
      fPrintStatus("���� �����ڽ��ϴ�..")
      goto ���۸���_��������	   
   }
	if( BoolNeedGoldRoomStage= true ) {
		fPrintStatus("Ȳ�ݹ��� ���ڽ��ϴ�.")
		goto ���۸���_Ȳ�ݹ����	
	}
	if( BoolNeedBattleStage = true ){
		fPrintStatus("�������� ���ڽ��ϴ�.")
		goto ���۸���_���������	
	}
   if( BoolNeedCastleBattle = true ){
		fPrintStatus("�������� ���ڽ��ϴ�.")
		goto ���۸���_����������
	}
   
   if( GuiSelectRaidMod= true and BoolNeedRaidBattle = true ){
      if ( funcIsExistImageFolder("4.���̵嵹��\����_����\���̵����") = true ){
         fPrintStatus("���� ������ Ȯ�εǾ����ϴ�. ")
         fPrintStatus("���̵带 ���ڽ��ϴ�.")
         goto ���̵������
      }        
   }
   
	goto ���۸���_�������
}


���۸���_�������:
{
	fPrintStatus("���� ������ ã�� �ֽ��ϴ�.")
	 If( funcSearchAndClickFolder( "2.���赹��\��ư_��������"  ) = true )
		goto ��������		
		
	fPrintStatus("ERROR_���۸���_��������� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
}

��������:
{		
	fPrintTitle("����  ����")
	fPrintStatus("�������忡 ���Խ��ϴ�.")
   
   If( funcSearchAndClickFolder( "2.���赹��\��ư_��������\��ư_����"  ) = true ){   
      goto, ��������_������������
   }else if( funcIsExistImageFolder("2.���赹��\��ư_��������\����_��������") = true ){
      fPrintStatus("�̹� ?�� ���� ȭ�鿡 ��� �� �ֽ��ϴ�.")
      goto, ��������_������������   
   }
      
	goto ��ġã��
}
funcIsMoonIsland( strInputStage )
{

	StringSplit,arrayStageName,strInputStage,-
   if( arrayStageName1 >= 8 ){
      return true
   }else{   
      return false
   }
}

��������_������������:
{
	fPrintStatus("������ ���������� Ȯ���մϴ�.")
   
   if( GuiLoopMap = true ){
      strStageName:=funcGetNextLoopMap()
   }else{
      strStageName:=GuiStageList
   }

   boolMoonIsland := funcIsMoonIsland( strStageName )
   
   ��������_�������:
   
	if( boolMoonIsland = true )	{
		if( funcIsExistImageFolder(  "2.���赹��\��������\���\��ư_�ƽ�����" ) = true )	{	
			fPrintStatus("���� �޺����� ���õǾ����ϴ�.")
		}else If( funcSearchAndClickFolder( "2.���赹��\��������\���\��ư_�޺��Ǽ�" ) = true )	{
			fPrintStatus("�޺����� �����Ͽ����ϴ�.")	
		}
	}else{
		if( funcIsExistImageFolder(  "2.���赹��\��������\���\��ư_�޺��Ǽ�" ) = true ){	
         if( funcIsExistImageFolder(  "2.���赹��\��������\���\��ư_�ƽ�����" ) = true )	{	
            fPrintStatus("���� �ƽ������� ���õǾ����ϴ�.")	
         }else{
            fPrintStatus("�׸����� ���� �ֳ����ϴ�..")	
            If( funcSearchAndClickFolder( "2.���赹��\��������\���\��ư_�޺��Ǽ�" ) = true )	{
               fPrintStatus("�޺����� �����Ͽ����ϴ�.")	          
               goto ��������_�������
            }
         }
         
		}else if( funcSearchAndClickFolder( "2.���赹��\��������\���\��ư_�ƽ�����" ) = true ){
			fPrintStatus("�ƽ��� ����� �����Ͽ����ϴ�.")	
		}
	}	
   goto ��������_���̵�����
   
	fPrintStatus("ERROR_��������_�������� ������ ��ġã��� �̵��մϴ�.")
	goto ��ġã��
}

��������_���̵�����:
{	
	fPrintTitle("���̵�����")
	fPrintStatus("���̵� ������ �����մϴ�.")

	if( GuiStageDifficulty = "����" ){
		fPrintStatus("������ ���̵��� �����Դϴ�.")
		If( funcIsExistImage(  "2.���赹��\��������\���̵�\��ư����.bmp" ) = true ){
			fPrintStatus("�̹� ������ ���õǾ� �־� �ʼ������� �Ѿ�ϴ�.")			
		}else{
			if( funcSearchAndClick( "2.���赹��\��������\���̵�\��ư�����.bmp")  = false )
				funcSearchAndClick( "2.���赹��\��������\���̵�\��ư����.bmp") 
			funcSearchAndClick( "2.���赹��\��������\���̵�\���ý���.bmp")   	
		}	
		goto, ��������_�ʼ���		
	}else if ( GuiStageDifficulty = "����" ){	
		fPrintStatus("������ ���̵��� �����Դϴ�.")
		If( funcIsExistImage(  "2.���赹��\��������\���̵�\��ư����.bmp" ) = true ){
			fPrintStatus("�̹� ������ ���õǾ� �־� �ʼ������� �Ѿ�ϴ�.")			
		}else{
			if( funcSearchAndClick( "2.���赹��\��������\���̵�\��ư�����.bmp")  = false )
				funcSearchAndClick( "2.���赹��\��������\���̵�\��ư����.bmp") 
			funcSearchAndClick( "2.���赹��\��������\���̵�\���ú���.bmp")   		
		}
		goto, ��������_�ʼ���
	}else if ( GuiStageDifficulty = "�����" ){
		fPrintStatus("������ ���̵��� ������Դϴ�.")
		If( funcIsExistImage(  "2.���赹��\��������\���̵�\��ư�����.bmp" ) = true ){
			fPrintStatus("�̹� ������� ���õǾ� �־� �ʼ������� �Ѿ�ϴ�.")			
		}else{
			if( funcSearchAndClick( "2.���赹��\��������\���̵�\��ư����.bmp")  = false )
				funcSearchAndClick( "2.���赹��\��������\���̵�\��ư����.bmp") 
			funcSearchAndClick( "2.���赹��\��������\���̵�\���þ����.bmp")   		
		}
		goto, ��������_�ʼ���
	}else
		fPrintStatus("������ Ȯ���� �ʿ��մϴ�. ����,����,������� �Ѱ��� ������ �Ǿ�� �մϴ�.")
	
	fPrintStatus("ERROR_��������_ ���̵������� ��ġã��� �̵��մϴ�.")
	goto ��ġã��
}
��������_�ʼ���:
{	
	fPrintTitle("��    ����")
	fPrintStatus("���������� �����մϴ�.")
      
   if( GuiStageDifficulty = "����"  ){
      v���̸� = ��%strStageName%.bmp
   }else if( GuiStageDifficulty = "����" ){
      v���̸� = ��%strStageName%.bmp
   }else if ( GuiStageDifficulty = "�����" ){
      v���̸� = ��%strStageName%.bmp
   }   
	
	v���̸� = 2.���赹��\��������\%v���̸�%
	 loop
	{		
		if( funcIsExistImage( v���̸� ) = true ){
			funcSearchAndClick(v���̸�)
			fPrintStatus("���� �غ� ȭ������ �̵��մϴ�.")
			goto, ��������_�����غ�
		}else{
			fPrintStatus("�ٸ�â�� ����")
         funcSearchAndClick( "2.���赹��\��������\���̵�.bmp") 
		}		
		if( A_Index >8 )
			break
	}
	fPrintStatus("ERROR_��������_ �ʼ����� ��ġã��� �̵��մϴ�. ���� ������ �߸��Ȱ� �����ϴ�.")
	goto ��ġã��
}
��������_�����غ�:
{	
	fPrintTitle("����  �غ�")
	fPrintStatus("���� �غ� ��ư�� Ŭ���մϴ�.")
	If( funcSearchAndClick("2.���赹��\Button_�����غ�.bmp") = true )
		 goto �������

	fPrintStatus("ERROR_��������_ �����غ��� ��ġã��� �̵��մϴ�. ���� ������ �߸��Ȱ� �����ϴ�.")
	goto ��ġã��
}

�������:
{	
	fPrintTitle("����  ����")
	fPrintStatus("������� �������� �Խ��ϴ�.")
	
   fPrintStatus("������ ���� �����մϴ�.")
	vLine=������ �������� %GuiListTeamAdvanture%�Դϴ�.
	fPrintStatus(vLine)   
	funcChoiceTeam( GuiListTeamAdvanture )
	funcChoicePlayerSkill( GuiListSkillAdvanture )
	goto,�������_�������	

	fPrintStatus("ERROR_��������� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}

�������_�������:
   fPrintTitle("����  ����")
	fPrintStatus("������ �����մϴ�.")	
	/*
	----------------------------------------------------------------
		���� Ȯ���� ���ؼ� �̾��� Ȯ�� �Ǿ��� ��� ��������
	----------------------------------------------------------------
	*/
	if( BoolNeedLevelUpCheck = true ){
		if( GuiBoolStopMonsterLevelUp = true ){
         updateLevelUpCheckZero()
			gosub, ��ũ������
		}
	}
	
	if( GuiBoolStopMonsterLevelUp = false ){
		if( BoolNeedLevelUpCheck = false ){				
			BoolNeedLevelUpCheck := checkLevelUpNeeds( IntMonitorNoLevelUpCheckCount )
		}
		if( BoolNeedLevelUpCheck = true ){
         gosub, ����_��Ȯ��_����         
		}			
	}
   if( GuiSelectRaidMod = true and BoolNeedRaidBattle = true){
      if ( funcIsExistImageFolder("4.���̵嵹��\����_����\���̵����") = true ){
         fPrintStatus("���� �� ���� ������ Ȯ�εǾ����ϴ�. ")
         BoolNeedRaidBattle:=true
         functionMoveTown() 
         goto ���۸���

      }
   }else{
      if( GuiSelectRaidMod = true  )
      {
         BoolNeedRaidBattle:=true
      }   
   }
   
   �������_�������_��ưŬ��:
	if ( funcSearchAndClick("2.���赹��\Button_����_�����ϱ�.bmp") = true ){
			goto, �������_��������üũ
	}
	fPrintStatus("ERROR_�������_��������� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��   
return

�������_��������üũ:
{	
   fPrintTitle("���� üũ")	
	fPrintStatus("������ ������ üũ�մϴ�.")	
	;~ funcSleep(2)
	/*
		-------------------------------------
		�˾�â�� Ŭ���� �ȵǼ� �ϴ� ���� Ŭ���ߴ�...
		������ �ʿ��ϱ� �ϴ�.
		-------------------------------------
	
   if( funcIsExistImageFolder( "2.���赹��\����_����ִ�" ) = true ){		
      goto ���_�κ�_�ִ�		
	}	
   */
	if( funcSearchAndClickFolder( "2.���赹��\��ư_�ִ�_����" ) = true ){		
      fPrintStatus("�ɸ��� ���ĵ� ���� �մϴ�.")	
	}	
	
	if( funcSearchAndClick(  "2.���赹��\�������\����Ű����.bmp" ) = true ){		
		fPrintStatus("���谡 ������ ��Ȳ�Դϴ�.")
		goto �������_����Ű����
	}	
   if ( funcIsExistImage("2.���赹��\Button_����_�����ϱ�.bmp") = true ){
      fPrintStatus("INFO_��������ϱ� ��ư�� �ȴ��ȳ� ���� �ٽ� ������")
		goto �������_�������_��ưŬ��
	}
   
	if( GuiAdvantureAutoSkill = true ){
		fPrintStatus("��ũ�� �ڵ� ��ų �����Ͽ����ϴ�. ���� ������ ��ٸ��ϴ�.")		
		if( funcWaitAndReturn(  "������\����������" ) = true ){
			fPrintStatus("������ ���������� ���۵Ǿ����ϴ�.")			
		}
      
      if( GuiAutoSkillOff = true ){
         if( funcIsExistImageFolder( "������\�ڵ���ų\Off" ) = false ){
            funcSearchAndClickFolder( "������\�ڵ���ų\On" )         
         }         
      }else{
        if( funcIsExistImageFolder( "������\�ڵ���ų\On" ) = false ){
            funcSearchAndClickFolder( "������\�ڵ���ų\Off" )         
         }               
      }
		if( GuiCheckCallFriend = true ) {
				gosub ������_���ģ����ȯ
		}
		else{
			fPrintStatus("ģ�� ��ȯ�� ��ġ �ʾ� �״�� �����մϴ�.")
		}		
		goto ������������	
	}else{
		fPrintStatus("�ڵ� ������ �����Ͽ����ϴ�. ���� ������ ��ٸ��ϴ�.")		
		funcWaitingForLoad()   
		if( funcIsExistImageFolder(  "������\����������" ) = true ){		
			fPrintStatus("������ ���������� ���۵Ǿ����ϴ�.")
			if( GuiCheckCallFriend = true ) 
				goto ������_ģ����ȯ
			else {
				fPrintStatus("ģ�� ��ȯ�� ��ġ �ʾ� �״�� �����մϴ�.")
				goto ������_����	
			}		
		}
	}
	
	fPrintStatus("ERROR_�������_����üũ�� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}
������_���ģ����ȯ:
{
	fPrintTitle("����������")
	fPrintStatus("ģ����ȯ�� �����մϴ�.")
   funcSearchAndClick("������\ģ����ȯ��ư.bmp", -20, -50 )
	return 
}

������_ģ����ȯ:
{
	fPrintTitle("����������")
	fPrintStatus("ģ����ȯ�� �����մϴ�.")
   
	If( funcSearchAndClick( "������\ģ����ȯ��ư.bmp", -20, -50 ) = true )	{
		goto ������_����		
	}
	fPrintStatus("ERROR_������_ģ����ȯ�� ���������� ��� �����մϴ�. ")
	fPrintStatus("ERROR_ģ���� ���� ���� �����Դϴ�. ")
	goto ������_����
}
 ������_����:
 {
	funcWaitingBattleBasicDuration()
	goto, ������_����_������	
}
 ������_����_������:
 {
	fPrintStatus("5�ʾ� ���������� ���Ḧ Ȯ���մϴ�.")
	loop{
		if( funcIsExistImage( "10.��������̹���\����\����W�ٽ�.bmp" ) = true ){		
			IntMonitorStageClearCount++
			IntMonitorNoLevelUpCheckCount++
			break	
		}else if( funcIsExistImage( "10.��������̹���\����\����F�ٽ�.bmp" ) = true ){				
			IntMonitorStageFailCount++
			break
		}
      funcWaitingForBattleCheck()
		if( A_index > 60 ){
			fPrintStatus("6�а� ��ٷ����� ������ ���� ���� �ʽ��ϴ�.")	
			fPrintStatus("Error�� �Ǵ��մϴ�.")				
			fPrintStatus("ERROR_������_����_�������� ��ġã��� �̵��մϴ�. ")
			goto ��ġã��
		}		
	}
	
	IntMonitorTotalStageCount++
	if( GuiCheckContentsGoldRoom = true ){
		BoolNeedGoldRoomStage:=checkGoldRoomNeeds( IntMonitorTotalStageCount )			
	}
	if( GuiCheckContentsBattleField = true ){
		BoolNeedBattleStage:=checkBattleNeeds( IntMonitorTotalStageCount )			
	}
	GuiControl, ,CountTotalCount,%IntMonitorTotalStageCount%
	GuiControl, ,CountClearCount,%IntMonitorStageClearCount%
	GuiControl, ,CountFailCount,%IntMonitorStageFailCount%
	GuiControl, ,NoLevelUp,%IntMonitorNoLevelUpCheckCount%

   if( GuiBoolScreenShotResult = true )
      funcCaptureSubScreen( "reward" )
   
	
	fPrintStatus("���� �Ϸᰡ Ȯ�εǾ����ϴ�.")				
	goto, �������_����
	
}
�������_����:
{
	fPrintTitle("���� ���")
	if( BoolNeedGoldRoomStage = true )
		fPrintStatus("Ȳ�ݹ��� ���ƾ� �մϴ�.")	
	if( BoolNeedBattleStage = true )			
      fPrintStatus("�������� ���ƾ� �մϴ�.")
	if( BoolNeedBattleStage =true or BoolNeedGoldRoomStage =true ){
      if( funcSearchAndClickFolder( "10.��������̹���\��ư_����" ) = true ){					
         funcWaitingForLoad()			
            
         fPrintStatus("���̵尡 �߰ߵƴ����� Ȯ���մϴ�.")
         if( funcIsExistImageFolder(  "10.�˾����̺�Ʈ\���̵�߰�" ) = true ){		
            fPrintStatus("���̵尡 �߰ߵǾ����ϴ�.")
            gosub �̺�Ʈ_���̵�߰�
         }
         fPrintStatus("������ �߻��Ͽ����� Ȯ���մϴ�.")
         if( funcIsExistImageFolder(  "10.�˾����̺�Ʈ\����Ȯ��â" ) = true ){		
            fPrintStatus("���� Ȯ������ �̵��մϴ�.")
            gosub �������_����Ȯ��
         }
         
         fPrintStatus("������ �Ͽ����� Ȯ���մϴ�.")
         if( funcIsExistImageFolder(  "10.�˾����̺�Ʈ\����Ȯ��â" ) = true ){		
            fPrintStatus("���� Ȯ������ �̵��մϴ�.")
            gosub �������_����Ȯ��
         }
         If( funcIsExistImageFolder( "2.���赹��\��ư_��������" ) = true ){			
            goto, ���۸���
         }else{
            fPrintStatus("�̺�Ʈ ó���� ���� ��ġ ã��� ���ϴ�.")
            goto ��ġã��
         }
      }
		fPrintStatus("ERROR_�������_������ ��ġã��� �̵��մϴ�. ")
		goto ��ġã��   
   }
  
	fPrintStatus("�ٽ� �ϱ⸦ Ŭ���մϴ�.")
	
	if( GuiCheckGoNextStage = true ){
		if( funcSearchAndClick( "10.��������̹���\����\����W����.bmp" ) = false ){				
			funcSearchAndClick( "10.��������̹���\����\����F�ٽ�.bmp" ) 
		}
		goto �������_����üũ
	}else if( funcSearchAndClick( "10.��������̹���\����\����W�ٽ�.bmp" ) = true ){				
		goto �������_����üũ
	}else {
      funcSleep(2)
      fPrintStatus("ERROR_���� �ɸ��� �� ����� ���� �ɸ��� 1�ʰ� ��ٷȴ� �ٽ��غ���.")
      if( funcSearchAndClick( "10.��������̹���\����\����W�ٽ�.bmp" ) = true ){				
         goto �������_����üũ
      }else if( funcSearchAndClick( "10.��������̹���\����\����F�ٽ�.bmp" ) = true ){				
         goto �������_����üũ
      }
	}
	fPrintStatus("ERROR_����Ϸ��� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}
�������_����üũ:
{
	fPrintTitle("����  üũ")
   funcWaitingForLoad()   
	if ( funcIsExistImage("2.���赹��\Button_����_�����ϱ�.bmp") = true ){
     
      
		fPrintStatus("��������� �����մϴ�.")
		goto, �������_�������
	}

	goto �������_�̺�Ʈüũ
	fPrintStatus("ERROR_�������_����üũ�� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
	return
}
�������_�̺�Ʈüũ:
{
	fPrintTitle("�̺�Ʈüũ")	
	fPrintStatus("�̺�Ʈ�� �߻��Ѱ����� ���Դϴ�. �̺�Ʈ�� Ȯ���մϴ�.")	
	
	fPrintStatus("���̵尡 �߰ߵƴ����� Ȯ���մϴ�.")
	if( funcIsExistImageFolder(  "10.�˾����̺�Ʈ\���̵�߰�" ) = true ){		
		fPrintStatus("���̵尡 �߰ߵǾ����ϴ�.")
		gosub �̺�Ʈ_���̵�߰�

      
      
      fPrintStatus("������ �߻��Ͽ����� Ȯ���մϴ�.")
      if( funcIsExistImageFolder(  "10.�˾����̺�Ʈ\����Ȯ��â" ) = true ){		
         fPrintStatus("���� Ȯ������ �̵��մϴ�.")
         gosub �������_����Ȯ��
      }
      fPrintStatus("������ �Ͽ����� Ȯ���մϴ�.")
      if( funcIsExistImageFolder(  "10.�˾����̺�Ʈ\����Ȯ��â" ) = true ){		
         fPrintStatus("���� Ȯ������ �̵��մϴ�.")
         gosub �������_����Ȯ��         
         fPrintStatus("�̵��� ������ Ȯ���ؾ� �մϴ�.")
      }   
            
      fPrintStatus("���� ���� ��ư�� ���ٸ� �װ��� ���� �����̰���." )
      funcSearchAndClickFolder( "2.���赹��\��ư_��������" )
      goto ��������
	}
	
	fPrintStatus("������ �߻��Ͽ����� Ȯ���մϴ�.")
	if( funcIsExistImageFolder(  "10.�˾����̺�Ʈ\����Ȯ��â" ) = true ){		
		fPrintStatus("���� Ȯ������ �̵��մϴ�.")
		gosub �������_����Ȯ��
	}
	fPrintStatus("������ �Ͽ����� Ȯ���մϴ�.")
	if( funcIsExistImageFolder(  "10.�˾����̺�Ʈ\����Ȯ��â" ) = true ){		
		fPrintStatus("���� Ȯ������ �̵��մϴ�.")
		gosub �������_����Ȯ��
		
		fPrintStatus("�̵��� ������ Ȯ���ؾ� �մϴ�.")

	}
	
	If( funcIsExistImage("2.���赹��\Button_����_�����ϱ�.bmp") = true ){
		 goto �������_�������
	 }

	fPrintStatus("ERROR_����ٷν���_����üũ�� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}

�̺�Ʈ_���̵�߰�:
{
	fPrintTitle("���̵�ȭ��")
	fPrintStatus("���̵� �߰߿��� �����ϴ�.")
       
	funcSearchAndClickFolder("10.�˾����̺�Ʈ\���̵�߰�")
	funcWaitingForLoad()
	fPrintStatus("���̵� ȭ�鿡�� �����ϴ�.")
	if( funcIsExistImage(  "4.���̵嵹��\���̵�ȭ��.bmp" ) = true ){		
		if( funcIsExistImage(  "4.���̵嵹��\���̵�ȭ��.bmp" ) = true ){		
			funcSendESC()
		}
	}
   return
}
�������_����Ȯ��:
{	
	fPrintTitle("����  Ȯ��")
	fPrintStatus("���� Ȯ���� �����մϴ�.")
	loop,5
	{
		if( funcIsExistImageFolder("10.�˾����̺�Ʈ\����Ȯ��â"  ) = true ){
         boolNeedCheckAchievement:=true
			If( funcSearchAndClickFolder("10.�˾����̺�Ʈ\����Ȯ��") = true ){
				vLine = ����Ȯ���� �����մϴ�. %A_Index%ȸ
				fPrintStatus(vLine)
			}else{
            fPrintStatus("Ȯ�� ��ư�� ��ã����... ESC�� �����ϴ�.")
            funcSendESC()
         }				
		}else{
			break
		}
	}	
	return
}

�������_����Ȯ��:
{
	fPrintTitle("����  Ȯ��")
	fPrintStatus(" ���� Ȯ���� �����մϴ�.")
	loop,5
	{
		if( funcIsExistImageFolder("10.�˾����̺�Ʈ\����Ȯ��"  ) = true ) {
			If( funcSearchAndClickFolder("10.�˾����̺�Ʈ\����Ȯ��") = true ){
            vLine = ����Ȯ���� �����߽��ϴ�. %A_Index%ȸ
            fPrintStatus(vLine)
            BoolNeedLevelUpCheck:= true
         }else{
            fPrintStatus("Ȯ�� ��ư�� ��ã����... ESC�� �����ϴ�.")
            funcSendESC()
         }	
		}else{
			break
		}
	}	
	return
}
����Ȯ��_Ȯ��:
{	
	fPrintTitle("����  Ȯ��")
	fPrintStatus("���� Ȯ���� �����մϴ�.")
	loop, 5
	{
		if( funcIsExistImageFolder("10.�˾����̺�Ʈ\����Ȯ��â"  ) = true ){
			If( funcSearchAndClickFolder("10.�˾����̺�Ʈ\����Ȯ��") = true ){
				vLine = ����Ȯ���� �����մϴ�. %A_Index%ȸ
				fPrintStatus(vLine)
			}else{
            fPrintStatus("Ȯ�� ��ư�� ��ã����... ESC�� �����ϴ�.")
            funcSendESC()
         }			
		}else{
			fPrintStatus("��𿡼� �߻��� �������� �𸣴� ��ġ ã��� �̵��մϴ�.")
			goto ��ġã��
		}
	}
   fPrintStatus( funcCaptureErrorScreen() )
   fPrintStatus("ERROR_5ȸ ���� �ݺ��ߴµ� ������ �Ⱦ��� ��������..")
   goto ��ġã��
}
����Ȯ��_Ȯ��:
{
	
	fPrintTitle("����  Ȯ��")
	fPrintStatus("���� Ȯ���� �����մϴ�.")	
	loop, 5
	{					
		if( funcIsExistImageFolder("10.�˾����̺�Ʈ\����Ȯ��"  ) = true ) {
			If( funcSearchAndClickFolder("10.�˾����̺�Ʈ\����Ȯ��") = true ){
				BoolNeedLevelUpCheck:= true
				vLine = ����Ȯ���� �����մϴ�. ���� ������ �̷����� Ȯ���ϰڽ��ϴ�. %A_Index%ȸ		
				fPrintStatus(vLine)
			}else{
            fPrintStatus("Ȯ�� ��ư�� ��ã����... ESC�� �����ϴ�.")
            funcSendESC()            
         }
		}else{
			if( GuiBoolStopMonsterLevelUp = true ){
            updateLevelUpCheckZero()
				gosub, ��ũ������
         }      
         fPrintStatus("��� �߻��� �̺�Ʈ���� �˼����⿡ ��ġã��� �̵��մϴ�. ")
         goto ��ġã��
		}
	}
   fPrintStatus( funcCaptureErrorScreen() )
   fPrintStatus("ERROR_5ȸ ���� �ݺ��ߴµ� ������ �Ⱦ��� ��������..")
   goto ��ġã��
}

������_Ȯ��:
{
	fPrintTitle("������Ȯ��")
	fPrintStatus("���� � ���������� Ȯ���մϴ�.")
	if( funcIsExistImage(  "������\������������.bmp" ) = true ){		
		fPrintStatus("������ ���������� �̵��մϴ�.")
		goto, ������_������_������
	}else if  ( funcIsExistImage(  "������\Ȳ��������.bmp" ) = true ){		
		fPrintStatus("Ȳ�ݹ� ���������� �̵��մϴ�.")
		goto, ������_Ȳ�ݹ�_������
	}else{
		fPrintStatus("���� ���������� �̵��մϴ�.")
		fPrintTitle("������_����")
		goto, ������_����_������
	}
	fPrintStatus("ERROR_������_Ȯ�� ��ġã��� �̵��մϴ�. ")
	goto ��ġã��
}


checkBattleNeeds(iBattleCount){
	global CountForBattle
	vSearchResult = ����Ƚ��: %iBattleCount% , �����嵹��:%CountForBattle%

	fPrintResult(vSearchResult)
	iRemain :=Mod(iBattleCount , CountForBattle)    
	if( iRemain = 0 ){
		fPrintResult("��������  ���ڽ��ϴ�.")
		return true
	}else{
		return false
	}
}

checkGoldRoomNeeds( iBattleCount ){
   global CountForGoldRoom
   vSearchResult = ����Ƚ��: %iBattleCount% , Ȳ�ݹ�:%CountForGoldRoom%
	fPrintResult(vSearchResult)
	iRemain :=Mod(iBattleCount , CountForGoldRoom)    
	if( iRemain = 0 ){
		fPrintResult("Ȳ�ݹ��� ���ڽ��ϴ�.")
		return true
	}else{
		return false  
	}
}

checkLevelUpNeeds( iBattleCount ){
   global CountForLevelupCheck

	vSearchResult = ����Ƚ��: %iBattleCount% , ����Ȯ��:%CountForLevelupCheck%
	fPrintResult(vSearchResult)
	iRemain := ( iBattleCount >= CountForLevelupCheck  )

if( iRemain = true ){
		fPrintResult("������ Ȯ���� �ʿ��մϴ�.")
		return true
	}else{
		fPrintResult("���� ������ üũ�� ���ҽ��ϴ�.")
		return false
	}

}
