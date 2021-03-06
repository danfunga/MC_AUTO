시작마을_황금방시작:
{	
	fPrintTitle("황금방입장")
	fPrintStatus("전투입장을 합니다.")
	
	 If( funcSearchAndClickFolder( "3.전투입장\버튼_전투입장"  ) = true )
		goto 전투입장_황금방돌기	
	fPrintStatus("ERROR_시작마을_모험시작중 위치찾기로 이동합니다.")
	goto 위치찾기
} 

전투입장_황금방돌기:
{	
	fPrintTitle("황금방입장")
	fPrintStatus("전투입장 화면에 도착하였습니다.")
	
	If( funcSearchAndClickFolder(  "3.전투입장\버튼_전투입장\버튼_무한의탑" ) = true )	{
		fPrintStatus("무한의 탑을 선택합니다.")
		goto 전투입장_무한의탑	
	}
	
	fPrintStatus("ERROR_시작마을_황금방 중 위치찾기로 이동합니다.")
	goto 위치찾기
	return
}

전투입장_무한의탑:
{	
	fPrintTitle("무한의  탑")
	fPrintStatus("무한의탑 화면에 도착하였습니다.")
   if ( funcIsExistImageFolder("3.전투입장\1.황금방돌기\상태_열쇠없음") = true ){
      BoolNeedGoldRoomStage:=false
      functionMoveTown()
      goto, 시작마을
   }
   
	if( funcSearchAndClickFolder( "3.전투입장\1.황금방돌기\버튼_황금의방" ) = true )	{
		goto 전투입장_황금의방
	}	
	fPrintStatus("ERROR_전투입장_무한의탑 중 위치찾기로 이동합니다.")
	goto 위치찾기
	return
}

