// Enemy Sprites
// Walk
enemy_sprite[EnemyState.idle][PlayerDirection.left]		= noone;
enemy_sprite[EnemyState.idle][PlayerDirection.right]	= noone;
enemy_sprite[EnemyState.alert][PlayerDirection.left]	= noone;
enemy_sprite[EnemyState.alert][PlayerDirection.right]	= noone;

// Enemy Variables
enemy_health = 2;
enemy_state = EnemyState.idle;
enemy_direction = PlayerDirection.left;
enemy_detection = 40;
step_size = 16;
moveX = 0;
moveY = 0;

// Enemy Functions
function MoveAndColide(x_axis, y_axis)
{
	moveX = x_axis * step_size;
	moveY = y_axis * step_size;
	
	var _player_check = max(instance_place(x + moveX, y, ObjPlayer), instance_place(x, y + moveY, ObjPlayer));
	
	// Check collision
	if (x_axis != 0 and place_empty(x + moveX, y, ObjCollision))
	{		
		// Move Enemy
		x += moveX;		
	}
	else if (y_axis != 0 and place_empty(x, y + moveY, ObjCollision))
	{
		// Move Enemy
		y += moveY;
	}
	else if (_player_check != noone)
	{
		with (_player_check) { player_state = PlayerState.hurt; }
	}
}

function ChangeDirection()
{
	if (moveX < 0)
	{
		enemy_direction = PlayerDirection.left;
	} 
	else if (moveX > 0)
	{
		enemy_direction = PlayerDirection.right;
	}
}

function ChangeSprite() 
{
	var _temp_sprite = enemy_sprite[enemy_state][enemy_direction];
	if (_temp_sprite != noone)
	{
		sprite_index = enemy_sprite[enemy_state][enemy_direction];
	}
}

// enemy States
function StateIdle()
{
	if (point_in_circle(ObjPlayer.x, ObjPlayer.y, x, y, enemy_detection)) 
	{
		enemy_state = EnemyState.alert;
	}
}

function StateAlert()
{
	if (GameManager.can_move) 
	{
		if (ObjPlayer.x == x)
		{
			var _target_x = 0;
		}
		else 
		{
			var _target_x = sign(ObjPlayer.x - x);
		}
		if (ObjPlayer.y == y)
		{
			var _target_y = 0;
		}
		else 
		{
			var _target_y = sign(ObjPlayer.y - y);
		}
		MoveAndColide(_target_x, _target_y);
	}
	if (!point_in_circle(ObjPlayer.x, ObjPlayer.y, x, y, enemy_detection)) 
	{
		enemy_state = EnemyState.idle;
	}
}

function StateKnockBack()
{
	if (ObjPlayer.x == x)
	{
		var _target_x = 0;
	}
	else 
	{
		var _target_x = -sign(ObjPlayer.x - x);
	}
	if (ObjPlayer.y == y)
	{
		var _target_y = 0;
	}
	else 
	{
		var _target_y = -sign(ObjPlayer.y - y);
	}
	MoveAndColide(_target_x, _target_y);
	enemy_state = EnemyState.idle;
}