AUTOMODE_CASTLEBATTLE:
{ 
   fPrintTitle("공성전 전투")
	fPrintStatus("공성전 전투를 시작합니다.")
   
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
AUTOMODE_CASTLEBATTLE1:
{
   fPrintStatus("공성전 전투 준비를 시작합니다.")
   
   if( funcIsExistImage( "전투입장\공성전\Status_공성참여_full.png" ) = true ){
      fPrintTitle("공성전 참여 완료")
      fPrintStatus("공성참여 횟수를 모두 소진하였습니다.")
      funcWaitingClick()
      functionMoveTown()
      goto 시작마을
   }   
	fPrintStatus( "설정된 공성전 스킬은 " GuiListSkillCastle "입니다")   
	funcChoicePlayerSkill( GuiListSkillCastle )
   goto AUTOMODE_CASTLEBATTLE_STARTBATTLE  
     
  return
}
AUTOMODE_CASTLEBATTLE_STARTBATTLE:
{
   fPrintTitle("공성전 시작")
	fPrintStatus("공성전을 시작합니다.")
	
	if ( funcSearchAndClick("전투입장\공성전\Button_공성전시작.png") = true ){
		goto, AUTOMODE_CASTLEBATTLE_CHECK_START
	}
	fPrintStatus("ERROR_공성전 시작중 위치찾기로 이동합니다. ")
	goto 위치찾기
}

AUTOMODE_CASTLEBATTLE_CHECK_START:
{	
	fPrintTitle("공성전 진행")
   
   if ( funcSearchAndClick("전투입장\공성전\Button_공성전시작.png") = true ){
      ;~ 다시 한번 클릭하자
		goto, AUTOMODE_CASTLEBATTLE_CHECK_START
	}
   if ( funcIsExistImage("전투입장\공성전\Status_공성추가입장.png") = true ){
   
      fPrintStatus("공성전을 모두 돌았습니다.")
      funcSearchAndClick("전투입장\공성전\Button_공성전_추가입장_아니요.png")
		functionMoveTown()
      goto 위치찾기
	}
   fPrintStatus("공성전 전투를 시작하였습니다. 전투 시작을 기다립니다.")		
	funcWaitingForLoad()   
   loop 3
   {
      if( funcIsExistImage( "전투입장\공성전\Button_공성전_2배_ON.png" ) = true ){		
         fPrintStatus("공성전이 정상적으로 시작되었습니다.")
         goto AUTOMODE_CASTLEBATTLE_CHECK_END
      }		
      funcWaitingClick()
   }
   fPrintStatus("ERROR_공성전 시작체크중 위치찾기로 이동합니다. ")
	goto 위치찾기
	return
}
AUTOMODE_CASTLEBATTLE_CHECK_END:
{
   funcWaitingBattleBasicDuration()
   
   fPrintStatus("5초씩 지속적으로 종료를 확인합니다.")
	loop{
      
		if( funcIsExistImage( "전투입장\공성전\Status_공성_종료.png" ) = true ){		
			break	
		}      
      if( funcIsExistImage( "10.전투결과이미지\모험\모험W다시.bmp" ) = true  or funcIsExistImage( "10.전투결과이미지\모험\모험F다시.bmp" ) = true ){		
         fPrintTitle("모험전투중")
         fPrintStatus("모험전투인것으로 확인이 됩니다. 상태를 변경합니다.")
         goto 전투중_모험_결과대기			
		}
      funcWaitingForBattleCheck()
		if( A_index > 60 ){
			fPrintStatus("6분간 기다렸으나 전투가 종료 되지 않습니다.")	
			fPrintStatus("Error로 판단합니다.")				
			fPrintStatus("ERROR_전투중_모험_결과대기중 위치찾기로 이동합니다. ")
			goto 위치찾기
		}		
      
      
      
      funcWaitingForBattleCheck()
		if( A_index > 360 ){
			fPrintStatus("30분간 기다렸으나 공성전이 종료 되지 않습니다.")	
			fPrintStatus("Error로 판단합니다.")				
         functionMoveTown()
         goto 위치찾기
		}		
	}
	fPrintStatus("공성전 전투가 확인되었습니다.")				
	goto, AUTOMODE_CASTLEBATTLE_RESULT
}
AUTOMODE_CASTLEBATTLE_RESULT:
{
   fPrintTitle("공성전 종료")
	fPrintStatus("공성전을 클릭합니다.")
	if ( funcSearchAndClick("전투입장\공성전\Button_공성종료_공성전.png") = true ){
		funcWaitingForLoad()
		goto, AUTOMODE_CASTLEBATTLE
	}
	fPrintStatus("ERROR_공성전 종료중 위치찾기로 이동합니다. ")
	goto 위치찾기   
   return
}