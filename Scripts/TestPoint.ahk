;~ PushNote("G4FPReaqdyZFu4njtx9cGTw4RgWwow2M", "�׽�Ʈ", "�Ϳ�....")

!F6::
{	
  	setUpBeforeStart()
   /*
      ------------------------------------------------------------
      �÷��̾� ��ų Ȯ��
      ------------------------------------------------------------
   */
   ;funcChoicePlayerSkill( 1 )
   ;funcChoicePlayerSkill( 2 )
   ;funcChoicePlayerSkill( 3 )
   goto ����_��Ȯ��_����
   return
} 
!F7::
{
	setUpBeforeStart()
   
   ;funcIsExistImage( "5.�����ϱ�\Monster\OutCheck\30Complete.bmp" )
   ;functionByKeyByPoint()
	;funcIsExistImage( "2.���赹��\Button_����_�����ϱ�.bmp" )
   ;funcSearchAndClickFolder( "1.���ӽ���\��Ÿ�˾�X" )
   return
}
!F8::
{
	setUpBeforeStart()
   goto ���̵������
	;With Catpion, NoClick 
   ;loopFindTestFolder( true, false )
   

	 
   return
}

loopFindTestFolder( boolWithCaption, enableClick ){
	fPrintTitle("�׸�ã�� �׽�Ʈ")
	global  ACTIVE_ID
	Loop,  %A_ScriptDir%\Image\5.�����ϱ�\�׽�Ʈ\*.png
	{
		vTestPicture=5.�����ϱ�\�׽�Ʈ\%A_LoopFileName%	
		WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%		
		if ( funcSearchImage(  xStart, yStart, vTestPicture ) = true ){		
			if( boolWithCaption = true ){
				SysGet, capH, 4 ; ĸ��Height
				SysGet, bordW, 32 ; ����Width
				SysGet, bordH, 33 ; ����Height
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
   Loop,  %A_ScriptDir%\Image\5.�����ϱ�\�׽�Ʈ\*.bmp
	{
		vTestPicture=5.�����ϱ�\�׽�Ʈ\%A_LoopFileName%	
		WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%		
		if ( funcSearchImage(  xStart, yStart, vTestPicture ) = true ){		
			if( boolWithCaption = true ){
				SysGet, capH, 4 ; ĸ��Height
				SysGet, bordW, 32 ; ����Width
				SysGet, bordH, 33 ; ����Height
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


�׽�Ʈ����ã��F:
{
	fPrintTitle("�׸�ã�� �׽�Ʈ")
	;~ global  ACTIVE_ID
	Loop,  %A_ScriptDir%\Image\5.�����ϱ�\�׽�Ʈ\*.bmp
	{
		vTestPicture=5.�����ϱ�\�׽�Ʈ\%A_LoopFileName%
		
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
		;~ PostMessage, 0x201, 1, %lParam%, , ��� ;WM_LBUTTONDOWN
		;~ sleep, 100	
		;~ PostMessage, 0x202, 1, %lParam%, , ��� ;WM_LBUTTONUP
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
			    ;~ SysGet, capH, 4 ; ĸ��Height
			;~ SysGet, bordW, 32 ; ����Width
			;~ SysGet, bordH, 33 ; ����Height
			xStart:=xStart-winX-bordW
			yStart:=yStart-winY-bordH-capH			
		mouseMove, xStart,yStart
		;~ lParam := xStart & 0xFFFF | (yStart & 0xFFFF) << 16
		;~ PostMessage, 0x201, 1, %lParam%, , ��� ;WM_LBUTTONDOWN
		;~ sleep, 100	
		;~ PostMessage, 0x202, 1, %lParam%, , ��� ;WM_LBUTTONUP
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
	    SysGet, capH, 4 ; ĸ��Height
			SysGet, bordW, 32 ; ����Width
			SysGet, bordH, 33 ; ����Height
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

	

�׽�Ʈ����ã��2:
{
	fPrintTitle("�׸�ã�� �׽�Ʈ")
	Loop,  %A_ScriptDir%\Image\5.�����ϱ�\�׽�Ʈ\*.bmp
	{
		vTestPicture=5.�����ϱ�\�׽�Ʈ\%A_LoopFileName%
		 ;~ fSearchNMove2( vTestPicture) 
		 testSearchNClcik2( vTestPicture) 
	}
	
	;~ If(  monsterFinder( xNew, yNew, vNewMonsterFile ) = true ){
	return
	
}
�׽�Ʈ����Ŭ��:
{
	fPrintTitle("�׸�ã�� �׽�Ʈ")
	Loop,  %A_ScriptDir%\Image\5.�����ϱ�\�׽�Ʈ\*.bmp
	{
		vTestPicture=5.�����ϱ�\�׽�Ʈ\%A_LoopFileName%
		 testImageSearch( x,y,vTestPicture,true) 
	}
	
	;~ If(  monsterFinder( xNew, yNew, vNewMonsterFile ) = true ){
	return
	
}
;~ F8::
��asdf:
{	
	fPrintTitle("��    ����")
	fPrintStatus("���������� �����մϴ�.")
	setUpBeforeStart()	
	if( GuiRadioStageEasy = true  ){
		v���̸� = ��%GuiStageList%.bmp
	}else if( GuiRadioStageNomal = true ){
		v���̸� = ��%GuiStageList%.bmp
	}else if ( GuiRadioStageHard = true ){
		v���̸� = ��%GuiStageList%.bmp
	}else{
		v���̸� = ��%GuiStageList%.bmp
	}
	v���̸� = 2.���赹��\��������\%v���̸�%
	fPrintStatus(v���̸� )
	 ;~ loop
	;~ {		
		if( funcIsExistImage(v���̸�) = true ){

		}else{
			fPrintStatus("�ٸ�â�� ����")
		}		
		;~ if( A_Index >8 )
			;~ break
	;~ }

	;~ fPrintStatus("ERROR_��������_ �ʼ����� ��ġã��� �̵��մϴ�. ���� ������ �߸��Ȱ� �����ϴ�.")
	;~ goto ��ġã��
	return
}

testImageSearch( ByRef intPosX, Byref intPosY, target, boolClick=false) {
   checkExit()
	global ACTIVE_ID
	vImgSepa=\Image\
	vPercent=50
	IfWinExist �Ŀ� ����
	{
		WinActivate �Ŀ� ����
		Send {Enter}
	}	
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%	
	ImageSearch, oX, oY, winX, winY, winX+winW, winY+winH, *TransWhite *%vPercent% %A_ScriptDir%%vImgSepa%%target%		
	If( ErrorLevel = 0 ){
		intPosX := oX
		intPosY := oY
		if( boolClick = true ){
			vSearchResult = %target%�� ã�Ұ�, Ŭ���մϴ�.
			fPrintResult(vSearchResult)
			funcSendClick( intPosX,intPosY)		
		}else{
			vSearchResult = %target%�� ã�ҽ��ϴ�.
			fPrintResult(vSearchResult)
		}
		return true
	}else If(Errorlevel = 2){		
		vSearchResult = ERROR--- %target% �� ���°� �����ϴ�.
		fPrintResult(vSearchResult)
		return false
	}else if( Errorlevel = 1 ){
		vSearchResult = %target%�� ã�� ���Ͽ����ϴ�.
		fPrintResult(vSearchResult)
		return false	
	}
	return false
}




