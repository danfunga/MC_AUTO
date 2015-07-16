funcReceiveAchievement(){	
    
	global boolNeedCheckAchievement	
   global INT_PREVENT_ACHIEVELOOP	
   global GuiWantByKeyPoint	
   global IntMonitorReceiveArcheivementCount
   fPrintTitle("명예  수령")
	fPrintStatus("달성한 업적을 수령합니다")
	 If( funcSearchAndClick( "시작마을\모두받기.bmp"  ) = true  or funcSearchAndClick( "시작마을\모두받기1.bmp"  ) = true){
		fPrintStatus("수령을 확인합니다")					
		if( funcSearchAndClick( "시작마을\receiveConfirm.bmp" ) = true ){
               IntMonitorReceiveArcheivementCount++
               GuiControl, ,GuiReceivePointCount,%IntMonitorReceiveArcheivementCount%
               fPrintStatus("수령을 확인하였습니다.")					
		}else{
               fPrintStatus("명예 수령에 실패한것으로 보입니다.")		
			funcSendESC()
               fPrintStatus("명예 수령을 중단합니다.")		
               funcSendESC()
               if( GuiWantByKeyPoint = true ){
                  fPrintStatus("열쇠 구입 설정이 되어 있으니 명예로 열쇠를 구입하겠습니다.")		
                     if( INT_PREVENT_ACHIEVELOOP < 5 ){
                        INT_PREVENT_ACHIEVELOOP++
                         fPrintStatus("명예로 열쇠를 구입하겠습니다.")		
                         functionMoveTown()            
                         functionByKeyByPoint()
                      }else{
                           fPrintResult("ERROR_무한루프를 대비하기 위해 일단 명예 수령을 멈춥니다.")		
                           boolNeedCheckAchievement:= false
                           return
                        }
                }else{
                   boolNeedCheckAchievement:= false
                   return
                }
		}
		funcSendESC()
	}else{
      boolNeedCheckAchievement:= false
      fPrintStatus( funcCaptureErrorScreen() )
		fPrintResult("모두받기 버튼을 찾지 못하였습니다.")
      funcSendESC()
	}
}

