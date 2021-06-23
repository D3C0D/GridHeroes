if (!is_undefined(throw_direction))
{
	switch (throw_direction)
	{
		case PlayerDirection.down:
			direction = 270;
			image_angle = 270;
			break;
		case PlayerDirection.left:
			direction = 0;
			image_angle = 0;
			break;
		case PlayerDirection.right:
			direction = 180;
			image_angle = 180;
			break;
		case PlayerDirection.up:
			direction = 90;
			image_angle = 90;
			break;
	}
}

if (place_meeting(x, y, ObjCollision))
{
	instance_destroy();
}
