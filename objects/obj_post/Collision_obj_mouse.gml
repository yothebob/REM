var p = init.posts;

if keyboard_check_pressed(vk_delete){
	switch id.post_type{
		case "UD":
			p.ud -= 1;
			break;
		case "DT":
			p.dt -= 1;
			break;
		case "1S":
			p.os -= 1;
			break;
		case "3S":
			p.ts -= 1;
			break;
		case "90":
			p.po -= 1;
			break;
	}
	p.totalposts -= 1;
	instance_destroy();
	surface_set_target(control.surface);
	draw_sprite(spr_fix, 0, mouse_x, mouse_y);
	surface_reset_target();
}