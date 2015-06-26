
/*
------------------------------------------------------------
활성 상태의 클릭 및 Search : 현재 gui 환경에 안맞을수 있다.
------------------------------------------------------------
*/ 
fSearchClick( target ){
	checkExit()
	vImgSepa=\Image\
	vPercent=50
	IfWinExist 후원 세션
	{
		WinActivate 후원 세션
		Send {Enter}
	}	
	ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight,  *%vPercent% %A_ScriptDir%%vImgSepa%%target%		
	If ( Errorlevel = 0 )	{
		vSearchResult = %target%을 찾아 클릭합니다.
		fPrintResult(vSearchResult)		
      fClick(x,y)
		return true
	}
	If ( Errorlevel = 2	){		
		vSearchResult = Error %target%이 잘못된것 같습니다.
		fPrintResult(vSearchResult)
		return false
	}else{
		;~ vSearchResult = %target%을 찾지 못하였습니다.
		;~ fPrintResult(vSearchResult)
	return false
	}
}

fClick( x, y){
	checkExit()
	WinActivate BlueStacks App Player
	MouseClick, Left, x, y
	funcWaitingClick()
	return 
}

/*
------------------------------------------------------------
   비활성 클릭 
------------------------------------------------------------
*/


funcIsExistImage(target) {
    If (  funcSearchImage( x, y, target) = true ) {
         vSearchResult = %target%가 존재합니다.
			fPrintResult(vSearchResult)         
         Return true
    }else{
		vSearchResult = %target%가 존재 하지 않습니다.
		fPrintResult(vSearchResult)         
		Return false
	}
}
funcSearchAndClick(targetImg, relateX=0, relateY=0 , boolDelay=true ) {
    If ( funcSearchImage( imgX, imgY, targetImg ) = true ) {   
         vSearchResult = %targetImg%을 찾았고, 클릭합니다.
			fPrintResult(vSearchResult)         
         
         imgX:=imgX+relateX
         imgY:=imgY+relateY
         
			funcSendClick( imgX,imgY, boolDelay )		
        Return true
    }else{
     vSearchResult = No %targetImg% 을 찾지 못했습니다.
     fPrintResult(vSearchResult)
    }
    Return false
}
funcSearchAndClickFolder( targetFolder, relateX=0, relateY=0 , boolDelay=true ) {
	extensions:="png,bmp"
   
   Loop, %A_ScriptDir%\Image\%targetFolder%\*
   {
      if A_LoopFileExt in %extensions% 
      {
         strFileName=%targetFolder%\%A_LoopFileName%
         If ( funcSearchImage( imgX, imgY, strFileName ) = true ) {   
            vSearchResult = %strFileName%을 찾았고, 클릭합니다.
            fPrintResult(vSearchResult)         
         
            imgX:=imgX+relateX
            imgY:=imgY+relateY
         
            funcSendClick( imgX,imgY, boolDelay )		
            Return true
         }   
      }
	}
   vSearchResult = No %targetFolder% 을 찾지 못했습니다.
   fPrintResult(vSearchResult)
   return false
}
funcIsExistImageFolder( targetFolder, boolLog=true ) {
	extensions :="png,bmp"
   
   Loop, %A_ScriptDir%\Image\%targetFolder%\*
   {
      if A_LoopFileExt in %extensions% 
      {
         strFileName=%targetFolder%\%A_LoopFileName%
         If( funcSearchImage( x, y, strFileName) = true ) {
            vSearchResult = %strFileName%가 존재합니다.
            fPrintResult(vSearchResult)         
            return true
         }         
      }
	}
   if( boolLog = true ){
      vSearchResult = %targetFolder%가 존재 하지 않습니다.
      fPrintResult(vSearchResult)         
   }
   return false
}

    



funcSearchImage(  ByRef intPosX, Byref intPosY, target ) {
   checkExit()
   CoordMode, Pixel, Screen
	global ACTIVE_ID, BooleanDebugMode
	vImgSepa=\Image\
	vPercent=50
	IfWinExist 후원 세션
	{
		WinActivate 후원 세션
		Send {Enter}
	}	
	
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%	
	ImageSearch, oX, oY, winX, winY, winX+winW, winY+winH, *%vPercent% %A_ScriptDir%%vImgSepa%%target%		
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
   ;~vSearchResult = CHECK__%target% 을 찾지 못했습니다.
	;~fPrintResult(vSearchResult)
	return false
}

funcSendClick( x, y, boolDelay=true) {
   	global ACTIVE_ID	
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%
	px:=x-winX
	py:=y-winy
   
	funcSendClickFixed(px, py )
	if( boolDelay = true )
		funcWaitingClick()
    Return
}

