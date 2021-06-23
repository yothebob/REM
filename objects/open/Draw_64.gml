/// @description Description of tool
if os_get_config() = "Default"
{
draw_self();
}

if (place_meeting(x,y,obj_mouse))
{
tick = tick -1;
image_index = 1;
}
else
{
tick = 10;
image_index	= 0;
}
if tick <= 0 and place_meeting(x,y, obj_mouse)
{
	
	draw_set_color(c_dkgray);
	draw_text(mouse_x-10,mouse_y+10, "Open (Ctrl + O)");
}
