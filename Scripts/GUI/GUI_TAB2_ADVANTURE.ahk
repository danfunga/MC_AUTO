INIT_TAB_ADVANTURE:
{ 
    {
        gui, 2: font,CPurple
        Gui, 2:  Add, GroupBox,  x02 y030 w505 h125, 모험 자동 스킬
        gui, 2: font,

        Gui, 2:  Add, Checkbox, x110 yp  gSelectAdvatureAutoSkill vGuiAdvantureAutoSkill ,사용
        Gui, 2:  Add, Checkbox, x+10 yp  vGuiAutoSkillOff ,자동스킬Off
        
        Gui, 2:  Add, Checkbox, x10 yp+20 section w30 h15  vGuiChar1Check ,1.
        Gui, 2:  Add, Edit, x+0 yp w30 h15  right vGuiChar1SkillDelay, 0
        Gui, 2:  Add, Text, x+0 yp+2 w40 h15 , 초 후
        Gui, 2:  Add, DropDownList, x+0 yp-5 w80  gSelectChar1  vGuiChar1, 아일린|레이
        Gui, 2:  Add, Radio, x+10 yp+3 w110 h15 vGuiChar1Skill1, 공격1
        Gui, 2:  Add, Radio, x+20 yp w110 h15 vGuiChar1Skill2, 공격2

        Gui, 2:  Add, Checkbox, xs y+5 w30 h15  vGuiChar2Check,2.
        Gui, 2:  Add, Edit, x+0 yp w30 h15  right vGuiChar2SkillDelay, 3
        Gui, 2:  Add, Text, x+0 yp+2 w40 h15 , 초 후
        Gui, 2:  Add, DropDownList, x+0 yp-5 w80  gSelectChar2 vGuiChar2, 아일린|레이
        Gui, 2:  Add, Radio, x+10 yp+3 w110 h15 vGuiChar2Skill1, 공격1
        Gui, 2:  Add, Radio, x+20 yp w110 h15 vGuiChar2Skill2,공격2

        Gui, 2:  Add, Checkbox, xs y+5 w30 h15  vGuiChar3Check,3.
        Gui, 2:  Add, Edit, x+0 yp w30 h15  right vGuiChar3SkillDelay, 3
        Gui, 2:  Add, Text, x+0 yp+2 w40 h15 , 초 후
        Gui, 2:  Add, DropDownList,  x+0 yp-5 w80  gSelectChar3 vGuiChar3, 아일린|레이
        Gui, 2:  Add, Radio, x+10 yp+3 w110 h15 vGuiChar3Skill1, 공격1
        Gui, 2:  Add, Radio, x+20 yp w110 h15 vGuiChar3Skill2, 공격2

        Gui, 2:  Add, Checkbox, xs y+5 w30 h15  vGuiChar4Check,4.
        Gui, 2:  Add, Edit, x+0 yp w30 h15  right vGuiChar4SkillDelay, 3
        Gui, 2:  Add, Text, x+0 yp+2 w40 h15 , 초 후
        Gui, 2:  Add, DropDownList, x+0 yp-5 w80  gSelectChar4  vGuiChar4, 아일린|레이
        Gui, 2:  Add, Radio, x+10 yp+3 w110 h15 vGuiChar4Skill1, 공격1
        Gui, 2:  Add, Radio, x+20 yp w110 h15 vGuiChar4Skill2, 공격2

        Gui, 2:  Add, Checkbox, xs y+5 w30 h15  vGuiChar5Check,5.
        Gui, 2:  Add, Edit, x+0 yp w30 h15  right vGuiChar5SkillDelay, 3
        Gui, 2:  Add, Text, x+0 yp+2 w40 h15 , 초 후
        Gui, 2:  Add, DropDownList, x+0 yp-5 w80  gSelectChar5  vGuiChar5, 아일린|레이
        Gui, 2:  Add, Radio, x+10 yp+3 w110 h15 vGuiChar5Skill1, 공격1
        Gui, 2:  Add, Radio, x+20 yp w110 h15 vGuiChar5Skill2, 공격2
    }
    {
        gui, 2: font,CPurple
        Gui, 2:  Add, GroupBox,  x02 y+10 w505 h85, 황금방 자동 스킬
        gui, 2: font,       
        
        Gui, 2:  Add, Checkbox, x110 yp  h15  gSelectGoldAutoSkill vGuiGoldRoomAutoSkill ,사용

        Gui, 2:  Add, Checkbox, x10 yp+20 w30 h15  vGuiCheckGoldChar1 ,1.
        Gui, 2:  Add, Edit, x+0 yp w30 h15  right vGuiGoldSkillDelay1, 0
        Gui, 2:  Add, Text, x+0 yp+2 w40 h15 , 초 후
        Gui, 2:  Add, DropDownList, x+0 yp-5 w80  gSelectGoldChar1  vGuiGoldChar1, 아일린|레이
        Gui, 2:  Add, Radio, x+10 yp+3 w110 h15 vGuiSkill1GoldChar1, 공격1
        Gui, 2:  Add, Radio, x+20 yp w110 h15 vGuiSkill2GoldChar1, 공격2

        Gui, 2:  Add, Checkbox, x10 y+5 w30 h15  vGuiCheckGoldChar2,2.
        Gui, 2:  Add, Edit, x+0 yp w30 h15  right vGuiGoldSkillDelay2, 3
        Gui, 2:  Add, Text, x+0 yp+2 w40 h15 , 초 후
        Gui, 2:  Add, DropDownList, x+0 yp-5 w80  gSelectGoldChar2 vGuiGoldChar2, 아일린|레이
        Gui, 2:  Add, Radio, x+10 yp+3 w110 h15 vGuiSkill1GoldChar2, 공격1
        Gui, 2:  Add, Radio, x+20 yp w110 h15 vGuiSkill2GoldChar2,공격2

        Gui, 2:  Add, Checkbox, x10 y+5 w30 h15  vGuiCheckGoldChar3,3.
        Gui, 2:  Add, Edit, x+0 yp w30 h15  right vGuiGoldSkillDelay3, 3
        Gui, 2:  Add, Text, x+0 yp+2 w40 h15 , 초 후
        Gui, 2:  Add, DropDownList,  x+0 yp-5 w80  gSelectGoldChar3 vGuiGoldChar3, 아일린|레이
        Gui, 2:  Add, Radio, x+10 yp+3 w110 h15 vGuiSkill1GoldChar3, 공격1
        Gui, 2:  Add, Radio, x+20 yp w110 h15 vGuiSkill2GoldChar3, 공격2
    }

    {
        gui, 2: font,CPurple
        Gui, 2:  Add, GroupBox, x2 y+10 w505 h60  , 딜레이 설정
        gui, 2: font,    
        
        Gui, 2:  Add, Text, x10   yp+20 section w60 h15 , 검색주기 :
        Gui, 2:  Add, Edit, x+0   ys-2 w25 h15 right vGuiDelayForSearch, 0.5
        Gui, 2:  Add, Text, x+0   ys w200 h15 Left , 초 마다 스킬을 체크합니다. ( 0.5초 )
        Gui, 2:  Add, Edit, x+10  ys-3 w80 h15 Left vGuiSkillFileName, default       
        Gui, 2:  Add, Button, x+15 ys-5 w80 h20  , SAVE
        
        Gui, 2:  Add, Text, xs    y+4 section w60 h15 , 검색제한 :       
        Gui, 2:  Add, Edit, x+0   ys-2 w25 h15 right vGuiSearchLimit, 20
        Gui, 2:  Add, Text, x+0   ys w200 h15 Left , 번 스킬 검색을 지속합니다.( 20번)
        Gui, 2:  Add, DropDownList, x+10  ys-5 w80 h100  gSelectSkillFiles vGuiSkillFiles,       
        Gui, 2:  Add, Button, x+15 ys-5 w80 h20  , LOAD
        
     
    }
    advantureSkillGuiEnable(false)
    GoldRoomSkillGuiEnable( false )
    funcCharactorGuiUpdate()


    return
}

