/*
---------------------------------------------------------------------------------------------------------------------------
   ��ü Wait�� ���� �� --> msec���� �����Ͽ� ��ٸ���.
---------------------------------------------------------------------------------------------------------------------------
*/ 
funcSleep( secSleep ){
   msec:=secSleep*1000
   Sleep, %msec%
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
   return
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

funcWaitingBeforeSkill( skillIndex ){   
   
   guiControlGet,skillDelay, 2: ,GuiChar%skillIndex%SkillDelay,text
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
	gosub ��ũ������   
   return
}
fLog( vContent , boolIsDebug=false){
	FormatTime, sFileName, %A_NOW%, MM��dd��
	FormatTime, TimeString, %A_NOW%, MM-dd tt hh��mm��ss��
	if( boolIsDebug = false ){
		FileAppend, `n[%TimeString%]: %vContent%, %A_ScriptDir%\Logs\log(%sFileName%).txt	
	}else{
		FileAppend, `n[%TimeString%]: %vContent%, %A_ScriptDir%\Logs\debug(%sFileName%).txt	
	}
}


funcLoadConstants( ByRef value, strTitile, strKey ){
	IniRead, value, %A_ScriptDir%\Resource\Image\Constants.ini ,%strTitile%, %strKey%
	IfEqual value, ERROR
	{
		value:=""
	}
	return value
}

/*
------------------------------------------------------------
Ȱ�� ������ Ŭ�� �� Search : ���� gui ȯ�濡 �ȸ����� �ִ�.
------------------------------------------------------------
*/ 
fSearchClick( target ){
	checkExit()
	vImgSepa=\Resource\Image\
	vPercent=50
	IfWinExist �Ŀ� ����
	{
		WinActivate �Ŀ� ����
		Send {Enter}
	}	
	ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight,  *%vPercent% %A_ScriptDir%%vImgSepa%%target%		
	If ( Errorlevel = 0 )	{
		vSearchResult = %target%�� ã�� Ŭ���մϴ�.
		fPrintResult(vSearchResult)		
      fClick(x,y)
		return true
	}
	If ( Errorlevel = 2	){		
		vSearchResult = Error %target%�� �߸��Ȱ� �����ϴ�.
		fPrintResult(vSearchResult)
		return false
	}else{
		;~ vSearchResult = %target%�� ã�� ���Ͽ����ϴ�.
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
   ��Ȱ�� Ŭ�� 
------------------------------------------------------------
*/


funcIsExistImage(target) {
    If (  funcSearchImage( x, y, target) = true ) {
         vSearchResult = %target%�� �����մϴ�.
			fPrintResult(vSearchResult)         
         Return true
    }else{
		vSearchResult = %target%�� ���� ���� �ʽ��ϴ�.
		fPrintResult(vSearchResult)         
		Return false
	}
}
funcSearchAndClick(targetImg, relateX=0, relateY=0 , boolDelay=true ) {
    If ( funcSearchImage( imgX, imgY, targetImg ) = true ) {   
         vSearchResult = %targetImg%�� ã�Ұ�, Ŭ���մϴ�.
			fPrintResult(vSearchResult)         
         
         imgX:=imgX+relateX
         imgY:=imgY+relateY
         
			funcSendClick( imgX,imgY, boolDelay )		
        Return true
    }else{
     vSearchResult = No %targetImg% �� ã�� ���߽��ϴ�.
     fPrintResult(vSearchResult)
    }
    Return false
}
funcSearchAndClickFolder( targetFolder, relateX=0, relateY=0 , boolDelay=true ) {
	extensions:="png,bmp"
   
   Loop, %A_ScriptDir%\Resource\Image\%targetFolder%\*
   {
      if A_LoopFileExt in %extensions% 
      {
         strFileName=%targetFolder%\%A_LoopFileName%
         If ( funcSearchImage( imgX, imgY, strFileName ) = true ) {   
            vSearchResult = %strFileName%�� ã�Ұ�, Ŭ���մϴ�.
            fPrintResult(vSearchResult)         
         
            imgX:=imgX+relateX
            imgY:=imgY+relateY
         
            funcSendClick( imgX,imgY, boolDelay )		
            Return true
         }   
      }
	}
   vSearchResult = No %targetFolder% �� ã�� ���߽��ϴ�.
   fPrintResult(vSearchResult)
   return false
}
funcIsExistImageFolder( targetFolder, boolLog=true ) {
	extensions :="png,bmp"
   
   Loop, %A_ScriptDir%\Resource\Image\%targetFolder%\*
   {
      if A_LoopFileExt in %extensions% 
      {
         strFileName=%targetFolder%\%A_LoopFileName%
         If( funcSearchImage( x, y, strFileName) = true ) {
            vSearchResult = %strFileName%�� �����մϴ�.
            fPrintResult(vSearchResult)         
            return true
         }         
      }
	}
   if( boolLog = true ){
      vSearchResult = %targetFolder%�� ���� ���� �ʽ��ϴ�.
      fPrintResult(vSearchResult)         
   }
   return false
}

    



funcSearchImage(  ByRef intPosX, Byref intPosY, target ) {
   checkExit()
   CoordMode, Pixel, Screen
	global ACTIVE_ID, BooleanDebugMode
	vImgSepa=\Resource\Image\
	vPercent=50
	IfWinExist �Ŀ� ����
	{
		WinActivate �Ŀ� ����
		Send {Enter}
	}	
	
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%	
	ImageSearch, oX, oY, winX, winY, winX+winW, winY+winH, *%vPercent% %A_ScriptDir%%vImgSepa%%target%		
	If( ErrorLevel = 0 ){
		intPosX := oX
		intPosY := oY    
		if( BooleanDebugMode = true ){
			vSearchResult = %target%�� ã�ҽ��ϴ�. X=%intPosX%, Y=%intPosY%
			fPrintResult(vSearchResult)	
		}
		 return true
	}else If(Errorlevel = 2){		
		vSearchResult = ERROR --- %target% ������ü�� �������� �ʽ��ϴ�.
		fPrintResult(vSearchResult)
		return false
	}
   ;~vSearchResult = CHECK__%target% �� ã�� ���߽��ϴ�.
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
   fPrintResult("ESC�� �����ϴ�.")
   
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
    SysGet, capH, 4 ; ĸ��Height
    SysGet, bordW, 32 ; ����Width
    SysGet, bordH, 33 ; ����Height

    px:=x-bordW/2
    py:=y-bordH/2-capH

    p := px|py<<16

    PostMessage, 0x201, 0, %p%, , %ACTIVE_ID%
    PostMessage, 0x202, 0, %p%, , %ACTIVE_ID%
    funcSleep(3)
    Return
}

;�̹��� ã�������� ���
funcWaitAndReturn(targetFolder, watigDelay=0.5, waitingCount=20 , enableLog=false) {
   Loop
	{
      If ( funcIsExistImageFolder( targetFolder, false ) = true ) {
         return true
      }

      FuncSleep(watigDelay)
      if( A_Index > waitingCount ){
         return false
      }
      if( enableLog = true ){
         fPrintStatus( targetFolder "�� ���������� ã�� �ֽ��ϴ�. (" A_Index "/" waitingCount ")")        
      }      
   }
	return false
}

;�̹��� ã�������� ����� Ŭ��
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


funcMouseDrag(fromX,fromY,toX,toY)
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


funcLoadConfig(  config, ByRef targetGuiValue, isListGui , vTitle, vKey  ){

   value:=config.loadValue( vTitle, vKey  )      
   if( value <> "" ){
      if( isListGui = false ){
         GuiControl, ,targetGuiValue,%value%   
      }else{
         GuiControl, choose ,targetGuiValue,%value%   
      }
   }
	return
}
funcSaveConfig(  config, vValue, isListGui , vTitle, vKey  ){
   config.saveValue( vTitle, vKey , vValue)      
	return
}


