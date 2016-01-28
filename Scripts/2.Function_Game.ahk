/*
------------------------------------------------------------
�⺻���� wait : ���� ������ ������ ���� ���� üũ ���� �⺻ Wait �⺻(40�� )
------------------------------------------------------------
*/
funcWaitingBattleBasicDuration(){
   global GuiDelayForBattle
   global BATTLE_CHECK_DELAY

   vStatus=%GuiDelayForBattle% �� �� ���� ���Ḧ %BATTLE_CHECK_DELAY%�� �� ���������� Ȯ���մϴ�.
   fPrintStatus(vStatus)
   funcSleep( GuiDelayForBattle )
}

/*
---------------------------------------------------------------------------------------------------------------------------
���谡 ���� ��� �� �ֱ�� ���� �ִ� ���θ� üũ�� ���ΰ� �⺻: 2�� ( 120 )
---------------------------------------------------------------------------------------------------------------------------
*/
funcWaitingForNoKeyDelay(){
   global BATTLE_CHECK_DELAY
   loop 24
   {
      funcSleep(BATTLE_CHECK_DELAY)
      checkExit()
   }
}




funcReceiveAchievement(){	
    
	global boolNeedCheckAchievement	
   global INT_PREVENT_ACHIEVELOOP	
   global GuiWantByKeyPoint	
   global IntMonitorReceiveArcheivementCount
   
   fPrintTitle("����  ����")
	fPrintStatus("�޼��� ������ �����մϴ�")
   
   fPrintStatus("�Ϲ� ������ �����մϴ�.")
   if( funcSearchAndClickFolder("8.����Ȯ��\��ư_�Ϲݾ���") = false ) {
      boolNeedCheckAchievement:= false
      fPrintResult("�Ϲ� ������ �����ϴ�. ���� �ޱ⸦ �����մϴ�.")
      funcSendESC()
      return
   }
   if( funcSearchAndClickFolder("8.����Ȯ��\��ư_��ιޱ�") = false ) {
      boolNeedCheckAchievement:= false
      fPrintStatus( funcCaptureErrorScreen() )
		fPrintResult("��ιޱ� ��ư�� ã�� ���Ͽ����ϴ�.")
      funcSendESC()
      return
   }        
	fPrintStatus("������ Ȯ���մϴ�")					
	if( funcSearchAndClickFolder( "8.����Ȯ��\��ư_����Ȯ��" ) = true ){
      IntMonitorReceiveArcheivementCount++
      GuiControl, ,GuiReceivePointCount,%IntMonitorReceiveArcheivementCount%
      fPrintStatus("������ Ȯ���Ͽ����ϴ�.")					
      funcSendESC()
      return
	}else{
      fPrintStatus("�� ���ɿ� �����Ѱ����� ���Դϴ�.")		
		funcSendESC()
      
      fPrintStatus("�� ������ �ߴ��մϴ�.")		
      funcSendESC()
      if( GuiWantByKeyPoint = true ){
         fPrintStatus("���� ���� ������ �Ǿ� ������ ���� ���踦 �����ϰڽ��ϴ�.")		
         if( INT_PREVENT_ACHIEVELOOP < 5 ){
            INT_PREVENT_ACHIEVELOOP++
            fPrintStatus("���� ���踦 �����ϰڽ��ϴ�.")		
            functionMoveTown()            
            functionByKeyByPoint()
            return
         }else{
            fPrintResult("ERROR_���ѷ����� ����ϱ� ���� �ϴ� �� ������ ����ϴ�.")		
            boolNeedCheckAchievement:= false
            return
         }
      }else{
         boolNeedCheckAchievement:= false
         return
      }
   }	
}

