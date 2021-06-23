/// @description Select the tool

var hotkey = keyboard_check(vk_control) and keyboard_check_pressed(ord("E"));

if mouse_check_button_pressed(mb_left) and distance_to_point(mouse_x,mouse_y) <= 1 or hotkey
{
global.tool = tool.eraser;
}

if global.tool = tool.eraser {
	//Set the cursor sprite
	window_set_cursor(cr_default);
	
	//Set the eraser width automatically to 10
	if set = false {
		set = true;
		control.width = 10;
	}
}

//Change the image when the tool is selected
if global.tool = tool.eraser || distance_to_point(mouse_x,mouse_y)<=1 {
	image_index = 1;
}else{
	image_index = 0;
}

//When the tool is not selected, change the variable
if global.tool != tool.eraser {
	set = false;
}