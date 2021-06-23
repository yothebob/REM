
function total_calc() 
{
	var keys = variable_struct_get_names(init.parts_dict);
	for (var i =array_length(keys) -1; i >=0;--i){
		var p_quan = init.parts_dict[$ keys[i]].q;
		var p_cost = init.parts_dict[$ keys[i]].cost;
		var p_name = init.parts_dict[$ keys[i]].name;
		init.job.cost += p_quan * p_cost;
	}
	global.totalstart = 0;
}