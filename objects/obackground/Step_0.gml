// backdrop
if !surface_exists(background) {
 background = surface_create(1920,1080);
 surface_set_target(background);
 draw_sprite(alumarail_background,0,0,0);
 surface_reset_target();
}
