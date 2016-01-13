레이드모드시작:
{
	fPrintTitle("레이드모드")
	fPrintStatus("레이드를 반복적으로 수행하겠습니다.")
   
	BoolNeedRaidBattle:=true   

   
   if ( bFirstRaidMode != true ){         
      PushNote(GuiPushBulletToken, "MC_Auto:RaidMode", "StartRaidMode")
      bFirstRaidMode:=true
   }
   
   
	if( funcIsExistImageFolder("4.레이드돌기\상태_전투중") = true ){		
	   goto 레이드모드_전투중
	}else if( funcIsExistImageFolder( "4.레이드돌기\상태_전투종료" ) = true ){		
		fPrintStatus("레이드 전투가 종료되었습니다.")	
      goto, 레이드_전투_종료
	}else if( funcIsExistImage( "시작마을\모험입장버튼.bmp" ) = true ){		
		fPrintStatus("시작 마을입니다.")	
      goto, 레이드_입장하기
	}else{
      functionMoveTown()          
      goto 레이드_입장하기
   }
   
   fPrintStatus("업적이 발생하였는지 확인합니다.")
	if( funcIsExistImageFolder(  "10.팝업및이벤트\업적확인창" ) = true ){		
		fPrintStatus("업적 확인을 수행합니다.")
		gosub 모험시작_업적확인
	}
   
   
   If( funcSearchAndClick( "전투입장\공성전\Button_공성전준비.png" ) = true )
		goto AUTOMODE_CASTLEBATTLE1
	fPrintStatus("ERROR_공성전 전투 중 위치찾기로 이동합니다.")
	goto 위치찾기

   return   
}
레이드_입장하기:
{
   fPrintTitle("레이드입장")
	fPrintStatus("레이드를 반복적으로 수행하겠습니다.")
   
   gosub 길드출석체크
	If( funcSearchAndClick( "시작마을\모험입장버튼.bmp" ) = true ){      
      if( funcSearchAndClickFolder( "4.레이드돌기\버튼_모험맵_레이드" ) = true ){
         goto 레이드_시작화면
      }      
   }
   goto 위치찾기
   return
}


레이드모드_전투중:
if( funcIsExistImageFolder( "전투중\자동스킬\On" ) = false ){
   funcSearchAndClickFolder( "전투중\자동스킬\Off" )         
}

if( GuiCheckCallFriend = true ) {
   gosub 모험중_약식친구소환
}

