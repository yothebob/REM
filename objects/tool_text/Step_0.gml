//Select the tool

var hotkey = keyboard_check(vk_control) and keyboard_check_pressed(ord("T"));

if mouse_check_button_pressed(mb_left) and distance_to_point(mouse_x,mouse_y)<= 1 or hotkey 
{
global.tool = tool.text;
}

//Change the image when the tool is selected
if global.tool = tool.text || distance_to_point(mouse_x,mouse_y)<=1 {
	image_index = 1;
}else{
	image_index = 0;
}

//Change the cursor sprite to pen
if global.tool = tool.text {
	window_set_cursor(cr_beam);
	
	//Check where to write the text
	if mouse_check_button_released(mb_left)  {
		selectedpointx = mouse_x;
		selectedpointy = mouse_y;
		stop = false;
	}
	//if the selected point is inside the surface...
	if stop = false{
		if selectedpointx < 1920 && selectedpointx > 32 {
			//Make the color
			if control.picked_color = noone {
				var h = hue_bar.sliders.x-hue_bar.sliders.dist;
				var s = saturation_bar.sliders.x-saturation_bar.sliders.dist;
				var v = value_bar.sliders.x-value_bar.sliders.dist;

				var color = make_color_hsv(h, s, v)
			}else{
				var color = make_color_rgb(control.red,control.green,control.blue);
			}
		
			//Ask what to write
			currenttext = get_string("Text to draw:","");
		
			//Write it
			surface_set_target(control.surface);
			draw_set_color(color);
			draw_text(selectedpointx,selectedpointy,currenttext);
			surface_reset_target();
			stop = true;
			
		}
	}
}