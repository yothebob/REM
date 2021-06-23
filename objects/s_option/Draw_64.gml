
if place_meeting(x,y,obj_mouse){
	draw_sprite_ext(spr_option,0,x,y,1,1,0,c_gray,1);
}
else{
	draw_self();	
}
if obj_scale.scale == "not selected"{
	draw_text(x,y,"1 box = " + string(scale_option) + "'");
	if mouse_check_button_pressed(mb_left) and place_meeting(x,y,obj_mouse){
		global.scale = 32/id.scale_option;
		obj_scale.scale = "selected";
	}
}
else{
	instance_destroy(id);
}