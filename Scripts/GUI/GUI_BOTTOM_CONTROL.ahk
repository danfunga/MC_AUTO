INIT_BOTTOM_CONTROL:
{
	{
		Gui, Font, S8 CDefault Bold, Verdana
		
		Gui, Add, Button, x2 y365 w80 h30  vButton_Start   , 시작[F9]
		Gui, Add, Button, xs ys w80 h30  +Hidden vButton_Stop   , 정지[F10]
		
		vIcon_resume=%A_ScriptDir%\Image\resume.png
		vIcon_pause  =%A_ScriptDir%\Image\pause.png
		
		Gui, Add, Picture, xs+26 ys+30 w24 h24  gICON_RESUME  +Hidden vPIC_RESUME, %vIcon_resume%
		Gui, Add, Picture, xs+26 ys+30 w24 h24  gICON_PAUSE  +Hidden   vPIC_PAUSE, %vIcon_pause%
		Gui, Add, Button, xs ys+55 w80 h30  , 다시[F12]
		
		Gui, Font, , 
	} 
	{
		gui,font,CPurple
		Gui, Add, GroupBox, x+5 y360 w422 h90 , 게임로그
		gui,font,
		
		Gui, Add, Text, xs+100 	yp+17 w70 h15 vBottomTitle, 런칭		
      Gui, Add, Text, x+10 	yp w250 h15 vSubTitle, 
		Gui, Add, Text, xs+100 	y+11 w410 hp v상태창, Macro Version 0.95
		Gui, Add, Text, xs+100 			y+11 wp hp v결과창,  '결과창'	
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

