function check_parts_list(_dict) {
	
	var dict = variable_struct_get_names(_dict);
	
		for (var i = 0; i < array_length(dict); i++){
			if _dict[$ dict[i]].q > 0 and _dict[$ dict[i]].index != 71{
				return true;
			}
		}
		
}