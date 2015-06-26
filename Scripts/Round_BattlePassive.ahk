수동전투시작:
{	
	Gui, Submit, NoHide
	fPrintTitle("수동   전투")
	fPrintStatus("설정한 스킬을 사용합니다.")	
	Loop, 6
	{ 
		if( GuiChar%a_index%Check = true ) {		
			strCharName:=GuiChar%a_index%
			if( GuiChar%a_index%Skill1 = true ){
				guiControlGet, skillName,,GuiChar%a_index%Skill1,text
			}else if (  GuiChar%a_index%Skill2 = true ){
				guiControlGet, skillName,,GuiChar%a_index%Skill2,text
			}else{
				fPrintStatus("두 스킬 모두 사용하지 않음으로 설정되어 있습니다.")
				continue
			}
			funcWaitingBeforeSkill( a_index )
	
			skillFolder=10.스킬이미지\%strCharName%\%skillName%
			delayFolder=10.스킬이미지\%strCharName%\%skillName%\delay
		
			vStatus=%a_index%번 스킬로 %strCharName%의 %skillName%(을)를 사용합니다.				
			fPrintStatus(vStatus)			
			funcUsingSkillAndWaitDelay( skillFolder, delayFolder, skillName)  
			
		}else{
			vStatus=%a_index%번 스킬은 설정되지 않았습니다.		
			fPrintStatus(vStatus)
		}	
   }
    fPrintStatus("스킬 사용을 종료합니다.")
   goto 전투중_모험_결과대기
	return
}
funcUsingSkillAndWaitDelay( skillFolder, delayFolder, skillName)
{
	global GuiDelayForSearch
	global GuiSearchLimit

	vStatus= 스킬(%skillName%)을 사용합니다.				
	fPrintStatus(vStatus)
	if( funcWaitAndClickImg( skillFolder ) = true  ){
		vStatus= 스킬(%skillName%) 사용을 기다립니다.
		fPrintStatus(vStatus)
		if( funcWaitAndReturn( delayFolder ) = true ){
			vStatus= 스킬(%skillName%) 사용을 확인했습니다.
			fPrintStatus(vStatus)
			return true
		}else{
			vStatus= ERROR_스킬(%skillName%)이 사용되지 않습니다. 제한( %GuiDelayForSearch%초 %GuiSearchLimit%회)을 넘어 무시됩니다.
			fPrintStatus(vStatus)
			return false
		}
	}else{
			vStatus= 스킬(%skillName%)를 찾지 못하였습니다.( %GuiDelayForSearch%초 %GuiSearchLimit%회 간 확인 )
			fPrintStatus(vStatus)
	}
	return false
}

