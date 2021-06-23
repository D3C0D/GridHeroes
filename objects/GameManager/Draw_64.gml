// Draw Mana Bar
//var _temp_mana = (global.mana / global.max_mana) * 100;
//draw_healthbar(mana_bar_x1, mana_bar_y1, mana_bar_x2, mana_bar_y2, _temp_mana, c_grey, c_blue, c_blue, 0, true, true);

// Draw Health Bar
var _xx = 0;
var _yy = 0;
var half_heart = health % 2;
var hearts_num = floor(health / 2);
for (var i = 1; i <= global.max_health; i++;)
{
	if (i <= hearts_num)
	{
		draw_sprite_ext(SprHealth, 0, _xx, _yy, 2, 2, 0, c_white, 1);
	}
	else if (i == hearts_num + 1 and half_heart)
	{
		draw_sprite_ext(SprHealth, 1, _xx, _yy, 2, 2, 0, c_white, 1);
	}
	else
	{		
		draw_sprite_ext(SprHealth, 2, _xx, _yy, 2, 2, 0, c_white, 1);
	}
	_xx += health_width;
	if (i == 12)
	{
		_yy += health_height;
		_xx = 0;
	}
}
