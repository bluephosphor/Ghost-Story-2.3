function ds_collector_add(variable){
	if (!variable_global_exists("ds_collector")){
		globalvar ds_collector;
		globalvar ds_index;
		ds_collector = [];
		ds_index = 0;
	} 
	ds_collector[ds_index++] = variable;
}

globalvar input;

input = {
	key: {
		left:	vk_left,
		right:	vk_right,
		up:		vk_up,
		down:	vk_down,
		action: ord("Z"),
		menu:	ord("X")
	},
	pad: {}
}