function move_and_collide(){
	var sx = self.spd.x;
	var sy = self.spd.y;
	
	if (place_meeting(self.x + sx,self.y,obj_boundary)){
		while (!place_meeting(self.x + sign(sx),self.y,obj_boundary)){
			self.x += sign(sx);
		}
		sx = 0;
	}
	self.x += sx;
	
	if (place_meeting(self.x,self.y + sy,obj_boundary)){
		while (!place_meeting(self.x,self.y + sign(sy),obj_boundary)){
			self.y += sign(sy);
		}
		sy = 0;
	}
	self.y += sy;
}

function move_and_collide_struct(){
	var sx = self.spd.x;
	var sy = self.spd.y;
	var bbox_x = self.x + (self.col_radius * sign(sx));
	var bbox_y = self.y + (self.col_radius * sign(sy));
	
	if (collision_point(bbox_x + sx,bbox_y,obj_boundary,0,0)){
		while (collision_point(bbox_x + sign(sx),bbox_y,obj_boundary,0,0) == noone){
			self.x += sign(sx);
			bbox_x = self.x + (self.col_radius * sign(sx));
		}
		sx = 0;
	}
	self.x += sx;
	
	if (collision_point(bbox_x,bbox_y + sy,obj_boundary,0,0)){
		while (collision_point(bbox_x,bbox_y + sign(sy),obj_boundary,0,0) == noone){
			self.y += sign(sy);
			bbox_y = self.y + (self.col_radius * sign(sy));
		}
		sy = 0;
	}
	self.y += sy;
}