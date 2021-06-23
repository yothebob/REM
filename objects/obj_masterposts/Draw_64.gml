
draw_self();
draw_set_color(c_dkgray);
draw_set_halign(fa_center);

if place_meeting(x,y,obj_mouse){
	tick = tick -1;
}
else{
	tick = 10;
}
if tick <= 0 and place_meeting(x,y, obj_mouse){
	draw_set_color(c_dkgray);
	switch post_type{
	case "UD":
		draw_text(mouse_x-10,mouse_y+20,"Undrilled \npost");
		break;
	case "DT":
		draw_text(mouse_x-10,mouse_y+20,"Drilled Thru \npost");
		break;
	case "1S":
		draw_text(mouse_x-10,mouse_y+20,"One Side \npost");
		break;
	case "3S":
		draw_text(mouse_x-10,mouse_y+20,"Three Side \npost");
		break;
	case "90":
		draw_text(mouse_x-10,mouse_y+20,"90 Degree \npost");
		break;
	}
}
