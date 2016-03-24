위치찾기:
 
checkExit()
if( GuiBoolScreenShotError = true )  {
   fPrintStatus("위치 찾기 첫 페이지")
   fPrintStatus( funcCaptureErrorScreen() )
}

매크로MAIN:
{

   fPrintTitle("위치  찾기")
   fPrintStatus("현재 어디인지 확인합니다.")
   
   
    If( funcIsExistImageFolder( "9.길드출석\상태_길드" ) = true ){      
      funcSearchAndClickFolder( "9.길드출석\버튼_뒤로" )
      funcWaitingForLoad()
   }
   
   fPrintStatus("시작마을인지 확인합니다" )
   If( funcIsExistImageFolder( "2.모험돌기\버튼_모험입장" ) = true ){
      goto, 시작마을
   }
   
   fPrintStatus("모험준비 화면 인지 확인합니다.")
   If( funcIsExistImage( "2.모험돌기\Button_모험준비.bmp" ) = true ){
      goto, 모험입장_모험준비
   }
      
   fPrintStatus("바탕화면인지 확인")   
   if( funcSearchAndClickFolder( "1.게임실행\세나아이콘" ) = true ){
      fPrintStatus(" 바탕화면에서 세나 아이콘을 클릭하였습니다. (ERROR - 확인용)")
      Waiting := GuiDelayForBattle*2 
      vStatus=부팅 로딩을 위해  %Waiting%초간 대기합니다.
      fPrintResult(vStatus)
      funcSleep(Waiting)          
      goto 공지사항
   }
   
   fPrintStatus("오류팝업들을 확인합니다. ")
   if( funcIsExistImageFolder( "11.오류화면\오류팝업" ) = true ){
      fPrintStatus("ERROR_오류 Screen샷 기록")
      fPrintStatus( funcCaptureErrorScreen() )
      funcSearchAndClickFolder("11.오류화면\오류팝업확인" )     
      goto 위치찾기
   }
   
   fPrintStatus("모험입장 화면 인지 확인합니다.")
   If( funcIsExistImage( "2.모험돌기\모험지도\모험입장화면.bmp" ) = true ){      
      goto, 모험입장
   }
  

      
   fPrintStatus("모험시작 화면 인지 확인합니다.")
   If( funcIsExistImage( "2.모험돌기\Button_모험_시작하기.bmp" ) = true ){
     fPrintStatus("모험시작하기 상황으로 전환")
      goto, 모험시작_모험시작
   }
   fPrintStatus("레이드 전투중인지 확인합니다.")
   if( funcIsExistImageFolder("4.레이드돌기\상태_전투중") = true ){		
      goto 레이드모드_전투중
   }
   if( funcIsExistImageFolder( "4.레이드돌기\상태_전투종료" ) = true ){		
      fPrintStatus("레이드 전투가 종료되었습니다.")	
      goto 레이드_전투_종료	
   }
   fPrintStatus("전투중인지 확인합니다.")
   If( funcIsExistImageFolder( "전투중\통합전투중" ) = true ){
      goto, 전투중_확인
   }
   fPrintStatus("결투장 인지 확인합니다.")
   If( funcIsExistImage( "전투중\결투전투중.bmp" ) = true ){
      goto, 전투중_결투장_결과대기
   }
   
   fPrintStatus("모험 전투 완료 화면 인지 확인합니다.")
   If( funcIsExistImage( "10.전투결과이미지\모험\모험W.bmp" ) = true ){
      fPrintStatus("전투결과_모험로 이동")
      goto, 전투결과_모험
   }
   If( funcIsExistImage( "10.전투결과이미지\모험\모험F.bmp" ) = true ){
      fPrintStatus("전투결과_모험로 이동")
      goto, 전투결과_모험
   }
   fPrintStatus("황금방  완료 화면 인지 확인합니다.")
   If( funcIsExistImage( "10.전투결과이미지\황금방\무한의탑.bmp" ) = true ){
      fPrintStatus("전투결과_모험로 이동")
      goto, 전투결과_황금방
   }
   fPrintStatus("결투장 완료 화면 인지 확인합니다.")
   If( funcIsExistImage( "10.전투결과이미지\결투장\결장W다시.bmp" ) = true ){
      fPrintStatus("전투결과_결투장로 이동")
      goto, 전투결과_결투장
   }
   If( funcIsExistImage( "10.전투결과이미지\결투장\결장L.bmp" ) = true ){
      fPrintStatus("전투결과_결투장 으로 이동")
      goto, 전투결과_결투장
   }
   
   fPrintStatus("레이드가 발견됐는지를 확인합니다.")
   if( funcIsExistImageFolder(  "10.팝업및이벤트\레이드발견" ) = true ){		
      fPrintStatus("레이드가 발견되었습니다.")
      gosub 이벤트_레이드발견
   }
   
   fPrintStatus("업적창이 뜬상태인지 확인합니다.")
   If( funcIsExistImageFolder( "10.팝업및이벤트\업적확인창" ) = true ){
      fPrintStatus("업적확인으로 이동")
      goto, 업적확인_확인
   }
   fPrintStatus("렙업창이 뜬상태인지 확인합니다.")
   If( funcIsExistImageFolder( "10.팝업및이벤트\렙업확인창" ) = true ){
      fPrintStatus("렙업확인으로 이동")
      goto, 렙업확인_확인
   }
   
   fPrintStatus("결투장 승급을 확인합니다.")
   if( funcIsExistImageFolder("10.팝업및이벤트\승급성공") = true ){
      fPrintStatus("승급 기록 에러처럼!!")
      fPrintStatus( funcCaptureErrorScreen() )
      funcSearchAndClickFolder("10.팝업및이벤트\승급성공")      
      goto 위치찾기
   }
   
   fPrintStatus("전투 입장중인지 확인합니다.")
   If( funcIsExistImageFolder( "3.전투입장\버튼_전투입장\화면_전투입장" )  = true ){
      fPrintStatus("마을로 돌아갑니다.")
      funcSendESC()
      goto, 시작마을
   }
   fPrintStatus("무한의 탑인지 확인합니다.")
   if( funcIsExistImageFolder( "3.전투입장\1.황금방돌기\버튼_황금의방" ) = true ){
      goto, 전투입장_무한의탑
   }
   fPrintStatus("결투장 준비 화면인지 확인합니다.")
   if( funcIsExistImageFolder( "3.전투입장\2.결투장돌기\버튼_준비하기" ) = true )	{
      goto 전투입장_결투장
   }	
   if( funcIsExistImageFolder( "3.전투입장\3.공성전돌기\화면_공성선택" ) = true )	{      
      goto 전투입장_공성전
   }
   if( funcIsExistImageFolder( "3.전투입장\3.공성전돌기\버튼_준비하기" ) = true ){
      goto AUTOMODE_CASTLEBATTLE
   }
   if( funcIsExistImageFolder( "3.전투입장\3.공성전돌기\버튼_시작하기" ) = true ){
      goto AUTOMODE_CASTLEBATTLE1
   }
   
   if( funcIsExistImageFolder( "3.전투입장\3.공성전돌기\상태_공성종료" ) = true ){
      goto AUTOMODE_CASTLEBATTLE_RESULT
   }
   
   if( funcIsExistImageFolder( "4.레이드돌기\팝업_종료된레이드" ) = true ){		
      fPrintStatus("이미 종료된 레이드라고 합니다.")	
      funcSearchAndClickFolder( "4.레이드돌기\팝업_종료된레이드\버튼_확인" )
      goto, 시작마을
   }
   fPrintStatus("공지 화면인지 찾기.")
   if( funcIsExistImageFolder( "1.게임실행\공지닫기" ) = true 
      or funcIsExistImageFolder( "1.게임실행\도우미확인" ) = true
      or funcIsExistImageFolder( "1.게임실행\입장터치" ) = true ){
      goto 공지사항
   }		

    
   if( funcIsExistImageFolder("4.레이드돌기\상태_전투중") = true ){		
      goto 레이드모드_전투중
   }else if( funcIsExistImageFolder( "4.레이드돌기\상태_전투종료" ) = true ){		
      fPrintStatus("레이드 전투가 종료되었습니다.")	
      goto, 레이드_전투_종료
   }

   if( GuiBoolScreenShotError = true )  {
      fPrintStatus("ERROR_어디인지 알수 없습니다")
      fPrintStatus( funcCaptureErrorScreen() )
   }
   funcSendESC()

   goto 위치찾기
   return
}

return