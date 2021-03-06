#region //undrilled posts
if init.job.infill == "picket" or init.job.infill == "glass"{
	if mouse_check_button_released(mb_left) and global.tool == tool.cable and global.measurement > 1{
	
		var new_post_positions = [];
		var post_spacing = 6;
		var num_of_openings = ceil(global.measurement/post_spacing);
		var post_buffer = 16;
		
	
		//if meeting a post at the beginning, dont put another one. ALSO if post is placed, an end is made.. if no post is placed, corner is made 
		if array_length(init.post_x_y) > 0{
			var need_start_post = true;
			for (var i = 0; i < array_length(init.post_x_y);i++){
				if abs(init.post_x_y[i,0] - global.xstar) <= post_buffer and abs(init.post_x_y[i,1] -global.ystar) <= post_buffer{
					need_start_post = false;
					corner_posts += 1;
					break;
				}
			}
		
			if need_start_post == true{
				end_posts += 1;
				array_insert(new_post_positions,0,[global.xstar,global.ystar]);
			}
		}else{
			end_posts += 1;
			array_insert(new_post_positions,0,[global.xstar,global.ystar]);
		}
	
		//create array of line post locations
		for (var i = 1; i < num_of_openings; i++){
			var x_distance = global.xstar - global.xending; 
			var y_distance = global.ystar - global.yending;	
			var new_line_post = [global.xending + ((x_distance/num_of_openings)*i),global.yending + ((y_distance/num_of_openings)*i)];
		
			array_insert(new_post_positions,array_length(new_post_positions),new_line_post); 
		}
	
		//if meeting an post at the end, dont put another one ALSO if post is placed, an end is made.. if no post is placed, corner is made
		if array_length(init.post_x_y) > 0{
			var need_end_post = true;
			for (var i = 0; i < array_length(init.post_x_y);i++){
				if abs(init.post_x_y[i,0] - global.xending) <= post_buffer and abs(init.post_x_y[i,1] -global.yending) <= post_buffer{
					need_end_post = false;
					corner_posts += 1;
					break;
				}
			}
		
			if need_end_post == true{
				array_insert(new_post_positions,0,[global.xending,global.yending]);
				end_posts += 1;
			}
		}else{
			end_posts += 1;
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
}

#endregion

#region //drilled posts
else if init.job.infill == "cable"{
	/*
	this tool is using linked lists (objects: linked_list, node) 
	
	The linked list object is keeping track of head AND tail
	
	Nodes are storing post values [x,y,corner(Boolean)], and next value
	
	NOTICE *This linked list does have a head and tails but can only be traversed from the head, I may alter if need be*
	*/
	
	
	if global.tool == tool.cable and global.measurement > 1 and mouse_check_button_released(mb_left){
		
		var new_post_positions = []
		current_list = undefined;
		var post_spacing = 4;
		var num_of_openings = ceil(global.measurement/post_spacing);
		var post_buffer = 16;
		
		//if meeting an post at the beginning, dont put another one ALSO if post is placed, an head is made.. if no post is placed, corner is made
		if array_length(init.post_x_y) > 0{
			var need_start_post = true;
			
			for (var i = 0; i < array_length(init.post_x_y);i++){
				show_debug_message(init.post_x_y);
				if abs(init.post_x_y[i,0] - global.xstar) <= post_buffer and abs(init.post_x_y[i,1] -global.ystar) <= post_buffer{
					need_start_post = false;
					
					//look through linked lists for an x,y matching node, if so reuse the head node as a corner
					for (var ii = 0; ii < array_length(list_sections);ii++){
						if list_sections[ii].head.post_values[0] == init.post_x_y[i,0] and list_sections[ii].head.post_values[1] == init.post_x_y[i,1]{
							show_debug_message("found post")
							list_sections[ii].head.post_values[2] = true;
							current_list = list_sections[ii];
							break;
						}
						else if list_sections[ii].tail.post_values[0] == init.post_x_y[i,0] and list_sections[ii].tail.post_values[1] == init.post_x_y[i,1]{
							show_debug_message("found post")
							list_sections[ii].tail.post_values[2] = true;
							current_list = list_sections[ii];
							break;
						}
					}
					break;
				}
			} 
			
			if need_start_post == true{
				current_list = instance_create_depth(1,1,1,linked_list);
				add_node(current_list,instance_create_depth(1,1,1,node));
				current_list.head.post_values = [global.xstar,global.ystar,false];
				array_insert(obj_post_layer.list_sections,array_length(obj_post_layer.list_sections),current_list.id);
			}
		}else{//place post if there are no posts
			current_list = instance_create_depth(1,1,1,linked_list);
			add_node(current_list,instance_create_depth(1,1,1,node));
			current_list.head.post_values = [global.xstar,global.ystar,false];
			array_insert(obj_post_layer.list_sections,array_length(obj_post_layer.list_sections),current_list.id);
		}
		
		
		//create linked list of line post locations
		for (var i = 1; i < num_of_openings; i++){
			var x_distance = global.xstar - global.xending; 
			var y_distance = global.ystar - global.yending;	
			
			var new_line_post = instance_create_depth(1,1,1,node);
			new_line_post.post_values =[global.xending + ((x_distance/num_of_openings)*i),global.yending + ((y_distance/num_of_openings)*i),false];
			add_node(current_list,new_line_post); 
		}
		
		
		//if meeting an post at the end, dont put another one ALSO if post is placed, an end is made.. if no post is placed, corner is made
		if array_length(init.post_x_y) > 0{
			var need_end_post = true;
			for (var i = 0; i < array_length(init.post_x_y);i++){
				if abs(init.post_x_y[i,0] - global.xending) <= post_buffer and abs(init.post_x_y[i,1] -global.yending) <= post_buffer{
					for (var ii = 0; ii < array_length(list_sections);ii++){
						if list_sections[ii].head.post_values[0] == init.post_x_y[i,0] and list_sections[ii].head.post_values[1] == init.post_x_y[i,1]{
							show_debug_message("found post")
							list_sections[ii].head.post_values[2] = true;
							current_list = list_sections[ii];
							break;
						}
					}
				}
			}
		
			if need_end_post == true{
				add_node(current_list,instance_create_depth(1,1,1,node));
				current_list.tail.post_values = [global.xending,global.yending,false];
				show_debug_message("added post");
			}
		}else{
			add_node(current_list,instance_create_depth(1,1,1,node));
			current_list.tail.post_values = [global.xending,global.yending,false];
			show_debug_message("added post");
		}
	
		current_node = get_head_node(current_list)
		print_list(current_list);
		
		
		
		//placing posts
		while current_node != undefined{
			
			if current_list.head == current_node{//head posts
				
				if instance_exists(obj_post){
					var nearest_post = instance_nearest(current_node.post_values[0],current_node.post_values[1],obj_post);
				}
				else{
					var nearest_post = linked_list;
				}
				
				if abs(nearest_post.x - current_node.post_values[0] ) < post_buffer and abs(nearest_post.y - current_node.post_values[1] ) < post_buffer{
					var reused_post = instance_nearest(current_node.post_values[0],current_node.post_values[1],obj_post);
					show_debug_message("reused head post" + string(current_node.post_values));
					reused_post.post_type = "1S";
				}
				else{ 
					array_insert(init.post_x_y,array_length(init.post_x_y),[current_node.post_values[0],current_node.post_values[1],0]);
					with(instance_create_depth(current_node.post_values[0],current_node.post_values[1],-10000,obj_post)){
						post_type = "1S";
						node_connected = other.current_node;
						link_connected = other.current_list;
						show_debug_message("Placed head post" + string(other.current_node.post_values));
						init.posts.totalposts ++;
						init.posts.os ++;
					}
					end_posts ++;
				}
			}
			
			else if current_node.post_values[2] == true{//corners
				
				if instance_exists(obj_post){
					var nearest_post = instance_nearest(current_node.post_values[0],current_node.post_values[1],obj_post);
				}
				else{
					var nearest_post = linked_list;
				}
				
				if abs(nearest_post.x - current_node.post_values[0] ) < post_buffer and abs(nearest_post.y - current_node.post_values[1] ) < post_buffer{
					var reused_post = instance_nearest(current_node.post_values[0],current_node.post_values[1],obj_post);
					show_debug_message("reused corner post" + string(current_node.post_values))
					if reused_post.post_type == "DT"{
						init.posts.po ++;
						init.posts.dt --;
						corner_posts ++;
						end_posts --;
						reused_post.post_type = "90";
					} else {reused_post.post_type = "90";}
				}
				else{
					array_insert(init.post_x_y,array_length(init.post_x_y),[current_node.post_values[0],current_node.post_values[1],2]);
					with(instance_create_depth(current_node.post_values[0],current_node.post_values[1],-10000,obj_post)){
						post_type = "90";
						node_connected = other.current_node;
						link_connected = other.current_list;
						show_debug_message("placed corner post" + string(other.current_node.post_values))
						init.posts.totalposts ++;
						init.posts.po ++;
					}
					corner_posts ++;
				}
			}
			
			else if current_list.tail == current_node{//end post
				
				if instance_exists(obj_post){
					var nearest_post = instance_nearest(current_node.post_values[0],current_node.post_values[1],obj_post);
				}
				else{
					var nearest_post = linked_list;
				}
				
				if abs(nearest_post.x - current_node.post_values[0] ) < post_buffer and abs(nearest_post.y - current_node.post_values[1] ) < post_buffer{
					var reused_post = instance_nearest(current_node.post_values[0],current_node.post_values[1],obj_post);
					show_debug_message("reused tail post" + string(current_node.post_values))
					reused_post.post_type = "DT";
				}
				else{
					array_insert(init.post_x_y,array_length(init.post_x_y),[current_node.post_values[0],current_node.post_values[1],3]);
					with(instance_create_depth(current_node.post_values[0],current_node.post_values[1],-10000,obj_post)){
						post_type = "DT";
						node_connected = other.current_node;
						link_connected = other.current_list;
						show_debug_message("Placed tail post" + string(other.current_node.post_values));
						init.posts.totalposts ++;
						init.posts.dt ++;
					}
					end_posts ++;
				}
			}
			
		
			else{//line posts
				
				if instance_exists(obj_post){
					var nearest_post = instance_nearest(current_node.post_values[0],current_node.post_values[1],obj_post);
				}
				else{
					var nearest_post = linked_list;
				}
				
				if abs(nearest_post.x - current_node.post_values[0] ) < post_buffer and abs(nearest_post.y - current_node.post_values[1] ) < post_buffer{
					var reused_post = instance_nearest(current_node.post_values[0],current_node.post_values[1],obj_post);
					show_debug_message("reused line post" + string(current_node.post_values))
					reused_post.post_type = "DT";
				}
				else{
					array_insert(init.post_x_y,array_length(init.post_x_y),[current_node.post_values[0],current_node.post_values[1],3]);
					with(instance_create_depth(current_node.post_values[0],current_node.post_values[1],-10000,obj_post)){
						post_type = "DT";
						node_connected = other.current_node;
						link_connected = other.current_list;
						show_debug_message("Placed line post" + string(other.current_node.post_values))
						init.posts.totalposts ++;
						init.posts.dt ++;
					}
				}
			}
			current_node = get_next_node(current_node)
		}
	}
}

#endregion 