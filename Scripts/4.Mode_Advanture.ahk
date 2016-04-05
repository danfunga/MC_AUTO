시작마을:
{	
	fPrintTitle("시작  마을")	
	fPrintStatus("시작 마을에서 시작합니다.")	
   loop,3
   { 
	     if( boolNeedCheckAchievement = true ){
			fPrintStatus("업적이 있는지 확인합니다.")
			if( funcSearchAndClickFolder("8.업적확인\상태_업적있음") = true ) {
				funcReceiveAchievement()
			}else{
				fPrintResult("업적이 없습니다.")
				break
			}
		}else{
			fPrintStatus("업적이 있는지 확인하지 않습니다.")
			break
		}
   }	
   
   if( BoolNeedSendHonor = true ){
      fPrintStatus("명예를 보내겠습니다..")
      goto 시작마을_명예보내기	   
   }
	if( BoolNeedGoldRoomStage= true ) {
		fPrintStatus("황금방을 돌겠습니다.")
		goto 시작마을_황금방시작	
	}
	if( BoolNeedBattleStage = true ){
		fPrintStatus("결투장을 돌겠습니다.")
		goto 시작마을_결투장시작	
	}
   if( BoolNeedCastleBattle = true ){
		fPrintStatus("공성전을 돌겠습니다.")
		goto 시작마을_공성전시작
	}
   
   if( GuiSelectRaidMod= true and BoolNeedRaidBattle = true ){
      if ( funcIsExistImageFolder("4.레이드돌기\열쇠_제한\레이드시작") = true ){
         fPrintStatus("열쇠 제한이 확인되었습니다. ")
         fPrintStatus("레이드를 돌겠습니다.")
         goto 레이드모드시작
      }        
   }
   
	goto 시작마을_모험시작
}


시작마을_모험시작:
{
	fPrintStatus("모험 입장을 찾고 있습니다.")
	 If( funcSearchAndClickFolder( "2.모험돌기\버튼_모험입장"  ) = true )
		goto 모험입장		
		
	fPrintStatus("ERROR_시작마을_모험시작중 위치찾기로 이동합니다.")
	goto 위치찾기
}

