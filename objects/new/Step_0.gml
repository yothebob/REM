/// @description New file/Start from 0

var hotkey = keyboard_check(vk_control) and keyboard_check_pressed(ord("N"));

if (mouse_check_button_pressed(mb_left) && distance_to_point(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)) <= 1) or hotkey {
	if show_question("Are you sure to start a new drawing?") {
		with(control) {
			surface_set_target(surface);
			draw_clear_alpha(c_black,0);
			surface_reset_target();
			game_restart();
		}
	}
}

//Change the image when mouse is on it
if distance_to_point(mouse_x,mouse_y)<=1 {
	image_index = 1;
}else{
	image_index = 0;
}