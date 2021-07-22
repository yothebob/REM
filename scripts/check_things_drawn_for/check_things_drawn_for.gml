
function check_things_drawn_for(tool_array,tool_string) 
{
	if array_length(tool_array) > 0{
		if array_get(init.things_drawn,array_length(init.things_drawn)-1) == tool_string{
			//check if last thing drawn was a line, if so delete last drawn item
			erase_drawn_item(init.things_drawn,tool_array);
		}
	}
}