모험입장:
{		
	fPrintTitle("모험  입장")
	fPrintStatus("모험입장에 들어왔습니다.")
   
   If( funcSearchAndClickFolder( "2.모험돌기\버튼_모험입장\버튼_모험"  ) = true ){   
      goto, 모험입장_스테이지선택
   }else if( funcIsExistImageFolder("2.모험돌기\버튼_모험입장\상태_모험입장") = true ){
      fPrintStatus("이미 ?머 입장 화면에 들어 와 있습니다.")
      goto, 모험입장_스테이지선택   
   }
      
	goto 위치찾기
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

모험입장_스테이지선택:
{
	fPrintStatus("설정한 스테이지를 확인합니다.")
   
   if( GuiLoopMap = true ){
      strStageName:=funcGetNextLoopMap()
   }else{
      strStageName:=GuiStageList
   }

   boolMoonIsland := funcIsMoonIsland( strStageName )
   
   모험입장_대륙선택:
   
	if( boolMoonIsland = true )	{
		if( funcIsExistImageFolder(  "2.모험돌기\모험지도\대륙\버튼_아스드대륙" ) = true )	{	
			fPrintStatus("현재 달빛섬이 선택되었습니다.")
		}else If( funcSearchAndClickFolder( "2.모험돌기\모험지도\대륙\버튼_달빛의섬" ) = true )	{
			fPrintStatus("달빛섬을 선택하였습니다.")	
		}
	}else{
		if( funcIsExistImageFolder(  "2.모험돌기\모험지도\대륙\버튼_달빛의섬" ) = true ){	
         if( funcIsExistImageFolder(  "2.모험돌기\모험지도\대륙\버튼_아스드대륙" ) = true )	{	
            fPrintStatus("현재 아스드대륙이 선택되었습니다.")	
         }else{
            fPrintStatus("그림자의 눈에 있나봅니다..")	
            If( funcSearchAndClickFolder( "2.모험돌기\모험지도\대륙\버튼_달빛의섬" ) = true )	{
               fPrintStatus("달빛섬을 선택하였습니다.")	          
               goto 모험입장_대륙선택
            }
         }
         
		}else if( funcSearchAndClickFolder( "2.모험돌기\모험지도\대륙\버튼_아스드대륙" ) = true ){
			fPrintStatus("아스드 대륙을 선택하였습니다.")	
		}
	}	
   goto 모험입장_난이도선택
   
	fPrintStatus("ERROR_모험입장_스테이지 선택중 위치찾기로 이동합니다.")
	goto 위치찾기
}

모험입장_난이도선택:
{	
	fPrintTitle("난이도선택")
	fPrintStatus("난이도 선택을 시작합니다.")

	if( GuiStageDifficulty = "쉬움" ){
		fPrintStatus("설정한 난이도는 쉬움입니다.")
		If( funcIsExistImage(  "2.모험돌기\모험지도\난이도\버튼쉬움.bmp" ) = true ){
			fPrintStatus("이미 쉬움이 선택되어 있어 맵선택으로 넘어갑니다.")			
		}else{
			if( funcSearchAndClick( "2.모험돌기\모험지도\난이도\버튼어려움.bmp")  = false )
				funcSearchAndClick( "2.모험돌기\모험지도\난이도\버튼보통.bmp") 
			funcSearchAndClick( "2.모험돌기\모험지도\난이도\선택쉬움.bmp")   	
		}	
		goto, 모험입장_맵선택		
	}else if ( GuiStageDifficulty = "보통" ){	
		fPrintStatus("설정한 난이도는 보통입니다.")
		If( funcIsExistImage(  "2.모험돌기\모험지도\난이도\버튼보통.bmp" ) = true ){
			fPrintStatus("이미 보통이 선택되어 있어 맵선택으로 넘어갑니다.")			
		}else{
			if( funcSearchAndClick( "2.모험돌기\모험지도\난이도\버튼어려움.bmp")  = false )
				funcSearchAndClick( "2.모험돌기\모험지도\난이도\버튼쉬움.bmp") 
			funcSearchAndClick( "2.모험돌기\모험지도\난이도\선택보통.bmp")   		
		}
		goto, 모험입장_맵선택
	}else if ( GuiStageDifficulty = "어려움" ){
		fPrintStatus("설정한 난이도는 어려움입니다.")
		If( funcIsExistImage(  "2.모험돌기\모험지도\난이도\버튼어려움.bmp" ) = true ){
			fPrintStatus("이미 어려움이 선택되어 있어 맵선택으로 넘어갑니다.")			
		}else{
			if( funcSearchAndClick( "2.모험돌기\모험지도\난이도\버튼보통.bmp")  = false )
				funcSearchAndClick( "2.모험돌기\모험지도\난이도\버튼쉬움.bmp") 
			funcSearchAndClick( "2.모험돌기\모험지도\난이도\선택어려움.bmp")   		
		}
		goto, 모험입장_맵선택
	}else
		fPrintStatus("설정의 확인이 필요합니다. 쉬움,보통,어려움중 한개는 선택이 되어야 합니다.")
	
	fPrintStatus("ERROR_모험입장_ 난이도선택중 위치찾기로 이동합니다.")
	goto 위치찾기
}
모험입장_맵선택:
{	
	fPrintTitle("맵    선택")
	fPrintStatus("스테이지를 선택합니다.")
      
   if( GuiStageDifficulty = "쉬움"  ){
      v맵이름 = 쉬%strStageName%.bmp
   }else if( GuiStageDifficulty = "보통" ){
      v맵이름 = 보%strStageName%.bmp
   }else if ( GuiStageDifficulty = "어려움" ){
      v맵이름 = 어%strStageName%.bmp
   }   
	
	v맵이름 = 2.모험돌기\모험지도\%v맵이름%
	 loop
	{		
		if( funcIsExistImage( v맵이름 ) = true ){
			funcSearchAndClick(v맵이름)
			fPrintStatus("모험 준비 화면으로 이동합니다.")
			goto, 모험입장_모험준비
		}else{
			fPrintStatus("다름창을 선택")
         funcSearchAndClick( "2.모험돌기\모험지도\맵이동.bmp") 
		}		
		if( A_Index >8 )
			break
	}
	fPrintStatus("ERROR_모험입장_ 맵선택중 위치찾기로 이동합니다. 지도 사진이 잘못된것 같습니다.")
	goto 위치찾기
}
모험입장_모험준비:
{	
	fPrintTitle("모험  준비")
	fPrintStatus("모험 준비 버튼을 클릭합니다.")
	If( funcSearchAndClick("2.모험돌기\Button_모험준비.bmp") = true )
		 goto 모험시작

	fPrintStatus("ERROR_모험입장_ 모험준비중 위치찾기로 이동합니다. 지도 사진이 잘못된것 같습니다.")
	goto 위치찾기
}

모험시작:
{	
	fPrintTitle("모험  시작")
	fPrintStatus("모험시작 페이지에 왔습니다.")
	
   fPrintStatus("모험팀 팀을 선택합니다.")
	vLine=설정된 모험팀은 %GuiListTeamAdvanture%입니다.
	fPrintStatus(vLine)   
	funcChoiceTeam( GuiListTeamAdvanture )
	funcChoicePlayerSkill( GuiListSkillAdvanture )
	goto,모험시작_모험시작	

	fPrintStatus("ERROR_모험시작중 위치찾기로 이동합니다. ")
	goto 위치찾기
}

모험시작_모험시작:
   fPrintTitle("모험  시작")
	fPrintStatus("모험을 시작합니다.")	
	/*
	----------------------------------------------------------------
		렙업 확인을 통해서 쫄업이 확인 되었을 경우 종료하자
	----------------------------------------------------------------
	*/
	if( BoolNeedLevelUpCheck = true ){
		if( GuiBoolStopMonsterLevelUp = true ){
         updateLevelUpCheckZero()
			gosub, 매크로종료
		}
	}
	
	if( GuiBoolStopMonsterLevelUp = false ){
		if( BoolNeedLevelUpCheck = false ){				
			BoolNeedLevelUpCheck := checkLevelUpNeeds( IntMonitorNoLevelUpCheckCount )
		}
		if( BoolNeedLevelUpCheck = true ){
         gosub, 렙업_쫄확인_통합         
		}			
	}
   if( GuiSelectRaidMod = true and BoolNeedRaidBattle = true){
      if ( funcIsExistImageFolder("4.레이드돌기\열쇠_제한\레이드시작") = true ){
         fPrintStatus("모험 중 열쇠 제한이 확인되었습니다. ")
         BoolNeedRaidBattle:=true
         functionMoveTown() 
         goto 시작마을

      }
   }else{
      if( GuiSelectRaidMod = true  )
      {
         BoolNeedRaidBattle:=true
      }   
   }
   
   모험시작_모험시작_버튼클릭:
	if ( funcSearchAndClick("2.모험돌기\Button_모험_시작하기.bmp") = true ){
			goto, 모험시작_전투시작체크
	}
	fPrintStatus("ERROR_모험시작_모험시작중 위치찾기로 이동합니다. ")
	goto 위치찾기   
return

모험시작_전투시작체크:
{	
   fPrintTitle("시작 체크")	
	fPrintStatus("모험의 시작을 체크합니다.")	
	;~ funcSleep(2)
	/*
		-------------------------------------
		팝업창이 클릭이 안되서 일단 직접 클릭했다...
		수정이 필요하긴 하다.
		-------------------------------------
	
   if( funcIsExistImageFolder( "2.모험돌기\상태_장비최대" ) = true ){		
      goto 장비_인벤_최대		
	}	
   */
	if( funcSearchAndClickFolder( "2.모험돌기\버튼_최대_진행" ) = true ){		
      fPrintStatus("케릭이 넘쳐도 진행 합니다.")	
	}	
	
	if( funcSearchAndClick(  "2.모험돌기\열쇠부족\모험키부족.bmp" ) = true ){		
		fPrintStatus("열쇠가 부족한 상황입니다.")
		goto 모험시작_모험키부족
	}	
   if ( funcIsExistImage("2.모험돌기\Button_모험_시작하기.bmp") = true ){
      fPrintStatus("INFO_모험시작하기 버튼이 안눌렸나 보다 다시 누르자")
		goto 모험시작_모험시작_버튼클릭
	}
   
	if( GuiAdvantureAutoSkill = true ){
		fPrintStatus("매크로 자동 스킬 시작하였습니다. 전투 시작을 기다립니다.")		
		if( funcWaitAndReturn(  "전투중\통합전투중" ) = true ){
			fPrintStatus("모험이 정상적으로 시작되었습니다.")			
		}
      
      if( GuiAutoSkillOff = true ){
         if( funcIsExistImageFolder( "전투중\자동스킬\Off" ) = false ){
            funcSearchAndClickFolder( "전투중\자동스킬\On" )         
         }         
      }else{
        if( funcIsExistImageFolder( "전투중\자동스킬\On" ) = false ){
            funcSearchAndClickFolder( "전투중\자동스킬\Off" )         
         }               
      }
		if( GuiCheckCallFriend = true ) {
				gosub 모험중_약식친구소환
		}
		else{
			fPrintStatus("친구 소환을 원치 않아 그대로 진행합니다.")
		}		
		goto 수동전투시작	
	}else{
		fPrintStatus("자동 전투를 시작하였습니다. 전투 시작을 기다립니다.")		
		funcWaitingForLoad()   
		if( funcIsExistImageFolder(  "전투중\통합전투중" ) = true ){		
			fPrintStatus("모험이 정상적으로 시작되었습니다.")
			if( GuiCheckCallFriend = true ) 
				goto 모험중_친구소환
			else {
				fPrintStatus("친구 소환을 원치 않아 그대로 진행합니다.")
				goto 전투중_모험	
			}		
		}
	}
	
	fPrintStatus("ERROR_모험시작_시작체크중 위치찾기로 이동합니다. ")
	goto 위치찾기
}
모험중_약식친구소환:
{
	fPrintTitle("모험전투중")
	fPrintStatus("친구소환을 시작합니다.")
   funcSearchAndClick("전투중\친구소환버튼.bmp", -20, -50 )
	return 
}

모험중_친구소환:
{
	fPrintTitle("모험전투중")
	fPrintStatus("친구소환을 시작합니다.")
   
	If( funcSearchAndClick( "전투중\친구소환버튼.bmp", -20, -50 ) = true )	{
		goto 전투중_모험		
	}
	fPrintStatus("ERROR_모험중_친구소환에 실패했지만 계속 진행합니다. ")
	fPrintStatus("ERROR_친구가 없는 경우는 정상입니다. ")
	goto 전투중_모험
}
 전투중_모험:
 {
	funcWaitingBattleBasicDuration()
	goto, 전투중_모험_결과대기	
}
 전투중_모험_결과대기:
 {
	fPrintStatus("5초씩 지속적으로 종료를 확인합니다.")
	loop{
		if( funcIsExistImage( "10.전투결과이미지\모험\모험W다시.bmp" ) = true ){		
			IntMonitorStageClearCount++
			IntMonitorNoLevelUpCheckCount++
			break	
		}else if( funcIsExistImage( "10.전투결과이미지\모험\모험F다시.bmp" ) = true ){				
			IntMonitorStageFailCount++
			break
		}
      funcWaitingForBattleCheck()
		if( A_index > 60 ){
			fPrintStatus("6분간 기다렸으나 전투가 종료 되지 않습니다.")	
			fPrintStatus("Error로 판단합니다.")				
			fPrintStatus("ERROR_전투중_모험_결과대기중 위치찾기로 이동합니다. ")
			goto 위치찾기
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
   
	
	fPrintStatus("전투 완료가 확인되었습니다.")				
	goto, 전투결과_모험
	
}
전투결과_모험:
{
	fPrintTitle("모험 결과")
	if( BoolNeedGoldRoomStage = true )
		fPrintStatus("황금방을 돌아야 합니다.")	
	if( BoolNeedBattleStage = true )			
      fPrintStatus("결투장을 돌아야 합니다.")
	if( BoolNeedBattleStage =true or BoolNeedGoldRoomStage =true ){
      if( funcSearchAndClickFolder( "10.전투결과이미지\버튼_마을" ) = true ){					
         funcWaitingForLoad()			
            
         fPrintStatus("레이드가 발견됐는지를 확인합니다.")
         if( funcIsExistImageFolder(  "10.팝업및이벤트\레이드발견" ) = true ){		
            fPrintStatus("레이드가 발견되었습니다.")
            gosub 이벤트_레이드발견
         }
         fPrintStatus("업적이 발생하였는지 확인합니다.")
         if( funcIsExistImageFolder(  "10.팝업및이벤트\업적확인창" ) = true ){		
            fPrintStatus("업적 확인으로 이동합니다.")
            gosub 모험시작_업적확인
         }
         
         fPrintStatus("렙업을 하였는지 확인합니다.")
         if( funcIsExistImageFolder(  "10.팝업및이벤트\렙업확인창" ) = true ){		
            fPrintStatus("렙업 확인으로 이동합니다.")
            gosub 모험시작_렙업확인
         }
         If( funcIsExistImageFolder( "2.모험돌기\버튼_모험입장" ) = true ){			
            goto, 시작마을
         }else{
            fPrintStatus("이벤트 처리를 위해 위치 찾기로 갑니다.")
            goto 위치찾기
         }
      }
		fPrintStatus("ERROR_전투결과_모험중 위치찾기로 이동합니다. ")
		goto 위치찾기   
   }
  
	fPrintStatus("다시 하기를 클릭합니다.")
	
	if( GuiCheckGoNextStage = true ){
		if( funcSearchAndClick( "10.전투결과이미지\모험\모험W다음.bmp" ) = false ){				
			funcSearchAndClick( "10.전투결과이미지\모험\모험F다시.bmp" ) 
		}
		goto 모험시작_시작체크
	}else if( funcSearchAndClick( "10.전투결과이미지\모험\모험W다시.bmp" ) = true ){				
		goto 모험시작_시작체크
	}else {
      funcSleep(2)
      fPrintStatus("ERROR_망할 케릭터 득 장면이 오래 걸리니 1초간 기다렸다 다시해본다.")
      if( funcSearchAndClick( "10.전투결과이미지\모험\모험W다시.bmp" ) = true ){				
         goto 모험시작_시작체크
      }else if( funcSearchAndClick( "10.전투결과이미지\모험\모험F다시.bmp" ) = true ){				
         goto 모험시작_시작체크
      }
	}
	fPrintStatus("ERROR_모험완료중 위치찾기로 이동합니다. ")
	goto 위치찾기
}
모험시작_시작체크:
{
	fPrintTitle("시작  체크")
   funcWaitingForLoad()   
	if ( funcIsExistImage("2.모험돌기\Button_모험_시작하기.bmp") = true ){
     
      
		fPrintStatus("모험시작을 시작합니다.")
		goto, 모험시작_모험시작
	}

	goto 모험시작_이벤트체크
	fPrintStatus("ERROR_모험시작_시작체크중 위치찾기로 이동합니다. ")
	goto 위치찾기
	return
}
모험시작_이벤트체크:
{
	fPrintTitle("이벤트체크")	
	fPrintStatus("이벤트가 발생한것으로 보입니다. 이벤트를 확인합니다.")	
	
	fPrintStatus("레이드가 발견됐는지를 확인합니다.")
	if( funcIsExistImageFolder(  "10.팝업및이벤트\레이드발견" ) = true ){		
		fPrintStatus("레이드가 발견되었습니다.")
		gosub 이벤트_레이드발견

      
      
      fPrintStatus("업적이 발생하였는지 확인합니다.")
      if( funcIsExistImageFolder(  "10.팝업및이벤트\업적확인창" ) = true ){		
         fPrintStatus("업적 확인으로 이동합니다.")
         gosub 모험시작_업적확인
      }
      fPrintStatus("렙업을 하였는지 확인합니다.")
      if( funcIsExistImageFolder(  "10.팝업및이벤트\렙업확인창" ) = true ){		
         fPrintStatus("렙업 확인으로 이동합니다.")
         gosub 모험시작_렙업확인         
         fPrintStatus("쫄들의 렙업을 확인해야 합니다.")
      }   
            
      fPrintStatus("모험 입장 버튼이 없다면 그곳은 모험 지도이겠지." )
      funcSearchAndClickFolder( "2.모험돌기\버튼_모험입장" )
      goto 모험입장
	}
	
	fPrintStatus("업적이 발생하였는지 확인합니다.")
	if( funcIsExistImageFolder(  "10.팝업및이벤트\업적확인창" ) = true ){		
		fPrintStatus("업적 확인으로 이동합니다.")
		gosub 모험시작_업적확인
	}
	fPrintStatus("렙업을 하였는지 확인합니다.")
	if( funcIsExistImageFolder(  "10.팝업및이벤트\렙업확인창" ) = true ){		
		fPrintStatus("렙업 확인으로 이동합니다.")
		gosub 모험시작_렙업확인
		
		fPrintStatus("쫄들의 렙업을 확인해야 합니다.")

	}
	
	If( funcIsExistImage("2.모험돌기\Button_모험_시작하기.bmp") = true ){
		 goto 모험시작_모험시작
	 }

	fPrintStatus("ERROR_모험바로시작_시작체크중 위치찾기로 이동합니다. ")
	goto 위치찾기
}

이벤트_레이드발견:
{
	fPrintTitle("레이드화면")
	fPrintStatus("레이드 발견에서 나갑니다.")
       
	funcSearchAndClickFolder("10.팝업및이벤트\레이드발견")
	funcWaitingForLoad()
	fPrintStatus("레이드 화면에서 나갑니다.")
	if( funcIsExistImage(  "4.레이드돌기\레이드화면.bmp" ) = true ){		
		if( funcIsExistImage(  "4.레이드돌기\레이드화면.bmp" ) = true ){		
			funcSendESC()
		}
	}
   return
}
모험시작_업적확인:
{	
	fPrintTitle("업적  확인")
	fPrintStatus("업적 확인을 수행합니다.")
	loop,5
	{
		if( funcIsExistImageFolder("10.팝업및이벤트\업적확인창"  ) = true ){
         boolNeedCheckAchievement:=true
			If( funcSearchAndClickFolder("10.팝업및이벤트\업적확인") = true ){
				vLine = 업적확인을 수행합니다. %A_Index%회
				fPrintStatus(vLine)
			}else{
            fPrintStatus("확인 버튼을 못찾으니... ESC를 누릅니다.")
            funcSendESC()
         }				
		}else{
			break
		}
	}	
	return
}

모험시작_렙업확인:
{
	fPrintTitle("렙업  확인")
	fPrintStatus(" 렙업 확인을 수행합니다.")
	loop,5
	{
		if( funcIsExistImageFolder("10.팝업및이벤트\렙업확인"  ) = true ) {
			If( funcSearchAndClickFolder("10.팝업및이벤트\렙업확인") = true ){
            vLine = 렙업확인을 수행했습니다. %A_Index%회
            fPrintStatus(vLine)
            BoolNeedLevelUpCheck:= true
         }else{
            fPrintStatus("확인 버튼을 못찾으니... ESC를 누릅니다.")
            funcSendESC()
         }	
		}else{
			break
		}
	}	
	return
}
업적확인_확인:
{	
	fPrintTitle("업적  확인")
	fPrintStatus("업적 확인을 수행합니다.")
	loop, 5
	{
		if( funcIsExistImageFolder("10.팝업및이벤트\업적확인창"  ) = true ){
			If( funcSearchAndClickFolder("10.팝업및이벤트\업적확인") = true ){
				vLine = 업적확인을 수행합니다. %A_Index%회
				fPrintStatus(vLine)
			}else{
            fPrintStatus("확인 버튼을 못찾으니... ESC를 누릅니다.")
            funcSendESC()
         }			
		}else{
			fPrintStatus("어디에서 발생한 업적인지 모르니 위치 찾기로 이동합니다.")
			goto 위치찾기
		}
	}
   fPrintStatus( funcCaptureErrorScreen() )
   fPrintStatus("ERROR_5회 동안 반복했는데 업적이 안없어 지나봐요..")
   goto 위치찾기
}
렙업확인_확인:
{
	
	fPrintTitle("렙업  확인")
	fPrintStatus("렙업 확인을 수행합니다.")	
	loop, 5
	{					
		if( funcIsExistImageFolder("10.팝업및이벤트\렙업확인"  ) = true ) {
			If( funcSearchAndClickFolder("10.팝업및이벤트\렙업확인") = true ){
				BoolNeedLevelUpCheck:= true
				vLine = 렙업확인을 수행합니다. 다음 전투에 쫄렙업을 확인하겠습니다. %A_Index%회		
				fPrintStatus(vLine)
			}else{
            fPrintStatus("확인 버튼을 못찾으니... ESC를 누릅니다.")
            funcSendESC()            
         }
		}else{
			if( GuiBoolStopMonsterLevelUp = true ){
            updateLevelUpCheckZero()
				gosub, 매크로종료
         }      
         fPrintStatus("어디서 발생된 이벤트인지 알수없기에 위치찾기로 이동합니다. ")
         goto 위치찾기
		}
	}
   fPrintStatus( funcCaptureErrorScreen() )
   fPrintStatus("ERROR_5회 동안 반복했는데 렙업이 안없어 지나봐요..")
   goto 위치찾기
}

전투중_확인:
{
	fPrintTitle("전투중확인")
	fPrintStatus("현재 어떤 전투인지를 확인합니다.")
	if( funcIsExistImage(  "전투중\결투장전투중.bmp" ) = true ){		
		fPrintStatus("결투장 전투중으로 이동합니다.")
		goto, 전투중_결투장_결과대기
	}else if  ( funcIsExistImage(  "전투중\황금전투중.bmp" ) = true ){		
		fPrintStatus("황금방 전투중으로 이동합니다.")
		goto, 전투중_황금방_결과대기
	}else{
		fPrintStatus("모험 전투중으로 이동합니다.")
		fPrintTitle("전투중_모험")
		goto, 전투중_모험_결과대기
	}
	fPrintStatus("ERROR_전투중_확인 위치찾기로 이동합니다. ")
	goto 위치찾기
}


checkBattleNeeds(iBattleCount){
	global CountForBattle
	vSearchResult = 전투횟수: %iBattleCount% , 결투장돌기:%CountForBattle%

	fPrintResult(vSearchResult)
	iRemain :=Mod(iBattleCount , CountForBattle)    
	if( iRemain = 0 ){
		fPrintResult("결투장을  돌겠습니다.")
		return true
	}else{
		return false
	}
}

checkGoldRoomNeeds( iBattleCount ){
   global CountForGoldRoom
   vSearchResult = 전투횟수: %iBattleCount% , 황금방:%CountForGoldRoom%
	fPrintResult(vSearchResult)
	iRemain :=Mod(iBattleCount , CountForGoldRoom)    
	if( iRemain = 0 ){
		fPrintResult("황금방을 돌겠습니다.")
		return true
	}else{
		return false  
	}
}

checkLevelUpNeeds( iBattleCount ){
   global CountForLevelupCheck

	vSearchResult = 전투횟수: %iBattleCount% , 렙업확인:%CountForLevelupCheck%
	fPrintResult(vSearchResult)
	iRemain := ( iBattleCount >= CountForLevelupCheck  )

if( iRemain = true ){
		fPrintResult("레벨업 확인이 필요합니다.")
		return true
	}else{
		fPrintResult("아직 레벨업 체크가 남았습니다.")
		return false
	}

}
