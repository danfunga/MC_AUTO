시작마을_황금방시작:
{	
	fPrintTitle("황금방입장")
	fPrintStatus("전투입장을 합니다.")
	
	 If( funcSearchAndClick( "시작마을\전투입장.bmp"  ) = true )
		goto 전투입장_황금방돌기	
	fPrintStatus("ERROR_시작마을_모험시작중 위치찾기로 이동합니다.")
	goto 위치찾기
} 

전투입장_황금방돌기:
{	
	fPrintTitle("황금방입장")
	fPrintStatus("전투입장 화면에 도착하였습니다.")
	
	If( funcSearchAndClick(  "전투입장\무탑선택.bmp", -20, 60 ) = true )	{
		fPrintStatus("무한의 탑을 선택합니다.")
		goto 전투입장_무한의탑	
	}
	
	fPrintStatus("ERROR_시작마을_황금방 중 위치찾기로 이동합니다.")
	goto 위치찾기
	return
}

전투입장_무한의탑:
{	
	fPrintTitle("무한의  탑")
	fPrintStatus("무한의탑 화면에 도착하였습니다.")
   if ( funcIsExistImage("전투입장\Status_무한탑_열쇠없음.bmp") = true ){
      BoolNeedGoldRoomStage:=false
      functionMoveTown()
      goto, 시작마을
   }
   
	if( funcSearchAndClick( "전투입장\황금선택.bmp" ) = true )	{
		goto 전투입장_황금의방
	}	
	fPrintStatus("ERROR_전투입장_무한의탑 중 위치찾기로 이동합니다.")
	goto 위치찾기
	return
}

