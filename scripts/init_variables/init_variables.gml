function init_variables() 
{
posts = {
	ud : 0,
	dt : 0,
	os : 0,
	ts : 0,
	po : 0,
	tallposts : 0,
	totalposts : 0,
	stairposts : 0,
}

//line drawing and scaling
global.ts = 0;
global.xstar = 0;
global.xending = 0;
global.measurement = 0;
global.scale = 0;
global.ystar = 0;
global.yending = 0;
global.drawx = 0;
global.drawy = 0;

// 36"
global.threesix = true;
global.fascia = false;

//struct of inventory parts 
parts_dict = {
	ud_p362 : {name : "UD P362- Blk U", q : 0, cost : 74.4, index : 1},
	os_p362 : {name : "1S P362- Blk U", q : 0, cost : 99.8, index : 2},
	ts_p362 : {name : "3S P362- Blk U", q : 0, cost : 99.8, index : 3},
	po_p362 : {name : "90 P362- Blk U", q : 0, cost : 99.8, index : 4},
	dt_p362 : {name : "DT P362- Blk U", q : 0, cost : 99.8, index : 5},
	ud_p361 : {name : "UD P361- Blk U", q : 0, cost : 74.4, index : 6},
	os_p361 : {name : "1S P361- Blk U", q : 0, cost : 99.8, index : 7},
	ts_p361 : {name : "3S P361- Blk U", q : 0, cost : 99.8, index : 8},
	po_p361 : {name : "90 P361- Blk U", q : 0, cost : 99.8, index : 9},
	dt_p361 : {name : "DT P361- Blk U", q : 0, cost : 99.8, index : 10},
	ud_p421 : {name : "UD P421- Blk U", q : 0, cost : 80.4, index : 11},
	os_p421 : {name : "1S P421- Blk U", q : 0, cost : 105.8, index : 12},
	ts_p421 : {name : "3S P421- Blk U", q : 0, cost : 105.8, index : 13},
	po_p421 : {name : "90 P421- Blk U", q : 0, cost : 105.8, index : 14},
	dt_p421 : {name : "DT P421- Blk U", q : 0, cost : 105.8, index : 15},
	ud_p422 : {name : "UD P422- Blk U", q : 0, cost : 80.4, index : 16},
	os_p422 : {name : "1S P422- Blk U", q : 0, cost : 105.8, index : 17},
	ts_p422 : {name : "3S P422- Blk U", q : 0, cost : 105.8, index : 18},
	po_p422 : {name : "90 P422- Blk U", q : 0, cost : 105.8, index : 19},
	dt_p422 : {name : "DT P422- Blk U", q : 0, cost : 105.8, index : 20},
	ud_p362_135 : {name : "UD P362 - 135° Blk", q : 0, cost : 99, index : 21},
	ud_p361_135 : {name : "UD P361-135° - Blk", q : 0, cost : 99, index : 22},
	ud_p422_135 : {name : "UD P422-135°- Blk", q : 0, cost : 92.3, index : 23},
	ud_p421_135 : {name : "P421-135°-Blk", q : 0, cost : 104.2, index : 24},
	dt_p362_135 : {name : "DT P362 - 135° Blk", q : 0, cost : 100.8, index : 25},
	dt_p361_135 : {name : "DT P361-135° - Blk", q : 0, cost : 111.1, index : 26},
	dt_p422_135 : {name : "DT P422-135°- Blk", q : 0, cost : 105.1, index : 27},
	fmpbs1 : {name : "FMPBS 1- Blk", q : 0, cost : 66.8, index : 28},
	fmpbs2 : {name : "FMPBS 2- Blk", q : 0, cost : 83.2, index : 29},
	fmpbs3 : {name : "FMPBS3- Blk", q : 0, cost : 67.6, index : 30},
	ud_fp45 : {name : "UD FP45- Blk", q : 0, cost : 48.4, index : 31},
	os_fp45 : {name : "1S FP45- Blk", q : 0, cost : 73.8, index : 32},
	ts_fp45 : {name : "3S FP45- Blk", q : 0, cost : 73.8, index : 33},
	po_fp45 : {name : "90 FP45- Blk", q : 0, cost : 73.8, index : 34},
	dt_fp45 : {name : "DT FP45- Blk", q : 0, cost : 73.8, index : 35},
	ud_fp56 : {name : "UD FP56- Blk", q : 0, cost : 57.8, index : 36},
	os_fp56 : {name : "1S FP56- Blk", q : 0, cost : 83.2, index : 37},
	ts_fp56 : {name : "3S FP56- Blk", q : 0, cost : 83.2, index : 38},
	po_fp56 : {name : "90 FP56- Blk", q : 0, cost : 83.2, index : 39},
	dt_fp56 : {name : "DT FP56- Blk", q : 0, cost : 83.2, index : 40},
	tr200 : {name : "TR200 Blk", q : 0, cost : 162.70, index : 41}, // 162.70
	tr375 : {name : "TR375 Blk", q : 0, cost : 138.90, index : 42},
	tr401 : {name : "TR400 Blk", q : 0, cost : 128.6, index : 43},
	flat_infill : {name : "FI- Blk", q : 0, cost : 55.10, index : 44},
	pocket_infill : {name : "Pocket Infill- Blk", q : 0, cost : 76.40, index : 45},
	spe1 : {name : "SPE1- Blk", q : 0, cost : 28, index : 46},
	spe2 : {name : "SPE2- Blk", q : 0, cost : 16.10, index : 47},
	br100 : {name : "BR100- Blk", q: 0, cost : 65.60, index : 48},
	br200 : {name :"BR200- Blk", q : 0, cost : 101.60, index : 49},
	pc1 : {name : "PC1- POW Blk", q: 0, cost : 8.60, index : 50},
	ipf : {name :"IPF-  POW Blk", q : 0, cost : 26.70, index : 51},
	ep200 : {name : "200EP POW Blk", q : 0, cost : 16.6, index : 52},
	int90 : {name : "INT-90° Splice", q : 0, cost : 16.8, index : 53},
	int135 : {name : "INT -135°", q : 0, cost : 26.9, index : 54},
	spl200 : {name : "Splice Flat Series 200", q : 0, cost : 6.4, index : 55},
	pt360 : {name : "PT1-360- Blk", q : 0, cost : 4, index : 56},
	pt420 : {name : "PT1-420- Blk", q : 0, cost : 4.6, index : 57},
	sp41 : {name : "SP41- Blk", q : 0, cost : 1, index : 58},
	sp42 : {name : "SP42- Blk", q : 0, cost : .9, index : 59},
	rcbscrew : {name : "RCB screws -  20 Count Bag", q : 0, cost : 8, index : 60},
	pvi : {name : "PVI", q : 0, cost : 9.7, index : 61},
	gvs_top : {name : "GVS Top Glass Vnl", q : 0, cost : 14.25, index : 62},
	gvs_bot : {name : "GVS Bot Glass Vnl", q : 0, cost : 14.25, index : 63},
	rcb1 : {name : "RCB1", q : 0, cost : .4, index : 64},
	rcb2 : {name : "RCB2", q : 0, cost : .8, index : 65},
	rcb112 : {name : "RCB1-12", q : 0, cost : 4.8, index : 66},
	rcb212 : {name : "RCB2-12", q : 0, cost : 6.7, index : 67},
	sds : {name : "SDS Bag 25 - SS Black", q : 0, cost : 4.9, index : 68},
	nc20 : {name : "NC-20, Blk", q : 0, cost : 3.5, index : 69},
	cw20 : {name : "CW-20", q : 0, cost : 12.5, index : 70},
	csp : {name : "CSP- Blk", q : 1, cost : 12.25, index : 71},
	ledlock : {name : "LedLok- 5", q : 0, cost : .95, index : 72},
	anchor : {name : "Concrete Anchor", q : 0, cost : .95, index : 73},
	aw30 : {name : "SS AW 30", q : 0, cost : 2.1, index : 74},
	cable : {name : "SS Cable- 1/8", q : 0, cost : .58, index : 75},
	dp : {name : "SS DPMS Short", q : 0, cost : 5.6, index : 76},
	tt : {name : "SS TTHS", q : 0, cost : 5.2, index : 77},
	ctgp : {name : "CTG - PE 1/4", q : 0, cost : .4, index : 78},
	ctgsf : {name : "CTG - CL 1/4", q : 0, cost : 7.4, index : 79},
	rubber_gasket : {name : "BP Rubber Gkt", q : 0, cost : 6.4, index : 80},
	swage : {name : "SS Labor", q : 0, cost : 3.25, index : 81},
	tr400: {name : "TR400 Blk", q : 0, cost : 128.6, index : 82}
}

job = {
	name : "",
	customer : "",
	lf : 0,
	stairlf : 0,
	decklf : 0,
	address : "",
	contact : "",
	tr : "TR200",
	br : "",
	infill : "picket",
	date : (string(current_hour) + string(current_month) + string(current_day) + string(current_year)),
	cost : 0,
	height : "",
	part_list : parts_dict
}


}