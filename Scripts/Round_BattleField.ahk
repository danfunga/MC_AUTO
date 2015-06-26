시작마을_결투장시작:
{
   fPrintTitle("결투장입장")
	fPrintStatus("전투 입장을 합니다.")
   If( funcSearchAndClick( "시작마을\전투입장.bmp"  ) = true )
		goto 전투입장_결투장돌기

	fPrintStatus("ERROR_시작마을_결투장시작 중 위치찾기로 이동합니다.")
	goto 위치찾기
} 

전투입장_결투장돌기:
{
   fPrintTitle("결투장입장")
	fPrintStatus("전투입장 화면에 도착하였습니다.")
   If( funcSearchAndClick( "전투입장\결장선택.bmp", 0, 60 ) = true )	{
		goto 전투입장_결투장
	}	
   
   fPrintStatus("ERROR_시작마을_결투장돌기 중 위치찾기로 이동합니다.")
	goto 위치찾기
}

전투입장_결투장:
{
	fPrintTitle("결  투  장")
	fPrintStatus("결투장  화면에 도착하였습니다.")
   if( funcIsExistImageFolder( "전투입장\결장마감" ) = true )	{      
		fPrintStatus("결투장이 마감 된것 같습니다. ESC")
      funcSendESC()
	}	   
	if( funcIsExistImageFolder( "전투입장\결장팝업" ) = true )	{      
		fPrintStatus("팝업은 무시합니다., ESC")
      funcSendESC()
	}	
   If( funcIsExistImage( "전투입장\결투키_없음.bmp"  ) = true ){
      BoolNeedBattleStage:=false
      functionMoveTown()
      goto, 시작마을
   }
   
	if( funcSearchAndClick( "전투입장\Button_준비하기.bmp" ) = true )	{
		goto 결투장_도전시작
	}	
		
	fPrintStatus("ERROR_전투입장_결투장 중 위치찾기로 이동합니다.")
	goto 위치찾기
	
}
;~ 전투입장_결투장준비:
;~ {
	;~ fPrintTitle("결투장준비")
	;~ fPrintStatus("결투장 준비 페이지에 왔습니다.")
	
	;~ fPrintStatus("결투장 팀을 선택합니다.")
	;~ vLine=설정된 결투팀은 %GuiListTeamBattle%입니다.
	;~ fPrintStatus(vLine)   
	;~ funcChoiceTeam( GuiListTeamBattle )
	;~ goto,결투장_도전시작	

	;~ fPrintStatus("ERROR_전투입장_결투장준비중 위치찾기로 이동합니다. ")
	;~ goto 위치찾기
;~ }


