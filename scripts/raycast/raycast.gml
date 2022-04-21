//Developed by Eray Zesen (c) 2020-2021 erayzesen.itch.io

///@function raycast(_x,_y,_dir,_length,_per_pixel,_object,_tilemap_layer_name,_precise_mode)
///@param {int} _x	 start position x
///@param {int} _y	 start position y
///@param {int} _dir		 angle of the ray
///@param {int} [_lenght=100]	 length of the ray
///@param {int} [_per_pixel=16]	 check per pixel
///@param [_object]	 target object or objects array
///@param {string} [_tilemap_layer_name]	target tilemap layer name
///@param {bool} [_precise_mode] for the precise mask collisions(slow)
///@return {raycast_data}	
function raycast(_x,_y,_dir,_length,_per_pixel,_object,_tilemap_layer_name,_precise_mode) {
	
	//Precise Mode required when you use collision mask shapes except the square on the objects
	if(_precise_mode==undefined)_precise_mode=false;
	
	//_tilemap_layer_name is optional.  
	if(_tilemap_layer_name==undefined || _tilemap_layer_name==noone)_tilemap_layer_name="";
	//Saving first position
	var sx=_x;
	var sy=_y;
	//Current Positions
	var cx=_x;
	var cy=_y;
	
	//We will return this
	raycast_data={
		type : rc_type.nothing, //all options nothing,tilemap,object
		index : noone, //instance id or tilemap index of the collision
		x : -1, // collision position x
		y : -1 //collision position y
	}

	//Checking _tilemap_layer_name argument
	var no_tilemaps=true;
	if(_tilemap_layer_name!=""){
		var layer_id=layer_get_id(_tilemap_layer_name);
		var tilemap_id=layer_tilemap_get_id(layer_id);
		no_tilemaps=false;
	}
	
	//Playing while loop to check ray collisions
	while(point_distance(_x,_y,cx,cy)<_length){
		cx+=lengthdir_x(_per_pixel,_dir);
		cy+=lengthdir_y(_per_pixel,_dir);
		//For Tilemap
		if(no_tilemaps==false){
			var col_tile=tilemap_get_at_pixel(tilemap_id,cx,cy);
			if(col_tile>0){
				//Setting true positions of collision
				while(tilemap_get_at_pixel(tilemap_id,cx,cy)){
					cx-=lengthdir_x(1,_dir);
					cy-=lengthdir_y(1,_dir);
				}
				//We finded a collision and we're setting raycast_data
				raycast_data.type=rc_type.tilemap;
				raycast_data.index=col_tile;
				raycast_data.x=cx;
				raycast_data.y=cy;
				break;
			}
		}
		//For Objects
		if(is_array(_object)){
			var obj_finded=false;
			var i;
			for(i=0;i<array_length(_object);i++){
				var obj=_object[i];
				var col_obj=collision_point(cx,cy,obj,_precise_mode,true);
				if(col_obj!=noone){
					//Setting true positions of collision
					while(collision_point(cx,cy,obj,_precise_mode,true)!=noone){
						cx-=lengthdir_x(1,_dir);
						cy-=lengthdir_y(1,_dir);
					}
					//We finded a collision and we're setting raycast_data
					raycast_data.type=rc_type.object;
					raycast_data.index=col_obj;
					raycast_data.x=cx;
					raycast_data.y=cy;
					obj_finded=true;
					break;
				}
			}
			if(obj_finded)break;
		}else if(_object!=noone){
			var col_obj=collision_point(cx,cy,_object,_precise_mode,true);
			if(col_obj!=noone){
				//Setting true positions of collision
				while(collision_point(cx,cy,_object,_precise_mode,true)!=noone){
					cx-=lengthdir_x(1,_dir);
					cy-=lengthdir_y(1,_dir);
				}
				//We finded a collision and we're setting raycast_data
				raycast_data.type=rc_type.object;
				raycast_data.index=col_obj;
				raycast_data.x=cx;
				raycast_data.y=cy;
				break;
			}
		}
	}
	if(raycast_data.type==rc_type.nothing){
		raycast_data.x=cx;
		raycast_data.y=cy;
	}

	return raycast_data;


}
//Raycast Types
enum rc_type{
	nothing,
	tilemap,
	object
}




