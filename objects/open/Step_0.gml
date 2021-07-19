/// @description Open a file when clicked

var hotkey = keyboard_check(vk_control) and keyboard_check_pressed(ord("O"));

if mouse_check_button_pressed(mb_left) && distance_to_point(mouse_x,mouse_y) <= 1 or hotkey {
	var file = get_open_filename("drawing|*.png", "");
	if file != "" {
		opened = true;
		opened_image = sprite_add(file,1,true,true,32,32);
		var xscale = 1980/sprite_get_width(opened_image);
		var yscale = 1080/sprite_get_height(opened_image);
		surface_set_target(control.surface);
		draw_sprite_ext(opened_image,0,32,32,xscale,yscale,0,c_white,1);
		surface_reset_target();
	}
}


//Change the image when mouse is on it
if distance_to_point(mouse_x,mouse_y)<=1 {
	image_index = 1;
}else{
	image_index = 0;
}