if (type == entity.player){
	move.x = keyboard_check(input.key.right) - keyboard_check(input.key.left);
	move.y = keyboard_check(input.key.down) - keyboard_check(input.key.up);
}

spd.x += accel * move.x;
spd.y += accel * move.y;

var _spd = point_distance(0,0,spd.x,spd.y);
var _dir = point_direction(0,0,spd.x,spd.y);

if (_spd > max_sp){
	spd.x = lengthdir_x(max_sp,_dir);
	spd.y = lengthdir_y(max_sp,_dir);
}

if (move.x == 0){
	spd.x = lerp(spd.x,0,frict);
} else {
	image_xscale = move.x;
}
if (move.y == 0){
	spd.y = lerp(spd.y,0,frict);
}

move_and_collide();