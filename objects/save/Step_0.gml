/// @description Save when clicked

var hotkey = keyboard_check(vk_control) and keyboard_check_pressed(ord("S"));

if (mouse_check_button_pressed(mb_left) && distance_to_point(mouse_x,mouse_y) <= 1) or hotkey {
	
	if os_get_config() == "HTML"{
		var file = -1;
		if file != "" {
			surface_set_target(control.surface);
			var tl = tool_line.lines
			var pxy = init.post_x_y;
			for( var i = 0; i < array_length(tl);i++){
				draw_line_width_color(tl[i,0],tl[i,1],tl[i,2],tl[i,3],control.width,tl[i,4],tl[i,4]);
			}
			for (var j = 0; j < array_length(pxy);j++){
				draw_sprite(spr_posts,pxy[j,2],pxy[j,0],pxy[j,1]);
			}
			surface_reset_target();
			surface_save_dialog(control.surface,"Drawing.png");
		}
	}	
	else{
		var file = get_save_filename("|Drawing|*.png","Drawing");
		if file != ""{
		surface_set_target(control.surface);
		var tl = tool_line.lines
		var pxy = init.post_x_y;
		for( var i = 0; i < array_length(tl);i++){
			draw_line_width_color(tl[i,0],tl[i,1],tl[i,2],tl[i,3],control.width,tl[i,4],tl[i,4]);
		}
		for (var j = 0; j < array_length(pxy);j++){
			draw_sprite(spr_posts,pxy[j,2],pxy[j,0],pxy[j,1]);
		}
		surface_reset_target();
		surface_copy(obackground.background,0,0,control.surface);
		surface_save(obackground.background,file);
		show_debug_message(working_directory)
		}
	}
		
}


//Change the image when mouse is on it
if distance_to_point(mouse_x,mouse_y)<=1 {
	image_index = 1;
}else{
	image_index = 0;
}

