������������:
{	
	Gui, Submit, NoHide
	fPrintTitle("����   ����")
	fPrintStatus("������ ��ų�� ����մϴ�.")	
	Loop, 6
	{ 
		if( GuiChar%a_index%Check = true ) {		
			strCharName:=GuiChar%a_index%
			if( GuiChar%a_index%Skill1 = true ){
				guiControlGet, skillName,,GuiChar%a_index%Skill1,text
			}else if (  GuiChar%a_index%Skill2 = true ){
				guiControlGet, skillName,,GuiChar%a_index%Skill2,text
			}else{
				fPrintStatus("�� ��ų ��� ������� �������� �����Ǿ� �ֽ��ϴ�.")
				continue
			}
			funcWaitingBeforeSkill( a_index )
	
			skillFolder=10.��ų�̹���\%strCharName%\%skillName%
			delayFolder=10.��ų�̹���\%strCharName%\%skillName%\delay
		
			vStatus=%a_index%�� ��ų�� %strCharName%�� %skillName%(��)�� ����մϴ�.				
			fPrintStatus(vStatus)			
			funcUsingSkillAndWaitDelay( skillFolder, delayFolder, skillName)  
			
		}else{
			vStatus=%a_index%�� ��ų�� �������� �ʾҽ��ϴ�.		
			fPrintStatus(vStatus)
		}	
   }
    fPrintStatus("��ų ����� �����մϴ�.")
   goto ������_����_������
	return
}
funcUsingSkillAndWaitDelay( skillFolder, delayFolder, skillName)
{
	global GuiDelayForSearch
	global GuiSearchLimit

	vStatus= ��ų(%skillName%)�� ����մϴ�.				
	fPrintStatus(vStatus)
	if( funcWaitAndClickImg( skillFolder ) = true  ){
		vStatus= ��ų(%skillName%) ����� ��ٸ��ϴ�.
		fPrintStatus(vStatus)
		if( funcWaitAndReturn( delayFolder ) = true ){
			vStatus= ��ų(%skillName%) ����� Ȯ���߽��ϴ�.
			fPrintStatus(vStatus)
			return true
		}else{
			vStatus= ERROR_��ų(%skillName%)�� ������ �ʽ��ϴ�. ����( %GuiDelayForSearch%�� %GuiSearchLimit%ȸ)�� �Ѿ� ���õ˴ϴ�.
			fPrintStatus(vStatus)
			return false
		}
	}else{
			vStatus= ��ų(%skillName%)�� ã�� ���Ͽ����ϴ�.( %GuiDelayForSearch%�� %GuiSearchLimit%ȸ �� Ȯ�� )
			fPrintStatus(vStatus)
	}
	return false
}