전투입장_황금의방:
{
	fPrintTitle("황금의 방")
	fPrintStatus("황금의방 페이지에 왔습니다.")
	
   fPrintStatus("황금방 팀을 선택합니다.")
	vLine=설정된 황금팀은 %GuiListTeamGoldRoom%입니다.
	fPrintStatus(vLine)   
   funcChoiceTeam( GuiListTeamGoldRoom )
   funcChoicePlayerSkill( GuiListTeamGoldRoom )
   
	goto,황금의방_도전시작	

	fPrintStatus("ERROR_모험시작중 위치찾기로 이동합니다. ")
	goto 위치찾기
	return
}
황금의방_도전시작:
{	
	fPrintTitle("황금방시작")
	fPrintStatus("황금방을  시작합니다.")
   if ( funcIsExistImage("전투입장\Status_무한탑_열쇠없음.bmp") = true ){
      BoolNeedGoldRoomStage:=false
      functionMoveTown()
      goto, 시작마을
   }
   if( funcIsExistImageFolder("10.팝업및이벤트\업적확인창"  ) = true ){
      gosub 모험시작_업적확인
   }
  
	if ( funcSearchAndClick("3.황금방돌기\Button_황금_시작하기.bmp") = true ){
		goto, 황금의방_도전시작_시작체크
	}


	fPrintStatus("ERROR_황금의방_도전시작중 위치찾기로 이동합니다. ")
	goto 위치찾기
}
황금의방_도전시작_시작체크:
{
	fPrintStatus("황금방 시작을 체크합니다.")	   
   if( funcSearchAndClick("전투입장\무탑키부족.bmp") = true ){
			BoolNeedGoldRoomStage:=false
			fPrintStatus("무탑키가 부족하기에 나갑니다.")
			funcSendESC()
         If( funcIsExistImage( "전투입장\황금선택.bmp"  ) = true ){
				fPrintStatus("무한의탑 화면 입니다. ")
				funcSendESC()            
			}
         If( funcIsExistImage( "전투입장\전투입장화면.bmp"  ) = true ){
				fPrintStatus("전투 입장 화면 입니다. ")
				funcSendESC()           
			}
         If( funcIsExistImage( "시작마을\모험입장버튼.bmp"  ) = true ){
				fPrintStatus("시작 마을로 돌아왔습니다.")
				goto, 시작마을
			}
			fPrintStatus("무한의 탑인것 같습니다.")
			funcSendESC()
			goto, 시작마을
   }else{     
       funcWaitingForLoad()
       if( funcWaitAndReturn(  "전투중\통합전투중" ) = true ){
          fPrintStatus("황금방 전투가 정상적으로 확인되었습니다..")
          if( GuiGoldRoomAutoSkill = true ){
            fPrintStatus("황금방 스킬 매크로 사용을 선택하였습니다.")	
            goto 황금방스킬매크로사용	
          }else{
            goto 전투중_황금방
          }
       }      
	}
  
	fPrintStatus("ERROR_황금의방_도전시작_시작체크중 위치찾기로 이동합니다. ")
	goto 위치찾기
}
황금방스킬매크로사용:
{	
	Gui, Submit, NoHide
	fPrintTitle("황금방스킬")
	fPrintStatus("설정한 스킬을 사용합니다.")	
	Loop, 3
	{        
		if( GuiCheckGoldChar%a_index% = true ) {		
			strCharName:=GuiGoldChar%a_index%
			if( GuiSkill1GoldChar%a_index% = true ){
				guiControlGet, skillName,,GuiSkill1GoldChar%a_index%,text
			}else if (  GuiSkill2GoldChar%a_index% = true ){
				guiControlGet, skillName,,GuiSkill2GoldChar%a_index%,text
			}else{
				fPrintStatus("두 스킬 모두 사용하지 않음으로 설정되어 있습니다.")
				continue
			}
         funcWaitingBeforeGoldSkill( a_index )
	
   
         skillFolder=10.스킬이미지\%strCharName%\%skillName%
			delayFolder=10.스킬이미지\%strCharName%\%skillName%\delay
		
			vStatus=%a_index%번 스킬로 %strCharName%의 %skillName%(을)를 사용합니다.				
			fPrintStatus(vStatus)			
			funcUsingSkillAndWaitDelay( skillFolder, delayFolder, skillName)  
			
		}else{
			vStatus=%a_index%번 스킬은 설정되지 않았습니다.		
			fPrintStatus(vStatus)
		}	
   }
    fPrintStatus("스킬 사용을 종료합니다.")
   goto 전투중_황금방_결과대기
	return
}
funcWaitingBeforeGoldSkill( skillIndex ){   
   guiControlGet,skillDelay,,GuiGoldSkillDelay%skillIndex%,text
   vStatus= %skillIndex%번 스킬 사용전 %skillDelay%초간 대기합니다.
   if( skillDelay = 0 )
   {
      vStatus= %skillIndex%번 스킬 사용전 딜레이 없이 진행합니다.
      fPrintResult(vStatus) 
      return
   }
   fPrintResult(vStatus)
   funcSleep(skillDelay)   
   return 
}

전투중_황금방:
 {
	funcWaitingBattleBasicDuration()
	goto, 전투중_황금방_결과대기	
}
전투중_황금방_결과대기:
 {
	fPrintTitle("황금방전투")
	fPrintStatus("5초씩 지속적으로 종료를 확인합니다.")
	loop{
		if( funcIsExistImage( "10.전투결과이미지\황금방\무한의탑다시.bmp" ) = true ){		
			IntMonitorGoldRoomClearCount++			
			GuiControl, ,CountGoldRoom,%IntMonitorGoldRoomClearCount%
			fPrintStatus("황금방 전투 완료가 확인되었습니다.")	
			goto, 전투결과_황금방
		}
		funcWaitingForBattleCheck()
		if( A_index > 120 ){
			fPrintStatus("전투가 너무 오래 걸리는것 같습니다.")	
			fPrintStatus("Error로 판단합니다.")				
			break
		}		
	}
	fPrintStatus("ERROR_전투중_황금방_결과대기중 위치찾기로 이동합니다. ")
	goto 위치찾기
}


전투결과_황금방:
{
	fPrintTitle("황금방결과")		
	fPrintStatus("다시 하기를 클릭합니다.")
	if( funcSearchAndClick( "10.전투결과이미지\황금방\무한의탑다시.bmp" ) = true ){				
		funcWaitingForLoad()
		goto 황금의방_도전시작
	}
	
	fPrintStatus("ERROR_전투결과_황금방중 위치찾기로 이동합니다. ")
	goto 위치찾기
	return
}
