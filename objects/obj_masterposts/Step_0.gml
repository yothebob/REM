switch id.post_type{
case "UD":
	sprite_index = spr_masterposts2;
	break;
case "DT":
	sprite_index = spr_masterposts3;
	break;
case "1S":
	sprite_index = spr_masterposts;
	break;
case "3S":
	sprite_index = spr_masterposts1;
	break;
case "90":
	sprite_index = spr_masterposts4;
	break;
}

if place_meeting(x,y,postcontroller){
id.selected = true;
}else id.selected = false;

if id.selected{
	image_index = 1;
}else image_index = 0;

var p = init.posts;

 if keyboard_check_pressed(vk_insert) or mouse_check_button_pressed(mb_right){
	if(id.selected){
		switch id.post_type{
			case "UD":
				p.ud += 1;
				p.totalposts += 1;
				with(instance_create_layer(round(mouse_x/global.gridsize)*global.gridsize,round(mouse_y/global.gridsize)*global.gridsize, "Instances", obj_post)){
					post_type = "UD";
					image_index = 4;
				}
				break;
			case "DT":
				p.dt += 1;
				p.totalposts += 1;
				with(instance_create_layer(round(mouse_x/global.gridsize)*global.gridsize,round(mouse_y/global.gridsize)*global.gridsize, "Instances", obj_post)){
					post_type = "DT";
					image_index = 3;
				}
				break;
			case "1S":
				p.os += 1;
				p.totalposts += 1;
				with(instance_create_layer(round(mouse_x/global.gridsize)*global.gridsize,round(mouse_y/global.gridsize)*global.gridsize, "Instances", obj_post)){
					post_type = "1S";
					image_index = 0;
				}
				break;
			case "3S":
				p.ts += 1;
				p.totalposts += 1;
				with(instance_create_layer(round(mouse_x/global.gridsize)*global.gridsize,round(mouse_y/global.gridsize)*global.gridsize, "Instances", obj_post)){
					post_type = "3S";
					image_index = 1;
				}
				break;
			case "90":
				p.po += 1;
				p.totalposts += 1;
				with(instance_create_layer(round(mouse_x/global.gridsize)*global.gridsize,round(mouse_y/global.gridsize)*global.gridsize, "Instances", obj_post)){
					post_type = "90";
					image_index = 2;
				}
				break;
		}
	}
 }