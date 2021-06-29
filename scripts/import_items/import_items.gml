function import_items(fname) 
{
var exception = "this did not load correctly.. please look at your imported file."
var csv = load_csv(fname);
var hh = ds_grid_height(csv);
var item = variable_struct_get_names(init.parts_dict);

	for(var i = 0;i < hh; i++){
		for(var ii = 0; ii < array_length(item); ii++){
			if string(csv[# 2,i]) == init.parts_dict[$ item[ii]].name{
				show_debug_message("Found match! updating...");
				show_debug_message(string(csv[# 2,i]) + " == " + string(csv[# 6,i]));
				try{
					init.parts_dict[$ item[ii]].cost = real(csv[# 6,i]);
					show_debug_message("it worked! after : " + string(init.parts_dict[$ item[ii]].cost));
				}
				catch (exception){
					show_debug_message(exception);
				}
			}
		}
	}
}
