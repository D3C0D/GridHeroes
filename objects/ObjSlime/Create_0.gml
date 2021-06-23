// Inherit the parent event
event_inherited();

// Enemy Sprites
// Walk
enemy_sprite[EnemyState.idle][PlayerDirection.left]		= SprSlimeLeft;
enemy_sprite[EnemyState.idle][PlayerDirection.right]	= SprSlimeRight;
enemy_sprite[EnemyState.alert][PlayerDirection.left]	= SprSlimeLeft;
enemy_sprite[EnemyState.alert][PlayerDirection.right]	= SprSlimeRight;

