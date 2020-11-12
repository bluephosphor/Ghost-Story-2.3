var len = array_length(ds_collector);

var ds, i = 0; repeat(len){
	ds = ds_collector[i];
	
	if (ds_exists(ds,ds_type_list)){
		ds_list_destroy(ds);
		show_debug_message("ds list destroyed!");
	} else if (ds_exists(ds,ds_type_grid)){
		ds_grid_destroy(ds);
		show_debug_message("ds grid destroyed!");
	} else if (ds_exists(ds,ds_type_map)){
		ds_map_destroy(ds);
		show_debug_message("ds map destroyed!");
	} else if (part_type_exists(ds)){
		part_type_destroy(ds);
		show_debug_message("part type destroyed!");
	} else if (part_system_exists(ds)){
		part_system_destroy(ds);
		show_debug_message("part system destroyed!");
	}
}