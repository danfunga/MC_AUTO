
ReceivePost:
   fPrintTitle("우편 수령")
	fPrintStatus("레이드 돌기 전 우편을 수령합니다.")
   
	if( funcSearchAndClickFolder( "9.우편받기\버튼_우편있음" ) = true ){
     functionReceivePost()
     fPrintStatus("마을로 돌아갑니다.")
     funcSearchAndClickFolder("9.우편받기\상태_우편받기\버튼_뒤로")     
   }else{
      fPrintStatus("수령할 우편이 없거나, 우편 버튼이 없습니다.(ERROR) ")
   }
   
   
return

functionReceivePost(){
   global ReceiveHonor, ReceiveKey, ReceiveGold, ReceiveRuby, ReceiveItem
;   msgbox,  % "명예"ReceiveHonor "열쇠"ReceiveKey "골드"ReceiveGold "루비"ReceiveRuby "아이템"ReceiveItem
   if( ReceiveHonor = true ){
      functionReceive("명예")
   }
   if( ReceiveKey = true ){
      functionReceive("열쇠")      
   }
   if( ReceiveGold = true ){
      functionReceive("골드")
   }
   
   if( ReceiveRuby = true ){
      functionReceive("루비")
   }
   
   if( ReceiveItem = true ){
      functionReceive("소환권")
   }
   return 
}

functionReceive( target ){
; 9.우편받기\상태_우편받기\탭\탭_명예
   if( funcSearchAndClickFolder("9.우편받기\상태_우편받기\탭\탭_"target ) =  true ){   
      if( functionReceiveAll() = false ){
         fPrintStatus( target " 수령이 중단 되었습니다.")	
         if( target = "명예" ){         
            ; 명예만 이곳에 걸릴 것이다. 명예로 열쇠 구입하자 .
            
            loop{
               fPrintStatus( target "명예 제한에 걸렸습니다. ")	
               functionMoveTown()
               functionByKeyByPoint() 
               if( funcSearchAndClickFolder( "9.우편받기\버튼_우편있음" ) = true ){
                  if( funcSearchAndClickFolder("9.우편받기\상태_우편받기\탭\탭_명예" ) = true ){
                     if( functionReceiveAll() = true ){
                        fPrintStatus( "명예를 모두 수령하였습니다.")	
                        return
                     }else{
                        continue
                     }                     
                  }
               }
            
            }                        
         }                 
         
      }else{
         fPrintStatus( target "을 수령하였습니다.")	
         return 
      }
   }
   fPrintStatus( target " 우편이 없네요")	
   return   
}

functionReceiveAll(){
   if( funcSearchAndClickFolder("9.우편받기\상태_우편받기\버튼_모두받기" ) =  true ){
      if( funcWaitAndReturn("9.우편받기\상태_우편받기\팝업_보상목록", 5, 60 , true ) = true ){
         if( funcIsExistImageFolder("9.우편받기\상태_우편받기\팝업_보상목록\상태_수령중단") = true ){
            funcSearchAndClickFolder("9.우편받기\상태_우편받기\팝업_보상목록\버튼_확인")
            return false
         }else{
            funcSearchAndClickFolder("9.우편받기\상태_우편받기\팝업_보상목록\버튼_확인")
            return true            
         }
      }else{
         
         fPrintStatus("ERROR - 보상이 너무 많거나 '9.우편받기\상태_우편받기\팝업_보상목록'이 바뀌었습니다. 확인하세요")	
         funcSearchAndClickFolder("9.우편받기\상태_우편받기\팝업_보상목록\버튼_확인")
         ; skip을 위해 true를 return 
         return true
      }
   }
}