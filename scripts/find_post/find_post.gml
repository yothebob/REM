// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_post(_id) {
	for(var i = 0;i < array_length(init.post_x_y);i++){
		if _id.x == init.post_x_y[i,0] and _id.y == init.post_x_y[i,1]{
			return i;
		}
	}
}