결투장_도전시작:
{	
	fPrintTitle("결투장시작")
	fPrintStatus("결투장을  시작합니다.")
	
	funcChoicePlayerSkill( GuiListTeamBattle )
	
	if ( funcSearchAndClick("전투입장\Button_전투_시작하기.bmp") = true ){
		goto, 결투장입장_시작체크
	}else{
		gosub 모험시작_업적확인
	}
	if ( funcSearchAndClick("전투입장\Button_전투_시작하기.bmp") = true )
		goto, 결투장입장_시작체크
	else{
		BoolNeedBattleStage:= false
		funcSendESC()
		If( funcIsExistImage( "전투입장\Button_준비하기.bmp"  ) = true ){
			fPrintStatus("결투장 화면 입니다.")
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
	}

	fPrintStatus("ERROR_황금의방_도전시작중 위치찾기로 이동합니다. ")
	goto 위치찾기
}
결투장입장_시작체크:
{
	fPrintStatus("전투 시작을 체크합니다.")	

if( funcIsExistImage("전투입장\명예최대.bmp") = true ){
      if( funcSearchAndClick("전투입장\명예최대예.bmp") = true ){
			fPrintStatus("최대 명예이지만 전투를 시작합니다.")
      }
   }
   if( funcSearchAndClick("전투입장\결장키부족.bmp") = true or  funcSearchAndClick("전투입장\결장마감.bmp") = true ){
		BoolNeedBattleStage:= false
		funcSendESC()
		If( funcIsExistImage( "전투입장\Button_전투_시작하기.bmp"  ) = true ){
			fPrintStatus("결투 입장 화면 입니다.")
			funcSendESC()
		}
      If( funcIsExistImage( "전투입장\Button_준비하기.bmp"  ) = true ){
			fPrintStatus("결투장 화면 입니다.")
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
        fPrintStatus("이곳이 왜 걸렸는지 모릅니다.")
		funcSendESC()
		goto, 시작마을
	}
   
	funcWaitingForLoad2()
	if( funcIsExistImage(  "전투중\2배속결장.bmp" ) = true ){		
		fPrintStatus("결투장 전투가 정상적으로 확인되었습니다..")
		goto 전투중_결투장
	}else{
		fPrintStatus("ERROR_여기는 안들어왔어야 하는 루프인데.... 일단 결투 시작이 안되었습니다.")
		BoolNeedBattleStage:=false
		funcSendESC()
		If( funcIsExistImage( "전투입장\Button_전투_시작하기.bmp"  ) = true ){
			fPrintStatus("결투 입장 화면 입니다.")
			funcSendESC()
		}
		If( funcIsExistImage( "전투입장\Button_준비하기.bmp"  ) = true ){
			fPrintStatus("결투장 화면 입니다.")
			funcSendESC()
		}
		If( funcIsExistImage( "전투입장\전투입장화면.bmp"  ) = true ){
         fPrintStatus("전투 입장 화면 입니다.")
			funcSendESC()
		}
      If( funcIsExistImage( "시작마을\모험입장버튼.bmp"  ) = true ){
         fPrintStatus("시작 마을로 돌아왔습니다.")
			goto, 시작마을
		}
       fPrintStatus("뭐야 이곳은 왜 걸린거야")
		funcSendESC()
		goto, 시작마을		
	}
		
	fPrintStatus("ERROR_결투장입장_시작체크중 위치찾기로 이동합니다. ")
	goto 위치찾기
}
전투중_결투장:
{	
   funcWaitingBattleBasicDuration()
	goto, 전투중_결투장_결과대기	
}

전투중_결투장_결과대기:
 {
	fPrintTitle("결투장전투")
	fPrintStatus("5초씩 지속적으로 종료를 확인합니다.")
	loop{
		if( funcIsExistImage( "10.전투결과이미지\결투장\결장L.bmp" ) = true ){				
			fPrintStatus("결투장 패배가 확인되었습니다" )	
			IntMonitorBattleLoseCount++
			GuiControl, ,CountLoseCount,%IntMonitorBattleLoseCount%			
			goto, 전투결과_결투장
		}else if( funcIsExistImage( "10.전투결과이미지\결투장\결장W.bmp" ) = true ){		         
			fPrintStatus("결투장 승리가 확인되었습니다")	
			IntMonitorBattleWinCount++
			GuiControl, ,CountWinCount,%IntMonitorBattleWinCount%			
			goto, 전투결과_결투장
		} 
		funcWaitingForBattleCheck()
		if( A_index > 150 ){
			fPrintStatus("전투가 너무 오래 걸리는것 같습니다.")	
			fPrintStatus("Error로 판단합니다.")				
			break
		}		
	}
	fPrintStatus("ERROR_전투중_결투장_결과대기중 위치찾기로 이동합니다. ")
	goto 위치찾기
}

전투결과_결투장:
{
	fPrintTitle("결투장결과")		
	fPrintStatus("다시 하기를 클릭합니다.")
	if( funcSearchAndClick( "10.전투결과이미지\결투장\결장W다시.bmp" ) = false ){
      funcSearchAndClick( "10.전투결과이미지\결투장\결장L다시.bmp" )
	}
   funcWaitingForLoad()
	goto 전투입장_결투장
}