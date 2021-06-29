
function start_rail_calc() 
{
	if !keyboard_check(vk_control)// make sure user is not trying to use rectangle hotkey
	{
		if init.posts.totalposts == 0{// no posts inserted
			show_message("Please Insert posts before Calculating")
			global.pressedtotal = 0;
		}
		if  obj_smart_calc.total == 0 and init.job.stairlf < 1{// no lengths inserted
			show_message("Please Enter TR Lengths By using 1-9 on Numpad" + "\n Press 0 for Stair rail LF")	
			global.pressedtotal = 0;
		}
		else{
	// calculate tr using 'smart' calculator----------------
			if obj_smart_calc.total > 1 and init.posts.totalposts > 0{
				if os_get_config() == "Default"{
					array_sort(tr,true);
				}
				for (var i = 9; i > 0; i = i - 1){
					var check = find_remainder(tr[i]);
					if tr[i] != 0{
						if tr[i] >= 20{
							if tr[i] >20 and tr[i] < 30{
								var k = (ceil((tr[i]/10))*10)/20;
							}
							else if tr[i] == 20{
								var k = 1;
							}
							else{
								var k = (ceil((tr[i]/19)));
							}
							var l = abs((k*20) - (tr[i] * fudge));
							var ll = abs(l-20);
							var rem = find_remainder(ll);
							if !is_undefined(rem){
								trr[rem] = trr[rem] - (l * fudge);
								trx = trx + ((k-1));
							}
							if is_undefined(rem){
								trr[i] = trr[i] +l;
								trx = trx + k;
							}
							if trr[i] = 20{
								trr[i] = 0;
								trx = trx -1;
							} 
						}
						if tr[i] >= 10 and tr[i] <= 19{
							if !is_undefined(check){
								trr[check] = trr[check] - (tr[i] * fudge);
								if trr[check] <= remainder{
									trr[check] = 0;
								}
							}
							else{
								trx = trx + 1;
								var j = abs(20- (tr[i]* fudge))
								if j < remainder{
									j = 0;
								}
								else{
									trr[i] = trr[i] + (j* fudge);
								}
							}
						}
						if tr[i] < 10{
							if !is_undefined(check){
								trr[check] = trr[check] - (tr[i] * fudge) ;
							}
							else{
								trx = trx + .5;
								trr[i] = trr[i] + abs(((tr[i] * fudge) - 10)); 
							}			
						}
					}
				}
			
				var part = init.parts_dict;
				var post = init.posts;
				var job = init.job;
				
				if init.job.tr == "TR400"{
					part.tr401.q = trx;
				}
				else if init.job.tr == "TR375"{
					part.tr375.q = trx;
				}
				else {
					part.tr200.q = trx;
				}
				
	
				if job.stairlf > 0{
					post.stairposts = get_integer(" # of stair posts: ","");
					post.tallposts = get_integer(" # of tall Stair posts: ","");
				}
				if show_question("Fascia Mount?"){
					global.fascia = true;
					part.ledlock.q = post.totalposts *4
				}
				else{
					global.fascia = false;
					if !show_question("are you mounting to concrete?"){
						part.rubber_gasket.q = 0;
						part.ledlock.q = post.totalposts *4;
					}
					else{
						part.rubber_gasket.q = post.totalposts;
						part.anchor.q = post.totalposts*4;
					}
				}
				if show_question("36 inch railing?") {
					global.threesix = true;
				}
				else {
					global.threesix = false;
				}
				job.decklf = tr[1] + tr[2] + tr[3] + tr[4] + tr[5] + tr[6] + tr[7] + tr[8] + tr[9];
				job.lf = job.decklf + job.stairlf;
				part.ep200.q = get_integer("# of endposts: ","");
				part.int135.q = get_integer( "# of 135 posts : ","");
				part.int90.q = get_integer("# of 90's ","");
				
				if init.job.tr == "TR200"{
					for (var a = 9; a > 0 ; a = a - 1){// spl200 calc.----------------------------------------
						if (tr[a] > 20){
							part.spl200.q += floor(tr[a]/20);
						}
					}
				}
				if (post.po + post.os + post.dt + post.ts) > 0{
					job.infill = "cable";
					switch init.job.tr{
						case "TR200":
							tr200_cable_calc();
							break;
						case "TR375":
							tr375_cable_calc();
							break;
						case "TR400":
							tr400_cable_calc();
							break;
					}
					exit;
				} 
				else{
					
					if show_question("Picket railing?"){
						job.infill = "picket";
						switch init.job.tr{
							case "TR200":
								tr200_picket_calc();
								break;
							case "TR375":
								tr375_picket_calc();
								break;
							case "TR400":
								tr400_picket_calc();
								break;
						}
						exit;
					}

					else{
						job.infill = "glass";
						switch init.job.tr{
							case "TR200":
								tr200_glass_calc();
								break;
							case "TR375":
								tr375_glass_calc();
								break;
							case "TR400":
								tr400_glass_calc();
								break;
						}
						exit;
					}

				}
			}
		}
	}
}