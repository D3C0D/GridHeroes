// keyboard Bindings
keyboard_attack = ord("Z");
keyboard_special = ord("X");
keyboard_change_up = vk_shift;
keyboard_change_down = vk_control;
keyboard_up = vk_up;
keyboard_down = vk_down;
keyboard_left = vk_left;
keyboard_right = vk_right;
// Gamepad Bindings
gamepad_attack = gp_face1;
gamepad_special = gp_face3;
gamepad_change_up = gp_shoulderl;
gamepad_change_down = gp_shoulderr;
gamepad_up = gp_padu;
gamepad_down = gp_padd;
gamepad_left = gp_padl;
gamepad_right = gp_padr;


// Check functions
function Attack(Pressed)
{
	if (Pressed)
	{
		return keyboard_check_pressed(keyboard_attack) or gamepad_button_check_pressed(global.current_gamepad, gamepad_attack);
	}
	else 
	{
		return keyboard_check(keyboard_attack) or gamepad_button_check(global.current_gamepad, gamepad_attack);
	}
}

function Special(Pressed)
{
	if (Pressed)
	{
		return keyboard_check_pressed(keyboard_special) or gamepad_button_check_pressed(global.current_gamepad, gamepad_special);
	}
	else
	{
		return keyboard_check(keyboard_special) or gamepad_button_check(global.current_gamepad, gamepad_special);
	}
}

function Change()
{
	return (keyboard_check_pressed(keyboard_change_up) - keyboard_check_pressed(keyboard_change_down)) or (gamepad_button_check_pressed(global.current_gamepad, gamepad_change_up) - gamepad_button_check_pressed(global.current_gamepad, gamepad_change_down));
}

function VerticalAxis(Pressed)
{
	if (Pressed)
	{
		return (keyboard_check_pressed(keyboard_down) - keyboard_check_pressed(keyboard_up))
		- (gamepad_button_check_pressed(global.current_gamepad, gamepad_up) - gamepad_button_check_pressed(global.current_gamepad, gamepad_down));
	}
	else 
	{
		return (keyboard_check(keyboard_down) - keyboard_check(keyboard_up))
		- (gamepad_button_check(global.current_gamepad, gamepad_up) - gamepad_button_check(global.current_gamepad, gamepad_down));
	}
}

function HorizontalAxis(Pressed)
{
	if (Pressed)
	{
		return (keyboard_check_pressed(keyboard_right) - keyboard_check_pressed(keyboard_left))
		- (gamepad_button_check_pressed(global.current_gamepad, gamepad_left) - gamepad_button_check_pressed(global.current_gamepad, gamepad_right));
	}
	else 
	{
		return (keyboard_check(keyboard_right) - keyboard_check(keyboard_left))
		- (gamepad_button_check(global.current_gamepad, gamepad_left) - gamepad_button_check(global.current_gamepad, gamepad_right));
	}
}