
updateLevelUpCheckZero(){
	global IntMonitorNoLevelUpCheckCount, BoolNeedLevelUpCheck
   BoolNeedLevelUpCheck:=false
	IntMonitorNoLevelUpCheckCount:=0	
	GuiControl, ,NoLevelUp,%IntMonitorNoLevelUpCheckCount%
	return
}


refreshHeroPage(){
   if( funcIsExistImage( "5.�����ϱ�\window_��������.png" ) = true ) {
      funcSendESC()
   }else if( funcSearchAndClick( "5.�����ϱ�\button_��������.png" ) = true ) {
      funcSendESC()
   }else{
      vStatus=��ġ�� �߸��Ǿ����ϴ�.
		fPrintStatus(vStatus)
		return
   }   
   funcSearchAndClick("5.�����ϱ�\button_��������.png")
   return
}
SUB_�����̹ٲٱ�:
{
	if( funcSearchAndClick( "5.�����ϱ�\buton_���ҿ�������.png" ) = true ){
		Loop, %A_ScriptDir%\Image\5.�����ϱ�\Monster\InElements\*,1,0
      {
         vTargetMonsterName = %A_LoopFileName%
         vStatus=��ü�� ����(%vTargetMonsterName%)�� ã���ϴ�. ( ���� ���� )
         fPrintStatus(vStatus)		
         booleanThisMonsterDone:=false
         Loop, %A_ScriptDir%\Image\5.�����ϱ�\Monster\InElements\%vTargetMonsterName%\*.bmp
         {
            vNewMonsterFile=5.�����ϱ�\monster\InElements\%vTargetMonsterName%\%A_LoopFileName%
            If(  monsterFinder( xNew, yNew, vNewMonsterFile ) = true ){					
               vStatus=%vTargetMonsterName%�� ã�ҽ��ϴ�.
               fPrintResult(vStatus)
               loop 5
               {
                  if( boolNeedChangeMonster%a_index% = true ){
                     vSearchResult = %A_LoopFileName%��  Ŭ���մϴ�. -���: %a_index%�� 
                     fPrintResult(vSearchResult)
                     funcSendClick( xNew, yNew )
                     
                     If( funcSearchAndClick( "5.�����ϱ�\����ġ.bmp" ) = true ){   
                        funcSendClickFixed( positionX%a_index%,positionY%a_index%, true)
                        If( funcSearchAndClick( "5.�����ϱ�\����������.bmp" ) = true ){
                           vSearchResult = �̹� ���� ������ ����(%vTargetMonsterName%)�� �ֳ׿� -������: %a_index%�� 
                           fPrintStatus(vSearchResult)
                           continue
                        }else{
                           booleanThisMonsterDone:=true
                           boolNeedChangeMonster%a_index%:=false
                           stringTitle=%stringTitle% , %a_index%-V 
                           funcPrintSubTitle(stringTitle)
                           vSearchResult = �� %a_index%���� ���� �Ϸ��߽��ϴ�.
                           fPrintStatus(vSearchResult)										
                           IntMonitorMonsterLevelUpCount++
                           GuiControl, ,CountMonsterChange,%IntMonitorMonsterLevelUpCount%
                           booleanNeedToChangeUp:= funcNeedToMonsterCheck()
                           if( booleanNeedToChangeUp = false ){
                              return
                           }							   
                           break
                        }									
                     }else{
                        booleanThisMonsterDone:=true
                        fPrintStatus("�̹� ���� �ִ� �����ΰ� ���ϴ�.")
                        funcSendESC()
                        fPrintStatus("���� ���͸� �˻��մϴ�.")                     
                        break
                      }                                
                  }
               }
            }
            ;~ �ش� ������ ������ �Ϸ��� ���
            if( booleanThisMonsterDone = true )
               break
         }				
      }
   }
   return
}