functionMoveTown()
{
   fPrintTitle("������ �̵�")
   fPrintStatus("������ �̵��� ���� �մϴ�.")
   loop
   {
      if( funcIsExistImage( "���۸���\���������ư.bmp" ) = true ){		
         fPrintStatus("������ ���� �߽��ϴ�.")
         return
      }else if( funcSearchAndClickFolder( "10.��������̹���\��ư_����" ) = true ){		
         fPrintStatus("������ �̵��մϴ�")
      }else if( funcIsExistImage( "2.���赹��\Button_����_�����ϱ�.bmp" ) = true ){		
         fPrintStatus("���� ���� ȭ�鿡 �ֽ��ϴ�")
         funcSendESC()         
      }else if( funcIsExistImage( "2.���赹��\Button_�����غ�.bmp" ) = true ){		
         fPrintStatus("���� �غ� �����ϰ� �ֽ��ϴ�")
         funcSendESC()         
      }else if( funcIsExistImage( "2.���赹��\��������\��������ȭ��.bmp" ) = true ){		
         fPrintStatus("���������� �����ϴ� �������� ȭ�� �Դϴ�.")
         funcSendESC()
      }else if( funcIsExistImageFolder( "3.��������\��ư_��������\ȭ��_��������" ) = true ){		
         fPrintStatus("�������� ȭ���Դϴ�")
         funcSendESC()
      }else if( funcIsExistImageFolder( "3.��������\3.����������\��ư_�����ϱ�" ) = true ){		
         fPrintStatus("������ �����غ� ȭ���Դϴ�")
         funcSendESC()
      }else if( funcIsExistImageFolder( "3.��������\3.����������\��ư_�غ��ϱ�") = true ){		
         fPrintStatus("������ �غ�ȭ���Դϴ�.")
         funcSendESC()
      }else if( funcIsExistImageFolder( "3.��������\3.����������\ȭ��_��������" ) = true ){		
         fPrintStatus("�������� ���� ȭ���Դϴ�")
         funcSendESC()
      }else if( funcIsExistImageFolder( "3.��������\1.Ȳ�ݹ浹��\��ġ_������ž" ) = true ){		
         fPrintStatus("������ž ���� ȭ���Դϴ�")
         funcSendESC()         
      }else if( funcIsExistImageFolder( "3.��������\2.�����嵹��\��ġ_������" ) = true ){		
         fPrintStatus("������ ����  ȭ���Դϴ�")
         funcSendESC()         
      }else{
         fPrintStatus("����� �𸣰� �ֽ��ϴ�")
         funcSendESC()
      }
      
      if( a_index > 10 ){
		fPrintStatus("ERROR_���� �̵��� ���� ������ ���������� ���Դϴ�.")
         return
      }
   }
}
funcChoiceTeam( teamName )
{
   StringReplace,teamNum,teamName,��,,All  
   
   teamFolder =10.�������ϱ�\team%teamNum%   
   if( funcSearchAndClickFolder( teamFolder ) = true ){
      result = %teamName%�� �����Ͽ����ϴ�.
      fPrintResult(result)
      return
   }else{
      result = %teamName%�� �̹� ���õǾ� �ִ°����� ���Դϴ�.
      fPrintResult(result)
   }
	return
}
funcChoicePlayerSkill( teamName )
{
  
   StringReplace,skillNum,teamName,��,,All  
   
   result="�÷��̾� ��ų%skillNum%�� ����ϰڽ��ϴ�."
   fPrintStatus(result)
   
   
   ;�̹� ���õǾ� �ִ��� Ȯ���Ѵ�.
   choicedFolder =10.�������ϱ�\playerSkill\skillbutton\choiced_skilll%skillNum%   
   if( funcIsExistImageFolder( choicedFolder ) = true ){
      result=�̹� �ý�%skillNum%�� ���õǾ� �ֽ��ϴ�.
      fPrintResult(result)
      return
   }else{
      ;�ϴ� skillButton�� Ŭ���Ѵ�.
      
      skillButtonFolder =10.�������ϱ�\playerSkill\skillbutton 
      if( funcSearchAndClickFolder( skillButtonFolder ) = true ){
      
         skillSelectButton =10.�������ϱ�\playerSkill\skill%skillNum%         
         if( funcSearchAndClickFolder( skillSelectButton ) = true ){
            result="�ý�%skillNum%�� �����Ͽ����ϴ�."
            fPrintResult(result)     
            
            funcSearchAndClickFolder("10.�������ϱ�\playerSkill\exit")
         }             
      }else{
         result = ERROR_�÷��̾� ��ų ��ư Ŭ���� �����մϴ�.
         fPrintResult(result)      
      }     
   }
   return    
}
funcGetNextLoopMap()
{
	global LoopMapList
	global MapIndex
	
	StringSplit,MapListArray,LoopMapList,|
	
	if( MapIndex > MapListArray0 )
		MapIndex:= 1
	else if(  MapIndex < 1 )
		MapIndex:= 1
		
	thisTimeMap:=MapListArray%MapIndex%
	MapIndex++
	
	return thisTimeMap

}
