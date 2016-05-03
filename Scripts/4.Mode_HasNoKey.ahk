모험시작_모험키부족:
{	
	fPrintTitle("모험키부족")
	fPrintStatus("모험키에 대한 작업을 수행합니다.")
	
   functionMoveTown()
   ;~setUpBeforeStart()
   ;MsgBox, %GuiWantByKeyPoint% + %GuiWantByKeyRuby%+ %GuiWantReceiveKey%
   
   if( GuiWantByKeyPoint = true ){
      fPrintStatus("명예 구입을 설정하여 명예구입 진행합니다.")
      functionByKeyByPoint()   
   }
   
   if( GuiWantByKeyRuby = true ){
      fPrintStatus("루비 구입을 설정하여 루비구입을 진행합니다.")
      functionByKeyByRuby()   
   }
     
   if( funcIsExistImageFolder(  "2.모험돌기\열쇠부족\열쇠_0" ) = true ){	
      if ( bFirstTimeCheck != true ){         
       ; PushNote(GuiPushBulletToken, "MC_Auto_Keys", "NoKeys")
        bFirstTimeCheck:=true
      }
      
      fPrintTitle("10분대기")
      fPrintStatus("열쇠가 없으므로 기다리겠습니다.")
      fPrintStatus("단순히 2분 단위로 확인합니다.")
   	Loop, 5
      {
         funcWaitingForNoKeyDelay()
         if( funcIsExistImageFolder(  "4.레이드돌기\열쇠_제한\레이드시작" ) = true ){		
            goto, 시작마을
         }         
      }
   }else{
      fPrintStatus("열쇠가 있으니 다시 진행합니다.")
      goto, 시작마을
   }

	fPrintStatus("ERROR_모험시작_모험키부족중 위치찾기로 이동합니다. ")
	goto 위치찾기
   return
}
길드출석체크:
   fPrintTitle("출석체크")
   fPrintStatus("레이드 돌기전 출석 확인합니다.")

   if( funcSearchAndClickFolder( "9.길드출석\버튼_길드" ) = true ){
      if( funcSearchAndClickFolder( "9.길드출석\버튼_출석" ) = true ){
         fPrintStatus(" 출석하였습니다. ^^")      
      }else{
         if( funcIsExistImageFolder( "9.길드출석\버튼_자기방문" ) = true ){
            fPrintStatus("출석이 확인되었습니다.")      
         }else{         
            fPrintStatus("ERROR_출석은 못했지만 방문표시도 나지 않습니다. ")      
         }
      }
      funcSearchAndClickFolder( "9.길드출석\버튼_뒤로" )
   }else{
      fPrintStatus("ERROR_길드버튼이 변경되었나 봅니다. 확인하세요")
   }
return