����_��Ȯ��_����:
{	
   fPrintTitle("�̷���Ȯ��")
   stringTitle=���� 
   funcPrintSubTitle(stringTitle)
     
     
	fPrintStatus("�������� �� �ٲٱ⸦ �õ��մϴ�.")
	updateLevelUpCheckZero()
	fPrintStatus("�ֽ� �� �ݿ��� ���� ���� ������ ���� ���ɴϴ�.")
	refreshHeroPage()
   
   booleanNeedToChangeUp:= false   
   gosub SUB_Read_LevelUpCheckConfig
   
	booleanNeedToChangeUp:= funcNeedToMonsterCheck()
	if( booleanNeedToChangeUp = false ){
		goto GOTO_EndLevelUpCheck
	}
	 
	 ;~ ���� ���� 
	if ( GuiCheckFirstElement = true ){
      gosub SUB_�����̹ٲٱ�
	}
	booleanNeedToChangeUp:= funcNeedToMonsterCheck()
   if( booleanNeedToChangeUp = false ){
      goto GOTO_EndLevelUpCheck
   }	 
	refreshHeroPage()	
   if( GuiRadioMonsterChangeCombine = true )
      gosub SUB_CHECK_MONSTER_BY_LEVEL1_PIC	
   else if ( GuiRadioMonsterChangeLoop = true )
      gosub, SUB_CHECK_MONSTER_BY_LOOP
   
	goto GOTO_EndLevelUpCheck
	return
}
SUB_CHECK_MONSTER_BY_LOOP:
{
   repeatCount:=GuiDragCount+1
   Loop, %repeatCount%
	{	
      ingLoopCount:=a_index-1
      Loop, 8
		{
      
         stringChoiceStatus = %a_index%/8 ( Drag=%ingLoopCount% )�� �����մϴ�.
			fPrintStatus(stringChoiceStatus)		
         
         ;������� ���͸� ����
         xNew:=X_POS_%a_index%
         yNew:=Y_POS_%a_index%
         
         booleanMonsterChecked:=false         
         loop 5
			{
            if( boolNeedChangeMonster%a_index% = true ){
               vSearchResult =%stringChoiceStatus% -���: %a_index%�� 
               fPrintResult(vSearchResult)
               funcSendClickFixed( xNew, yNew , true)
               if( booleanMonsterChecked = false ){
                  if( funcIsExistImageFolder("5.�����ϱ�\Monster\OutCheck") = true ){
                     fPrintStatus("���� �����Դϴ�. ���� �̺����� �����մϴ�.")
                     funcSendESC()
                     return
                  }
                  booleanMonsterChecked:=true
               }
               
               If( funcSearchAndClick( "5.�����ϱ�\����ġ.bmp" ) = true ){   
                  funcSendClickFixed( positionX%a_index%,positionY%a_index%, true)
                  If( funcSearchAndClick( "5.�����ϱ�\����������.bmp" ) = true ){
                     vSearchResult = �̹� ���� ������ ����(%vTargetMonsterName%)�� �ֳ׿� -������: %a_index%�� 
                        fPrintStatus(vSearchResult)
                     continue
                  }else{
                     stringTitle=%stringTitle% , %a_index%-V 
                     funcPrintSubTitle(stringTitle)
                     booleanThisMonsterDone:=true
                     boolNeedChangeMonster%a_index%:=false
                     fPrintStatus("���� �Ϸ� �߽��ϴ�.")									
                     IntMonitorMonsterLevelUpCount++
                     GuiControl, ,CountMonsterChange,%IntMonitorMonsterLevelUpCount%
                     booleanNeedToChangeUp:= funcNeedToMonsterCheck()
                     if( booleanNeedToChangeUp = false ){
                        return
                     }							   
                     break
                  }									
               }else{
                  fPrintStatus("�̹� ���� �ִ� �����ΰ� ���ϴ�.")
                  funcSendESC()
                  fPrintStatus("���� ���͸� �˻��մϴ�.")                     
                  break
               }                                
            }
         }
      }
      fDragUpHero()	
	}
   return
}
SUB_CHECK_MONSTER_BY_LEVEL1_PIC:
{
   repeatCount:=GuiDragCount+1
   Loop, %repeatCount%
	{	
		Loop, %A_ScriptDir%\Image\5.�����ϱ�\Monster\InMonster\*,1,0
		{
			vTargetMonsterName = %A_LoopFileName%
			vStatus=��ü�� ����(%vTargetMonsterName%) ã���ϴ�
			fPrintStatus(vStatus)		
			booleanThisMonsterDone:=false
			booleanMonsterFind :=false
			Loop, %A_ScriptDir%\Image\5.�����ϱ�\Monster\InMonster\%vTargetMonsterName%\*.bmp
			{
				vNewMonsterFile=5.�����ϱ�\monster\InMonster\%vTargetMonsterName%\%A_LoopFileName%
				If(  monsterFinder( xNew, yNew, vNewMonsterFile ) = true ){					
					booleanMonsterFind :=true
					vStatus=%vTargetMonsterName%�� ã�ҽ��ϴ�.
					fPrintResult(vStatus)
					loop 5
					{
						if( boolNeedChangeMonster%a_index% = true ){
							vSearchResult = %A_LoopFileName%��  Ŭ���մϴ�. -���: %a_index%�� 
							fPrintResult(vSearchResult)
							funcSendClick( xNew, yNew )
							If( funcSearchAndClick( "5.�����ϱ�\����ġ.bmp" ) = true ){   
								funcSendClickFixed( positionX%a_index%,positionY%a_index%, true)
								If( funcSearchAndClick( "5.�����ϱ�\����������.bmp" ) = true ){
								   vSearchResult = �̹� ���� ������ ����(%vTargetMonsterName%)�� �ֳ׿� -������: %a_index%�� 
									   fPrintStatus(vSearchResult)
								   continue
								}else{
									stringTitle=%stringTitle% , %a_index%-V 
									funcPrintSubTitle(stringTitle)
									booleanThisMonsterDone:=true
									boolNeedChangeMonster%a_index%:=false
									fPrintStatus("���� �Ϸ� �߽��ϴ�.")									
									IntMonitorMonsterLevelUpCount++
									GuiControl, ,CountMonsterChange,%IntMonitorMonsterLevelUpCount%
									booleanNeedToChangeUp:= funcNeedToMonsterCheck()
                           if( booleanNeedToChangeUp = false ){
                              return
									}							   
									break
								}									
							}else{
								booleanThisMonsterDone:=true
								fPrintStatus("�̹� ���� �ִ� �����ΰ� ���ϴ�.")
								funcSendESC()
								fPrintStatus("���� ���͸� �˻��մϴ�.")                     
								break
							 }                                
						  }
					   }
				   break
				}
				;~ �ش� ������ ������ �Ϸ��� ���
				if( booleanThisMonsterDone = true )
					break
			}
			if( booleanMonsterFind =false )
			{
				vSearchResult = %vTargetMonsterName%�� ã�� ���Ͽ����ϴ�. 
				fPrintResult(vSearchResult)	
			}
			;~ Ư�� ���Ϳ� ���� �̹����� �� �˻�������, ���Ͱ� ���� --> Next Folder
		}
		;~ ��ü ���͸� ã������ ������ ���� �ʴ�. Drag�� ����
		fDragUpHero()	
	}
   return
}
GOTO_EndLevelUpCheck:
{		
	vStatus=�� ���� Ȯ���� ����Ǿ����ϴ�. 
	fPrintStatus(vStatus)
	funcSendESC()
	return
}

