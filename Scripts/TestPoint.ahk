;~ PushNote("G4FPReaqdyZFu4njtx9cGTw4RgWwow2M", "�׽�Ʈ", "�Ϳ�....")

!F6::
{	
  	setUpBeforeStart()
   /*
      ------------------------------------------------------------
      �÷��̾� ��ų Ȯ��
      ------------------------------------------------------------
   */    
   goto ���̵������
   ;funcChoicePlayerSkill( 1 )
   ;funcChoicePlayerSkill( 2 )
   
   ;goto ����_��Ȯ��_����
   
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
   goto ����_��Ȯ��_����

   ;boolMoonIsland := funcIsMoonIsland( strStageName )
   ;msgbox, StageName(%strStageName%) boolMoonIsland = %boolMoonIsland%
   
   ;teamName=2��
   ;funcChoiceTeam( teamName )
   ;funcChoicePlayerSkill( teamName )
   return
}

!F8::
{
	setUpBeforeStart()
   funcChoicePlayerSkill( 3 )
   
   ;fPrintStatus( funcCaptureErrorScreen() )
;   teamName=3��
 ;  funcChoiceTeam( teamName )
  ; funcChoicePlayerSkill( teamName )

	;With Catpion, NoClick 
   ;loopFindTestFolder( true, false )
   

	 
   return
}

testLoopFindTestFolder( relateX=0, relateY=0 , boolDelay=true, enableClick = false ) {
	extensions:="png,bmp"
   global ACTIVE_ID
   Loop, %A_ScriptDir%\Image\5.�����ϱ�\�׽�Ʈ\*
   {
      if A_LoopFileExt in %extensions% 
      {
         strFileName=5.�����ϱ�\�׽�Ʈ\%A_LoopFileName%
         If ( funcSearchWhiteIgnore( imgX, imgY, strFileName ) = true ) {   
            
            if( enableClick ){
               vSearchResult = %strFileName%�� ã�Ұ�, Ŭ���մϴ�.
               fPrintResult(vSearchResult)         
               imgX:=imgX+relateX
               imgY:=imgY+relateY
               funcSendClick( imgX,imgY, boolDelay )		
            }else{
               vSearchResult = %strFileName%�� ã�ҽ��ϴ�.
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
   vSearchResult = No %targetFolder% �� ã�� ���߽��ϴ�.
   fPrintResult(vSearchResult)
   return false
}

funcSearchWhiteIgnore(  ByRef intPosX, Byref intPosY, target ) {
   checkExit()
   CoordMode, Pixel, Screen
	global ACTIVE_ID, BooleanDebugMode
	vImgSepa=\Image\
	vPercent=50
	IfWinExist �Ŀ� ����
	{
		WinActivate �Ŀ� ����
		Send {Enter}
	}	
	
	WinGetPos, winX, winY, winW, winH, %ACTIVE_ID%	
	ImageSearch, oX, oY, winX, winY, winX+winW, winY+winH, *%vPercent%  *TransWhite %A_ScriptDir%%vImgSepa%%target%		
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
   vSearchResult = CHECK__%target% �� ã�� ���߽��ϴ�.
	fPrintResult(vSearchResult)
	return false
}



