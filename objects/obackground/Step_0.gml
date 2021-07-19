// backdrop
if !surface_exists(background) {
	if open.opened == false{
		background = surface_create(1920,1080);
		surface_set_target(background);
		draw_sprite(alumarail_background,0,0,0);
		surface_reset_target();
	}else{
		background = surface_create(1920,1080);
		var xscale = 1980/sprite_get_width(open.opened_image);
		var yscale = 1080/sprite_get_height(open.opened_image);
		surface_set_target(control.surface);
		draw_sprite_ext(open.opened_image,0,32,32,xscale,yscale,0,c_white,1);
		surface_reset_target();
	}
}
