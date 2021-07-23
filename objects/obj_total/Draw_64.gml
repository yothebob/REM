

if (global.totalslider == true){
	// if slider is open
	
		
		draw_set_halign(fa_left);
		var o = 150;
		var key = variable_struct_get_names(init.parts_dict);
		//var index_array[array_length(key)] = "";
		var index_array = array_create(array_length(key),"");
		
		// loop through dictionary, each iteration check if part quanity is < 1, then draw to screen
		for(var ii = 0;ii < array_length(key); ii++){
			if init.parts_dict[$ key[ii]].q > 0{
				index_array[init.parts_dict[$ key[ii]].index] = [init.parts_dict[$ key[ii]].q,x+o,70,init.parts_dict[$ key[ii]].name + " : "];
			}
		}
		var spacing = 0;
		for (var i = 0; i < array_length(index_array); i++){
			if index_array[i] != ""{
				draw_part_total(index_array[i,0],index_array[i,1],index_array[i,2] + (spacing * 34.5),index_array[i,3]);
				spacing ++;
			}
		}
		draw_set_halign(fa_center);
}