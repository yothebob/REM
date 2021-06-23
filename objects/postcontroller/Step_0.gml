

if (mouse_wheel_up())
{
x = x+32;
}

if (mouse_wheel_down())
{
x = x-32;
}

// click on a post type to have it select that one
if distance_to_object(obj_mouse) < radius and obj_mouse.x > 1525 and obj_mouse.x < 1670 and obj_mouse.y < 60
	{
	if mouse_check_button_pressed(mb_left)
		{
		x = (round(obj_mouse.x/32) * 32);
		}
	}