레이드_전투_종료대기:
 {
   fPrintTitle("레이드전투중")
	fPrintStatus("5초씩 지속적으로 종료를 확인합니다.")
   
   total := 360*5
   
	loop{          
      during:=a_index*5      
	  stringTitle=%during%초 / %total%초
     funcPrintSubTitle(stringTitle )
		if( funcIsExistImageFolder( "4.레이드돌기\상태_전투종료" ) = true ){		
         fPrintStatus("레이드 전투가 종료되었습니다.")
         IntMonitorRaidConsume++
         GuiControl, ,GuiCountRaidConsume,%IntMonitorRaidConsume%
         if( GuiBoolScreenShotRaid = true )
            funcCaptureSubScreen("Raid")
			break	
		}
      if( funcIsExistImage( "4.레이드돌기\레이드_전투종료_종료된레이드.bmp" ) = true ){		
         IntMonitorRaidConsume++
         GuiControl, ,GuiCountRaidConsume,%IntMonitorRaidConsume%
         if( GuiBoolScreenShotRaid = true )
            funcCaptureSubScreen("Raid")
         fPrintStatus("이미 종료된 레이드라고 합니다.")	
         If( funcSearchAndClick( "4.레이드돌기\Button_종료된레이드_확인.bmp" ) = true )
            goto 레이드_입장하기
			break	
		}
      if( funcSearchAndClickFolder( "1.게임실행\세나아이콘" ) = true ){
         fPrintStatus(" 레이드 도중 바탕 화면으로 튕겼나 봅니다. (ERROR - 확인용 스샷 추가)")
         fPrintStatus( funcCaptureErrorScreen() )
         Waiting := GuiDelayForBattle*2 
         vStatus=부팅 로딩을 위해  %Waiting%초간 대기합니다.
         fPrintResult(vStatus)
         funcSleep(Waiting)          
         goto 공지사항
      }
      funcWaitingForBattleCheck()
	
      if( A_index > 360 ){
            fPrintStatus("30분간 기다렸으나 전투가 종료 되지 않습니다.")	
            fPrintStatus("Error로 판단합니다.")				
            fPrintStatus("ERROR_전투중_모험_결과대기중 위치찾기로 이동합니다. ")
            if( funcSearchAndClickFolder( "4.레이드돌기\일시정지" ) = true ){
               funcSearchAndClickFolder("4.레이드돌기\버튼_레이드복귀" )     
               funcSearchAndClickFolder("4.레이드돌기\예" )     
               funcWaitingForLoad()
               goto 레이드_입장하기
            }
            goto 위치찾기
         }		
      }			
	fPrintStatus("레이트 전투 종료가 확인되었습니다.")		
   
   
   BoolNeedGoldRoomStage:=true
   BoolNeedBattleStage:=true
   
	goto, 레이드_전투_종료
   
	return
}
레이드_전투_종료:
{
   fPrintTitle("레이드모드")
   If( funcSearchAndClick( "4.레이드돌기\레이드_전투종료_레이드버튼.bmp" ) = true ){
      funcWaitingForLoad()
      
      If( funcSearchAndClickFolder( "4.레이드돌기\버튼_종료된레이드" ) = true ){
         If( funcSearchAndClickFolder( "4.레이드돌기\버튼_레이드입장" ) = true ){
            gosub 레이드_보상수령
         }
      }
      If( funcSearchAndClickFolder( "4.레이드돌기\버튼_뒤로가기" ) = true ){
         fPrintStatus("레이드 화면에서 나갑니다.")		
      }  
   }
	
   functionMoveTown()
   goto 시작마을
   return
}
레이드_보상수령:
{
 ; 보상을 수령하자!
   funcPrintSubTitle("보상 수령")
   If( funcSearchAndClickFolder( "4.레이드돌기\버튼_보상받기" ) = true ){

      if( funcIsExistImageFolder( "4.레이드돌기\상태_보상받기_보상목록" ) = true ){
         funcSearchAndClickFolder("4.레이드돌기\버튼_보상목록_확인" )  
         IntMonitorRaidPrize++
         GuiControl, ,GuiCountRaidPrize,%IntMonitorRaidPrize%
         fPrintStatus("Raid 보상 수령 완료!!.")		
      }else if( funcSearchAndClick( "4.레이드돌기\레이드_버튼_보상_받기_상태아님.bmp" ) = true ){
         fPrintStatus("이미 보상 수령을 했잖아!!.")		
      }        
      
                
      If( funcSearchAndClick( "4.레이드돌기\Button_레이드화면_뒤로가기.bmp" ) = true ){
         fPrintStatus("보상 입장화면으로 이동")		
      } 
   }
   return
}
	
