camera_set_view_size(view, view_width, view_height);
if (instance_exists(obj_follow))
{
	var _x = clamp(obj_follow.x - view_width / 2, 0, room_width - view_width);	
	var _y = clamp(obj_follow.y - view_height / 2, 0, room_height - view_height);
	
	var _cur_x = camera_get_view_x(view);
	var _cur_y = camera_get_view_y(view);
	
	camera_set_view_pos(view, lerp(_cur_x, _x, camera_speed), lerp(_cur_y, _y, camera_speed));
}

//Change to Fullscreen
if (keyboard_check_pressed(vk_f4))
	window_set_fullscreen(!window_get_fullscreen());
