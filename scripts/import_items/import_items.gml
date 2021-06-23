function import_items(_file) 
{
var fname = get_open_filename(".csv","");
var csv = load_csv(fname);
var hh = ds_grid_height(csv);
var ww = ds_grid_height(csv);
var item = variable_struct_get_names(init.parts_dict);

	for(var i = 0;i < hh; i++){
		for(var ii = 0; ii < array_length(item); ii++){
			if csv[# 3,i] == init.parts_dict[$ item[ii]].name{
				init.parts_dict[$ item[ii]].cost = csv[# 7,i];
			}
		}
	}
}
