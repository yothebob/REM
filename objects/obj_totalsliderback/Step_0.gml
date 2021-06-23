if (global.totalslider = false and place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left))
{
global.totalslider = true;
instance_create_depth(x + 295,y,-10000, obj_totalslider);
instance_destroy(self);
}