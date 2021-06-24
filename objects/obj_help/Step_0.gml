
var hotkey = keyboard_check(vk_f1);

if(place_meeting(x,y,obj_mouse))
{
image_index = 1;
}
else
{
image_index = 0;
}

if place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left) or hotkey
{
	if link = 0
	{
	url_open("https://www.youtube.com/");
	}
	if link = 1
	{
	url_open(working_directory + "index.html");
	}
}