funcSendClickFixed( posX, posY , boolDelay=false){
   global ACTIVE_ID,BooleanDebugMode
   
   if( BooleanDebugMode = true ){
      vSearchResult =last Click Position %posX%, %posY%
      fPrintResult(vSearchResult)
   }    
   lParam:= posX|posY<< 16
   
	PostMessage, 0x201, 0, %lParam%, , %ACTIVE_ID% ;WM_LBUTTONDOWN
	sleep, 50	
	PostMessage, 0x202, 0, %lParam%, , %ACTIVE_ID% ;WM_LBUTTONUP
   if( boolDelay = true )
		funcWaitingClick()
   return
}
funcSendESC() {
   global ACTIVE_ID
   fPrintResult("ESC를 누릅니다.")
   
	WM_KEYDOWN:=0x100
	WM_KEYUP:=0x101
	VK_ESCAPE:=0x1B
	
	PostMessage, WM_KEYDOWN,  VK_ESCAPE, 0,,  %ACTIVE_ID%
	sleep, 50	
	PostMessage, WM_KEYUP,  VK_ESCAPE,  0,,  %ACTIVE_ID% 
	funcWaitingClick()
   Return
}





sendClick2( x, y) {
    global ACTIVE_ID
    SysGet, capH, 4 ; 캡션Height
    SysGet, bordW, 32 ; 보더Width
    SysGet, bordH, 33 ; 보더Height

    px:=x-bordW/2
    py:=y-bordH/2-capH

    p := px|py<<16

    PostMessage, 0x201, 0, %p%, , %ACTIVE_ID%
    PostMessage, 0x202, 0, %p%, , %ACTIVE_ID%
    funcSleep(3)
    Return
}

;이미지 찾을때까지 대기
funcWaitAndReturn(targetFolder) {
	global GuiDelayForSearch
	global GuiSearchLimit
   Loop
	{
      If ( funcIsExistImageFolder( targetFolder, false ) = true ) {
         return true
      }
      FuncSleep(GuiDelayForSearch)
      if( A_Index > GuiSearchLimit ){
         return false
      }
   }
	return false
}

;이미지 찾을때까지 대기후 클릭
funcWaitAndClickImg( targetFolder) {
	global GuiDelayForSearch
	global GuiSearchLimit
    Loop
	{
        If ( funcSearchAndClickFolder(  targetFolder ,0,0, false ) = true ) {
            return true
        }
        FuncSleep( GuiDelayForSearch )
		if( A_Index > GuiSearchLimit ){
			return false
		}
    }
	;~ FuncSlep(GuiDelayForSearch)
   return false
}
funcSendMouseDragFixed(fromX,fromY,toX,toY)
{
  	global ACTIVE_ID
   ;global ACTIVE_ID, IntWinCapHeight , IntWinBorderWidth, IntWinBorderHeight 
	startX:=fromX
	startY:=fromY
	
	endX:=toX
	endY:=toY
	
	startParam := startX|startY<< 16
	endParam := endX|endY<< 16
		
   middleX := startX
   middleY := startY
   
	PostMessage, 0x201, 1, %startParam%, , %ACTIVE_ID% ;WM_LBUTTONDOWN	
   PostMessage, 0x201, 1, %endParam%, , %ACTIVE_ID% ;WM_LBUTTONDOWN	      
   PostMessage, 0x202, 1, %endParam%, , %ACTIVE_ID% ;WM_LBUTTONUP	  
   return
}
funcSendMouseDrag(fromX,fromY,toX,toY)
{
  	global ACTIVE_ID, IntWinCapHeight , IntWinBorderWidth, IntWinBorderHeight
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%
   
	startX:=fromX-winX
   
	startY:=fromY-winy
	
	endX:=toX-winX
	endY:=toY-winy
   funcSendMouseDragFixed(startX,startY,endX,endY)
   return
}


MouseDrag(fromX,fromY,toX,toY)
{
	global ACTIVE_ID, IntWinCapHeight , IntWinBorderWidth, IntWinBorderHeight
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%
   
	startX:=fromX-winX
	startY:=fromY-winy
	
	endX:=toX-winX
	endY:=toY-winy
	
	
	startParam := startX & 0xFFFF | (startY & 0xFFFF) << 16
	endParam := endX & 0xFFFF | (endY & 0xFFFF) << 16
	
	;~ postmessage, 0x200,%startParam%,%endParam%,,%ACTIVE_ID%
	;~ postmessage, 0x200,,%startParam%,,%ACTIVE_ID%
	
	PostMessage, 0x201, 1, %startParam%, , %ACTIVE_ID% ;WM_LBUTTONDOWN	
	sleep, 100
	PostMessage, 0x201, 1, %endParam%, , %ACTIVE_ID% ;WM_LBUTTONDOWN	
	;~ sleep, 100
	PostMessage, 0x202, 1, %endParam%, , %ACTIVE_ID% ;WM_LBUTTONUP	
   return
}


