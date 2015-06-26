/*
------------------------------------------------------------
��ü Wait�� ���� �� --> msec���� �����Ͽ� ��ٸ���.
------------------------------------------------------------
*/ 
funcSleep(secSleep){
   msec:=secSleep*1000
   Sleep, %msec%
   return
}

/*
------------------------------------------------------------
�⺻���� wait : ���� ������ ������ ���� ���� üũ ���� �⺻ Wait �⺻(40�� )
------------------------------------------------------------
*/
funcWaitingBattleBasicDuration(){
   global GuiDelayForBattle
   global BATTLE_CHECK_DELAY

   vStatus=%GuiDelayForBattle% �� �� ���� ���Ḧ %BATTLE_CHECK_DELAY%�� �� ���������� Ȯ���մϴ�.
   fPrintStatus(vStatus)
   funcSleep(GuiDelayForBattle)
}


/*
---------------------------------------------------------------------------------------------------------------------------
���谡 ���� ��� �� �ֱ�� ���� �ִ� ���θ� üũ�� ���ΰ� �⺻: 2�� ( 120 )
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
ȭ�� ��ȯ���� ���� Loading�� �߻��� ��� �ش� Loading�� ���� waiting�̴�. �⺻ : 10��
---------------------------------------------------------------------------------------------------------------------------
*/
funcWaitingForLoad(){
   global DelayForFileLoading
   vStatus=���� �ε��� ���� %DelayForFileLoading%�ʰ� ����մϴ�.
	fPrintResult(vStatus)
	funcSleep(DelayForFileLoading)
}
/*
---------------------------------------------------------------------------------------------------------------------------
ȭ�� ��ȯ���� ���� Loading�� �߻��� ����� 2�踦 Waiting�Ѵ�. ������ �ε��� ���� ����ߴ�.
---------------------------------------------------------------------------------------------------------------------------
*/
funcWaitingForLoad2(){
   global DelayForFileLoading
   Waiting := DelayForFileLoading*2 
   vStatus=���� �ε��� ���� %Waiting%�ʰ� ����մϴ�.
	fPrintResult(vStatus)
	funcSleep(Waiting)
   return 
}

/*
---------------------------------------------------------------------------------------------------------------------------
������ ������ ���Ḧ �󸶸��� �ѹ��� Ȯ���Ұ��ΰ��� Delay�̴�. ������ ������. ũ�� �αװ� ����( �⺻ 5�� )
---------------------------------------------------------------------------------------------------------------------------
*/
funcWaitingForBattleCheck(){
   global BATTLE_CHECK_DELAY
   funcSleep( BATTLE_CHECK_DELAY )
   return 
}
/*
---------------------------------------------------------------------------------------------------------------------------
ESC Ű�� ���콺 Click�� �����ϰ� ���ƴ�. Ŭ���� �ش� �ð� ��ŭ Waiting �Ѵ�. �⺻ 5��
---------------------------------------------------------------------------------------------------------------------------
*/
funcWaitingClick(){
   global GuiDelayForClickAfter
	funcSleep(GuiDelayForClickAfter)
    return 
}

funcWaitingBeforeSkill( skillIndex ){   
   
   guiControlGet,skillDelay,,GuiChar%skillIndex%SkillDelay,text
   vStatus= %skillIndex%�� ��ų ����� %skillDelay%�ʰ� ����մϴ�.
   if( skillDelay = 0 )
   {
     vStatus= %skillIndex%�� ��ų ����� ������ ���� �����մϴ�.
     fPrintResult(vStatus) 
      return
   }
   fPrintResult(vStatus)
   funcSleep(skillDelay)
   return 
}

