
if place_meeting(x,y,obj_mouse){
	draw_sprite_ext(spr_option,0,x,y,1,1,0,c_gray,1);
}
else{
	draw_self();	
}
if obj_tr_selector.selected == "not selected"{
	draw_text(x,y,option);
	if mouse_check_button_pressed(mb_left) and place_meeting(x,y,obj_mouse){
		init.job.tr = option;
		obj_tr_selector.selected = "selected";
	}
}
else{
	instance_destroy(id);
}