SUB_Read_LevelUpCheckConfig:
{
   loop 5
   {
      if( GuiCheckChangeTeam%a_index% = true ){
         positionX%a_index%:=%GuiListTeamPosition%monster%a_index%X
         positionY%a_index%:=%GuiListTeamPosition%monster%a_index%Y
         vStatus=%GuiListTeamPosition%���� %a_index%�� ���� Ȯ��
         fPrintStatus(vStatus)           
         
         funcSendClickFixed( positionX%a_index%,positionY%a_index%, true)
         if( funcIsExistImageFolder("5.�����ϱ�\Monster\OutCheck") = true ){
            booleanNeedToChangeUp:=true
            boolNeedChangeMonster%a_index%:=true
            stringTitle=%stringTitle% : %a_index%-O
            funcPrintSubTitle(stringTitle)
            vStatus=%GuiListTeamPosition%���� %a_index%�� ���� Ȯ�� -> ��ü �ʿ�
            fPrintStatus(vStatus) 
         }else {
            stringTitle=%stringTitle% : %a_index%-X
            funcPrintSubTitle(stringTitle)
            boolNeedChangeMonster%a_index%:=false
         }
         ;~ ���� ȭ������ �̵�
         funcSendESC()
      }
   }
   return
}


funcNeedToMonsterCheck(){
	global boolNeedChangeMonster1, boolNeedChangeMonster2, boolNeedChangeMonster3, boolNeedChangeMonster4, boolNeedChangeMonster5
	needUpdate:=false
	 loop, 5
	{
		if( boolNeedChangeMonster%a_index% = true ){
			needUpdate:=true
			break
		}
	}		
	return needUpdate	
 }
	 
