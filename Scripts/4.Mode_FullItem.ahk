장비_인벤_최대:
{	   
	fPrintTitle("장비인벤최대")
	fPrintStatus("장비가 최대인 상황입니다.")
	if( funcSearchAndClickFolder( "6.열쇠구입하기\버튼_상점" ) = true ){
   
   }else{
      functionMoveTown()
   }
   
   if( GuiCheckSellEquip = true ){
      fPrintStatus("장비 판매를 수행합니다.")
      sellcount = functionSellItem()   
      if ( sellcount = 0 ){
         BoolNeedSellItem:=false      
      }      
   }else{
      fPrintStatus("장비 판매를 원하지 않습니다.")
      fPrintStatus("장비가  넘쳐도 진행 합니다.")
      BoolNeedSellItem:=false      
   }
   functionMoveTown()
   fPrintStatus("다시 진행합니다.")
   goto, 시작마을

   return
}

functionSellItem()
{
   global IntMonitorPointForByKey
   
   
   fPrintTitle("열쇠구입:명예")
	fPrintStatus("명예로 열쇠를 구입합니다.")	
      
   if( funcSearchAndClickFolder( "6.열쇠구입하기\버튼_상점" ) = true ){
      fPrintResult("상점에 들어왔습니다.")
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
                        if( funcIsExistImageFolder( "6.열쇠구입하기\구매완료" ) = true ){                               
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
