draw_self();

if place_meeting(x,y,obj_mouse){
	tick = tick -1;
}

else{
	tick = 10;
}

if tick <= 0 and place_meeting(x,y, obj_mouse){
	draw_set_color(c_dkgray);
	draw_text(mouse_x-50,mouse_y+10,"Deck \nMeasurements");
}
