/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 04C3EDB0
/// @DnDArgument : "code" "if (global.colorslider = true and place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left))$(13_10){$(13_10)	global.colorslider = false;$(13_10)instance_create_depth(x,y - 265,-10000,obj_colorsliderback);$(13_10)instance_destroy(self);$(13_10)}$(13_10)$(13_10)if (global.colorslider = true)$(13_10){$(13_10)	cursor_sprite = cr_arrow;$(13_10)global.tool = tool.hand;$(13_10)}"
if (global.colorslider = true and place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left))
{
	global.colorslider = false;
instance_create_depth(x,y - 265,-10000,obj_colorsliderback);
instance_destroy(self);
}

if (global.colorslider = true)
{
	cursor_sprite = cr_arrow;
global.tool = tool.hand;
}