funcGuiLoadConfigList( choice ){		
   
	Loop, %A_ScriptDir%\Config\Skill\*.ini
   {		
        StringReplace, configName, A_LoopFileName, .ini, , All
		SkillFileList=%SkillFileList%|%configName%
   }
	GuiControl,,GuiSkillFiles,%SkillFileList%
   GuiControl,chooseString,GuiSkillFiles, %choice%
	return
}
funcCharactorGuiUpdate(){
    	Loop, %A_ScriptDir%\Resource\Image\10.스킬이미지\*,2,0
	{
		strCharList=%strCharList%|%A_LoopFileName%
	}
	Loop 5
	{
		GuiControl, ,GuiChar%A_Index%,%strCharList%
		GuiControl, ,GuiWarChar%A_Index%,%strCharList%
		GuiControl, ,GuiGoldChar%A_Index%,%strCharList%
	}
	return
}

SelectAdvatureAutoSkill:
{	
    guiControlGet, booleanValue,,GuiAdvantureAutoSkill
   if ( booleanValue = true )
      advantureSkillGuiEnable( true )
   else
      advantureSkillGuiEnable( false )	  
    return
}
SelectGoldAutoSkill:
{
    guiControlGet, booleanValue,,GuiGoldRoomAutoSkill
   if ( booleanValue = true )
      GoldRoomSkillGuiEnable( true )
   else
      GoldRoomSkillGuiEnable( false )	  
    return
    
        return
}

