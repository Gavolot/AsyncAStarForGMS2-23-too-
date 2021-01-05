# AsyncAStarForGMS2-23-too-
AsyncAStarForGMS2(23 too)


#Hack if u want diagonal

	function make_diagonal_path(path){
		for(var i = 0; i < path_get_number(path); i++){
			var xp = path_get_point_x(path, i);
			var yp = path_get_point_y(path, i);
			//Рисуем потенциальные диагональные точки
			if(i + 1 < path_get_number(path) and i - 1 >= 0){
				var xpp = path_get_point_x(path, i + 1);
				var ypp = path_get_point_y(path, i + 1);
				var xpm = path_get_point_x(path, i - 1);
				var ypm = path_get_point_y(path, i - 1);
				
				if((xpp > xp and xpm == xp) or (ypp > yp and ypm == yp)){
					//draw_set_color(c_aqua);
					path_delete_point(path, i);
				}
				else
				if((xpp < xp and xpm == xp) or (ypp < yp and ypm == yp)){
					//draw_set_color(c_aqua);
					path_delete_point(path, i);
				}
			}
		}
	}