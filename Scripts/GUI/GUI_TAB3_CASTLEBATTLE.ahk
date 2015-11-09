INIT_TAB_CASTLEBATTLE:
{

     {
          Gui, Add, GroupBox,  x02 y030 w570 h160, ��ɻ��

          Gui, Add, Checkbox, x20 y50 w30 h15  vGuiWarChar1Check ,1.
          Gui, Add, DropDownList, x+0 yp-5 w80  gSelectWarChar1  vGuiWarChar1, ���ϸ�|����
          Gui, Add, Radio, x+10 yp+3 w110 h15 vGuiWarChar1Skill1, ����1
          Gui, Add, Radio, x+20 yp w110 h15 vGuiWarChar1Skill2, ����2

          Gui, Add, Checkbox, x20 y+8 w30 h15  vGuiWarChar2Check,2.
          Gui, Add, DropDownList, x+0 yp-5 w80  gSelectWarChar2 vGuiWarChar2, ���ϸ�|����
          Gui, Add, Radio, x+10 yp+3 w110 h15 vGuiWarChar2Skill1, ����1
          Gui, Add, Radio, x+20 yp w110 h15 vGuiWarChar2Skill2,����2

          Gui, Add, Checkbox, x20 y+8 w30 h15  vGuiWarChar3Check,3.
          Gui, Add, DropDownList,  x+0 yp-5 w80  gSelectWarChar3 vGuiWarChar3, ���ϸ�|����
          Gui, Add, Radio, x+10 yp+3 w110 h15 vGuiWarChar3Skill1, ����1
          Gui, Add, Radio, x+20 yp w110 h15 vGuiWarChar3Skill2, ����2

          Gui, Add, Checkbox, x20 y+8 w30 h15  vGuiWarChar4Check,4.
          Gui, Add, DropDownList, x+0 yp-5 w80  gSelectWarChar4  vGuiWarChar4, ���ϸ�|����
          Gui, Add, Radio, x+10 yp+3 w110 h15 vGuiWarChar4Skill1, ����1
          Gui, Add, Radio, x+20 yp w110 h15 vGuiWarChar4Skill2, ����2
          
          Gui, Add, Checkbox, x20 y+8 w30 h15  vGuiWarChar5Check,5.
          Gui, Add, DropDownList, x+0 yp-5 w80  gSelectWarChar5  vGuiWarChar5, ���ϸ�|����
          Gui, Add, Radio, x+10 yp+3 w110 h15 vGuiWarChar5Skill1, ����1
          Gui, Add, Radio, x+20 yp w110 h15 vGuiWarChar5Skill2, ����2
          
          Gui, Add, Checkbox, x20 y+8 w30 h15  vGuiWarChar6Check,6.
          Gui, Add, DropDownList, x+0 yp-5 w80  gSelectWarChar6  vGuiWarChar6, ���ϸ�|����
          Gui, Add, Radio, x+10 yp+3 w110 h15 vGuiWarChar6Skill1, ����1
          Gui, Add, Radio, x+20 yp w110 h15 vGuiWarChar6Skill2, ����2
               
          Gui, Add, DropDownList, x20 y+30 w90 Choose1 vGuiAutoSkillList, ������|���̵�    
          Gui, Add, Button, x+10 yp-5 w80 h30  , SAVE_SKILL
          Gui, Add, Button, x+10 yp w80 h30  , LOAD_SKILL
          
          Gui, Add, Button, x20 y+30 w100 h30  , SKILL_START
     }
return
}


SelectWarChar1:
{
	fUpdateGongsungGui(1)
	return
}
SelectWarChar2:
{
	fUpdateGongsungGui(2)
	return
}
SelectWarChar3:
{
	fUpdateGongsungGui(3)
	return
}
SelectWarChar4:
{
	fUpdateGongsungGui(4)
	return
}
SelectWarChar5:
{
	fUpdateGongsungGui(5)
	return
}
SelectWarChar6:
{
	fUpdateGongsungGui(6)
	return
}
fUpdateGongsungGui(  charNum ){
	guiControlGet, charName,,GuiWarChar%charNum%
	skillAfterIndex:="D."
	indexSkill=1
	Loop, %A_ScriptDir%\Resource\Image\10.��ų�̹���\%charName%\*.bmp
	{
		if A_LoopFileName not contains %skillAfterIndex%
		{
			StringReplace, skillName, A_LoopFileName, .bmp, , All
			GuiControl, ,GuiWarChar%charNum%Skill%indexSkill%,%skillName%
			indexSkill++
		}		
	}
	return	
}



SaveAutoSkillConfig:
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
	guiControlGet, fileName,,GuiAutoSkillList
		
	Loop, 5
	{
		title=%a_index%����ų
		funcSaveSkillFile( fileName, GuiWarChar%a_index%, title, "�ɸ���" )
   		funcSaveSkillFile( fileName, GuiWarChar%a_index%Check, title, "���" )
		funcSaveSkillFile( fileName, GuiWarChar%a_index%Skill1, title, "1��ų���" )
		guiControlGet, skillName,,GuiWarChar%a_index%Skill1,text
		funcSaveSkillFile( fileName, skillName, title, "1��ų�̸�" )
		
		funcSaveSkillFile( fileName, GuiWarChar%a_index%Skill2, title, "2��ų���" )   
		guiControlGet,skillName,,GuiWarChar%a_index%Skill2,text
		funcSaveSkillFile( fileName, skillName, title, "2��ų�̸�" )
   } 
   return
}

LoadAutoSkillConfig:
{
		IfNotExist, Logs
	{
		FileCreateDir, Logs
	}
   
   	guiControlGet, fileName,,GuiAutoSkillList
	
   	Loop, 6
	{
		title=%a_index%����ų
		funcLoadSkillFile( fileName, vValue, title, "���")
		if( vValue <> "" )
			GuiControl, ,GuiWarChar%a_index%Check,%vValue%	
		funcLoadSkillFile( fileName, vValue, title, "��ų������")
		if( vValue <> "" )
			GuiControl, ,GuiWarChar%a_index%SkillDelay,%vValue%
		funcLoadSkillFile( fileName, vValue, title, "�ɸ���")
		if( vValue <> "" )
			GuiControl, Choose ,GuiWarChar%a_index%,%vValue%
		funcLoadSkillFile( fileName, vValue, title, "1��ų���")
		if( vValue <> "" )
			GuiControl, ,GuiWarChar%a_index%Skill1,%vValue%
      funcLoadSkillFile( fileName, vValue, title, "1��ų�̸�")
	  if( vValue <> "" )
			GuiControl, ,GuiWarChar%a_index%Skill1,%vValue%
      
      funcLoadSkillFile( fileName, vValue, title, "2��ų���")
	  if( vValue <> "" )
			GuiControl,,GuiWarChar%a_index%Skill2,%vValue%
      funcLoadSkillFile( fileName, vValue, title, "2��ų�̸�")
	  if( vValue <> "" )
			GuiControl, ,GuiWarChar%a_index%Skill2,%vValue%
	  
	
   }
   return
}




funcSaveSkillFile( vFileName,   vValue, vTitle, vKey  ){
	IniWrite, %vValue%,  %A_ScriptDir%\Config\Skill\%vFileName%.ini, %vTitle%, %vKey%
	return
}

funcLoadSkillFile(vFileName,  ByRef value, vTitle, vKey ){
	IniRead, value, %A_ScriptDir%\Config\Skill\%vFileName% ,%vTitle%, %vKey%
	IfEqual value, ERROR
	{
			value:=""
	}
	return
}
