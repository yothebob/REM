x = mouse_x;
y = mouse_y;


if (global.tool == tool.line) or (global.tool == tool.cable)
{
drawline = true;
}
else 
{
drawline = false;
}

if (drawline == true)
{
	if(mouse_check_button_pressed(mb_left))
	{
	global.xstar = mouse_x;
	global.ystar = mouse_y;
	}
	if (mouse_check_button_released(mb_left))
	{
	global.xending = mouse_x;
	global.yending = mouse_y;

	global.measurement = point_distance(global.xstar,global.ystar,global.xending,global.yending);
	global.measurement = (round((global.measurement/global.scale)*2))/2;
	global.measurement = abs(global.measurement);
	if ii < 10 and global.tool == tool.cable  and global.measurement > .5
		{
		obj_smart_calc.tr[ii] = global.measurement;
		ii +=1;
		}

	}

global.drawx = mouse_x - global.xstar;
global.drawy = mouse_y - global.ystar;

}

