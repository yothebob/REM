if (place_meeting(x,y,obj_mouse) and mouse_check_button_pressed(mb_left))
{
get_grid = show_question("Do you want 1' increment snap?");

if get_grid
{
global.gridsize = 32;
}
else
{
global.gridsize = 16;
}
}