functionByKeyByPoint()
{
   global IntMonitorPointForByKey
   
   
   fPrintTitle("열쇠구입:명예")
	fPrintStatus("명예로 열쇠를 구입합니다.")	
      
   if( funcSearchAndClickFolder( "6.열쇠구입하기\버튼_상점" ) = true ){
      if( funcSearchAndClickFolder( "6.열쇠구입하기\버튼_상점\버튼_2차상점" ) = true ){
         
         if( funcIsExistImageFolder( "6.열쇠구입하기\팝업_상점팝업" ) = true ){             
            fPrintResult("요일 팝업이 떠있는것 같습니다.")
            funcSendESC()
         }
         fPrintResult("상점에 들어갑니다..")
         if( funcWaitAndReturn("6.열쇠구입하기\상태_상점화면", 6, 20 , true ) = true ){
            fPrintResult("상점 화면에 들어 왔습니다.")
         }else{
            fPrintResult("ERROR_ 2분동안 기다려도 상점에 들어오지 못하였습니다. '상태_상점화면'을 확인하세요 ")
         }
      }
      
      if( funcIsExistImageFolder( "6.열쇠구입하기\팝업_상점팝업" ) = true ){             
         fPrintResult("요일 팝업이 떠있는것 같습니다.")
         funcSendESC()
      }
      if( funcIsExistImageFolder( "6.열쇠구입하기\상태_상점화면" ) = false ){
         fPrintStatus( funcCaptureErrorScreen() )
         fPrintResult("ERROR 팝업화면 새로 스샷 필요 --> 요일 팝업이 떠있는것 같습니다.")
         funcSendESC()
      }
      if( funcIsExistImageFolder( "6.열쇠구입하기\상태_상점화면" ) = true ){             
         fPrintStatus("열쇠 구입을 시작합니다")
         if( funcSearchAndClickFolder( "6.열쇠구입하기\상태_상점화면\버튼_열쇠탭" ) = true ){
            
            fPrintStatus("명예 100짜리 구입을 시도합니다.")
            loop
            {
               if( funcSearchAndClickFolder( "6.열쇠구입하기\상태_상점화면\버튼_명예100" ) = true ){
                  if(  funcSearchAndClickFolder( "6.열쇠구입하기\버튼_구매하기" ) = true ){
                        if( funcIsExistImageFolder( "6.열쇠구입하기\상태_구매완료" ) = true ){                               
                           IntMonitorPointForByKey:=IntMonitorPointForByKey+100
                           GuiControl, ,GuiUsingPointCount,%IntMonitorPointForByKey%
                           funcSendESC()                     
                           fPrintResult("명예 100으로 열쇠를 구입했습니다.")                    
                        }else{                           
                           fPrintResult("ERROR_확인용- 구매했으나 구매완료가 안뜨는듯")     
                           fPrintStatus( funcCaptureErrorScreen() )                           
                           funcSendESC()                                               
                        }
                  }else{
                     fPrintResult("명예 100짜리 구입하기에 명예가 부족하였습니다..")
                     funcSendESC()                     
                     break                  
                  }
               }else{
                  fPrintStatus("ERROR 뭔가 선택이 잘못되었습니다. 명예100을 클릭 못합니다.")
                  break
               }
            }
            ;~ fPrintStatus("명예 10으로 열쇠 구입을 시도합니다.")
            ;~ loop
            ;~ {
               ;~ if( funcSearchAndClickFolder( "6.열쇠구입하기\상태_상점화면\버튼_명예10" ) = true ){
                  ;~ if(  funcSearchAndClick( "6.열쇠구입하기\구매버튼.bmp" ) = true ){
                        ;~ if( funcIsExistImageFolder( "6.열쇠구입하기\상태_구매완료" ) = true ){                               
                           ;~ INT_POINT_FOR_BUY_KEY:=INT_POINT_FOR_BUY_KEY+10
                           ;~ GuiControl, ,GuiUsingPointCount,%INT_POINT_FOR_BUY_KEY%
                           ;~ funcSendESC()                     
                           ;~ fPrintStatus("명예 10으로 열쇠를 구입했습니다.")
                        ;~ }
                  ;~ }else if( funcIsExistImage( "6.열쇠구입하기\명예부족.bmp" ) = true ){    
                     ;~ funcSendESC()
                     ;~ fPrintStatus("명예 10짜리 구입하기에 명예가 부족하였습니다..")
                     ;~ break
                  ;~ }      
               ;~ }else{
                  ;~ fPrintStatus("ERROR 뭔가 선택이 잘못되었습니다. 명예10을 클릭 못합니다.")
                  ;~ break
               ;~ }
            ;~ }
            
            functionMoveTown()
            fPrintStatus("명예 열쇠 구입을 종료합니다.")
            return
         }else{
            fPrintStatus("열쇠를 정상적으로 구입하지 못했습니다...")      
            funcSendESC()
         }
      }  
   }else{
      fPrintStatus("상점 입장 못하고 종료합니다.")	
   }
   functionMoveTown()
   fPrintStatus("명예 열쇠 구입을 종료합니다.")	
}
functionByKeyByRuby()   
{
   fPrintStatus("아직 구현 안했지요")
}

