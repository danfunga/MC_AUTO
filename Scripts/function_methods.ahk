funcReceiveAchievement(){	
    
	global boolNeedCheckAchievement	
   global INT_PREVENT_ACHIEVELOOP	
   global GuiWantByKeyPoint	
   global IntMonitorReceiveArcheivementCount
   fPrintTitle("��  ����")
	fPrintStatus("�޼��� ������ �����մϴ�")
	 If( funcSearchAndClick( "���۸���\��ιޱ�.bmp"  ) = true  or funcSearchAndClick( "���۸���\��ιޱ�1.bmp"  ) = true){
		fPrintStatus("������ Ȯ���մϴ�")					
		if( funcSearchAndClick( "���۸���\receiveConfirm.bmp" ) = true ){
               IntMonitorReceiveArcheivementCount++
               GuiControl, ,GuiReceivePointCount,%IntMonitorReceiveArcheivementCount%
               fPrintStatus("������ Ȯ���Ͽ����ϴ�.")					
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
		funcSendESC()
	}else{
      boolNeedCheckAchievement:= false
      fPrintStatus( funcCaptureErrorScreen() )
		fPrintResult("��ιޱ� ��ư�� ã�� ���Ͽ����ϴ�.")
      funcSendESC()
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
      }else if( funcSearchAndClick( "���۸���\����.bmp" ) = true ){		
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
      }else if( funcIsExistImage( "��������\��������ȭ��.bmp" ) = true ){		
         fPrintStatus("�������� ȭ���Դϴ�")
         funcSendESC()
      }else if( funcIsExistImage( "��������\������\Button_����������.png" ) = true ){		
         fPrintStatus("������ �����غ� ȭ���Դϴ�")
         funcSendESC()
      }else if( funcIsExistImage( "��������\������\Button_�������غ�.png") = true ){		
         fPrintStatus("������ �غ�ȭ���Դϴ�.")
         funcSendESC()
      }else if( funcIsExistImage( "��������\������\Window_��������.png" ) = true ){		
         fPrintStatus("�������� ���� ȭ���Դϴ�")
         funcSendESC()
      }else if( funcIsExistImage( "��������\Window_������ž.png" ) = true ){		
         fPrintStatus("������ž ���� ȭ���Դϴ�")
         funcSendESC()         
      }else if( funcIsExistImage( "��������\Window_������.png" ) = true ){		
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
   Loop, %A_ScriptDir%\Image\10.�������ϱ�\%teamName%*.bmp
	{
		v���̸�=10.�������ϱ�\%A_LoopFileName%
		if ( funcSearchAndClick(v���̸�) = true ){
                  fPrintResult("�ش� ���� �����Ͽ����ϴ�.")
                  return
           }
	}
   fPrintResult("�̹� ���õǾ� �ִ� ������ ���Դϴ�.")
	return
}
funcChoicePlayerSkill( teamName )
{
  
   StringReplace,skillNum,teamName,��,,All  
   
   result="�÷��̾� ��ų%skillNum%�� ����ϰڽ��ϴ�."
   fPrintStatus(result)
   
   Loop, %A_ScriptDir%\Image\10.�������ϱ�\playerSkill\choiced_Skill%skillNum%*.bmp
   {
      choicedFile=10.�������ϱ�\playerSkill\%A_LoopFileName%
      if ( funcIsExistImage(choicedFile) = true ){
         result="�̹� �ý�%skillNum%�� ���õǾ� �ֽ��ϴ�."
         fPrintResult(result)     
         return
      }
   }
   Loop, %A_ScriptDir%\Image\10.�������ϱ�\playerSkill\playerSkill_button*.bmp
   {
      skillButtonFiles=10.�������ϱ�\playerSkill\%A_LoopFileName%
      if ( funcSearchAndClick(skillButtonFiles) = true ){
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
         break
      }

   }
   return    
}

func_windowResize( boolForce = false ){
   global ACTIVE_ID, RUN_WIDTH, RUN_HEIGHT, DEFAULT_WIDTH, DEFAULT_HEIGHT,BoolReSized
   if( boolForce = false ){

         if( BoolReSized =  false ){
            WinMove, %ACTIVE_ID%,,,,RUN_WIDTH,RUN_HEIGHT   
            BoolReSized :=true
         }else{
            WinMove, %ACTIVE_ID%,,,,DEFAULT_WIDTH,DEFAULT_HEIGHT
           BoolReSized:=false
      }
   }else{
      WinMove, %ACTIVE_ID%,,,,RUN_WIDTH,RUN_HEIGHT   
   }
}
fRetrun(){
	gosub StopPoint   
   return
}
fLog( vContent , boolIsDebug=false){
	FormatTime, sFileName, %A_NOW%, MM��dd��
	FormatTime, TimeString, %A_NOW%, MM-dd tt hh��mm��ss��
	if( boolIsDebug = false ){
		FileAppend, `n[%TimeString%]: %vContent%, %A_ScriptDir%\Logs\log(%sFileName%).txt	
	}else{
		FileAppend, `n[%TimeString%]: %vContent%, %A_ScriptDir%\Logs\debug(%sFileName%).txt	
	}
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


funcLoadConstants( ByRef value, strTitile, strKey ){
	IniRead, value, %A_ScriptDir%\Image\Constants.ini ,%strTitile%, %strKey%
	IfEqual value, ERROR
	{
		value:=""
	}
	return value
}