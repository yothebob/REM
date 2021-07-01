if (place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left)){
	get_grid = show_question("Do you want grid snaping?");

	if get_grid{
		global.gridsize = 16;
	}

	else{
		global.gridsize = 1;
	}
	
	if show_question("Keep grid on?"){
		obj_grid.gridswitch = true;
	}else obj_grid.gridswitch = false;
}