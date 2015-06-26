;~ PushNote("G4FPReaqdyZFu4njtx9cGTw4RgWwow2M", "테스트", "와우....")

!F6::
{	
  	setUpBeforeStart()
   /*
      ------------------------------------------------------------
      플레이어 스킬 확인
      ------------------------------------------------------------
   */
   ;funcChoicePlayerSkill( 1 )
   ;funcChoicePlayerSkill( 2 )
   ;funcChoicePlayerSkill( 3 )
   goto 렙업_쫄확인_통합
   return
} 
!F7::
{
	setUpBeforeStart()
   
   ;funcIsExistImage( "5.쫄작하기\Monster\OutCheck\30Complete.bmp" )
   ;functionByKeyByPoint()
	;funcIsExistImage( "2.모험돌기\Button_모험_시작하기.bmp" )
   ;funcSearchAndClickFolder( "1.게임실행\기타팝업X" )
   return
}
!F8::
{
	setUpBeforeStart()
   goto 레이드모드시작
	;With Catpion, NoClick 
   ;loopFindTestFolder( true, false )
   

	 
   return
}

loopFindTestFolder( boolWithCaption, enableClick ){
	fPrintTitle("그림찾기 테스트")
	global  ACTIVE_ID
	Loop,  %A_ScriptDir%\Image\5.쫄작하기\테스트\*.png
	{
		vTestPicture=5.쫄작하기\테스트\%A_LoopFileName%	
		WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%		
		if ( funcSearchImage(  xStart, yStart, vTestPicture ) = true ){		
			if( boolWithCaption = true ){
				SysGet, capH, 4 ; 캡션Height
				SysGet, bordW, 32 ; 보더Width
				SysGet, bordH, 33 ; 보더Height
				xStart:=xStart-winX-bordW
				yStart:=yStart-winY-bordH-capH			
			}else{
				xStart:=xStart-winX
				yStart:=yStart-winy
			}
			mouseMoveOrClick( xStart, yStart , enableClick )
		}else{
			MsgBox,,,WRONG:%vTestPicture%,0.3
		}
	}
   Loop,  %A_ScriptDir%\Image\5.쫄작하기\테스트\*.bmp
	{
		vTestPicture=5.쫄작하기\테스트\%A_LoopFileName%	
		WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%		
		if ( funcSearchImage(  xStart, yStart, vTestPicture ) = true ){		
			if( boolWithCaption = true ){
				SysGet, capH, 4 ; 캡션Height
				SysGet, bordW, 32 ; 보더Width
				SysGet, bordH, 33 ; 보더Height
				xStart:=xStart-winX-bordW
				yStart:=yStart-winY-bordH-capH			
			}else{
				xStart:=xStart-winX
				yStart:=yStart-winy
			}
			mouseMoveOrClick( xStart, yStart , enableClick )
		}else{
			MsgBox,,,WRONG:%vTestPicture%,0.3
		}
	}
	return
	
}
mouseMoveOrClick( xStart, yStart , enableClick )
{
	if( enableClick = true )
		funcSendClickFixed( xStart, yStart )
	else{
		mouseMove, xStart,yStart
		MsgBox,%A_LoopFileName% : X=%xStart%,Y=%yStart%
	}
	return	
}


테스트폴더찾기F:
{
	fPrintTitle("그림찾기 테스트")
	;~ global  ACTIVE_ID
	Loop,  %A_ScriptDir%\Image\5.쫄작하기\테스트\*.bmp
	{
		vTestPicture=5.쫄작하기\테스트\%A_LoopFileName%
		
		WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%
		if ( funcSearchImage(  xStart, yStart, vTestPicture ) = true ){		
			xStart:=xStart-winX
			yStart:=yStart-winy
		mouseMove, xStart,yStart
	}else{
		MsgBox,,,WRONG:%vTestPicture%,0.3
	}

	}

	return
	
}


