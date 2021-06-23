if place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left) and selected == "not selected"{
	selected = "selected";	
}

else if place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left){
	selected = "not selected";
	for(var i = 0; i< 3; i++){
		with(instance_create_depth(x+50,y + (i*32) + 16,-10000,tr_option)){
			option = obj_tr_selector.tr_array[i];
		}
	}
}

