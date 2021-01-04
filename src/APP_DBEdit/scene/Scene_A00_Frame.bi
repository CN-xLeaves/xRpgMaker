


Dim Shared BtnCaption(10) As String * 4 = {"��ɫ", "ְҵ", "����", "��Ʒ", "����", "����", "����", "����", "״̬", "ͼ��", "ϵͳ"}
Dim Shared ScenesProc(10) As Any Ptr = {@A01_Player_Scene, @A02_Job_Scene, @A03_Skill_Scene, @A04_Goods_Scene, @A05_Weapon_Scene, @A06_Armor_Scene, @A07_Monster_Scene, @A08_Team_Scene, @A09_Buff_Scene, @A11_TileSet_Scene, @A13_System_Scene}



' ѡ���ť����¼�
Sub UI_Frame_TabBtn_OnCheck(ele As xui.Button Ptr)
	' ����ҳ�����ʾ״̬
	For i As Integer = 0 To 10
		UI_Frame_Page(i)->Visible = FALSE
	Next
	UI_Frame_Page(ele->TagInt)->Visible = TRUE
	' �л�����
	xge.Scene.Cut(ScenesProc(ele->TagInt), 40)
End Sub

' ���水ť���
Sub UI_Frame_Save_OnClick(ele As xui.Button Ptr, btn As Integer)
	SaveTileData()
End Sub

' �˳���ť���
Sub UI_Frame_Exit_OnClick(ele As xui.Button Ptr, btn As Integer)
	Dim iRet As Integer = MessageBox(xge.hWnd, "�˳����ݿ�༭�����ᶪʧ����δ��������ݣ��˳�ǰ�ȱ������ݿ���", "xRpgMaker DataBase Edit", MB_ICONQUESTION Or MB_YESNOCANCEL)
	Select Case iRet
		Case IDYES						' �ȱ������˳�
			SaveTileData()
			xge.Scene.StopAll()
		Case IDNO						' ֱ���˳�
			xge.Scene.StopAll()
		Case IDCANCEL					' ȡ����ɶҲ����
			
	End Select
End Sub



Sub xRpgMaker_InitUI(DefaultPage As Integer)
	' �����������ֿ��
	UI_Frame_Root = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, XUI_LAYOUT_T2B, "Frame_Root")
	UI_Frame_Layout_Tabs = xui.CreateElement(XUI_LAYOUT_RULER_PIXEL, 0, 0, 800,  24, XUI_LAYOUT_L2R, "Frame_Layout_Tabs")
	UI_Frame_Layout_Page = xui.CreateElement(XUI_LAYOUT_RULER_PIXEL, 0, 0, 800, 536, XUI_LAYOUT_L2R, "Frame_Layout_Page")
	UI_Frame_Layout_Btns = xui.CreateFrame(XUI_LAYOUT_RULER_PIXEL, 0, 0, 800,  40, XUI_LAYOUT_L2R, "", "Frame_Layout_Btns")
	UI_Frame_Layout_Btns->BackStyle.BorderColor = &HFFC0C0C0
	UI_Frame_Layout_Btns->BackStyle.FillColor = &HFFC0C0C0
	UI_Frame_Root->Childs.AddElement(UI_Frame_Layout_Tabs)
	UI_Frame_Root->Childs.AddElement(UI_Frame_Layout_Page)
	UI_Frame_Root->Childs.AddElement(UI_Frame_Layout_Btns)
	' ����ѡ���ť
	For i As Integer = 0 To 10
		UI_Frame_TabBtn(i) = xui.CreateRadioButton(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, BtnCaption(i), "Frame_TabBtn_" & BtnCaption(i))
		UI_Frame_TabBtn(i)->TagInt = i
		UI_Frame_TabBtn(i)->Event.OnCheck = Cast(Any Ptr, @UI_Frame_TabBtn_OnCheck)
		UI_Frame_Layout_Tabs->Childs.AddElement(UI_Frame_TabBtn(i))
	Next
	UI_Frame_TabBtn(DefaultPage)->Checked = TRUE
	' ����ѡ�ҳ��
	For i As Integer = 0 To 10
		UI_Frame_Page(i) = xui.CreateElement(XUI_LAYOUT_RULER_RATIO, 0, 0, 1, 1, XUI_LAYOUT_L2R, "Frame_Page_" & BtnCaption(i))
		UI_Frame_Page(i)->Visible = FALSE
		UI_Frame_Layout_Page->Childs.AddElement(UI_Frame_Page(i))
	Next
	UI_Frame_Page(DefaultPage)->Visible = TRUE
	' ����������˳���ť
	UI_Frame_Save = xui.CreateButton(XUI_LAYOUT_RULER_PIXEL, 624, 8, 80, 24, "�� ��", "Frame_Save")
	UI_Frame_Exit = xui.CreateButton(XUI_LAYOUT_RULER_PIXEL, 8, 8, 80, 24, "�� ��", "Frame_Exit")
	UI_Frame_Save->Event.OnClick = Cast(Any Ptr, @UI_Frame_Save_OnClick)
	UI_Frame_Exit->Event.OnClick = Cast(Any Ptr, @UI_Frame_Exit_OnClick)
	UI_Frame_Layout_Btns->Childs.AddElement(UI_Frame_Save)
	UI_Frame_Layout_Btns->Childs.AddElement(UI_Frame_Exit)
	' ��ʼ����ҳ��UI
	InitUI_A01_Player(UI_Frame_Page(0))
	InitUI_A02_Job(UI_Frame_Page(1))
	InitUI_A03_Skill(UI_Frame_Page(2))
	InitUI_A04_Goods(UI_Frame_Page(3))
	InitUI_A05_Weapon(UI_Frame_Page(4))
	InitUI_A06_Armor(UI_Frame_Page(5))
	InitUI_A07_Monster(UI_Frame_Page(6))
	InitUI_A08_Team(UI_Frame_Page(7))
	InitUI_A09_Buff(UI_Frame_Page(8))
	InitUI_A11_TileSet(UI_Frame_Page(9))
	InitUI_A13_System(UI_Frame_Page(10))
End Sub
