// Detect first gamepad
var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;) {
   if gamepad_is_connected(i) { 
	   global.current_gamepad = i;
	   break;
   }
}

/* Detect ps4 or xbox
if (global.current_gamepad >= 4) {
	global.controller_type = 0;	
} else {
	global.controller_type = 1;
}
*/


// Set Deadzone
gamepad_set_axis_deadzone(global.current_gamepad, 0.10);
