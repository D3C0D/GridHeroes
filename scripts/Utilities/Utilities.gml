function animation_end(_sprite_index, _image_index)
{
	//returns true if the animation will loop this step.
	if (is_undefined(_sprite_index))
		_sprite_index = sprite_index;
		
	if (is_undefined(_image_index))
		_image_index = image_index;
		
	var _type=sprite_get_speed_type(sprite_index);
	var _spd=sprite_get_speed(sprite_index)*image_speed;
	if(_type == spritespeed_framespersecond)
	    _spd = _spd/room_speed;
	return _image_index + _spd >= sprite_get_number(_sprite_index);
}