SelectChar1:
{
	fUpdateGui( 1 )
	return
}
SelectChar2:
{
	fUpdateGui( 2 )
	return
}
SelectChar3:
{
	fUpdateGui( 3 )
	return
}
SelectChar4:
{
	fUpdateGui( 4 )
	return
}
SelectChar5:
{
	fUpdateGui( 5)
	return
}

SelectGoldChar1:
{
	funcGoldCharGuiUpdate( 1 )	
	return
}
SelectGoldChar2:
{
	funcGoldCharGuiUpdate(2 )	
	return
}
SelectGoldChar3:
{
	funcGoldCharGuiUpdate( 3)	
	return
}
SelectSkillFiles:
{
	guiControlGet, fileName,,GuiSkillFiles
	StringReplace,fileName,fileName,.ini
	GuiControl,,GuiSkillFileName,%filename%		
   return
}
GoldRoomSkillGuiEnable( boolEnable )
{
    loop, 3
    {
        GuiControl, Enable%boolEnable%,GuiCheckGoldChar%A_index%
        GuiControl, Enable%boolEnable%,GuiGoldSkillDelay%A_index%
        GuiControl, Enable%boolEnable%,GuiGoldChar%A_index%
        GuiControl, Enable%boolEnable%,GuiSkill1GoldChar%A_index%
        GuiControl, Enable%boolEnable%,GuiSkill2GoldChar%A_index%
    }
    return	
}
advantureSkillGuiEnable( boolEnable )
{
    loop, 5
    {
        GuiControl, Enable%boolEnable%,GuiChar%A_index%Check
        GuiControl, Enable%boolEnable%,GuiChar%A_index%SkillDelay
        GuiControl, Enable%boolEnable%,GuiChar%A_index%
        GuiControl, Enable%boolEnable%,GuiChar%A_index%Skill1
        GuiControl, Enable%boolEnable%,GuiChar%A_index%Skill2
    }
    return	
}




funcGoldCharGuiUpdate( charNum ) {
	guiControlGet, charName,,GuiGoldChar%charNum%
	indexSkill=1
	Loop, %A_ScriptDir%\Resource\Image\10.스킬이미지\%charName%\*,2,0
	{
      GuiControl, ,GuiSkill%indexSkill%GoldChar%charNum%,%A_LoopFileName%
		indexSkill++

	}
   if( indexSkill = 2 ){
      GuiControl, ,GuiSkill%indexSkill%GoldChar%charNum%,
   }
	return	
}
fUpdateGui(  charNum ){
	guiControlGet, charName,,GuiChar%charNum%
   indexSkill=1
	Loop, %A_ScriptDir%\Resource\Image\10.스킬이미지\%charName%\*,2,0
	{      
		GuiControl, ,GuiChar%charNum%Skill%indexSkill%,%A_LoopFileName%
      indexSkill++    
   }
   if( indexSkill = 2 ){
      GuiControl, ,GuiChar%charNum%Skill%indexSkill%,   
   }
	return	
}

