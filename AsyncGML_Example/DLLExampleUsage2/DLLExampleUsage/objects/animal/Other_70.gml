if (!ds_exists(async_load, ds_type_map)){
    show_debug_message("Async_load doesn't exist?");
    return;
}

/*if(global.DESTROY){
	global.DESTROY = false;
	ds_map_destroy(async_load);
	return;
}*/

if(async_load[? "requestID"] != requestID) return;

if(async_load[? "timedOut"]){
	displayText = "Not reachable";
	return;
}

if(movementPath != -1){
    path_delete(movementPath);
}

displayText = "Found a path!";
var size = async_load[? "pathWaypoints"];
movementPath = path_add();
for(var i = size-1; i > 0; i--){
    var xp = async_load[? ("position" + string(i) + "valueX")];
    var yp = async_load[? ("position" + string(i) + "valueY")];
    path_add_point(movementPath, xp, yp, 1);
}

//There is no need to destroy the async_load ds_map as this is handled for you by GameMaker: Studio. https://docs.yoyogames.com/source/dadiospice/001_advanced%20use/more%20about%20async%20events/steam.html
//ds_map_destroy(async_load);

requestID = -1;

ii = instance_create_depth(0,0,-1,path_drawer);
ii.path = movementPath;