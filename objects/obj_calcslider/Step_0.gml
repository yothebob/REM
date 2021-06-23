if (global.calcslider = true and place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left))
{
	global.calcslider = false;
instance_create_depth(x+290,y,-10000,obj_calcsliderback);
instance_destroy(oclicker);
instance_destroy(self);
}