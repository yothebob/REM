function tr375_picket_calc(){
	var job = init.job;
	var part = init.parts_dict;
	var post = init.posts;

	part.tr375.q += (ceil(job.stairlf/10)/2);

	if (part.tr375.q < 1){
		part.rcb1.q = (post.totalposts *4) - part.ep200.q;
	}
	else{
		part.rcb1.q = ((post.totalposts - post.stairposts) *4);
	}
	// post section
	if job.height == "36" and global.fascia == false{
		part.ud_p361.q = (post.totalposts - post.stairposts) + (post.stairposts - post.tallposts);// deck posts
		part.ud_p421.q = post.tallposts;//start/end stair posts
	}
	else if job.height == "42" and global.fascia == false{
		part.ud_p421.q = (post.totalposts - post.stairposts) + post.tallposts;// deck post & start/end stair posts
		part.ud_p361.q = post.stairposts - post.tallposts;//stair intermediate posts
	}
	else if job.height == "36" and global.fascia == true{
		part.ud_fp45.q = post.totalposts - post.tallposts;// intermediate stair/deck posts
		part.ud_fp56.q = post.tallposts;//start/end stair posts
		part.fmpbs1.q = post.totalposts - part.int90.q;
		part.fmpbs2.q = part.int90.q;
	}
	else {
		part.ud_fp56.q = post.totalposts;// all posts
		part.fmpbs1.q = post.totalposts - part.int90.q;
		part.fmpbs2.q = part.int90.q;
	}
	
	// 36" rail parts 
	if job.height == "36"{
		part.pt360.q = job.lf *3;
	}
	else{
		part.pt420.q = job.lf *3;
	}
	part.nc20.q = ceil((post.totalposts * 4)/20);
	part.cw20.q = ceil((post.totalposts * 4)/20);
	part.rcbscrew.q = ceil(((part.rcb1.q * 2) + (part.rcb2.q * 2) + ((part.rcb112.q *6) *2) + ((part.rcb212.q *6)*2))/20);
	part.pc1.q = post.totalposts - (post.stairposts - post.tallposts);
	part.ipf.q = post.stairposts - post.tallposts;
	part.br100.q = (ceil((job.lf/10)*1.1)/2);
	part.sp41.q = (job.lf *3) *2;
	part.pvi.q = ceil((job.lf * 2) /10);
	part.rcb112.q = ceil((post.stairposts*2)/6);
	part.int90.q -= part.int90.q;
	part.ep200.q -= part.ep200.q;
	part.int135.q -= part.int135.q;
	part.spl200.q -= part.spl200.q;
	part.sds.q = ceil((((part.int90.q*10) + (part.int135.q*10) + (part.spl200.q*10))+(post.totalposts *5))/25);
	part.csp.q = 1;
	global.pressedtotal = 0;
}