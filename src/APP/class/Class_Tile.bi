


' �޸����������ļ���ʽ�����ݣ����ޱ�Ҫ������Ҫ�޸�
#Define MAX_FILENAME		64					' �ļ�����󳤶�



' ͼ������
Type xRpgMaker_TileInfo Field = 1
	WalkFlag As UByte				' ͨ�б�� [8bit����8������]
	Priority As UByte				' ���ȼ�
	CoverFoot As UByte				' ��ľ��ï��
	TileFlag As UByte				' ���α�־
End Type



' ͼ�鼯
Type xRpgMaker_TileSet
	TileSetName As ZString * MAX_FILENAME				' ͼ�鼯����
	TileSetFile As ZString * MAX_FILENAME				' ��ͼԪ���ļ�
	AutoTileFile(14) As ZString * MAX_FILENAME			' �Զ�Ԫ���ļ�
	AutoTileInfo(14) As xRpgMaker_TileInfo				' �Զ�Ԫ����Ϣ
	BackGroundFile As ZString * MAX_FILENAME			' ȫ���ļ�
	FogFile As ZString * MAX_FILENAME					' ���ļ�
	BattleFile As ZString * MAX_FILENAME				' ս�������ļ�
End Type
