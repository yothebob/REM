/// @description Execute Code
draw_self();

if place_meeting(x,y,obj_mouse){
	tick -= 1;
	image_index = 1;
}
else{
	tick = 10;
	image_index = 0;
}

if place_meeting(x,y,obj_mouse) and tick <= 0{
	draw_set_color(c_dkgrey);
	draw_text(mouse_x-10,mouse_y-10,"export as csv")
}