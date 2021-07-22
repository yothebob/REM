/// @description Description of tool
draw_self();
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
	draw_text(mouse_x-10,mouse_y+10,"Rectangle (Ctrl + R)");
}

if global.tool == tool.rectangle and holding == true{
	// draw rectangle in real time before you release the mouse
	draw_line_width(x1,y1,x1,y2,control.width);
	draw_line_width_color(x2,y2,x1,y2,control.width,color,color);
	draw_line_width_color(x1,y2,x1,y1,control.width,color,color);
	draw_line_width_color(x2,y1,x1,y1,control.width,color,color);
}

