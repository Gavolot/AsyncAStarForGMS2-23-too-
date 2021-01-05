var first = true;
if(path_exists(path)){
	draw_primitive_begin(pr_linestrip);
	draw_set_color(c_red);
	for(var i = 0; i < path_get_number(path); i++){
		var xp = x + path_get_point_x(path,i), yp = y + path_get_point_y(path,i);
		draw_vertex(xp, yp);
		draw_rectangle(xp - 5, yp - 5, xp + 5, yp + 5, !first);
		if(first) first = false;
	}
	draw_set_color(c_white);
	draw_primitive_end()
}else{
	instance_destroy();
}