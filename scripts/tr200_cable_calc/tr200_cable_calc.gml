
function tr200_cable_calc() 
{	
	var part = init.parts_dict;
	var post = init.posts;
	var job = init.job;
	
	part.tr375.q = (ceil(job.stairlf/10)/2);
	part.sds.q = ceil((((part.int90.q*10) + (part.int135.q*10) + (part.spl200.q*10))+(post.totalposts *2))/25); 

	var endpost = get_integer("# of Terminal posts(POSTS THAT USE A TTHS/TTMS):", "");
	var inter = get_integer("# of DT/90/1s posts that use 2 DP:" + "\n DO NOT DOUBLE COUNT POSTS" , "");
	var threeside = post.ts;
	var oneside = get_integer("# of 1s posts (DO NOT DOUBLE COUNT):", "");
	var cables = 10;
		
	if !show_question("BR?"){
		if global.threesix == true{ cables = 10;}
		else{ cables = 12;}
	}
	else{
		if global.threesix == true{cables = 9;}
		else{cables = 11;}
	
		if post.stairposts < 1{
		part.rcb2.q = (post.totalposts *2) - part.ep200.q;
		}
		else{
			part.rcb2.q = (((post.totalposts - post.stairposts)+ (post.tallposts / 2)) *2);
		}
		part.rcb112.q = ceil(post.tallposts/6);
		part.rcb212.q = ceil((post.tallposts + ((post.stairposts - post.tallposts)*2)) /6);
		part.br200.q = (ceil((job.lf/10)*1.1)/2);
		part.spe2.q = part.br200.q;
			
	}
		// post section
	if global.threesix == true and global.fascia == false{
		part.dt_p362.q = post.dt - part.int135.q;// deck posts
		part.os_p362.q = post.os;
		part.ts_p362.q = post.ts;
		part.po_p362.q = post.po;
		part.ud_p361.q = post.stairposts - post.tallposts;//stair intermediate posts
		part.ud_p421.q = post.tallposts;//start/end stair posts
	}
	else if global.threesix == false and global.fascia == false{
		part.dt_p422.q = post.dt;// deck posts
		part.os_p422.q = post.os;
		part.ts_p422.q = post.ts;
		part.po_p422.q = post.po;
		part.ud_p361.q = post.stairposts - post.tallposts;//stair intermediate posts
		part.ud_p421.q = post.tallposts;//start/end stair posts
	}
	else if global.threesix == true and global.fascia == true{
		part.dt_fp45.q = post.dt;// deck posts
		part.os_fp45.q = post.os;
		part.ts_fp45.q = post.ts;
		part.po_fp45.q = post.po;
		part.ud_fp45.q = post.stairposts - post.tallposts;//stair intermediate posts
		part.ud_fp56.q = post.tallposts;//start/end stair posts
		part.fmpbs1.q = post.totalposts - part.int90.q;
		part.fmpbs2.q = part.int90.q;
	}
	else {
		part.dt_fp56.q = post.dt;// deck posts
		part.os_fp56.q = post.os;
		part.ts_fp56.q = post.ts;
		part.po_fp56.q = post.po;
		part.ud_fp45.q = post.stairposts - post.tallposts;//stair intermediate posts
		part.ud_fp56.q = post.tallposts;//start/end stair posts
		part.fmpbs1.q = post.totalposts - part.int90.q;
		part.fmpbs2.q = part.int90.q;
	}
	
	part.spe1.q = part.tr375.q;
	part.flat_infill.q = part.tr200.q;
	part.nc20.q = ceil((post.totalposts * 4)/20);
	part.cw20.q = ceil((post.totalposts * 4)/20);
	part.rcbscrew.q = ceil(((part.rcb1.q * 2) + (part.rcb2.q * 2) + ((part.rcb112.q *6) *2) + ((part.rcb212.q *6)*2))/20);
	part.pc1.q = post.tallposts;
	part.ipf.q = post.stairposts - post.tallposts;
	part.dp.q = (oneside + threeside + (inter *2)) *cables;
	part.tt.q = ((threeside + endpost) * cables);
	part.swage.q = ((part.dp.q + part.tt.q)/2);
	part.aw30.q = (post.tallposts/2) *cables;
	part.csp.q = 1;
}