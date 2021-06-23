// Player State Switcher
switch (player_state)
{
	case PlayerState.walk:
		StateWalk();
		break;
	case PlayerState.hurt:
		StateHurt();
		break;
}

// Sprite Management
ChangeDirection();
ChangeSprite();

// Reset Move
moveX = 0;
moveY = 0;