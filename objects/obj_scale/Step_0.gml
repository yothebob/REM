/// @description Execute Code
if place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left) and scale == "not selected"{
	scale = "selected";
}

else if place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left){
	scale = "not selected";
	for(var i=0; i<4;i++){
		with(instance_create_depth(x+50,y + (i*31) + 16,-10000,s_option)){
			scale_option = obj_scale.scales[i];
		}
	}
}
