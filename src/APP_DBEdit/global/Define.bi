


' �ṹ�������ļ�ͷ [20Byte]
Type xRpgMaker_StructDB_Info
	HeadText As UInteger									' �ļ�ͷ [ &H01626473 = sdb1��1��ʾ�汾�� ]
	DataType As UInteger									' �������� [�����������������������]
	ItemCount As UInteger									' ��������
	ItemSize As UInteger									' ���ݴ�С
	Reserved As UInteger									' �����ģ���ʱû���õ�
End Type

#Define XRM_SDB_FILEHEAD			&H01626473				' xrmsdb ��ʽ�ļ�ͷ��֤��Ϣ

#Define XRM_SDB_TYPE_TILESET		1						' ͼ�鼯����



' ȫ��·��
Dim Shared G_Path_Data As ZString * MAX_PATH
Dim Shared G_Path_Tilesets As ZString * MAX_PATH



' ͼ��༭��Ԫ����ض���
Namespace xui
	
	' ͼ��༭��Ԫ����
	Type TileEdit Extends xui.ScrollView
		EditMode As Integer							' �༭ģʽ [0=��ͨ�С�1=8����ͨ�С�2=���ȼ���3=��ľ��ï����4=���α�־]
		
		TileSet As xRpgMaker_TileSet Ptr			' ͼ�鼯
		
		TileSetImage As xge.Surface Ptr				' ͼ�鼯ͼ�� [ԭͼ]
		AutoTileImage(14) As xge.Surface Ptr			' �Զ�Ԫ��ͼ��
		
		imgEdit As xge.Surface Ptr					' �༭ģʽ�µ�ͼ�� [��Ⱦ�����]
		
		' ʹ��ͼ�鼯����
		Declare Sub UseTileSet(ts As xRpgMaker_TileSet Ptr)
		
		' �ؽ��༭ģʽͼ��
		Declare Sub ReBuildEditImage()
		
	End Type
	
End Namespace



' ��ܲ���Ԫ��
Dim Shared As xui.Element Ptr UI_Frame_Root, UI_Frame_Layout_Tabs, UI_Frame_Layout_Page
Dim Shared As xui.Frame Ptr UI_Frame_Layout_Btns
Dim Shared As xui.Button Ptr UI_Frame_TabBtn(10)
Dim Shared As xui.Element Ptr UI_Frame_Page(10)
Dim Shared As xui.Button Ptr UI_Frame_Save, UI_Frame_Exit



' ��ɫ���沼��Ԫ��
Dim Shared As xui.Element Ptr UI_Player_LayoutList
Dim Shared As xui.Frame Ptr UI_Player_LayoutInfo

Dim Shared As xui.Label Ptr UI_Player_Title
Dim Shared As xui.Element Ptr UI_Player_List
Dim Shared As xui.Button Ptr UI_Player_SetMax



' ְҵ���沼��Ԫ��
Dim Shared As xui.Element Ptr UI_Job_LayoutList
Dim Shared As xui.Frame Ptr UI_Job_LayoutInfo

Dim Shared As xui.Label Ptr UI_Job_Title
Dim Shared As xui.Element Ptr UI_Job_List
Dim Shared As xui.Button Ptr UI_Job_SetMax



' ���ܽ��沼��Ԫ��
Dim Shared As xui.Element Ptr UI_Skill_LayoutList
Dim Shared As xui.Frame Ptr UI_Skill_LayoutInfo

Dim Shared As xui.Label Ptr UI_Skill_Title
Dim Shared As xui.Element Ptr UI_Skill_List
Dim Shared As xui.Button Ptr UI_Skill_SetMax



' ��Ʒ���沼��Ԫ��
Dim Shared As xui.Element Ptr UI_Goods_LayoutList
Dim Shared As xui.Frame Ptr UI_Goods_LayoutInfo

Dim Shared As xui.Label Ptr UI_Goods_Title
Dim Shared As xui.Element Ptr UI_Goods_List
Dim Shared As xui.Button Ptr UI_Goods_SetMax



' �������沼��Ԫ��
Dim Shared As xui.Element Ptr UI_Weapon_LayoutList
Dim Shared As xui.Frame Ptr UI_Weapon_LayoutInfo

Dim Shared As xui.Label Ptr UI_Weapon_Title
Dim Shared As xui.Element Ptr UI_Weapon_List
Dim Shared As xui.Button Ptr UI_Weapon_SetMax



' ���߽��沼��Ԫ��
Dim Shared As xui.Element Ptr UI_Armor_LayoutList
Dim Shared As xui.Frame Ptr UI_Armor_LayoutInfo

Dim Shared As xui.Label Ptr UI_Armor_Title
Dim Shared As xui.Element Ptr UI_Armor_List
Dim Shared As xui.Button Ptr UI_Armor_SetMax



' ������沼��Ԫ��
Dim Shared As xui.Element Ptr UI_Monster_LayoutList
Dim Shared As xui.Frame Ptr UI_Monster_LayoutInfo

Dim Shared As xui.Label Ptr UI_Monster_Title
Dim Shared As xui.Element Ptr UI_Monster_List
Dim Shared As xui.Button Ptr UI_Monster_SetMax



' �Ŷӽ��沼��Ԫ��
Dim Shared As xui.Element Ptr UI_Team_LayoutList
Dim Shared As xui.Frame Ptr UI_Team_LayoutInfo

Dim Shared As xui.Label Ptr UI_Team_Title
Dim Shared As xui.Element Ptr UI_Team_List
Dim Shared As xui.Button Ptr UI_Team_SetMax



' ״̬���沼��Ԫ��
Dim Shared As xui.Element Ptr UI_Buff_LayoutList
Dim Shared As xui.Frame Ptr UI_Buff_LayoutInfo

Dim Shared As xui.Label Ptr UI_Buff_Title
Dim Shared As xui.Element Ptr UI_Buff_List
Dim Shared As xui.Button Ptr UI_Buff_SetMax



' ͼ����沼��Ԫ��
Dim Shared As xui.Element Ptr UI_TileSet_LayoutList, UI_TileSet_Layout1, UI_TileSet_Layout2, UI_TileSet_Layout3
Dim Shared As xui.Frame Ptr UI_TileSet_LayoutInfo

Dim Shared As xui.Label Ptr UI_TileSet_Title
Dim Shared As xui.ListBox Ptr UI_TileSet_List
Dim Shared As xui.Button Ptr UI_TileSet_SetMax

Dim Shared As xui.Label Ptr UI_TileSet_Name_Label, UI_TileSet_File_Label, UI_TileSet_AutoTile_Label, UI_TileSet_Back_Label, UI_TileSet_Fog_Label, UI_TileSet_Battle_Label
Dim Shared As xui.Button Ptr UI_TileSet_Name, UI_TileSet_File, UI_TileSet_AutoTile(6), UI_TileSet_Back, UI_TileSet_Fog, UI_TileSet_Battle
Dim Shared As xui.Element Ptr UI_TileSet_Layout1_Space

Dim Shared As xui.TileEdit Ptr UI_TileSet_TileEdit

Dim Shared As xui.Button Ptr UI_TileSet_EditMode1, UI_TileSet_EditMode2, UI_TileSet_EditMode3, UI_TileSet_EditMode4, UI_TileSet_EditMode5, UI_TileSet_EditMode6
Dim Shared As xui.Element Ptr UI_TileSet_Layout3_Space



' ϵͳ���沼��Ԫ��




' ��������
Declare Sub UI_Frame_Exit_OnClick(ele As xui.Button Ptr, btn As Integer)