functionMoveTown()
{
   fPrintTitle("마을로 이동")
   fPrintStatus("마을로 이동을 시작 합니다.")
   loop
   {
      if( funcIsExistImage( "시작마을\모험입장버튼.bmp" ) = true ){		
         fPrintStatus("마을에 도착 했습니다.")
         return
      }else if( funcSearchAndClick( "시작마을\마을.bmp" ) = true ){		
         fPrintStatus("마을로 이동합니다")
      }else if( funcIsExistImage( "2.모험돌기\Button_모험_시작하기.bmp" ) = true ){		
         fPrintStatus("모험 시작 화면에 있습니다")
         funcSendESC()         
      }else if( funcIsExistImage( "2.모험돌기\Button_모험준비.bmp" ) = true ){		
         fPrintStatus("모험 준비를 수행하고 있습니다")
         funcSendESC()         
      }else if( funcIsExistImage( "2.모험돌기\모험지도\모험입장화면.bmp" ) = true ){		
         fPrintStatus("스테이지를 선택하는 모험입장 화면 입니다.")
         funcSendESC()
      }else if( funcIsExistImage( "전투입장\전투입장화면.bmp" ) = true ){		
         fPrintStatus("전투입장 화면입니다")
         funcSendESC()
      }else if( funcIsExistImage( "전투입장\공성전\Button_공성전시작.png" ) = true ){		
         fPrintStatus("공성전 시작준비 화면입니다")
         funcSendESC()
      }else if( funcIsExistImage( "전투입장\공성전\Button_공성전준비.png") = true ){		
         fPrintStatus("공성전 준비화면입니다.")
         funcSendESC()
      }else if( funcIsExistImage( "전투입장\공성전\Window_공성선택.png" ) = true ){		
         fPrintStatus("공성요일 선택 화면입니다")
         funcSendESC()
      }else if( funcIsExistImage( "전투입장\Window_무한의탑.png" ) = true ){		
         fPrintStatus("무한의탑 선택 화면입니다")
         funcSendESC()         
      }else if( funcIsExistImage( "전투입장\Window_결투장.png" ) = true ){		
         fPrintStatus("결투장 선택  화면입니다")
         funcSendESC()         
      }else{
         fPrintStatus("어딘지 모르고 있습니다")
         funcSendESC()
      }
      
      if( a_index > 10 ){
		fPrintStatus("ERROR_마을 이동중 무한 루프에 빠진것으로 보입니다.")
         return
      }
   }
}
funcChoiceTeam( teamName )
{
   StringReplace,teamNum,teamName,팀,,All  
   
   teamFolder =10.팀선택하기\team%teamNum%   
   if( funcSearchAndClickFolder( teamFolder ) = true ){
      result = %teamName%을 선택하였습니다.
      fPrintResult(result)
      return
   }else{
      result = %teamName%이 이미 선택되어 있는것으로 보입니다.
      fPrintResult(result)
   }
	return
}
funcChoicePlayerSkill( teamName )
{
  
   StringReplace,skillNum,teamName,팀,,All  
   
   result="플레이어 스킬%skillNum%을 사용하겠습니다."
   fPrintStatus(result)
   
   
   ;이미 선택되어 있는지 확인한다.
   choicedFolder =10.팀선택하기\playerSkill\choiced_skill%skillNum%   
   if( funcIsExistImageFolder( choicedFolder ) = true ){
      result=이미 플스%skillNum%이 선택되어 있습니다.
      fPrintResult(result)
      return
   }else{
      ;일단 skillButton을 클릭한다.
      
      skillButtonFolder =10.팀선택하기\playerSkill\skillbutton 
      if( funcSearchAndClickFolder( skillButtonFolder ) = true ){
      
         skillSelectButton =10.팀선택하기\playerSkill\skill%skillNum%         
         if( funcSearchAndClickFolder( skillSelectButton ) = true ){
            result="플스%skillNum%를 선택하였습니다."
            fPrintResult(result)     
            
            funcSearchAndClickFolder("10.팀선택하기\playerSkill\exit")
         }             
      }else{
         result = ERROR_플레이어 스킬 버튼 클릭에 실패합니다.
         fPrintResult(result)      
      }     
   }
   return    
}

func_windowResize( boolForce = false ){
   global ACTIVE_ID, RUN_WIDTH, RUN_HEIGHT, DEFAULT_WIDTH, DEFAULT_HEIGHT,BoolReSized
   if( boolForce = false ){

         if( BoolReSized =  false ){
            WinMove, %ACTIVE_ID%,,,,RUN_WIDTH,RUN_HEIGHT   
            BoolReSized :=true
         }else{
            WinMove, %ACTIVE_ID%,,,,DEFAULT_WIDTH,DEFAULT_HEIGHT
           BoolReSized:=false
      }
   }else{
      WinMove, %ACTIVE_ID%,,,,RUN_WIDTH,RUN_HEIGHT   
   }
}
fRetrun(){
	gosub StopPoint   
   return
}
fLog( vContent , boolIsDebug=false){
	FormatTime, sFileName, %A_NOW%, MM월dd일
	FormatTime, TimeString, %A_NOW%, MM-dd tt hh시mm분ss초
	if( boolIsDebug = false ){
		FileAppend, `n[%TimeString%]: %vContent%, %A_ScriptDir%\Logs\log(%sFileName%).txt	
	}else{
		FileAppend, `n[%TimeString%]: %vContent%, %A_ScriptDir%\Logs\debug(%sFileName%).txt	
	}
}
funcGetNextLoopMap()
{
	global LoopMapList
	global MapIndex
	
	StringSplit,MapListArray,LoopMapList,|
	
	if( MapIndex > MapListArray0 )
		MapIndex:= 1
	else if(  MapIndex < 1 )
		MapIndex:= 1
		
	thisTimeMap:=MapListArray%MapIndex%
	MapIndex++
	
	return thisTimeMap

}


funcLoadConstants( ByRef value, strTitile, strKey ){
	IniRead, value, %A_ScriptDir%\Image\Constants.ini ,%strTitile%, %strKey%
	IfEqual value, ERROR
	{
		value:=""
	}
	return value
}