시작마을_명예보내기:
{
	fPrintTitle("명예 보내기")
	fPrintStatus("명예 보내기를 수행합니다.")	
	fPrintStatus("카카오톡 친구 페이지로 이동합니다.")
	gotoKakaoFriends()
	
	fPrintTitle("명예 보내기")
	fPrintStatus("명예 보내기를 수행합니다.")
	
	gosub INIT_SEND_HONOR
	intCountTemp :=0
	intCountTry:=0
	loop
	{
		checkExit()
		loop, 5
		{
			checkExit()
         if( intCountTry >= GuiSendFrindShipCount*2 ){
				break
         }
			funcPrintSubTitle( intCountTemp " / " intCountTry)
         intCountTry++ 
         GuiControl, ,GuiCountSendTry,%intCountTry%
         
			funcSendClickFixed( SEND_HONOR_BUTTON_X ,SEND_HONOR_BUTTON_Y_%a_index%, true)
			fPrintStatus("명예 버튼 클릭")
			if( funcIsExistImageFolder( "7.명예보내기\버튼_명예선물" ) = false ){
            continue
			}
         
			if( GuiCheckSendFriendsShipOnlyGame = true ) {
				if( funcIsExistImageFolder( "7.명예보내기\상태_수신차단" ) = true  ){
					IntMonitorSendingHonorCount++
					intCountTemp++
               GuiControl, ,GuiCountSendComplete,%IntMonitorSendingHonorCount%
               funcPrintSubTitle( intCountTemp " / " intCountTry)
					funcSearchAndClickFolder( "7.명예보내기\버튼_명예선물" )					
				}else{
					fPrintStatus("차단 하지 않은 사용자입니다.")
					funcSendESC()	
				}
			}else if( GuiCheckSendFriendsShipAll = true ){
            IntMonitorSendingHonorCount++
            intCountTemp++            
            GuiControl, ,GuiCountSendComplete,%IntMonitorSendingHonorCount%
            funcPrintSubTitle( intCountTemp " / " intCountTry)
				funcSearchAndClickFolder( "7.명예보내기\버튼_명예선물" )								
			}			
         
			if( intCountTemp >= GuiSendFrindShipCount )
				break			
		}
		if( intCountTry >= GuiSendFrindShipCount*2 )
				break
		if( intCountTemp >= GuiSendFrindShipCount )
			break			
		fDragUpFriends()
	}
	BoolNeedSendHonor:=false
	funcSendESC()
	functionMoveTown()
	if( GuiSendingAfterAdventure = true )
		goto, 시작마을    
	return
}

SendHonorToFriend:
   fPrintTitle("명예 보내기")
	fPrintStatus("게임 친구에게 명예를 보냅니다..")	

      
   loop{
      gotoGameFriends()
      if( sendToFriend() = true ){
         break
      }
      functionMoveTown()
      functionByKeyByPoint()      
   }
   functionMoveTown()
return
   sendToFriend(){
      if( funcIsExistImageFolder("7.명예보내기\버튼_게임친구\상태_NEW") = true ){
         if( funcSearchAndClickFolder("7.명예보내기\버튼_게임친구\상태_NEW\버튼_모두보내기" ) =  true ){
            if( funcSearchAndClickFolder("7.명예보내기\버튼_게임친구\상태_NEW\버튼_모두보내기\버튼_보내기" ) = true ){ 
               if( funcWaitAndReturn("7.명예보내기\버튼_게임친구\팝업_전송완료", 5, 60 , true ) = true ){
                  if( funcIsExistImageFolder("7.명예보내기\버튼_게임친구\팝업_전송완료\상태_전송중지") = true ){
                     funcSearchAndClickFolder("7.명예보내기\버튼_게임친구\팝업_전송완료\상태_전송중지\버튼_확인")
                     return false
                  }else{
                     funcSearchAndClickFolder("7.명예보내기\버튼_게임친구\팝업_전송완료\버튼_확인")
                     return true            
                  }
         
               }
            }
         }
   
      }
      return true
   }
   

gotoGameFriends(){
   if( funcSearchAndClickFolder( "7.명예보내기\버튼_게임친구" ) = true  ){
      return
   }
   functionMoveTown()
	if ( funcSearchAndClickFolder("7.명예보내기\버튼_소셜") = true ){
		if ( funcSearchAndClickFolder("7.명예보내기\버튼_친구") = true ){
			funcSearchAndClickFolder("7.명예보내기\버튼_게임친구") 
         return         
      }
   }	
	fPrintStatus("카카오톡 친구 페이지로 이동을 실패하였습니다. ")
   return
}
         
gotoKakaoFriends(){

   if( funcIsExistImageFolder("7.명예보내기\상태_카톡친구선택" ) = true ){
		funcSearchAndClickFolder( "7.명예보내기\버튼_접속일업" )
		return
	}else if( funcIsExistImageFolder( "7.명예보내기\상태_친구관리" ) = true  ){
		if ( funcSearchAndClickFolder("7.명예보내기\버튼_카톡친구") = true ){
			funcSearchAndClickFolder( "7.명예보내기\버튼_접속일업" )
			return
		}
	}else{
		functionMoveTown()
	}
	
	if ( funcSearchAndClickFolder("7.명예보내기\버튼_소셜") = true ){
		if ( funcSearchAndClickFolder("7.명예보내기\버튼_친구") = true ){
			if( funcIsExistImageFolder( "7.명예보내기\상태_친구관리" ) = true  ){
            if ( funcSearchAndClickFolder("7.명예보내기\버튼_카톡친구") = true ){
               funcSearchAndClickFolder( "7.명예보내기\버튼_접속일업" )
               return
            }
         }
		}
	}	
	fPrintStatus("카카오톡 친구 페이지로 이동을 실패하였습니다. ")
	gosub END_JOB
}
