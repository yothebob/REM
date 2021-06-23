if place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left){
	
	var item = variable_struct_get_names(init.parts_dict);
	var fname = get_save_filename("Comma Separated Values|*.csv","");
	var file = file_text_open_write(fname);
	var index = 1;
	var total = 0;
	
	file_text_write_string(file,"Part name,Quantity,Price,Part Total\n");
	for(var i = 0; i< array_length(item);i++){
		for(var ii = 0; ii < array_length(item);ii++){
			if (init.parts_dict[$ item[ii]].index == index and init.parts_dict[$ item[ii]].q > 0){
				file_text_write_string(file,init.parts_dict[$ item[ii]].name + ",");
				file_text_write_real(file,init.parts_dict[$ item[ii]].q);
				file_text_write_string(file,",");
				file_text_write_real(file, init.parts_dict[$ item[ii]].cost);
				file_text_write_string(file,",");
				file_text_write_real(file, init.parts_dict[$ item[ii]].cost * init.parts_dict[$ item[ii]].q);
				total += init.parts_dict[$ item[ii]].cost * init.parts_dict[$ item[ii]].q;
				file_text_write_string(file,"\n");
			}
		}
		index ++;
	}
	file_text_write_string(file,",,," + string(total));
	file_text_close(file);
}
