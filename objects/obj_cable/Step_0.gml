
var hotkey = keyboard_check(vk_control) and keyboard_check(ord("M"));

if (mouse_check_button_pressed(mb_left) and distance_to_point(mouse_x,mouse_y)<= 1) or hotkey
{
global.tool = tool.cable;
}

if global.tool = tool.cable || distance_to_point(mouse_x,mouse_y)<=1 {
	image_index = 1;
}else{
	image_index = 0;
}




if (global.tool =! tool.cable)
{
	image_index = 0;
}