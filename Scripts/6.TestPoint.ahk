;~ PushNote("G4FPReaqdyZFu4njtx9cGTw4RgWwow2M", "테스트", "와우....")

^F6::
{	
  	setUpBeforeStart()
   /*
      ------------------------------------------------------------
      플레이어 스킬 확인
      ------------------------------------------------------------
   */    
   ;funcTestGetString("First", "Second" )
   ;goto 레이드모드시작
   
   ;functionByKeyByPoint()
   ;funcChoicePlayerSkill( 2 )
   ;funcChoicePlayerSkill( 1 )
   ;funcChoicePlayerSkill( 2 )
   ;goto 렙업_쫄확인_통합
   functionMoveTown()
   
   ;테스트
   ; 1. 황금, 모험 먼저 실행
   ; 2. 레이드 모드
   ; 3. 열쇠 구입
      ;goto 모험시작_모험키부족
   ; 4. 렙업 쫄확인
       ;goto 렙업_쫄확인_통합
   return
} 
!F7::
{
	setUpBeforeStart()
;      if( GuiLoopMap = true ){
      ;strStageName:=funcGetNextLoopMap()
   ;}else{
      ;strStageName:=GuiStageList
   ;}
   goto 렙업_쫄확인_통합

   ;boolMoonIsland := funcIsMoonIsland( strStageName )
   ;msgbox, StageName(%strStageName%) boolMoonIsland = %boolMoonIsland%
   
   ;teamName=2팀
   ;funcChoiceTeam( teamName )
   ;funcChoicePlayerSkill( teamName )
   return
}

!F8::
{
	setUpBeforeStart()
   funcChoicePlayerSkill( 1 )
   
   ;fPrintStatus( funcCaptureErrorScreen() )
;   teamName=3팀
 ;  funcChoiceTeam( teamName )
  ; funcChoicePlayerSkill( teamName )

	;With Catpion, NoClick 
   ;loopFindTestFolder( true, false )
   

	 
   return
}



testLoopFindTestFolder( relateX=0, relateY=0 , boolDelay=true, enableClick = false ) {
	extensions:="png,bmp"
   global ACTIVE_ID
   Loop, %A_ScriptDir%\Resource\Image\5.쫄작하기\테스트\*
   {
      if A_LoopFileExt in %extensions% 
      {
         strFileName=5.쫄작하기\테스트\%A_LoopFileName%
         If ( funcSearchWhiteIgnore( imgX, imgY, strFileName ) = true ) {   
            
            if( enableClick ){
               vSearchResult = %strFileName%을 찾았고, 클릭합니다.
               fPrintResult(vSearchResult)         
               imgX:=imgX+relateX
               imgY:=imgY+relateY
               funcSendClick( imgX,imgY, boolDelay )		
            }else{
               vSearchResult = %strFileName%을 찾았습니다.
               fPrintResult(vSearchResult) 
              
               WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%               
               imgX:=imgX+relateX
               imgY:=imgY+relateY
					imgX:=imgX-winX
               imgY:=imgY-winy                     
               mouseMove, imgX,imgY
            }
            Return true
         }   
      }
	}
   vSearchResult = No %targetFolder% 을 찾지 못했습니다.
   fPrintResult(vSearchResult)
   return false
}

funcSearchWhiteIgnore(  ByRef intPosX, Byref intPosY, target ) {
   checkExit()
   CoordMode, Pixel, Screen
	global ACTIVE_ID, BooleanDebugMode
	vImgSepa=\Resource\Image\
	vPercent=50
	IfWinExist 후원 세션
	{
		WinActivate 후원 세션
		Send {Enter}
	}	
	
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%	
	ImageSearch, oX, oY, winX, winY, winX+winW, winY+winH, *%vPercent%  *TransWhite %A_ScriptDir%%vImgSepa%%target%		
	If( ErrorLevel = 0 ){
		intPosX := oX
		intPosY := oY    
		if( BooleanDebugMode = true ){
			vSearchResult = %target%을 찾았습니다. X=%intPosX%, Y=%intPosY%
			fPrintResult(vSearchResult)	
		}
		 return true
	}else If(Errorlevel = 2){		
		vSearchResult = ERROR --- %target% 파일자체가 존재하지 않습니다.
		fPrintResult(vSearchResult)
		return false
	}
   vSearchResult = CHECK__%target% 을 찾지 못했습니다.
	fPrintResult(vSearchResult)
	return false
}



