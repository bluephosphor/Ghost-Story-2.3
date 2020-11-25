///@description script_execute_alt
///@arg ind
///@arg [arg1,arg2,...]
function script_execute_alt(s,a) {

	var len = array_length(a);

	switch(len){
		case 0 : script_execute(s); break;
		case 1 : script_execute(s, a[0]); break;
		case 2:  script_execute(s, a[0], a[1]); break;
		case 3:  script_execute(s, a[0], a[1], a[2]); break;
		case 4:  script_execute(s, a[0], a[1], a[2], a[3]); break;
		case 5:  script_execute(s, a[0], a[1], a[2], a[3], a[4]); break;
		case 6:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5]); break;
		case 7:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6]); break;
		case 8:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]); break;
		case 9:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]); break;
		case 10: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]); break;
		case 11: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]); break;
		case 12: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]); break;
		case 13: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]); break;
		case 14: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]); break;
		case 15: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]); break;
	}
}

function vec2(x,y) constructor{
	self.x = x;
	self.y = y;
}

function draw_vars_list(x,y,obj){
	var list = variable_instance_get_names(obj);
	var i = 0, vn, vv; repeat(array_length(list)){
		vn = list[i];
		vv = variable_instance_get(obj,vn);
		draw_text(x, y + (12 * i), vn + ": " + string(vv));
		i++;
	}
}

function approach(a, b, amount){
	// Moves "a" towards "b" by "amount" and returns the result
	// Nice bcause it will not overshoot "b", and works in both directions
	// Examples:
	//      speed = Approach(speed, max_speed, acceleration);
	//      hp = Approach(hp, 0, damage_amount);
	//      hp = Approach(hp, max_hp, heal_amount);
	//      x = Approach(x, target_x, move_speed);
	//      y = Approach(y, target_y, move_speed);
	if (a < b) {
	    a += amount;
		if (a > b) return b;
	} else {
	    a -= amount;
	    if (a < b) return b;
	}
	return a;
}

function animate_sprite(){
	
}