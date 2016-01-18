
INIT_GLOBAL_VARIABLES:
{

   SysGet, IntWinCapHeight, 4 ; 캡션Height
   SysGet, IntWinBorderWidth, 32 ; 보더Width
   SysGet, IntWinBorderHeight, 33 ; 보더Height
        
   ;~ Status
   BoolStarted:=false
   BoolPaused:=false
   BoolWantToStop:=false

   ;~ Procced
   BoolNeedBattleStage:=false
   BoolNeedGoldRoomStage:=false
   BoolNeedLevelUpCheck:=false
   BoolNeedCastleBattle:=false
   BoolNeedRaidBattle:=false
   
   gosub INIT_MONITORING
   
   
   IntMonitorSendingHonorCount:=0
   
 
   IntTryCountLimit:=5
   boolNeedCheckAchievement:=true		


   BoolReSized := false
   BooleanDebugMode:=false
   ;~ MsgBox, %DEFAULT_WIDTH% %DEFAULT_HEIGHT% "DEFAULT"
   ;~WinGetPos, , , winW, winH, %ACTIVE_ID%
   DEFAULT_WIDTH:=966
   DEFAULT_HEIGHT:=628
   RUN_WIDTH:=644
   RUN_HEIGHT:=428

   INT_PREVENT_ACHIEVELOOP:=0
   BATTLE_CHECK_DELAY:=5
    
    
   gosub HeroPositionInit
   
   
   return
}
INIT_MONITORING:   
   ;~ Monitoring
   IntMonitorPointForByKey:=0
   IntMonitorNoLevelUpCheckCount:=0
   IntMonitorTotalStageCount:=0
   IntMonitorStageClearCount:=0
   IntMonitorStageFailCount:=0
   IntMonitorBattleWinCount:=0
   IntMonitorBattleLoseCount:=0
   IntMonitorMonsterLevelUpCount:=0
   IntMonitorGoldRoomClearCount:=0
   IntMonitorReceiveArcheivementCount:=0
   
   IntMonitorRaidConsume:=0
   IntMonitorRaidPrize:=0
return   
setUpBeforeStart(){
	Gui, Submit , Nohide
   Gui,2:  Submit , Nohide
	global BoolNeedGoldRoomStage
   global BoolNeedBattleStage
   global BoolNeedCastleBattle
   global BoolNeedRaidBattle
   guiControlGet, BoolNeedGoldRoomStage,,GuiBoolFirstGoldRoom
   guiControlGet, BoolNeedBattleStage,,GuiBoolFirstBattleField
   guiControlGet, BoolNeedCastleBattle,,GuiBooFirstlCastleBattle
   guiControlGet, BoolNeedRaidBattle,,GuiSelectRaidMod
   return
}

