script_execute(state);

switch(move.x){
	case -1: 
		part_type_direction(part.player.tail,280,280,0,0);
	break;
	case 1: 
		part_type_direction(part.player.tail,260,260,0,0);
	break;
}