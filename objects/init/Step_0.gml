
if opened_file == false{
	opened_file = true;
	show_debug_message("opening csv file...")
	import_items("part_pricing_list.csv")
	show_debug_message("done!")
}