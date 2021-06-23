// Macros
#macro view view_camera[0]
// Globals
global.current_gamepad = 0;
global.mana = 100;
global.max_mana = 100;
global.max_health = 8;

global.tile_size = 16;

// Enums
enum PlayerState 
{
	walk,
	hurt
}
enum PlayerDirection
{
	up,
	down,
	left,
	right
}
enum PlayerObject
{
	card
}

enum EnemyState
{
	idle,
	alert,
	knockBack
}

enum HitAxis
{
	vertical,
	horizontal
}