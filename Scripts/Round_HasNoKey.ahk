모험시작_모험키부족:
{	
	fPrintTitle("모험키부족")
	fPrintStatus("모험키에 대한 작업을 수행합니다.")
	
   functionMoveTown()
   ;~setUpBeforeStart()
   ;MsgBox, %GuiWantByKeyPoint% + %GuiWantByKeyRuby%+ %GuiWantReceiveKey%
   
   if( GuiWantReceiveKey = true ){
      fPrintStatus("우편 받기를 설정하였기에 수령을 진행합니다.")
       functionReiceiveKey()   
   }
   if( GuiWantByKeyPoint = true ){
      fPrintStatus("명예 구입을 설정하여 명예구입 진행합니다.")
      functionByKeyByPoint()   
   }
   
   if( GuiWantByKeyRuby = true ){
      fPrintStatus("루비 구입을 설정하여 루비구입을 진행합니다.")
      functionByKeyByRuby()   
   }
     
   if( funcIsExistImage(  "2.모험돌기\열쇠부족\메인키오링1.bmp" ) = true ){	
      if ( bFirstTimeCheck != true ){
         
        PushNote(GuiPushBulletToken, "MC_Auto_Keys", "NoKeys")
        bFirstTimeCheck:=true
     }

      fPrintStatus("열쇠가 없으므로 기다리겠습니다.")
      fPrintStatus("단순히 2분 단위로 확인합니다.")
   	Loop, 5
      {
         funcWaitingForNoKeyDelay()
         if( funcIsExistImage(  "2.모험돌기\열쇠부족\메인키오링2.bmp" ) = true ){		
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

functionReiceiveKey()
{
   fPrintStatus("우편 수령은 아직 구현이 안되었습니다.")
}

functionByKeyByPoint()
{
   global IntMonitorPointForByKey
   
   
   fPrintTitle("열쇠구입:명예")
	fPrintStatus("명예로 열쇠를 구입합니다.")	
      
   if( funcSearchAndClick( "6.열쇠구입하기\1_상점입장.bmp" ) = true ){
      fPrintResult("상점에 들어왔습니다.")
      if( funcIsExistImage( "6.열쇠구입하기\2_상점팝업.bmp" ) = true ){             
         fPrintResult("요일 팝업이 떠있는것 같습니다.")
         funcSendESC()
      }
      if( funcIsExistImage( "6.열쇠구입하기\상점화면.bmp" ) = false ){
         fPrintStatus( funcCaptureErrorScreen() )
         fPrintResult("ERROR 팝업화면 새로 스샷 필요 --> 요일 팝업이 떠있는것 같습니다.")
         funcSendESC()
      }
      if( funcIsExistImage( "6.열쇠구입하기\상점화면.bmp" ) = true ){             
         fPrintStatus("열쇠 구입을 시작합니다")
         if( funcSearchAndClick( "6.열쇠구입하기\상점열쇠탭.bmp" ) = true ){
            
            fPrintStatus("명예 100짜리 구입을 시도합니다.")
            loop
            {
               if( funcSearchAndClick( "6.열쇠구입하기\명예100.bmp" ) = true ){
                  if(  funcSearchAndClick( "6.열쇠구입하기\구매버튼.bmp" ) = true ){
                        if( funcIsExistImage( "6.열쇠구입하기\구매완료.bmp" ) = true ){                               
                           IntMonitorPointForByKey:=IntMonitorPointForByKey+100
                           GuiControl, ,GuiUsingPointCount,%IntMonitorPointForByKey%
                           funcSendESC()                     
                           fPrintResult("명예 100으로 열쇠를 구입했습니다.")                    
                        }else{
                           fPrintResult("ERROR_확인용- 구매했으나 구매완료가 안뜨는듯")                    
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
               ;~ if( funcSearchAndClick( "6.열쇠구입하기\명예10.bmp" ) = true ){
                  ;~ if(  funcSearchAndClick( "6.열쇠구입하기\구매버튼.bmp" ) = true ){
                        ;~ if( funcIsExistImage( "6.열쇠구입하기\구매완료.bmp" ) = true ){                               
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
            funcSendESC()
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

   fPrintStatus("명예 열쇠 구입을 종료합니다.")	
}
functionByKeyByRuby()   
{
   fPrintStatus("아직 구현 안했지요")
}