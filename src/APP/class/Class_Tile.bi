


' 修改这里会造成文件格式不兼容，如无必要尽量不要修改
#Define MAX_FILENAME		64					' 文件名最大长度


Type xGame_Tile Field = 1
	img As xge.Surface Ptr		' 图块图像
	x As UShort					' 坐标
	y As UShort
	w As UShort
	h As UShort
	
End Type

' 自动元件
Type xGame_AutoTile
	img As xge.Surface Ptr
	File As ZString * 60
End Type



' 图块集
Type xRpgMaker_TileSet
	TileSetName As ZString * MAX_FILENAME
	TileSetFile As ZString * MAX_FILENAME
	AutoTileFile(6) As ZString * MAX_FILENAME
	BackGroundFile As ZString * MAX_FILENAME
	FogFile As ZString * MAX_FILENAME
	BattleFile As ZString * MAX_FILENAME
End Type



' 地图类
Type xRpgMaker_Map
	TileSet_File As ZString * 60
	
End Type
