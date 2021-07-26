
function erase_drawn_item(init_list,tool_list){
// generic function to erase last done thing 
	if array_length(tool_list) >= 1{
		if init_list[array_length(init_list)-1] == "POST"{
			instance_destroy(instance_position(tool_list[array_length(tool_list)-1,0],tool_list[array_length(tool_list)-1,1],obj_post));
			array_delete(tool_list,array_length(tool_list)-1,1);
			array_delete(init_list,array_length(init_list)-1,1);	
		}
		else{
			array_delete(tool_list,array_length(tool_list)-1,1);
			array_delete(init_list,array_length(init_list)-1,1);
		}
	}
}