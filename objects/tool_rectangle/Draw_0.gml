//drawing to the screen
	for (var i = 0; i < array_length(rectangles); i++){
		var r = rectangles;
		var rx1 = r[i,0];
		var ry1 = r[i,1];
		var rx2 = r[i,2];
		var ry2 = r[i,3];
		var w = r[i,4];
		var c = r[i,5];
		draw_line_width_color(rx2,ry2,rx1,ry2,w,c,c);
		draw_line_width_color(rx1,ry2,rx1,ry1,w,c,c);
		draw_line_width_color(rx2,ry1,rx1,ry1,w,c,c);
		draw_line_width_color(rx2,ry2,rx2,ry1,w,c,c);
	}