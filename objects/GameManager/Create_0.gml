mana_bar_x1 = 0 + 10;
mana_bar_y1 = 0 + 10;
mana_bar_x2 = 300 + 10;
mana_bar_y2 = 50 + 10;

// Game UI variables
health_width = 32;
health_height = 32;


// Game logic variables
can_move = false;
turn_num = 0;

// Game logic functions
function ChangeTurn()
{
	can_move = true;
	turn_num++;
}
