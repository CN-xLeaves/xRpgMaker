


' �޸����������ļ���ʽ�����ݣ����ޱ�Ҫ������Ҫ�޸�
#Define MAX_FILENAME		64					' �ļ�����󳤶�


Type xGame_Tile Field = 1
	img As xge.Surface Ptr		' ͼ��ͼ��
	x As UShort					' ����
	y As UShort
	w As UShort
	h As UShort
	
End Type

' �Զ�Ԫ��
Type xGame_AutoTile
	img As xge.Surface Ptr
	File As ZString * 60
End Type



' ͼ�鼯
Type xRpgMaker_TileSet
	TileSetName As ZString * MAX_FILENAME
	TileSetFile As ZString * MAX_FILENAME
	AutoTileFile(6) As ZString * MAX_FILENAME
	BackGroundFile As ZString * MAX_FILENAME
	FogFile As ZString * MAX_FILENAME
	BattleFile As ZString * MAX_FILENAME
End Type



' ��ͼ��
Type xRpgMaker_Map
	TileSet_File As ZString * 60
	
End Type