SaveSkillConfig:
{
   Gui, Submit, NoHide
    IfNotExist, Logs
	{
		FileCreateDir, Logs
	}
	IfNotExist, Config
	{
		FileCreateDir, Config
	}
	guiControlGet, fileName,,GuiSkillFileName
	
	fSaveSkillFile( fileName, GuiDelayForSearch, "딜레이", "검색주기")	
	fSaveSkillFile( fileName, GuiSearchLimit, "딜레이", "검색제한" )
   
	fSaveSkillFile( fileName, GuiAdvantureAutoSkill, "자동스킬", "모험자동스킬" )
   fSaveSkillFile( fileName, GuiAutoSkillOff, "자동스킬", "모험자동스킬Off" )
   
	fSaveSkillFile( fileName, GuiGoldRoomAutoSkill, "자동스킬", "황금방자동스킬" )
	Loop, 5
	{
		title=모험%a_index%번스킬
		
		fSaveSkillFile( fileName, GuiChar%a_index%Check, title, "사용" )
		fSaveSkillFile( fileName, GuiChar%a_index%, title, "케릭터" )   		
		
		guiControlGet,skillDelay,,GuiChar%a_index%SkillDelay,text
		fSaveSkillFile( fileName, skillDelay, title, "스킬딜레이" )		
		
		fSaveSkillFile( fileName, GuiChar%a_index%Skill1, title, "1스킬사용" )
		guiControlGet, skillName,,GuiChar%a_index%Skill1,text
		fSaveSkillFile( fileName, skillName, title, "1스킬이름" )
		
		fSaveSkillFile( fileName, GuiChar%a_index%Skill2, title, "2스킬사용" )   
		guiControlGet,skillName,,GuiChar%a_index%Skill2,text
		fSaveSkillFile( fileName, skillName, title, "2스킬이름" )
   }  
   	Loop, 3
	{
		title=황금%a_index%번스킬
		fSaveSkillFile( fileName, GuiCheckGoldChar%a_index%, title, "사용" )		
		fSaveSkillFile( fileName, GuiGoldChar%a_index%, title, "케릭터" )
		
		guiControlGet,skillDelay,,GuiGoldSkillDelay%a_index%,text
		fSaveSkillFile( fileName, skillDelay, title, "스킬딜레이" )		
   		
		fSaveSkillFile( fileName, GuiSkill1GoldChar%a_index%, title, "1스킬사용" )
		guiControlGet, skillName,,GuiSkill1GoldChar%a_index%,text
		fSaveSkillFile( fileName, skillName, title, "1스킬이름" )
		
		fSaveSkillFile( fileName, GuiSkill2GoldChar%a_index%, title, "2스킬사용" )   
		guiControlGet,skillName,,GuiSkill2GoldChar%a_index%,text
		fSaveSkillFile( fileName, skillName, title, "2스킬이름" )
   }	
   return
}