전투입장_황금의방:
{
	fPrintTitle("황금의 방")
	fPrintStatus("황금의방 페이지에 왔습니다.")	
	fPrintStatus("설정된 황금팀은 " GuiListTeamGoldRoom " 플레이어스킬은 " GuiListSkillGoldRoom " 입니다.")   
   funcChoiceTeam( GuiListTeamGoldRoom )
   funcChoicePlayerSkill( GuiListSkillGoldRoom )
   
	goto,황금의방_도전시작	

	fPrintStatus("ERROR_모험시작중 위치찾기로 이동합니다. ")
	goto 위치찾기
	return
}
황금의방_도전시작:
{	
	fPrintTitle("황금방시작")
	fPrintStatus("황금방을  시작합니다.")
   if ( funcIsExistImageFolder("3.전투입장\1.황금방돌기\상태_열쇠없음") = true ){
      BoolNeedGoldRoomStage:=false
      functionMoveTown()
      goto, 시작마을
   }
   if( funcIsExistImageFolder("10.팝업및이벤트\업적확인창"  ) = true ){
      gosub 모험시작_업적확인
   }
  
	if ( funcSearchAndClickFolder("3.전투입장\1.황금방돌기\버튼_황금방_시작하기") = true ){
		goto, 황금의방_도전시작_시작체크
	}


	fPrintStatus("ERROR_황금의방_도전시작중 위치찾기로 이동합니다. ")
	goto 위치찾기
}
황금의방_도전시작_시작체크:
{
	fPrintStatus("황금방 시작을 체크합니다.")	   
   if ( funcSearchAndClickFolder("3.전투입장\1.황금방돌기\팝업_무탑키부족") = true ){
			BoolNeedGoldRoomStage:=false
			fPrintStatus("무탑키가 부족하기에 나갑니다.")
			funcSendESC()
         if( funcIsExistImageFolder( "3.전투입장\1.황금방돌기\버튼_황금의방" ) = true ){
				fPrintStatus("무한의탑 화면 입니다. ")
				funcSendESC()            
			}
         If( funcIsExistImageFolder( "3.전투입장\버튼_전투입장\화면_전투입장" )  = true ){
				fPrintStatus("전투 입장 화면 입니다. ")
				funcSendESC()           
			}
         If( funcIsExistImageFolder( "2.모험돌기\버튼_모험입장" ) = true ){
				fPrintStatus("시작 마을로 돌아왔습니다.")
				goto, 시작마을
			}
			fPrintStatus("무한의 탑인것 같습니다.")
			funcSendESC()
			goto, 시작마을
   }else{     
       funcWaitingForLoad()
       if( funcWaitAndReturn(  "전투중\통합전투중" ) = true ){
          fPrintStatus("황금방 전투가 정상적으로 확인되었습니다..")
         if( funcIsExistImageFolder( "전투중\자동스킬\On" ) = false ){
            funcSearchAndClickFolder( "전투중\자동스킬\Off" )         
         }    
          if( GuiGoldRoomAutoSkill = true ){
            fPrintStatus("황금방 스킬 매크로 사용을 선택하였습니다.")	
            goto 황금방스킬매크로사용	
          }else{
            goto 전투중_황금방
          }
       }      
	}
  
	fPrintStatus("ERROR_황금의방_도전시작_시작체크중 위치찾기로 이동합니다. ")
	goto 위치찾기
}
황금방스킬매크로사용:
{	
	;Gui, Submit, NoHide
   ;Gui, 2: Submit, NoHide
   
	fPrintTitle("황금방스킬")
	fPrintStatus("설정한 스킬을 사용합니다.")	
	Loop, 3
	{        
		if( GuiCheckGoldChar%a_index% = true ) {		
			strCharName:=GuiGoldChar%a_index%
			if( GuiSkill1GoldChar%a_index% = true ){
				guiControlGet, skillName, 2: ,GuiSkill1GoldChar%a_index%,text
			}else if (  GuiSkill2GoldChar%a_index% = true ){
				guiControlGet, skillName, 2: ,GuiSkill2GoldChar%a_index%,text
			}else{
				fPrintStatus("두 스킬 모두 사용하지 않음으로 설정되어 있습니다.")
				continue
			}
         funcWaitingBeforeGoldSkill( a_index )
	
   
         skillFolder=10.스킬이미지\%strCharName%\%skillName%
			delayFolder=10.스킬이미지\%strCharName%\%skillName%\delay
		
			vStatus=%a_index%번 스킬로 %strCharName%의 %skillName%(을)를 사용합니다.				
			fPrintStatus(vStatus)			
			funcUsingSkillAndWaitDelay( skillFolder, delayFolder, skillName)  
			
		}else{
			vStatus=%a_index%번 스킬은 설정되지 않았습니다.		
			fPrintStatus(vStatus)
		}	
   }
    fPrintStatus("스킬 사용을 종료합니다.")
   goto 전투중_황금방_결과대기
	return
}
funcWaitingBeforeGoldSkill( skillIndex ){   
   guiControlGet,skillDelay, 2:,GuiGoldSkillDelay%skillIndex%,text
   vStatus= %skillIndex%번 스킬 사용전 %skillDelay%초간 대기합니다.
   if( skillDelay = 0 )
   {
      vStatus= %skillIndex%번 스킬 사용전 딜레이 없이 진행합니다.
      fPrintResult(vStatus) 
      return
   }
   fPrintResult(vStatus)
   funcSleep(skillDelay)   
   return 
}

전투중_황금방:
 {
	funcWaitingBattleBasicDuration()
	goto, 전투중_황금방_결과대기	
}
전투중_황금방_결과대기:
 {
	fPrintTitle("황금방전투")
	fPrintStatus("5초씩 지속적으로 종료를 확인합니다.")
	loop{
		if( funcIsExistImageFolder( "10.전투결과이미지\황금방\다시" ) = true ){		
			IntMonitorGoldRoomClearCount++			
			GuiControl, ,CountGoldRoom,%IntMonitorGoldRoomClearCount%
			fPrintStatus("황금방 전투 완료가 확인되었습니다.")	
			goto, 전투결과_황금방
		}
		funcWaitingForBattleCheck()
		if( A_index > 120 ){
			fPrintStatus("전투가 너무 오래 걸리는것 같습니다.")	
			fPrintStatus("Error로 판단합니다.")				
			break
		}		
	}
	fPrintStatus("ERROR_전투중_황금방_결과대기중 위치찾기로 이동합니다. ")
	goto 위치찾기
}


전투결과_황금방:
{
	fPrintTitle("황금방결과")		
	fPrintStatus("다시 하기를 클릭합니다.")
	if( funcSearchAndClickFolder( "10.전투결과이미지\황금방\다시" ) = true ){				
		funcWaitingForLoad()
		goto 황금의방_도전시작
	}
	
	fPrintStatus("ERROR_전투결과_황금방중 위치찾기로 이동합니다. ")
	goto 위치찾기
	return
}
