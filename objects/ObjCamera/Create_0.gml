// Camera Variables
view_width = 256;
view_height = 144;
window_width = 1280;
window_height = 720;
camera_speed = 0.1;

obj_follow = ObjPlayer;

// Camera setup
window_set_size(window_width, window_height);
surface_resize(application_surface, window_width, window_height);
alarm[0] = 1;

// Camera Functions
function CenterCameraFollow()
{
	if (instance_exists(obj_follow))
	{
		var _x = clamp(obj_follow.x - view_width / 2, 0, room_width - view_width);	
		var _y = clamp(obj_follow.y - view_height / 2, 0, room_height - view_height);
	
		camera_set_view_pos(view, _x, _y);
	}
}