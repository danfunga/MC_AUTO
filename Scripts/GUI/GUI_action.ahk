BUTTON��������:
{
	fPrintTitle( "��������" )
	fPrintStatus( "���� ������ �����մϴ�." )
	gosub SaveConfig
	fPrintResult( "������ �����Ͽ����ϴ�." )
   MsgBox, ,,Main ������ �����Ͽ����ϴ�.,0.5
	return   
}
BUTTONSAVE:
{
   fPrintTitle( "��ų����" )
	fPrintStatus( "��ų ������ �����մϴ�." )
	gosub SaveSkillConfig
	guiControlGet, fileName,,GuiSkillFileName
	GuiControl,chooseString,GuiSkillFiles,%fileName%.ini
	
	fPrintResult( "��ų ������ �����Ͽ����ϴ�." )
	MsgBox, ,,SKill ������ �����Ͽ����ϴ�.,0.5   
   
   guiControlGet, tempString,,GuiSkillFileName
   fSaveFile(tempString,   "��ų����", "�����̸�" )
   
   funcGuiLoadConfigList(fileName)  
	return
}
BUTTONL:
{
	fPrintTitle( "���� �б�" )
	fPrintStatus( "���� �������� �ҷ��ɴϴ�." )
   
	gosub LoadConfig 
   fLoadConfig( GuiSkillFileName, false, "��ų����", "�����̸�" )
   guiControlGet, tempString,,GuiSkillFileName
   funcGuiLoadConfigList( tempString )
   
   gosub LoadSkillConfig
	MsgBox, ,,SKill(%configFileName%) ������ �ҷ��Խ��ϴ�..,0.5
	return
}
BUTTONLOAD:
{
	fPrintTitle( "��ų�ε�" )
	fPrintStatus( "��ų ������ �ҷ��ɴϴ�." )
	gosub LoadSkillConfig
	guiControlGet, fileName,,GuiSkillFiles	
	StringReplace,fileName,fileName,.ini
	GuiControl,,GuiSkillFileName,%filename%	
   fSaveFile(filename,   "��ų����", "�����̸�" )
   
   
	MsgBox, ,,SKill(%filename%) ������ �ҷ��Խ��ϴ�..,0.5
	return
}

checkExit(){
	global BoolWantToStop
	if ( BoolWantToStop = true ){		
		gosub StopPoint   
	}
}
StopPoint:
{
	fPrintTitle("��ũ������")
	fPrintStatus("��ũ�θ� �����մϴ�.")
	fPrintResult("��ũ�� ����")
	BoolStarted:=false
	BoolWantToStop:=false
	loop 4
	{
		funcChangeTab%a_index%Status()	
	}		
	exit
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
	GuiControl,, ����â ,%vStatus%
	fLog(vLog, boolIsDebug)
	return
}

fPrintResult( vStatus ){	
	vResult:= "         --> " . vStatus
	GuiControl,, ���â , [���] %vStatus%
	fLog(vResult)
	return
}

funcSelectChangeRule(  charNum ){
	guiControlGet, charName,,GuiChar%charNum%
	skillAfterIndex:="D."
	indexSkill=1
	Loop, %A_ScriptDir%\Resource\Image\10.��ų�̹���\%charName%\*.bmp
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



