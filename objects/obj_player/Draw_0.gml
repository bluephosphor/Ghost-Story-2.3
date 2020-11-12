if (tp_marker.active){
	tp_marker.update();
	if (debug) draw_circle_color(tp_marker.x,tp_marker.y,5,c_red,c_red,false);
}

draw_self();