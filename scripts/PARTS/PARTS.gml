function particles_init(){
	globalvar part;

	part = {
		player: {
			system: part_system_create_layer("Behind",true),
			tail: part_type_create(),
		}
	}

	part_type_sprite(part.player.tail,spr_tail,true,true,false);
	part_type_life(part.player.tail,13,13);
	part_type_direction(part.player.tail,260,260,0,0);
	part_type_speed(part.player.tail,1.5,1.8,0,0);
	part_type_alpha2(part.player.tail,1,0);

	ds_collector_add(part.player.tail);
	ds_collector_add(part.player.system);
}