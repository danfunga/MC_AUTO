공지사항:
{	
	fPrintTitle("공지사항")
	fPrintStatus("공지사항 페이지입니다.")	
   
	fPrintStatus("루프를 돌며 공지사항을 닫습니다.")
	Loop
	{
      if( funcSearchAndClickFolder( "1.게임실행\공지닫기" ) = false ){
         break
      }
		if( A_Index > 8 ){
			break
		}
	} 
	
	fPrintStatus("입장을 위해 클릭합니다..")	
   
   if( funcSearchAndClickFolder( "1.게임실행\입장터치" ) = true ){
      funcWaitingForLoad2()
   }
   
    
   fPrintStatus("출석체크, 이벤트 팝업 및 패키지 구입을 취소합니다.")	
   loop, 4
   {     
      funcSearchAndClickFolder( "1.게임실행\출석체크" )  
      funcSearchAndClickFolder( "1.게임실행\이벤트_팝업" )  
      funcSearchAndClickFolder( "1.게임실행\도우미확인" )
      funcSearchAndClickFolder( "1.게임실행\기타팝업X" )
      funcSearchAndClickFolder( "1.게임실행\구입취소" )
      
      If( funcIsExistImageFolder( "2.모험돌기\버튼_모험입장" ) = true ){
         fPrintStatus("정상적으로 시작마을에 도착했습니다.")	
         goto 시작마을
      }
   }
   
	If( funcIsExistImageFolder( "2.모험돌기\버튼_모험입장" ) = true ){
		fPrintStatus("정상적으로 시작마을에 도착했습니다.")	
		goto 시작마을
	}
	
	fPrintStatus("ERROR_공지사항중 위치찾기로 이동합니다.")
	goto 위치찾기
	return
}
