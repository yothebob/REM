

if keyboard_check_pressed(ord("R")) or global.pressedtotal == 1
{
	if init.parts_dict.nc20.q > 0 or init.parts_dict.tr200.q > 0{
		if show_question("Do you want to restart your quote?"){
			var key = variable_struct_get_names(init.parts_dict);
			for(var i = 0; i < array_length(key);i++){
				init.parts_dict[$ key[i]].q = 0;
			}
			trx = 0;
			init.job.lf = 0;
			init.job.decklf = 0;
			init.job.cost = 0;
			start_rail_calc();
		}
		else{
			global.pressedtotal = 0;
			exit;
		}
	}
	else{
		start_rail_calc();	
	}
}

// TR Calcuations ------------------------------------------------\\
for (var i = 9; i > 0; i = i -1){
	if tr[i] > 0{
		c[i]= c_green;
	}
	else{
		c[i]= c_dkgray;
	}
	if trr[i] > 0{
		cr[i] = c_red;
	}
	else cr[i] = c_dkgray;
}

switch keyboard_key
{
case vk_numpad1:
	tr[1] = get_integer("Enter top rail length","");
	break;
case vk_numpad2: 
	tr[2] = get_integer("Enter top rail length","");
	break;
case vk_numpad3: 
	tr[3] = get_integer("Enter top rail length","");
	break;
case vk_numpad4: 
	tr[4] = get_integer("Enter top rail length","");
	break;
case vk_numpad5: 
	tr[5] = get_integer("Enter top rail length","");
	break;
case vk_numpad6: 
	tr[6] = get_integer("Enter top rail length","");
	break;
case vk_numpad7:
	tr[7] = get_integer("Enter top rail length","");
	break;
case vk_numpad8: 
	tr[8] = get_integer("Enter top rail length","");
	break;
case vk_numpad9: 
	tr[9] = get_integer("Enter top rail length","");
	break;
case vk_numpad0: 
	init.job.stairlf = get_integer("Total Stair LF","");
	break;
case ord("1"):
	tr[1] = get_integer("Enter top rail length","");
	break;
case ord("2"): 
	tr[2] = get_integer("Enter top rail length","");
	break;
case ord("3"): 
	tr[3] = get_integer("Enter top rail length","");
	break;
case ord("4"): 
	tr[4] = get_integer("Enter top rail length","");
	break;
case ord("5"): 
	tr[5] = get_integer("Enter top rail length","");
	break;
case ord("6"): 
	tr[6] = get_integer("Enter top rail length","");
	break;
case ord("7"):
	tr[7] = get_integer("Enter top rail length","");
	break;
case ord("8"): 
	tr[8] = get_integer("Enter top rail length","");
	break;
case ord("9"): 
	tr[9] = get_integer("Enter top rail length","");
	break;
case ord("0"): 
	init.job.stairlf = get_integer("Total Stair LF","");
	break;
}

if global.totalstart == 1{
	total_calc();
}


