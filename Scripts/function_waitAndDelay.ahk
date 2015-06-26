/*
------------------------------------------------------------
전체 Wait에 대한 초 --> msec으로 변경하여 기다린다.
------------------------------------------------------------
*/ 
funcSleep(secSleep){
   msec:=secSleep*1000
   Sleep, %msec%
   return
}

/*
------------------------------------------------------------
기본적인 wait : 전투 시작후 지속적 전투 종료 체크 전에 기본 Wait 기본(40초 )
------------------------------------------------------------
*/
funcWaitingBattleBasicDuration(){
   global GuiDelayForBattle
   global BATTLE_CHECK_DELAY

   vStatus=%GuiDelayForBattle% 초 후 전투 종료를 %BATTLE_CHECK_DELAY%초 씩 지속적으로 확인합니다.
   fPrintStatus(vStatus)
   funcSleep(GuiDelayForBattle)
}


/*
---------------------------------------------------------------------------------------------------------------------------
열쇠가 없을 경우 얼마 주기로 열쇠 있는 여부를 체크할 것인가 기본: 2분 ( 120 )
---------------------------------------------------------------------------------------------------------------------------
*/
funcWaitingForNoKeyDelay(){
   global BATTLE_CHECK_DELAY
   loop 24
   {
      funcSleep(BATTLE_CHECK_DELAY)
      checkExit()
   }
}

/*
---------------------------------------------------------------------------------------------------------------------------
화면 전환으로 인해 Loading이 발생할 경우 해당 Loading에 대한 waiting이다. 기본 : 10초
---------------------------------------------------------------------------------------------------------------------------
*/
funcWaitingForLoad(){
   global DelayForFileLoading
   vStatus=파일 로딩을 위해 %DelayForFileLoading%초간 대기합니다.
	fPrintResult(vStatus)
	funcSleep(DelayForFileLoading)
}
/*
---------------------------------------------------------------------------------------------------------------------------
화면 전환으로 인해 Loading이 발생할 경우의 2배를 Waiting한다. 결투장 로딩을 위해 사용했다.
---------------------------------------------------------------------------------------------------------------------------
*/
funcWaitingForLoad2(){
   global DelayForFileLoading
   Waiting := DelayForFileLoading*2 
   vStatus=파일 로딩을 위해 %Waiting%초간 대기합니다.
	fPrintResult(vStatus)
	funcSleep(Waiting)
   return 
}

/*
---------------------------------------------------------------------------------------------------------------------------
결투나 전투의 종료를 얼마만에 한번씩 확인할것인가의 Delay이다. 작으면 빠르게. 크면 로그가 적게( 기본 5초 )
---------------------------------------------------------------------------------------------------------------------------
*/
funcWaitingForBattleCheck(){
   global BATTLE_CHECK_DELAY
   funcSleep( BATTLE_CHECK_DELAY )
   return 
}
/*
---------------------------------------------------------------------------------------------------------------------------
ESC 키도 마우스 Click과 동일하게 사용됐다. 클릭시 해당 시간 만큼 Waiting 한다. 기본 5초
---------------------------------------------------------------------------------------------------------------------------
*/
funcWaitingClick(){
   global GuiDelayForClickAfter
	funcSleep(GuiDelayForClickAfter)
    return 
}

funcWaitingBeforeSkill( skillIndex ){   
   
   guiControlGet,skillDelay,,GuiChar%skillIndex%SkillDelay,text
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

