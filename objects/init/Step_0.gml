
if opened_file == false{
	//open pricing csv file and import prices
	opened_file = true;
	show_debug_message("opening csv file...")
	import_items("part_pricing_list.csv")
	show_debug_message("done!")
}

//delete last drawn line
if keyboard_check(vk_control) and keyboard_check_pressed(ord("Z")) and array_length(things_drawn) > 0{
	// checks for if the last index in the things_drawn was a line,rectangle or text
	check_things_drawn_for(tool_line.lines,"LINE");
	check_things_drawn_for(tool_rectangle.rectangles,"RECTANGLE");
	check_things_drawn_for(tool_text.texts,"TEXT");	
}
