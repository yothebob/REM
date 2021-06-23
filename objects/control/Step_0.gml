/// @description Draw always to mouse position


if mouse_check_button_released(mb_left) and surface_exists(surface) and os_get_config() == "Default"
	{
	surface_set_target(surface);
	buffer_delete(buffer);
	buffer = buffer_create(1920*1080*4,buffer_grow,1);
	buffer_get_surface(buffer,surface,0);
	surface_reset_target();
	}

if (mouse_check_button(mb_left)) { mxp = mx; myp = my;}
else { mxp = mouse_x; myp = mouse_y; }
mx = mouse_x;
my = mouse_y;

// surface object dont forget to delete the buffer and surface when the game ends
if !surface_exists(surface)
{
	if buffer_exists(buffer)
	{
	surface = surface_create(1920,1080);
	surface_set_target(surface);
	buffer_set_surface(buffer,surface,0);
	surface_reset_target();
	}
	else
{
surface = surface_create(1920,1080);
}
}
