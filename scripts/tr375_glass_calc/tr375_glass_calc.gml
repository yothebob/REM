
function tr375_glass_calc() 
{
var part = init.parts_dict;
var post = init.posts;
var job = init.job; 
	
part.tr375.q += (ceil(job.stairlf/10)/2);	
part.ctgp.q = get_integer("# of total panels needed?","");

// ctg sf and polish
if global.threesix == true{
	part.ctgp.q = part.ctgp.q * 60;
	part.ctgsf.q = ((job.lf *30))/12;
}
else{//42"
	part.ctgp.q = part.ctgp.q * 72;
	part.ctgsf.q = ((job.lf *36))/12;
}

// post section
if global.threesix == true and global.fascia == false{
	part.ud_p361.q = (post.totalposts - post.stairposts) + (post.stairposts - post.tallposts);// deck posts and stair intermediate posts
	part.ud_p421.q = post.tallposts;//start/end stair posts
}
else if global.threesix == false and global.fascia == false{
	part.ud_p421.q = (post.totalposts - post.stairposts) + post.tallposts;// deck posts + start/end stair posts
	part.ud_p361.q = post.stairposts - post.tallposts;//stair intermediate posts
}
else if global.threesix == true and global.fascia == true{
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

if post.stairposts < 1{
	part.rcb2.q = (post.totalposts *2) - part.ep200.q;
	part.rcb1.q = (post.totalposts *2) - part.ep200.q;
}
else{
	part.rcb2.q = (((post.totalposts - post.stairposts)+ (post.tallposts / 2)) *2);
	part.rcb1.q = (((post.totalposts - post.stairposts)+ (post.tallposts / 2)) *2);
}
part.nc20.q = ceil((post.totalposts * 4)/20);
part.cw20.q = ceil((post.totalposts * 4)/20);
part.rcbscrew.q = ceil(((part.rcb1.q * 2) + (part.rcb2.q * 2) + ((part.rcb112.q *6) *2) + ((part.rcb212.q *6)*2))/20);
part.ipf.q = post.stairposts - post.tallposts;
part.pc1.q = post.totalposts - (post.stairposts - post.tallposts);
part.rcb112.q = ceil(post.tallposts/6);
part.rcb212.q = ceil((post.tallposts + ((post.stairposts - post.tallposts)*2)) /6);
part.br200.q = ceil((job.lf/10)*1.1)/2;
part.gvs_bot.q = ceil(job.lf/10);
part.gvs_top.q = ceil(job.lf/10);
part.int90.q -= part.int90.q;
part.ep200.q -= part.ep200.q;
part.int135.q -= part.int135.q;
part.spl200.q -= part.spl200.q;
part.sds.q = ceil((((part.int90.q*10) + (part.int135.q*10) + (part.spl200.q*10))+(post.totalposts *2))/25); 
part.csp.q = 1;
global.pressedtotal = 0;
}