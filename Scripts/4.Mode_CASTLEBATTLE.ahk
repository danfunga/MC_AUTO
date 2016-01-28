시작마을_공성전시작:
{	
	fPrintTitle("공성전전투")
	fPrintStatus("전투입장을 합니다.")
	
	 If( funcSearchAndClickFolder( "3.전투입장\버튼_전투입장"  ) = true )
		goto 전투입장_공성전돌기	
	fPrintStatus("ERROR_시작마을_공성전시작중 위치찾기로 이동합니다.")
	goto 위치찾기
} 

전투입장_공성전돌기:
{	
	fPrintTitle("공성전입장")
	fPrintStatus("전투입장 화면에 도착하였습니다.")
	
	If( funcSearchAndClickFolder(  "3.전투입장\버튼_전투입장\버튼_공성전" ) = true )	{
		fPrintStatus("공성전을 택합니다.")
		goto 전투입장_공성전	
	}
	
	fPrintStatus("ERROR_전투입장_공성전돌기 중 위치찾기로 이동합니다.")
	goto 위치찾기
	return
}

전투입장_공성전:
{
	fPrintTitle("공성전")
	fPrintStatus("공성전 요일 선택 화면입니다..")
   if( funcIsExistImageFolder( "3.전투입장\3.공성전돌기\화면_공성선택" ) = true )	{      
      fPrintStatus("요일을 선택합니다. ")
      
      xPos:=funcLoadConstants( vValue, "CastleBattle", A_WDay "_X" )       
      yPos:=funcLoadConstants( vValue, "CastleBattle", A_WDay "_Y" )       
      funcSendClickFixed( xPos, yPos , true)
		goto AUTOMODE_CASTLEBATTLE
      
	}	
   fPrintStatus("ERROR_전투입장_공성전 중 위치찾기로 이동합니다.")
	goto 위치찾기

}   
	



AUTOMODE_CASTLEBATTLE:
{ 
   fPrintTitle("공성전 전투")
	fPrintStatus("공성전 전투를 시작합니다.")
   
   fPrintStatus("업적이 발생하였는지 확인합니다.")
	if( funcIsExistImageFolder(  "10.팝업및이벤트\업적확인창" ) = true ){		
		fPrintStatus("업적 확인을 수행합니다.")
		gosub 모험시작_업적확인
	}
   
   If( funcSearchAndClickFolder( "3.전투입장\3.공성전돌기\버튼_준비하기" ) = true )
		goto AUTOMODE_CASTLEBATTLE1
	fPrintStatus("ERROR_공성전 전투 중 위치찾기로 이동합니다.")
	goto 위치찾기

   return   
}
AUTOMODE_CASTLEBATTLE1:
{
   fPrintStatus("공성전 전투 준비를 시작합니다.")
   
   if( funcIsExistImageFolder( "3.전투입장\3.공성전돌기\상태_참여FULL" ) = true ){
      BoolNeedCastleBattle:=false
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
	
	if ( funcSearchAndClickFolder("3.전투입장\3.공성전돌기\버튼_시작하기") = true ){
		goto, AUTOMODE_CASTLEBATTLE_CHECK_START
	}
	fPrintStatus("ERROR_공성전 시작중 위치찾기로 이동합니다. ")
	goto 위치찾기
}

AUTOMODE_CASTLEBATTLE_CHECK_START:
{	
	fPrintTitle("공성전 진행")
   
   if ( funcSearchAndClickFolder("3.전투입장\3.공성전돌기\버튼_시작하기") = true ){
      ;~ 다시 한번 클릭하자
		goto, AUTOMODE_CASTLEBATTLE_CHECK_START
	}
   if ( funcIsExistImageFolder("3.전투입장\3.공성전돌기\팝업_추가입장") = true ){
      BoolNeedCastleBattle:=false
      fPrintStatus("공성전을 모두 돌았습니다.")
      funcSearchAndClickFolder("3.전투입장\3.공성전돌기\팝업_추가입장\버튼_아니요")
		functionMoveTown()
      goto 위치찾기
	}
   fPrintStatus("공성전 전투를 시작하였습니다. 전투 시작을 기다립니다.")		
	funcWaitingForLoad()   
   loop 3
   {
      if( funcIsExistImageFolder( "3.전투입장\3.공성전돌기\버튼_전투_2배_ON" ) = true ){		
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
   if( funcIsExistImageFolder( "전투중\자동스킬\On" ) = false ){
      funcSearchAndClickFolder( "전투중\자동스킬\Off" )         
   }    
   funcWaitingBattleBasicDuration()   
   fPrintStatus("5초씩 지속적으로 종료를 확인합니다.")
	loop{
      
		if( funcIsExistImageFolder( "3.전투입장\3.공성전돌기\상태_공성종료" ) = true ){		
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
	if ( funcSearchAndClickFolder("3.전투입장\3.공성전돌기\버튼_종료_공성전") = true ){
		funcWaitingForLoad()
		goto, AUTOMODE_CASTLEBATTLE
	}
	fPrintStatus("ERROR_공성전 종료중 위치찾기로 이동합니다. ")
	goto 위치찾기   
   return
}