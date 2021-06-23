if (global.calcslider = false and place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left))
{
	global.calcslider = true;
instance_create_depth(x-290,y,-10000,obj_calcslider);
instance_create_depth(1820,950,-10000,oclicker);
instance_destroy(self);
}

