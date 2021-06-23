// Player Sprites
// Walk
player_sprite[PlayerState.walk][PlayerDirection.left]	= SprPlayerLeft;
player_sprite[PlayerState.walk][PlayerDirection.right]	= SprPlayerRight;
// Hurt
player_sprite[PlayerState.hurt][PlayerDirection.left]	= SprPlayerLeftHurt;
player_sprite[PlayerState.hurt][PlayerDirection.right]	= SprPlayerRightHurt;

// Player Variables
player_state = PlayerState.walk;
player_direction = PlayerDirection.right;
can_hurt = true;
inv_timer = room_speed;
step_size = 16;
moveX = 0;
moveY = 0;

// Player Gameplay Variables
health = 7;
global.mana = 100;

// Player Functions
function MoveAndColide()
{
	// Calculate MovDirection
	var x_axis = Input.HorizontalAxis(true);
	var y_axis = Input.VerticalAxis(true);
	
	if (x_axis != 0)
	{
		GameManager.ChangeTurn();
		moveX = x_axis * step_size;
		// Check Collision
		if (place_empty(x + moveX, y, ObjCollision))
		{
			// Move Player
			x += moveX;
		}
		else
		{
			var _temp_enemy = instance_place(x + moveX, y, ObjEnemy);
			with (_temp_enemy) { enemy_state = EnemyState.knockBack; enemy_health--; }
		}
	}
	else if (y_axis != 0)
	{
		GameManager.ChangeTurn();
		moveY = y_axis * step_size;
		// Check Collision
		if (place_empty(x, y + moveY, ObjCollision))
		{
			// Move Player
			y += moveY;
		}
		else
		{
			var _temp_enemy = instance_place(x, y + moveY, ObjEnemy);
			with (_temp_enemy) { enemy_state = EnemyState.knockBack; enemy_health--; }
		}
	}
}

function ChangeDirection()
{
	if (moveX < 0)
	{
		player_direction = PlayerDirection.left;
	} 
	else if (moveX > 0)
	{
		player_direction = PlayerDirection.right;
	}
}

function ChangeSprite() 
{
	sprite_index = player_sprite[player_state][player_direction];
}

// Player States
function StateWalk()
{
	MoveAndColide();
	// Check For input
}

function StateHurt()
{
	MoveAndColide();
	if (can_hurt)
	{
		health--;
		show_debug_message(health);
		alarm[0] = inv_timer;
		can_hurt = false;
	}
}