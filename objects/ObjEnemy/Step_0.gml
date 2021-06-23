switch (enemy_state)
{
	case EnemyState.idle:
		StateIdle();
		break;
	case EnemyState.alert:
		StateAlert();
		break;
	case EnemyState.knockBack:
		StateKnockBack()
		break;
}

// Detect Death
if (enemy_health <= 0)
{
	instance_destroy();
}

// Sprite Management
ChangeDirection();
ChangeSprite();

// Reset Move
moveX = 0;
moveY = 0;
