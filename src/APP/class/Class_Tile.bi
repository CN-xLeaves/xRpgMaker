


' 修改这里会造成文件格式不兼容，如无必要尽量不要修改
#Define MAX_FILENAME		64					' 文件名最大长度



' 图块属性
Type xRpgMaker_TileInfo Field = 1
	WalkFlag As UByte				' 通行标记 [8bit代表8个方向]
	Priority As UByte				' 优先级
	CoverFoot As UByte				' 草木繁茂处
	TileFlag As UByte				' 地形标志
End Type



' 图块集
Type xRpgMaker_TileSet
	TileSetName As ZString * MAX_FILENAME				' 图块集名称
	TileSetFile As ZString * MAX_FILENAME				' 地图元件文件
	AutoTileFile(14) As ZString * MAX_FILENAME			' 自动元件文件
	AutoTileInfo(14) As xRpgMaker_TileInfo				' 自动元件信息
	BackGroundFile As ZString * MAX_FILENAME			' 全景文件
	FogFile As ZString * MAX_FILENAME					' 雾文件
	BattleFile As ZString * MAX_FILENAME				' 战斗背景文件
End Type
