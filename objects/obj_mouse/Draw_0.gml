//draw_self();



if (drawline == true)
{
	if (mouse_check_button(mb_left))
		{
		release = false;
		draw_text(mouse_x +50 ,mouse_y + 50, string(((sqrt(abs(sqr(x-global.xstar) + sqr(y-global.ystar))))/global.scale)));
		}
	

draw_set_color(c_black);
if (drawline == false and mouse_check_button(mb_left))
	{
	xStart = x
	yStart = y
	draw_line(xStart,yStart,mouse_x,mouse_y);
	}

if (mouse_check_button_released(mb_left) and global.tool == tool.cable)
	{
	release = true;
	}
	
if (release == true and global.measurement > 1)
	{
	surface_set_target(control.surface);
	draw_set_color(c_black);
	if abs(xStart - mouse_x) < 100 and (yStart - mouse_y) < 0{
		draw_text( xStart + ((xStart - mouse_x)/2)+15,lerp(yStart,mouse_y,.5), string(global.measurement));
	}
	else if abs(xStart - mouse_x) < 100 and (yStart - mouse_y) > 0{
		draw_text( xStart + ((xStart - mouse_x)/2)-15,lerp(yStart,mouse_y,.5), string(global.measurement));
	}
	else if abs(yStart - mouse_y) < 100 and (xStart - mouse_x) < 0{
		draw_text( lerp(xStart,mouse_x,.5),lerp(yStart,mouse_y,.5)-25, string(global.measurement));
	}
	else {
		draw_text( lerp(xStart,mouse_x,.5),lerp(yStart,mouse_y,.5)+6, string(global.measurement));
	}
	surface_reset_target();
	release = false;
	}

if (drawline == true)
	{

		if (mouse_check_button(mb_left))
		{
		    if (!getStart)
		    {
		    getStart = true;
		    xStart = round(mouse_x/global.gridsize)*global.gridsize;
		    yStart = round(mouse_y/global.gridsize)*global.gridsize;
		    }

		draw_line(xStart,yStart,mouse_x,mouse_y);
		}
	
		else 
		{
		getStart = false;
		}
	}
}

