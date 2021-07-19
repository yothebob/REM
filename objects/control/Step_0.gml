
if (mouse_check_button(mb_left)) { mxp = mx; myp = my;}
else { mxp = mouse_x; myp = mouse_y; }
mx = mouse_x;
my = mouse_y;

// surface object dont forget to delete the buffer and surface when the game ends
if !surface_exists(surface){
	surface = surface_create(1920,1080);
}
