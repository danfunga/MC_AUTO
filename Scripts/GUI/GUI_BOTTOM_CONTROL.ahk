INIT_BOTTOM_CONTROL:
{
	{
		Gui, Font, S8 CDefault Bold, Verdana
      controlHeight:=guiHeight-90
		Gui, Add, Button, x2 y%controlHeight% section w80 h30  vButton_Start   , ����[F9]
		Gui, Add, Button, xs ys w80 h30  +Hidden vButton_Stop   , ����[F10]
		
		vIcon_resume=%A_ScriptDir%\Image\resume.png
		vIcon_pause  =%A_ScriptDir%\Image\pause.png
		
		Gui, Add, Picture, xs+26 ys+30 w24 h24  gICON_RESUME  +Hidden vPIC_RESUME, %vIcon_resume%
		Gui, Add, Picture, xs+26 ys+30 w24 h24  gICON_PAUSE  +Hidden   vPIC_PAUSE, %vIcon_pause%
		Gui, Add, Button, xs ys+55 w80 h30  , �ٽ�[F12]
		
		Gui, Font, , 
	} 
	{
		
      
		gui,font,CPurple
		Gui, Add, GroupBox, x85 ys-5  w422 h90 , ���ӷα�
		gui,font,

		Gui, Add, Text, xp+10 	yp+20 section w70  vBottomTitle, ��Ī		
      Gui, Add, Text, x+15 	yp w250  vSubTitle, ���� �Ϸ� �Ǽ���
      Gui, Font, S8 CDefault Bold, Verdana
		Gui, Add, Button, x420 yp-10 w80 h25   vButton_Apply, ��������
		Gui, Font, ,
      
		Gui, Add, Text, xs 	   y+10 w400  v����â, Macro Version 0.95
		Gui, Add, Text, xs-2 	y+10 wp  v���â,  '���â'	
	}
		;~ Gui, show
	return
}

ICON_PAUSE:
{
	if( BoolStarted = true ){
		if( BoolPaused = false ){
			BoolPaused:= true
			GuiControl, hide%BoolPaused%, PIC_PAUSE
			GuiControl, show%BoolPaused%, PIC_RESUME
			pause
		}
	}
	return
}

ICON_RESUME:
{	
	if( BoolStarted = true ){
		if( BoolPaused = true ){
			BoolPaused:=false
			GuiControl, hide%BoolPaused%, PIC_PAUSE
			GuiControl, show%BoolPaused%, PIC_RESUME
			pause
		}
	}
	return
}

