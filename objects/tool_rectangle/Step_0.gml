///@description Select the tool

var hotkey = keyboard_check(vk_control) and keyboard_check_pressed(ord("R"))

if mouse_check_button_pressed(mb_left) or hotkey{
	if distance_to_point(mouse_x,mouse_y)<= 1 or hotkey{
		global.tool = tool.rectangle;
	}
	//Set the start point of the rectangle
	if global.tool == tool.rectangle {
		holding = true;
		x1 = mouse_x;
		y1 = mouse_y;
	}
}

if mouse_check_button_released(mb_left) {
	if global.tool == tool.rectangle and holding == true{
		holding = false;
		//Make the color
		if control.picked_color = noone {
			var h = hue_bar.sliders.x-hue_bar.sliders.dist;
			var s = saturation_bar.sliders.x-saturation_bar.sliders.dist;
			var v = value_bar.sliders.x-value_bar.sliders.dist;

			color = make_color_hsv(h, s, v)
		}else{
			color = make_color_rgb(control.red,control.green,control.blue);
		}
		// add rectangle to arrays (for undoing and saving)
		array_insert(rectangles,array_length(rectangles),[x1,y1,x2,y2,control.width,color]);
		array_insert(init.things_drawn,array_length(init.things_drawn),"RECTANGLE");
		show_debug_message(init.things_drawn);
		show_debug_message(rectangles);
	}
}

if global.tool == tool.rectangle {
	
	//Set the cursor sprite
	window_set_cursor(cr_default);
	
	//Set the other point of the rectangle
	if holding == true {
		x2 = mouse_x;
		y2 = mouse_y;
	}
}


//Change the image when the tool is selected
if global.tool == tool.rectangle || distance_to_point(mouse_x,mouse_y)<=1 {
	image_index = 1;
}else{
	image_index = 0;
}