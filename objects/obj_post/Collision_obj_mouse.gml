var p = init.posts;

if keyboard_check_pressed(vk_delete){
	var found = find_post(id);
	switch id.post_type{
		case "UD":
			p.ud -= 1;
			array_delete(init.post_x_y,found,1);
			break;
		case "DT":
			p.dt -= 1;
			array_delete(init.post_x_y,found,1);
			break;
		case "1S":
			p.os -= 1;
			array_delete(init.post_x_y,found,1);
			break;
		case "3S":
			p.ts -= 1;
			array_delete(init.post_x_y,found,1);
			break;
		case "90":
			p.po -= 1;
			array_delete(init.post_x_y,found,1);
			break;
	}
	p.totalposts -= 1;
	instance_destroy();
}