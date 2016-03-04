
INIT_GLOBAL_VARIABLES:
{
   ;~ Procced
   BoolNeedBattleStage:=false
   BoolNeedGoldRoomStage:=false
   BoolNeedLevelUpCheck:=false
   BoolNeedCastleBattle:=false
   BoolNeedRaidBattle:=false
   BoolNeedSendHonor:=false
   gosub INIT_MONITORING
   
   
   IntMonitorSendingHonorCount:=0
   IntTryCountLimit:=5
   boolNeedCheckAchievement:=true		
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
   global BoolNeedSendHonor
   
   guiControlGet, BoolNeedGoldRoomStage,,GuiBoolFirstGoldRoom
   guiControlGet, BoolNeedBattleStage,,GuiBoolFirstBattleField
   guiControlGet, BoolNeedCastleBattle,,GuiBooFirstlCastleBattle
   guiControlGet, BoolNeedRaidBattle,,GuiSelectRaidMod
   guiControlGet, BoolNeedSendHonor,,GuiSending
   
   return
}

