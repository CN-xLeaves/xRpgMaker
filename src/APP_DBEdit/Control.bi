'==================================================================================
	'�� ��Ϸ���̿�����
	'#-------------------------------------------------------------------------------
	'# ���� : ���������Ϸ���̺ͳ����л� , ��Ϸ�ĵ�һ����������������
	'# ˵�� : 
'==================================================================================



' ����ȫ����Դ
Function LoadRes() As Integer
	xge.Text.LoadFont(ExePath & "\ToolRes\simsun_12px_gb2312.xrf", 0)
	xge.Text.LoadFont(ExePath & "\ToolRes\simsun_16px_gb2312.xrf", 0)
	xRpgMaker_InitUI(9)
	Return -1
End Function



' �ͷ�ȫ����Դ
Sub FreeRes()
	xge.Text.RemoveFont(2)
	xge.Text.RemoveFont(1)
End Sub



' ��ʼ��Ӧ��
Function AppInit() As Integer
	' ��ʼ��XGE��Ϸ����
	If xge.Init(800, 600, XGE_INIT_WINDOW Or XGE_INIT_ALPHA, XGE_INIT_ALL, "xRpgMaker DataBase Edit") = FALSE Then
		MessageBox(0, "xywh Game Engine ��ʼ��ʧ�ܣ�", "xTank", MB_ICONERROR)
		Return 0
	EndIf
	' ������Ϸ��Դ
	If LoadRes() = FALSE Then
		MessageBox(0, "��Ϸ��Դ����ʧ�ܣ���ȷ����Ϸ�ͻ���������", "xRpgMaker DataBase Edit", MB_ICONERROR)
		Return 0
	EndIf
	xge.Scene.Cut(@A11_TileSet_Scene, 20)
End Function



' �ͷ�Ӧ����Դ
Sub AppUint()
	xge.Unit()
End Sub
