

if (global.totalslider == true)
{
draw_set_halign(fa_left);
var o = 150;

var key = variable_struct_get_names(init.parts_dict)
var spacing = 0;
var index = 1;

for(var i = 0; i < array_length(key); i++){
	for(var ii = 0;ii < array_length(key); ii++){
		if init.parts_dict[$ key[ii]].q > 0 and init.parts_dict[$ key[ii]].index == index{
			spacing ++
			draw_part_total(init.parts_dict[$ key[ii]].q,x+o,(spacing*34)+35,init.parts_dict[$ key[ii]].name + " : ");
		}
	}
	index += 1;
}

draw_set_halign(fa_center);
}