fDragUpHero(){	
	fPrintStatus("�巡�� Up")	
	global DRAGUP_MONSTER
	startingPosX=360
	startingPosY=500
	if( DRAGUP_MONSTER = false ){	
		endPosY=218
		DRAGUP_MONSTER := true
	}else{
		endPosY=219
		DRAGUP_MONSTER := false
	}
   
   funcSendMouseDragFixed(  startingPosX, startingPosY,startingPosX, endPosY )
    funcWaitingClick()
	return	
}

monsterFinder(  ByRef intPosX, ByRef intPosY, img){
	checkExit()
	global ACTIVE_ID
	vImgSepa=\Image\
	vPercent=80
	IfWinExist �Ŀ� ����
	{
		WinActivate �Ŀ� ����
		Send {Enter}
	}	
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%
	ImageSearch, oX, oY, winX, winY, winX+winW, winY+winH, *%vPercent% %A_ScriptDir%%vImgSepa%%img%		
	If Errorlevel = 0
	{
		intPosX := oX
		intPosY := oY
		vSearchResult = %img%�� ã�ҽ��ϴ�.
		fPrintResult(vSearchResult)
		return true
	}
	If Errorlevel = 2
	{		
		vSearchResult = %img%�� �߸��Ȱ� �����ϴ�.
		fPrintResult(vSearchResult)
		return false
	}
	;~ vSearchResult = %img%�� ã�� ���Ͽ����ϴ�. 
	;~ fPrintResult(vSearchResult)	
	return false
}



