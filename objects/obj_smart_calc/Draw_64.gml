///@description drawing calculator & lengths

draw_set_color(c_dkgray);
draw_set_halign(fa_left);

if(global.calcslider = true)
{
// drawlabel
draw_text_color(x-540, y-30,"Railing Calculator:", c_green, c_green, c_green, c_green, 1);
//draw_lengths and numbers

for (var i = 9; i > 0; i -= 1)
    {	
    draw_text_color(x-offset.o1,(y-32) + (i * 30),"Length " + string(i) + " : " +string(tr[i]),c[i],c[i],c[i],c[i],1);
	draw_text_color(x-offset.o3,(y-32) + (i*30),"Scrap:" + string(trr[i]),cr[i],cr[i],cr[i],cr[i],1);
	}


if init.job.decklf < 1{
		draw_text(x-offset.o2-40,y+270, "Total Deck LF :" + (string(init.job.decklf)));
	}
	else{
		draw_text_color(x-offset.o2-40,y+270, "Total Deck LF :" + (string(init.job.decklf)),c_green,c_green,c_green,c_green,1);
	}
	
if init.job.stairlf < 1{
		draw_text(x-offset.o2-30,y+300, "Total Stair LF :" + (string(init.job.stairlf)));
	}
	else{
		draw_text_color(x-offset.o2-30,y+300, "Total Stair LF :" + (string(init.job.stairlf)),c_green,c_green,c_green,c_green,1);
	}
	
if init.job.lf < 1{
		draw_text(x-offset.o2,y+330, "Total LF :" + string(init.job.lf));
	}
	else{
		draw_text_color(x-offset.o2,y+330, "Total LF :" + string(init.job.lf),c_green,c_green,c_green,c_green,1);	
	}
	
draw_text(x-offset.o1, y + offset.o3 -30,"Max len. to scrap? : " + string(remainder));
draw_text(x-offset.o1,y + offset.o3,"% of wiggle room : " + string(fudge));

	
draw_text(x-offset.o1,y+(offset.o2), "Estimated Cost: " + (string(init.job.cost)));
}