fSearchNMove( img ){	
	global  ACTIVE_ID
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%
	;~ if ( funcSearchImage(  xStart, yStart, img ) = true ){		
		if ( monsterFinder(  xStart, yStart, img ) = true ){		
			xStart:=xStart-winX
			yStart:=yStart-winy
		mouseMove, xStart,yStart
		;~ lParam := xStart & 0xFFFF | (yStart & 0xFFFF) << 16
		;~ PostMessage, 0x201, 1, %lParam%, , 경고 ;WM_LBUTTONDOWN
		;~ sleep, 100	
		;~ PostMessage, 0x202, 1, %lParam%, , 경고 ;WM_LBUTTONUP
	}else{
		MsgBox,,,WRONG:%img%,0.3
	}
	return	
}
fSearchNMove2( img ){	
	global  ACTIVE_ID
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%
	;~ if ( funcSearchImage(  xStart, yStart, img ) = true ){		
		if ( funcSearchImage(  xStart, yStart, img ) = true ){		
			    ;~ SysGet, capH, 4 ; 캡션Height
			;~ SysGet, bordW, 32 ; 보더Width
			;~ SysGet, bordH, 33 ; 보더Height
			xStart:=xStart-winX-bordW
			yStart:=yStart-winY-bordH-capH			
		mouseMove, xStart,yStart
		;~ lParam := xStart & 0xFFFF | (yStart & 0xFFFF) << 16
		;~ PostMessage, 0x201, 1, %lParam%, , 경고 ;WM_LBUTTONDOWN
		;~ sleep, 100	
		;~ PostMessage, 0x202, 1, %lParam%, , 경고 ;WM_LBUTTONUP
	}else{
		MsgBox,,,WRONG:%img%,0.3
	}
	return	
}

testSearchNClcik( img ){
	global ACTIVE_ID	
    WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%
	if ( testImageSearch(  xStart, yStart, img ) = true ){		
			xStart:=xStart-winX
			yStart:=yStart-winy
	lParam := xStart & 0xFFFF | (yStart & 0xFFFF) << 16
	PostMessage, 0x201, 0, %lParam%, , %ACTIVE_ID% ;WM_LBUTTONDOWN
	sleep, 100	
	PostMessage, 0x202, 0, %lParam%, , %ACTIVE_ID% ;WM_LBUTTONUP
	sleep, 100	
	}
	return
	
}
testSearchNClcik2( img ){
	global ACTIVE_ID	
    WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%
	if ( testImageSearch(  xStart, yStart, img ) = true ){		
	    SysGet, capH, 4 ; 캡션Height
			SysGet, bordW, 32 ; 보더Width
			SysGet, bordH, 33 ; 보더Height
			xStart:=xStart-winX-bordW
			yStart:=yStart-winY-bordH-capH		
	lParam := xStart & 0xFFFF | (yStart & 0xFFFF) << 16
	PostMessage, 0x201, 0, %lParam%, , %ACTIVE_ID% ;WM_LBUTTONDOWN
	sleep, 100	
	PostMessage, 0x202, 0, %lParam%, , %ACTIVE_ID% ;WM_LBUTTONUP
	sleep, 100	
	}
	return
	
}

	

테스트폴더찾기2:
{
	fPrintTitle("그림찾기 테스트")
	Loop,  %A_ScriptDir%\Image\5.쫄작하기\테스트\*.bmp
	{
		vTestPicture=5.쫄작하기\테스트\%A_LoopFileName%
		 ;~ fSearchNMove2( vTestPicture) 
		 testSearchNClcik2( vTestPicture) 
	}
	
	;~ If(  monsterFinder( xNew, yNew, vNewMonsterFile ) = true ){
	return
	
}
테스트폴더클릭:
{
	fPrintTitle("그림찾기 테스트")
	Loop,  %A_ScriptDir%\Image\5.쫄작하기\테스트\*.bmp
	{
		vTestPicture=5.쫄작하기\테스트\%A_LoopFileName%
		 testImageSearch( x,y,vTestPicture,true) 
	}
	
	;~ If(  monsterFinder( xNew, yNew, vNewMonsterFile ) = true ){
	return
	
}
;~ F8::
모asdf:
{	
	fPrintTitle("맵    선택")
	fPrintStatus("스테이지를 선택합니다.")
	setUpBeforeStart()	
	if( GuiRadioStageEasy = true  ){
		v맵이름 = 쉬%GuiStageList%.bmp
	}else if( GuiRadioStageNomal = true ){
		v맵이름 = 보%GuiStageList%.bmp
	}else if ( GuiRadioStageHard = true ){
		v맵이름 = 어%GuiStageList%.bmp
	}else{
		v맵이름 = 팔%GuiStageList%.bmp
	}
	v맵이름 = 2.모험돌기\모험지도\%v맵이름%
	fPrintStatus(v맵이름 )
	 ;~ loop
	;~ {		
		if( funcIsExistImage(v맵이름) = true ){

		}else{
			fPrintStatus("다름창을 선택")
		}		
		;~ if( A_Index >8 )
			;~ break
	;~ }

	;~ fPrintStatus("ERROR_모험입장_ 맵선택중 위치찾기로 이동합니다. 지도 사진이 잘못된것 같습니다.")
	;~ goto 위치찾기
	return
}

testImageSearch( ByRef intPosX, Byref intPosY, target, boolClick=false) {
   checkExit()
	global ACTIVE_ID
	vImgSepa=\Image\
	vPercent=50
	IfWinExist 후원 세션
	{
		WinActivate 후원 세션
		Send {Enter}
	}	
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%	
	ImageSearch, oX, oY, winX, winY, winX+winW, winY+winH, *TransWhite *%vPercent% %A_ScriptDir%%vImgSepa%%target%		
	If( ErrorLevel = 0 ){
		intPosX := oX
		intPosY := oY
		if( boolClick = true ){
			vSearchResult = %target%을 찾았고, 클릭합니다.
			fPrintResult(vSearchResult)
			funcSendClick( intPosX,intPosY)		
		}else{
			vSearchResult = %target%을 찾았습니다.
			fPrintResult(vSearchResult)
		}
		return true
	}else If(Errorlevel = 2){		
		vSearchResult = ERROR--- %target% 이 없는것 같습니다.
		fPrintResult(vSearchResult)
		return false
	}else if( Errorlevel = 1 ){
		vSearchResult = %target%을 찾지 못하였습니다.
		fPrintResult(vSearchResult)
		return false	
	}
	return false
}




