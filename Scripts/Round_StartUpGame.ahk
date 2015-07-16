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
   fPrintStatus("출석 체크 여부를 확인합니다.")	
   funcSearchAndClickFolder( "1.게임실행\출석체크" )
   
   
   fPrintStatus("친구 사용에 따른 도우미를 확인합니다...")	
   funcSearchAndClickFolder( "1.게임실행\도우미확인" )
    
    
   fPrintStatus("Event 팝업을 제거합니다.")	
   loop, 3
   {     
      if( funcSearchAndClickFolder( "1.게임실행\기타팝업X" ) = false )      
         break
   }
   
   fPrintStatus("행운 상자 및 패키지 구입을 취소합니다.")	
   loop, 3
   {
      if( funcSearchAndClickFolder( "1.게임실행\구입취소" ) = false )      
         break      
   }
	
	If( funcIsExistImage( "시작마을\모험입장버튼.bmp" ) = true ){
		fPrintStatus("정상적으로 시작마을에 도착했습니다.")	
		goto 시작마을
	}
	
	fPrintStatus("ERROR_공지사항중 위치찾기로 이동합니다.")
	goto 위치찾기
	return
}
