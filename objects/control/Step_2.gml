/// @description Mouse sprite
//Make the mouse sprite be the default when outside the drawing surface
if mouse_x < 5 || mouse_x > 1920 || mouse_y < 5 || mouse_y > 1080 {
	window_set_cursor(cr_default);
	cursor_sprite = noone;
}