LoadSkillConfig:
{
     
   
   
	IfNotExist, Logs
	{
		FileCreateDir, Logs
	}
   	guiControlGet, fileName,,GuiSkillFiles
    fileName=%fileName%.ini
    
   fLoadSkillFile( fileName, vValue, "자동스킬", "모험자동스킬")
   if( vValue <> "" ){	
		GuiControl,,GuiAdvantureAutoSkill,%vValue%	
        
		if( vValue = true )
			advantureSkillGuiEnable( true )
      else 
         advantureSkillGuiEnable( false )
	}
    fLoadSkillFile( fileName, vValue, "자동스킬", "모험자동스킬Off")
	if( vValue <> "" )
		GuiControl,,GuiAutoSkillOff,%vValue%	
   
   
	fLoadSkillFile( fileName, vValue, "자동스킬", "황금방자동스킬" )
   if( vValue <> "" ){	
		GuiControl,,GuiGoldRoomAutoSkill,%vValue%	
		if( vValue = true )
			GoldRoomSkillGuiEnable( true )
      else 
         GoldRoomSkillGuiEnable( false )
	}
   
    fLoadSkillFile( fileName, vValue, "딜레이", "검색주기")
	if( vValue <> "" )
		GuiControl,,GuiDelayForSearch,%vValue%	
   fLoadSkillFile( fileName, vValue, "딜레이", "검색제한")
	if( vValue <> "" )
		GuiControl,,GuiSearchLimit,%vValue%	
	   
   	Loop, 6
	{
		title=모험%a_index%번스킬
		fLoadSkillFile( fileName, vValue, title, "사용")
		if( vValue <> "" )
			GuiControl, ,GuiChar%a_index%Check,%vValue%	
		fLoadSkillFile( fileName, vValue, title, "스킬딜레이")
		if( vValue <> "" )
			GuiControl, ,GuiChar%a_index%SkillDelay,%vValue%
		fLoadSkillFile( fileName, vValue, title, "케릭터")
		if( vValue <> "" )
			GuiControl, Choose ,GuiChar%a_index%,%vValue%
		fLoadSkillFile( fileName, vValue, title, "1스킬사용")
		if( vValue <> "" )
			GuiControl, ,GuiChar%a_index%Skill1,%vValue%
      fLoadSkillFile( fileName, vValue, title, "1스킬이름")
	  if( vValue <> "" )
			GuiControl, ,GuiChar%a_index%Skill1,%vValue%
      
      fLoadSkillFile( fileName, vValue, title, "2스킬사용")
	  if( vValue <> "" )
			GuiControl,,GuiChar%a_index%Skill2,%vValue%
      fLoadSkillFile( fileName, vValue, title, "2스킬이름")
	  if( vValue <> "" )
			GuiControl, ,GuiChar%a_index%Skill2,%vValue%
   }
   
   	Loop, 3
	{
		title=황금%a_index%번스킬
		fLoadSkillFile( fileName, vValue, title, "사용")
		if( vValue <> "" )
			GuiControl, ,GuiCheckGoldChar%a_index%,%vValue%				
		fLoadSkillFile( fileName, vValue, title, "스킬딜레이")
		if( vValue <> "" )
			GuiControl, ,GuiGoldSkillDelay%a_index%,%vValue%			
		fLoadSkillFile( fileName, vValue, title, "케릭터")
		if( vValue <> "" )
			GuiControl, Choose ,GuiGoldChar%a_index%,%vValue%
				
		
		fLoadSkillFile( fileName, vValue, title, "1스킬사용")
		if( vValue <> "" )
			GuiControl, ,GuiSkill1GoldChar%a_index%,%vValue%
		
		fLoadSkillFile( fileName, vValue, title, "1스킬이름")
		if( vValue <> "" )
			GuiControl, ,GuiSkill1GoldChar%a_index%,%vValue%
      
      fLoadSkillFile( fileName, vValue, title, "2스킬사용")
	  if( vValue <> "" )
			GuiControl,,GuiSkill2GoldChar%a_index%,%vValue%
      fLoadSkillFile( fileName, vValue, title, "2스킬이름")
	  if( vValue <> "" )
			GuiControl, ,GuiSkill2GoldChar%a_index%,%vValue%
   } 
   return
}

fSaveSkillFile( vFileName,   vValue, vTitle, vKey  ){
	IniWrite, %vValue%,  %A_ScriptDir%\Config\Skill\%vFileName%.ini, %vTitle%, %vKey%
	return
}

fLoadSkillFile(vFileName,  ByRef value, vTitle, vKey ){
	IniRead, value, %A_ScriptDir%\Config\Skill\%vFileName% ,%vTitle%, %vKey%
	IfEqual value, ERROR
	{
			value:=""
	}
	return
}