;~ F8::
�׽�ƮPNGã��:
{
	fPrintTitle("�׸�ã�� �׽�Ʈ")
	;~ global  ACTIVE_ID
	Loop,  %A_ScriptDir%\Image\5.�����ϱ�\�׽�Ʈ\*.png
	{
		vTestPicture=5.�����ϱ�\�׽�Ʈ\%A_LoopFileName%
		
		WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%
		if ( funcSearchImage(  xStart, yStart, vTestPicture ) = true ){		
			xStart:=xStart-winX
			yStart:=yStart-winy
		mouseMove, xStart,yStart
		;~ lParam := xStart & 0xFFFF | (yStart & 0xFFFF) << 16
		;~ PostMessage, 0x201, 1, %lParam%, , ��� ;WM_LBUTTONDOWN
		;~ sleep, 100	
		;~ PostMessage, 0x202, 1, %lParam%, , ��� ;WM_LBUTTONUP
	}else{
		MsgBox,,,WRONG:%vTestPicture%,0.3
	}

	}
	
	;~ If(  monsterFinder( xNew, yNew, vNewMonsterFile ) = true ){
	return
	
}

HeroPositionInit:
{
   rightRowX:=funcLoadConstants(vValue, "MEMBER_POSITION", "X_RIGHT_ROW" )
   leftRowX:=funcLoadConstants(vValue, "MEMBER_POSITION", "X_LEFT_ROW" )
      
   TOP_Y:=funcLoadConstants(vValue, "MEMBER_POSITION", "Y_TOP" )
   DIFF_Y:=funcLoadConstants(vValue, "MEMBER_POSITION", "Y_DIFF" )
   Bottom_Y:=funcLoadConstants(vValue, "MEMBER_POSITION", "Y_BOTTOM" )
   
   ��ȣmonster1X:=rightRowX
   ��ȣmonster2X:=rightRowX
   ��ȣmonster3X:=rightRowX
   ��ȣmonster4X:=rightRowX
   ��ȣmonster5X:=leftRowX
   
   ����monster1X:=rightRowX
   ����monster2X:=leftRowX
   ����monster3X:=leftRowX
   ����monster4X:=leftRowX
   ����monster5X:=leftRowX

   �⺻monster1X:=rightRowX
   �⺻monster2X:=rightRowX
   �⺻monster3X:=leftRowX
   �⺻monster4X:=leftRowX
   �⺻monster5X:=leftRowX
   
   �뷱��monster1X:=rightRowX
   �뷱��monster2X:=rightRowX
   �뷱��monster3X:=rightRowX
   �뷱��monster4X:=leftRowX
   �뷱��monster5X:=leftRowX
   

   ��ȣmonster1Y:=TOP_Y
   ��ȣmonster2Y:=��ȣmonster1Y+DIFF_Y
   ��ȣmonster3Y:=��ȣmonster2Y+DIFF_Y
   ��ȣmonster4Y:=��ȣmonster3Y+DIFF_Y
   ��ȣmonster5Y:=(TOP_Y+Bottom_Y)/2
   
   ����monster1Y:=(TOP_Y+Bottom_Y)/2
   ����monster2Y:=TOP_Y
   ����monster3Y:=����monster2Y+DIFF_Y
   ����monster4Y:=����monster3Y+DIFF_Y
   ����monster5Y:=����monster4Y+DIFF_Y

   
   
   �⺻monster3Y:=TOP_Y
   �⺻monster4Y:=(TOP_Y+Bottom_Y)/2
   �⺻monster5Y:=Bottom_Y
   �⺻monster1Y:=(�⺻monster3Y+�⺻monster4Y)/2
   �⺻monster2Y:=(�⺻monster4Y+�⺻monster5Y)/2
   
   �뷱��monster1Y:=TOP_Y
   �뷱��monster2Y:=(TOP_Y+Bottom_Y)/2
   �뷱��monster3Y:=Bottom_Y
   �뷱��monster4Y:=(�뷱��monster1Y+�뷱��monster2Y)/2
   �뷱��monster5Y:=(�뷱��monster2Y+�뷱��monster3Y)/2
   
   
   
   
   X_POS_1:=funcLoadConstants(vValue, "MONSTER_POS", "X_FIRST" )
   Y_POS_1:=funcLoadConstants(vValue, "MONSTER_POS", "Y_FIRST" )
   X_POS_DIFF:=funcLoadConstants(vValue, "MONSTER_POS", "X_DIFF" )  
   Y_POS_DIFF:=funcLoadConstants(vValue, "MONSTER_POS", "Y_DIFF" )
   
   X_POS_2:=X_POS_1+X_POS_DIFF
   Y_POS_2:=Y_POS_1
   
   X_POS_3:=X_POS_2+X_POS_DIFF
   Y_POS_3:=Y_POS_1
   
   X_POS_4:=X_POS_3+X_POS_DIFF
   Y_POS_4:=Y_POS_1
   
   X_POS_5:=X_POS_1
   Y_POS_5:=Y_POS_1+Y_POS_DIFF
   
   X_POS_6:=X_POS_2
   Y_POS_6:=Y_POS_5
   
   X_POS_7:=X_POS_3
   Y_POS_7:=Y_POS_5
   
   X_POS_8:=X_POS_4
   Y_POS_8:=Y_POS_5
   
   
   
   
   return
}


���Ǹ����Ǹ�:
{
	stringTitle=�����Ǹ�
	fPrintTitle(stringTitle)
	fPrintStatus("�������� �� �ٲٱ⸦ �õ��մϴ�.")
	updateLevelUpCheckZero()
	fPrintStatus("�ֽ� �� �ݿ��� ���� ���� ������ ���� ���ɴϴ�.")
	refreshHeroPage()
   
	return

}