레이드_시작화면:
{
   fPrintTitle("레이드모드")
  	fPrintStatus("종료된 레이드를 확인합니다.")	

   If( funcSearchAndClickFolder( "4.레이드돌기\버튼_종료된레이드" ) = false ){
      BoolNeedRaidBattle:=false      
      fPrintStatus("ERROR_레이드_버튼_종료된레이드를 찾지 못해서 진행을 하지 않겠다.")
      fPrintStatus( funcCaptureErrorScreen() )
      goto 위치찾기
   }
   
   
   ;종료된 레이드 화면 --> 보상 수령을 한다.
   If( funcSearchAndClickFolder( "4.레이드돌기\버튼_레이드입장" ) = true ){
      gosub 레이드_보상수령
      ;보상 수령 했으면 일단 화면으로 나갔다가 온다. ( reset --> 중복되게 보상을 받을것을 고려 )
      functionMoveTown()
      goto 레이드_입장하기         
   }
   
   ;종료된 레이드 화면이 깨끗하기에 레이드를 돌자 
   
   ;레이드 그만 돌까 체크 --> 열쇠 6개가 되면 레이드 보다는 모험..
   if( funcIsExistImage( "4.레이드돌기\열쇠\status_열쇠_6개_raid.bmp" ) = true ){
      fPrintStatus("열쇠가 6개가 되어 모험을 수행합니다.")	
      BoolNeedRaidBattle:=false
   }
   
   
   if( BoolNeedRaidBattle = false ){
      functionMoveTown()
      goto 시작마을	
   }
   
   
   If( funcSearchAndClick( "4.레이드돌기\레이드_버튼_미참여레이드.bmp" ) = true ){
      If( funcIsExistImageFolder( "4.레이드돌기\버튼_레이드입장" ) = false ){
         fPrintStatus("새로운 레이드가 없으니 기존 레이드를 돕니다.")
         funcSearchAndClick( "4.레이드돌기\레이드_버튼_참여레이드.bmp" )
      }            
      If( funcSearchAndClickFolder( "4.레이드돌기\버튼_레이드입장" ) = true ){
         If( funcSearchAndClickFolder( "4.레이드돌기\버튼_레이드준비하기" ) = true ){
            funcChoicePlayerSkill( 2 )
            If( funcSearchAndClickFolder( "4.레이드돌기\버튼_레이드시작" ) = true ){
               if( funcIsExistImage(  "4.레이드돌기\레이드_입장실패.bmp" ) = true ){		
                  BoolNeedRaidBattle:=false
                  funcSearchAndClick( "4.레이드돌기\레이드_입장실패_아니오.bmp" )                        
                  functionMoveTown()
                  fPrintStatus("열쇠가 없어 레이드를 돌지 않겠습니다.")
                  goto 시작마을                     
               }else if( funcIsExistImageFolder(  "4.레이드돌기\상태_추가_입장팝업" ) = true ){		
                  BoolNeedRaidBattle:=false
                  if( funcSearchAndClick( "4.레이드돌기\레이드_입장실패_아니오.bmp" ) = false ){
                     fPrintStatus( funcCaptureErrorScreen() )
                     fPrintStatus("아니오 버튼이 다른가 보다")
                     funcSendESC()
                  }                        
                  functionMoveTown()
                  fPrintStatus("세번이나 돌았네요..새로운 레이드는 없었고, 그냥 던전이나 돕시다.")
                  goto 시작마을                     
               }
               
               funcWaitingForBattleCheck()                    
               if( funcIsExistImageFolder("4.레이드돌기\상태_전투중") = true ){		
                  goto 레이드모드_전투중
               }
               fPrintStatus("ERROR_레이드 도는데 실패한 모양이다.")
               fPrintStatus( funcCaptureErrorScreen() )
               BoolNeedRaidBattle:=false
               functionMoveTown()
               fPrintStatus("레이드 도는 도중 위치 찾기로 이동합니다...")
               goto 위치찾기          
            }            
         }
      }
      fPrintStatus("레이드 자체가 없나 봅니다.")
      BoolNeedRaidBattle:=false
      functionMoveTown()      
      goto 시작마을        
   }    
   ;레이드 모드 종료

   fPrintStatus("ERROR_요상하네 위치 찾기로 가는 것이지만 정상 처리하는 걸로 하자~")
   fPrintStatus( funcCaptureErrorScreen() )
   BoolNeedRaidBattle:=false
   functionMoveTown()
   goto 시작마을         

   return
}
레이드모드종료:
{
   fPrintStatus("공성전 전투 준비를 시작합니다.")
   
   if( funcIsExistImage( "전투입장\공성전\Status_공성참여_full.png" ) = true ){
      fPrintTitle("공성전 참여 완료")
      fPrintStatus("공성참여 횟수를 모두 소진하였습니다.")
      funcWaitingClick()
      functionMoveTown()
      goto 위치찾기
   }
   vLine=설정된 공성전 팀은  %GuilListCatleBattleTeam%입니다.
	fPrintStatus(vLine)   
	funcChoiceTeam( GuilListCatleBattleTeam )
	funcChoicePlayerSkill( GuilListCatleBattleTeam )
   goto AUTOMODE_CASTLEBATTLE_STARTBATTLE  
     
  return
}