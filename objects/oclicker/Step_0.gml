/// @description Execute Code

if (place_meeting(x,y,obj_mouse) and mouse_check_button(mb_left)) 
{
obj_smart_calc.fudge = get_integer("% of wiggle room you want for scrap? (10% is 1.1)", obj_smart_calc.fudge);
obj_smart_calc.remainder = get_integer("max length to keep as usable scrap?", obj_smart_calc.remainder);

}