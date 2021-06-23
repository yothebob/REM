///@description Select the tool

var hotkey = keyboard_check(vk_control) and keyboard_check_pressed(ord("R"))

if mouse_check_button_pressed(mb_left) or hotkey{
	if distance_to_point(mouse_x,mouse_y)<= 1 or hotkey{
		global.tool = tool.rectangle;
	}
	//Set the start point of the rectangle
	if global.tool = tool.rectangle {
		holding = true;
		x1 = mouse_x;
		y1 = mouse_y;
	}
}

if mouse_check_button_released(mb_left) {
	if global.tool = tool.rectangle {
		holding = false;
		//Make the color
		if control.picked_color = noone {
			var h = hue_bar.sliders.x-hue_bar.sliders.dist;
			var s = saturation_bar.sliders.x-saturation_bar.sliders.dist;
			var v = value_bar.sliders.x-value_bar.sliders.dist;

			var color = make_color_hsv(h, s, v)
		}else{
			var color = make_color_rgb(control.red,control.green,control.blue);
		}
		
		//Draw the rectangle
		surface_set_target(control.surface);
		draw_set_color(color);
		draw_rectangle(x1,y1,x2,y2,true);
		surface_reset_target();
	}
}

if global.tool = tool.rectangle {
	
	//Set the cursor sprite
	window_set_cursor(cr_default);
	
	//Set the other point of the rectangle
	if holding = true {
		x2 = mouse_x;
		y2 = mouse_y;
	}
}


//Change the image when the tool is selected
if global.tool = tool.rectangle || distance_to_point(mouse_x,mouse_y)<=1 {
	image_index = 1;
}else{
	image_index = 0;
}