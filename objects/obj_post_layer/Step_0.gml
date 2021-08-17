if mouse_check_button_released(mb_left) and global.tool == tool.cable and global.measurement > 1{
	
	var new_post_positions = [];
	var post_spacing = 6;
	var num_of_openings = ceil(global.measurement/post_spacing);
	
	//if meeting a post at the beginning, dont put another one. ALSO if post is placed, and end is made.. if no post is placed, corner is made 
	if array_length(init.post_x_y) > 0{
		var need_start_post = true;
		for (var i = 0; i < array_length(init.post_x_y);i++){
			if abs(init.post_x_y[i,0] - global.xstar) <= 32 and abs(init.post_x_y[i,1] -global.ystar) <= 32{
				need_start_post = false;
				corner_posts += 1;
			}
		}
		
		if need_start_post == true{
			end_posts += 1;
			array_insert(new_post_positions,0,[global.xstar,global.ystar]);
		}
	}else{
		array_insert(new_post_positions,0,[global.xstar,global.ystar]);
	}
	
	//create array of line post locations
	for (var i = 1; i < num_of_openings; i++){
		var x_distance = global.xstar - global.xending; 
		var y_distance = global.ystar - global.yending;	
		var new_line_post = [global.xending + ((x_distance/num_of_openings)*i),global.yending + ((y_distance/num_of_openings)*i)];
		
		array_insert(new_post_positions,array_length(new_post_positions),new_line_post); 
	}
	
	//if meeting an post at the end, dont put another one
	if array_length(init.post_x_y) > 0{
		var need_end_post = true;
		for (var i = 0; i < array_length(init.post_x_y);i++){
			if abs(init.post_x_y[i,0] - global.xending) <= 32 and abs(init.post_x_y[i,1] -global.yending) <= 32{
				need_end_post = false;
				corner_posts += 1;
			}
		}
		
		if need_end_post == true{
			array_insert(new_post_positions,0,[global.xending,global.yending]);
			end_posts += 1;
		}
	}else{
		array_insert(new_post_positions,0,[global.xending,global.yending]);
	}
	
	
	//create posts
	for (var i = 0; i < array_length(new_post_positions);i++){
		init.posts.totalposts += 1;
		init.posts.ud += 1;
		array_insert(init.post_x_y,array_length(init.post_x_y),[new_post_positions[i,0],new_post_positions[i,1],4]);
		with(instance_create_depth(new_post_positions[i,0],new_post_positions[i,1],-10000,obj_post)){
			post_type = "UD";
		}
	}
}