/// @description Execute Code

var hotkey = !keyboard_check(vk_control) and keyboard_check_pressed(ord("T"));

if place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left) or hotkey
{
global.totalstart = 1;
}