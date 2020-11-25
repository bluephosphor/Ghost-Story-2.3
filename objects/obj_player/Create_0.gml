event_inherited();

type = entity.player;
state = playerstate_normal;
max_sp = 3;
accel = 0.7;
frict = 0.2;

hands = {
	x: 0,
	y: 0,
	holding: 0,
	state: 0
}

tp_marker = {
	active: false,
	spd: {x:0, y: 0, maxx: 10},
	move: {x: 0, y: 0},
	col_radius: 8,
	reset: function(){
		audio_play_sound(snd_teleport,10,false);
		self.x = obj_player.x;
		self.y = obj_player.y;
		self.life = 15;
		self.active = true;
		self.spd.x = obj_player.move.x * self.spd.maxx;
		self.spd.y = obj_player.move.y * self.spd.maxx;
		
		//don't spawn in a wall
		var box_right	= self.x + self.col_radius;
		var box_left	= self.x - self.col_radius;
		var box_bottom	= self.y + self.col_radius;
		var box_top		= self.y - self.col_radius;
		var right_col	= (collision_point(box_right,self.y,obj_boundary,0,0));
		var left_col	= (collision_point(box_left,self.y,obj_boundary,0,0));
		var bottom_col	= (collision_point(self.x,box_bottom,obj_boundary,0,0));
		var top_col		= (collision_point(self.x,box_top,obj_boundary,0,0));
		if (right_col != noone){
			self.x = right_col.bbox_left - self.col_radius - 1;
		} else if (left_col != noone){
			self.x = left_col.bbox_right + self.col_radius + 1;
		}
		if (bottom_col != noone){
			self.y = bottom_col.bbox_top - self.col_radius - 1;
		} else if (top_col != noone){
			self.y = top_col.bbox_bottom + self.col_radius + 1;
		}
	},
	update: function(){
		self.life--;
		self.spd.x += keyboard_check(input.key.right) - keyboard_check(input.key.left);
		self.spd.y += keyboard_check(input.key.down) - keyboard_check(input.key.up);
		
		var _spd = point_distance(0,0,self.spd.x,self.spd.y);
		var _dir = point_direction(0,0,self.spd.x,self.spd.y);

		if (_spd > 3){
			self.spd.x = lengthdir_x(self.spd.maxx,_dir);
			self.spd.y = lengthdir_y(self.spd.maxx,_dir);
		}
		move_and_collide_struct();
		if (self.life <= 0){
			obj_player.x = x;
			obj_player.y = y;
			self.active = false;
		}
	}
}