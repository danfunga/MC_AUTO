2BUTTON설정저장:
{
	fPrintTitle( "설정저장" )
	fPrintStatus( "설정 파일을 저장합니다." )
	gosub SaveConfig
   
   guiControlGet, fileName,,GuiConfigFiles  
   mainConfig.saveValue("설정파일", "파일이름", fileName )
   
	fPrintResult( "설정을 적용하였습니다." )
   MsgBox, ,,Main 설정을 저장하였습니다.,0.5
	return   
}
2BUTTONSAVE:
{
   fPrintTitle( "스킬저장" )
	fPrintStatus( "스킬 파일을 저장합니다." )
   
   
	gosub SaveSkillConfig
	guiControlGet, fileName,,GuiSkillFileName
	GuiControl,chooseString,GuiSkillFiles,%fileName%.ini
   
	fPrintResult( "스킬 설정을 적용하였습니다." )
	MsgBox, ,,SKill 설정을 저장하였습니다.,0.5   
   
   guiControlGet, tempString,,GuiSkillFileName
   fSaveFile(tempString,   "스킬파일", "파일이름" )
   
   funcGuiLoadConfigList(fileName)  
	return
}
2BUTTON불러오기:
{
	fPrintTitle( "설정 읽기" )
	fPrintStatus( "설정 파일을을 불러옵니다." )
   
   guiControlGet, tempFileName,,GuiConfigFiles
   mainConfig.saveValue("설정파일", "파일이름", tempFileName )

	gosub LoadConfig 
   
   fLoadConfig( GuiSkillFileName, false, "스킬파일", "파일이름" )
   guiControlGet, tempString,,GuiSkillFileName
   funcGuiLoadConfigList( tempString )
   
   gosub LoadSkillConfig
	MsgBox, ,,SKill(%configFileName%) 설정을 불러왔습니다..,0.5
	return
}
2BUTTONLOAD:
{
	fPrintTitle( "스킬로드" )
	fPrintStatus( "스킬 파일을 불러옵니다." )
	gosub LoadSkillConfig
	guiControlGet, fileName,,GuiSkillFiles	
	StringReplace,fileName,fileName,.ini
	GuiControl,,GuiSkillFileName,%filename%	
   fSaveFile(filename,   "스킬파일", "파일이름" )
   
   
	MsgBox, ,,SKill(%filename%) 설정을 불러왔습니다..,0.5
	return
}


fPrintTitle( vTitle ){
	GuiControl,, BottomTitle ,%vTitle%
	return
}
funcPrintSubTitle( string ){
	GuiControl,, SubTitle ,%string%
	return
}

fPrintStatus( vStatus , boolIsDebug=false){
	guiControlGet, vLog,,BottomTitle	
	vLog= [%vLog%] %vStatus%
	GuiControl,, 상태창 ,%vStatus%
	fLog(vLog, boolIsDebug)
	return
}

fPrintResult( vStatus ){	
	vResult:= "         --> " . vStatus
	GuiControl,, 결과창 , [결과] %vStatus%
	fLog(vResult)
	return
}

funcSelectChangeRule(  charNum ){
	guiControlGet, charName,,GuiChar%charNum%
	skillAfterIndex:="D."
	indexSkill=1
	Loop, %A_ScriptDir%\Resource\Image\10.스킬이미지\%charName%\*.bmp
	{
		if A_LoopFileName not contains %skillAfterIndex%
		{
			StringReplace, skillName, A_LoopFileName, .bmp, , All
			GuiControl, ,GuiChar%charNum%Skill%indexSkill%,%skillName%
			indexSkill++
		}		
	}
	return	
}



