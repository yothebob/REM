/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 25553201
/// @DnDArgument : "code" "if (global.colorslider = false and place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left))$(13_10){$(13_10)global.colorslider = true;$(13_10)instance_create_depth(x,y + 265,-10000, obj_colorslider);$(13_10)$(13_10)instance_destroy(self);$(13_10)}"
if (global.colorslider = false and place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left))
{
global.colorslider = true;
instance_create_depth(x,y + 265,-10000, obj_colorslider);

instance_destroy(self);
}