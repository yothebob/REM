/// @description make grid
if gridswitch{
	draw_set_color(c_teal);

// draw vertical

	for (var i = v_line; i >= 0; i -=1)
	{
	draw_line(grid * i,0,grid * i,room_length);
	}

	// draw horizontial

	for (var j = h_line; j >= 0; j -= 1)
	{
	draw_line(0,grid*j,room_length,grid*j);
	}
}
draw_set_color(c_black);