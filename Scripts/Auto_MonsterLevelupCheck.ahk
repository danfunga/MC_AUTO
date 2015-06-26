
updateLevelUpCheckZero(){
	global IntMonitorNoLevelUpCheckCount, BoolNeedLevelUpCheck
   BoolNeedLevelUpCheck:=false
	IntMonitorNoLevelUpCheckCount:=0	
	GuiControl, ,NoLevelUp,%IntMonitorNoLevelUpCheckCount%
	return
}


refreshHeroPage(){
   if( funcIsExistImage( "5.쫄작하기\window_영웅관리.png" ) = true ) {
      funcSendESC()
   }else if( funcSearchAndClick( "5.쫄작하기\button_영웅관리.png" ) = true ) {
      funcSendESC()
   }else{
      vStatus=위치가 잘못되었습니다.
		fPrintStatus(vStatus)
		return
   }   
   funcSearchAndClick("5.쫄작하기\button_영웅관리.png")
   return
}
SUB_원소쫄바꾸기:
{
	if( funcSearchAndClick( "5.쫄작하기\buton_원소영웅보기.png" ) = true ){
		Loop, %A_ScriptDir%\Image\5.쫄작하기\Monster\InElements\*,1,0
      {
         vTargetMonsterName = %A_LoopFileName%
         vStatus=교체할 몬스터(%vTargetMonsterName%)를 찾습니다. ( 원소 먼저 )
         fPrintStatus(vStatus)		
         booleanThisMonsterDone:=false
         Loop, %A_ScriptDir%\Image\5.쫄작하기\Monster\InElements\%vTargetMonsterName%\*.bmp
         {
            vNewMonsterFile=5.쫄작하기\monster\InElements\%vTargetMonsterName%\%A_LoopFileName%
            If(  monsterFinder( xNew, yNew, vNewMonsterFile ) = true ){					
               vStatus=%vTargetMonsterName%를 찾았습니다.
               fPrintResult(vStatus)
               loop 5
               {
                  if( boolNeedChangeMonster%a_index% = true ){
                     vSearchResult = %A_LoopFileName%을  클릭합니다. -대상: %a_index%번 
                     fPrintResult(vSearchResult)
                     funcSendClick( xNew, yNew )
                     
                     If( funcSearchAndClick( "5.쫄작하기\팀배치.bmp" ) = true ){   
                        funcSendClickFixed( positionX%a_index%,positionY%a_index%, true)
                        If( funcSearchAndClick( "5.쫄작하기\팀설정실패.bmp" ) = true ){
                           vSearchResult = 이미 팀에 동일한 몬스터(%vTargetMonsterName%)가 있네요 -현재대상: %a_index%번 
                           fPrintStatus(vSearchResult)
                           continue
                        }else{
                           booleanThisMonsterDone:=true
                           boolNeedChangeMonster%a_index%:=false
                           stringTitle=%stringTitle% , %a_index%-V 
                           funcPrintSubTitle(stringTitle)
                           vSearchResult = 쫄 %a_index%번을 변경 완료했습니다.
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
                        fPrintStatus("이미 팀에 있는 몬스터인가 봅니다.")
                        funcSendESC()
                        fPrintStatus("다음 몬스터를 검색합니다.")                     
                        break
                      }                                
                  }
               }
            }
            ;~ 해당 몬스터의 적용을 완료한 경우
            if( booleanThisMonsterDone = true )
               break
         }				
      }
   }
   return
}

렙업_쫄확인_통합:
{	
   fPrintTitle("쫄렙업확인")
   stringTitle=쫄작 
   funcPrintSubTitle(stringTitle)
     
     
	fPrintStatus("레벨업한 쫄 바꾸기를 시도합니다.")
	updateLevelUpCheckZero()
	fPrintStatus("최신 몹 반영을 위해 영웅 관리를 들어갔다 나옵니다.")
	refreshHeroPage()
   
   booleanNeedToChangeUp:= false   
   gosub SUB_Read_LevelUpCheckConfig
   
	booleanNeedToChangeUp:= funcNeedToMonsterCheck()
	if( booleanNeedToChangeUp = false ){
		goto GOTO_EndLevelUpCheck
	}
	 
	 ;~ 원소 먼저 
	if ( GuiCheckFirstElement = true ){
      gosub SUB_원소쫄바꾸기
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
      
         stringChoiceStatus = %a_index%/8 ( Drag=%ingLoopCount% )를 선택합니다.
			fPrintStatus(stringChoiceStatus)		
         
         ;순서대로 몬스터를 선택
         xNew:=X_POS_%a_index%
         yNew:=Y_POS_%a_index%
         
         booleanMonsterChecked:=false         
         loop 5
			{
            if( boolNeedChangeMonster%a_index% = true ){
               vSearchResult =%stringChoiceStatus% -대상: %a_index%번 
               fPrintResult(vSearchResult)
               funcSendClickFixed( xNew, yNew , true)
               if( booleanMonsterChecked = false ){
                  if( funcIsExistImageFolder("5.쫄작하기\Monster\OutCheck") = true ){
                     fPrintStatus("만렙 몬스터입니다. 이제 쫄변경을 종료합니다.")
                     funcSendESC()
                     return
                  }
                  booleanMonsterChecked:=true
               }
               
               If( funcSearchAndClick( "5.쫄작하기\팀배치.bmp" ) = true ){   
                  funcSendClickFixed( positionX%a_index%,positionY%a_index%, true)
                  If( funcSearchAndClick( "5.쫄작하기\팀설정실패.bmp" ) = true ){
                     vSearchResult = 이미 팀에 동일한 몬스터(%vTargetMonsterName%)가 있네요 -현재대상: %a_index%번 
                        fPrintStatus(vSearchResult)
                     continue
                  }else{
                     stringTitle=%stringTitle% , %a_index%-V 
                     funcPrintSubTitle(stringTitle)
                     booleanThisMonsterDone:=true
                     boolNeedChangeMonster%a_index%:=false
                     fPrintStatus("변경 완료 했습니다.")									
                     IntMonitorMonsterLevelUpCount++
                     GuiControl, ,CountMonsterChange,%IntMonitorMonsterLevelUpCount%
                     booleanNeedToChangeUp:= funcNeedToMonsterCheck()
                     if( booleanNeedToChangeUp = false ){
                        return
                     }							   
                     break
                  }									
               }else{
                  fPrintStatus("이미 팀에 있는 몬스터인가 봅니다.")
                  funcSendESC()
                  fPrintStatus("다음 몬스터를 검색합니다.")                     
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
		Loop, %A_ScriptDir%\Image\5.쫄작하기\Monster\InMonster\*,1,0
		{
			vTargetMonsterName = %A_LoopFileName%
			vStatus=교체할 몬스터(%vTargetMonsterName%) 찾습니다
			fPrintStatus(vStatus)		
			booleanThisMonsterDone:=false
			booleanMonsterFind :=false
			Loop, %A_ScriptDir%\Image\5.쫄작하기\Monster\InMonster\%vTargetMonsterName%\*.bmp
			{
				vNewMonsterFile=5.쫄작하기\monster\InMonster\%vTargetMonsterName%\%A_LoopFileName%
				If(  monsterFinder( xNew, yNew, vNewMonsterFile ) = true ){					
					booleanMonsterFind :=true
					vStatus=%vTargetMonsterName%를 찾았습니다.
					fPrintResult(vStatus)
					loop 5
					{
						if( boolNeedChangeMonster%a_index% = true ){
							vSearchResult = %A_LoopFileName%을  클릭합니다. -대상: %a_index%번 
							fPrintResult(vSearchResult)
							funcSendClick( xNew, yNew )
							If( funcSearchAndClick( "5.쫄작하기\팀배치.bmp" ) = true ){   
								funcSendClickFixed( positionX%a_index%,positionY%a_index%, true)
								If( funcSearchAndClick( "5.쫄작하기\팀설정실패.bmp" ) = true ){
								   vSearchResult = 이미 팀에 동일한 몬스터(%vTargetMonsterName%)가 있네요 -현재대상: %a_index%번 
									   fPrintStatus(vSearchResult)
								   continue
								}else{
									stringTitle=%stringTitle% , %a_index%-V 
									funcPrintSubTitle(stringTitle)
									booleanThisMonsterDone:=true
									boolNeedChangeMonster%a_index%:=false
									fPrintStatus("변경 완료 했습니다.")									
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
								fPrintStatus("이미 팀에 있는 몬스터인가 봅니다.")
								funcSendESC()
								fPrintStatus("다음 몬스터를 검색합니다.")                     
								break
							 }                                
						  }
					   }
				   break
				}
				;~ 해당 몬스터의 적용을 완료한 경우
				if( booleanThisMonsterDone = true )
					break
			}
			if( booleanMonsterFind =false )
			{
				vSearchResult = %vTargetMonsterName%을 찾지 못하였습니다. 
				fPrintResult(vSearchResult)	
			}
			;~ 특정 몬스터에 대한 이미지를 다 검색했으나, 몬스터가 없다 --> Next Folder
		}
		;~ 전체 몬스터를 찾았지만 끝난것 같지 않다. Drag를 하자
		fDragUpHero()	
	}
   return
}
GOTO_EndLevelUpCheck:
{		
	vStatus=쫄 렙업 확인이 종료되었습니다. 
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
         vStatus=%GuiListTeamPosition%진형 %a_index%번 몬스터 확인
         fPrintStatus(vStatus)           
         
         funcSendClickFixed( positionX%a_index%,positionY%a_index%, true)
         if( funcIsExistImageFolder("5.쫄작하기\Monster\OutCheck") = true ){
            booleanNeedToChangeUp:=true
            boolNeedChangeMonster%a_index%:=true
            stringTitle=%stringTitle% : %a_index%-O
            funcPrintSubTitle(stringTitle)
            vStatus=%GuiListTeamPosition%진형 %a_index%번 몬스터 확인 -> 교체 필요
            fPrintStatus(vStatus) 
         }else {
            stringTitle=%stringTitle% : %a_index%-X
            funcPrintSubTitle(stringTitle)
            boolNeedChangeMonster%a_index%:=false
         }
         ;~ 영웅 화면으로 이동
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
	fPrintStatus("드래그 Up")	
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
	IfWinExist 후원 세션
	{
		WinActivate 후원 세션
		Send {Enter}
	}	
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%
	ImageSearch, oX, oY, winX, winY, winX+winW, winY+winH, *%vPercent% %A_ScriptDir%%vImgSepa%%img%		
	If Errorlevel = 0
	{
		intPosX := oX
		intPosY := oY
		vSearchResult = %img%을 찾았습니다.
		fPrintResult(vSearchResult)
		return true
	}
	If Errorlevel = 2
	{		
		vSearchResult = %img%이 잘못된것 같습니다.
		fPrintResult(vSearchResult)
		return false
	}
	;~ vSearchResult = %img%을 찾지 못하였습니다. 
	;~ fPrintResult(vSearchResult)	
	return false
}



;~ F8::
테스트PNG찾기:
{
	fPrintTitle("그림찾기 테스트")
	;~ global  ACTIVE_ID
	Loop,  %A_ScriptDir%\Image\5.쫄작하기\테스트\*.png
	{
		vTestPicture=5.쫄작하기\테스트\%A_LoopFileName%
		
		WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%
		if ( funcSearchImage(  xStart, yStart, vTestPicture ) = true ){		
			xStart:=xStart-winX
			yStart:=yStart-winy
		mouseMove, xStart,yStart
		;~ lParam := xStart & 0xFFFF | (yStart & 0xFFFF) << 16
		;~ PostMessage, 0x201, 1, %lParam%, , 경고 ;WM_LBUTTONDOWN
		;~ sleep, 100	
		;~ PostMessage, 0x202, 1, %lParam%, , 경고 ;WM_LBUTTONUP
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
   
   보호monster1X:=rightRowX
   보호monster2X:=rightRowX
   보호monster3X:=rightRowX
   보호monster4X:=rightRowX
   보호monster5X:=leftRowX
   
   공격monster1X:=rightRowX
   공격monster2X:=leftRowX
   공격monster3X:=leftRowX
   공격monster4X:=leftRowX
   공격monster5X:=leftRowX

   기본monster1X:=rightRowX
   기본monster2X:=rightRowX
   기본monster3X:=leftRowX
   기본monster4X:=leftRowX
   기본monster5X:=leftRowX
   
   밸런스monster1X:=rightRowX
   밸런스monster2X:=rightRowX
   밸런스monster3X:=rightRowX
   밸런스monster4X:=leftRowX
   밸런스monster5X:=leftRowX
   

   보호monster1Y:=TOP_Y
   보호monster2Y:=보호monster1Y+DIFF_Y
   보호monster3Y:=보호monster2Y+DIFF_Y
   보호monster4Y:=보호monster3Y+DIFF_Y
   보호monster5Y:=(TOP_Y+Bottom_Y)/2
   
   공격monster1Y:=(TOP_Y+Bottom_Y)/2
   공격monster2Y:=TOP_Y
   공격monster3Y:=공격monster2Y+DIFF_Y
   공격monster4Y:=공격monster3Y+DIFF_Y
   공격monster5Y:=공격monster4Y+DIFF_Y

   
   
   기본monster3Y:=TOP_Y
   기본monster4Y:=(TOP_Y+Bottom_Y)/2
   기본monster5Y:=Bottom_Y
   기본monster1Y:=(기본monster3Y+기본monster4Y)/2
   기본monster2Y:=(기본monster4Y+기본monster5Y)/2
   
   밸런스monster1Y:=TOP_Y
   밸런스monster2Y:=(TOP_Y+Bottom_Y)/2
   밸런스monster3Y:=Bottom_Y
   밸런스monster4Y:=(밸런스monster1Y+밸런스monster2Y)/2
   밸런스monster5Y:=(밸런스monster2Y+밸런스monster3Y)/2
   
   
   
   
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


해피몬스터판매:
{
	stringTitle=몬스터판매
	fPrintTitle(stringTitle)
	fPrintStatus("레벨업한 쫄 바꾸기를 시도합니다.")
	updateLevelUpCheckZero()
	fPrintStatus("최신 몹 반영을 위해 영웅 관리를 들어갔다 나옵니다.")
	refreshHeroPage()
   
	return

}
