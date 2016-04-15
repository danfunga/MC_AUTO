시작마을_심연전시작:
{	
	fPrintTitle("심연전투")
	fPrintStatus("심연의 탑을 돌겠습니다.")
	
	 If( funcSearchAndClickFolder( "3.전투입장\버튼_전투입장"  ) = true )
		goto 전투입장_심연의탑_돌기	
	fPrintStatus("ERROR_시작마을_심연전시작중 위치찾기로 이동합니다.")
	goto 위치찾기
} 

전투입장_심연의탑_돌기:
{	
	fPrintTitle("심연입장")
	fPrintStatus("전투입장 화면에 도착하였습니다.")
	
	If( funcSearchAndClickFolder(  "3.전투입장\버튼_전투입장\버튼_심연의탑" ) = true )	{
		fPrintStatus("심연의 탑을 선택합니다..")
		goto 전투입장_심연의탑	
	}
	
	fPrintStatus("ERROR_전투입장_심연의탑_돌기 중 위치찾기로 이동합니다.")
	goto 위치찾기
	return
}

전투입장_심연의탑:
{
	fPrintTitle("심연의탑")
	fPrintStatus("심연의 탑에 입장하였습니다.")
   if( funcSearchAndClickFolder( "3.전투입장\4.심연탑돌기\버튼_준비하기" ) = true )	{       
      if( funcSearchAndClickFolder("3.전투입장\4.심연탑돌기\버튼_시작하기") = true ){
         if( funcSearchAndClickFolder("3.전투입장\4.심연탑돌기\버튼_시작하기\팝업_입장실패") = true ){         
            BoolNeedDeepBattle:=false
            funcSearchAndClickFolder("3.전투입장\4.심연탑돌기\버튼_시작하기\팝업_입장실패\버튼_확인")
            functionMoveTown()
            goto 시작마을            
         }else{
            funcWaitingForLoad()   
            goto 심연의탑_시작준비
         }         
      }
	}	
   fPrintStatus("ERROR_전투입장_심연의탑 중 위치찾기로 이동합니다.")
	goto 위치찾기

}   

심연의탑_시작준비:
{ 
   fPrintTitle("심연의탑")
	fPrintStatus("심연의 탑 전투 시작 대기 화면입니다.")
   
   If( funcSearchAndClickFolder( "3.전투입장\4.심연탑돌기\버튼_진행하기" ) = true )
		goto 심연의탑_전투시작
	fPrintStatus("ERROR_공성전 전투 중 위치찾기로 이동합니다.")
	goto 위치찾기

   return   
}
심연의탑_전투시작:
{
   fPrintTitle("심연시작")
	fPrintStatus("심연의탑 전투를 시작합니다..")
	 if ( funcSearchAndClickFolder("3.전투입장\4.심연탑돌기\버튼_진행하기") = true ){
      ;~ 다시 한번 클릭하자
		goto 심연의탑_전투시작
	}
	
   fPrintStatus("심연의탑 전투를 시작하였습니다. 전투 시작을 기다립니다.")		
	funcWaitingForLoad()   
   loop 3
   {
      if( funcIsExistImageFolder( "3.전투입장\3.공성전돌기\버튼_전투_2배_ON" ) = true ){		
         fPrintStatus("심연의탑이 정상적으로 시작되었습니다.")
         goto 심연의탑_전투시작_중
      }		
      funcWaitingClick()
   }
   fPrintStatus("ERROR_심연의탑_전투시작중 위치찾기로 이동합니다. ")
	goto 위치찾기
	return
}
심연의탑_전투시작_중:
{
   if( funcIsExistImageFolder( "전투중\자동스킬\On" ) = false ){
      funcSearchAndClickFolder( "전투중\자동스킬\Off" )         
   }         
   fPrintStatus("5초씩 지속적으로 종료를 확인합니다.")
	loop{      
		if( funcIsExistImageFolder( "3.전투입장\4.심연탑돌기\상태_전투종료" ) = true ){		
			break	
		}      
      funcWaitingForBattleCheck()
      fPrintStatus( "심연 진행중 : " A_index " / 120 ( " BATTLE_CHECK_DELAY "sec )")				
		if( A_index > 120 ){
			fPrintStatus("120 회 기다렸으나 전투가 종료 되지 않습니다.")	
			fPrintStatus("Error로 판단합니다.")				
			fPrintStatus("ERROR_심연의탑_전투시작_중 위치찾기로 이동합니다. ")
			goto 위치찾기
		}		
           
	}
	fPrintStatus("심연전 전투 종료가 확인되었습니다.")				
	goto, 심연의탑_전투종료
}
심연의탑_전투종료:
{
   fPrintTitle("심연의탑")
	fPrintStatus("심연의탑 전투를 종료합니다.")

   BoolNeedDeepBattle:=false
   functionMoveTown()
   goto 시작마을       
   return
}