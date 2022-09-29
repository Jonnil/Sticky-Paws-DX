//Developed by Eray Zesen (c) 2020-2021 erayzesen.itch.io

///@function scr_raycast(xx, yy, dir, length, per_pixel, object, tilemap_layer_name, precise_mode)
///@param {int} xx	 start position x
///@param {int} yy	 start position y
///@param {int} dir		 angle of the ray
///@param {int} [lenght = 100]	 length of the ray
///@param {int} [per_pixel = 16]	 check per pixel
///@param [object]	 target object or objects array
///@param {string} [tilemap_layer_name]	target tilemap layer name
///@param {bool} [precise_mode] for the precise mask collisions(slow)
///@return {raycast_data}

function scr_raycast(xx = x, yy = y, dir = 90, length = 380, per_pixel = 16, object = obj_wall, tilemap_layer_name = "", precise_mode = false)
{
	
	/* Precise Mode required when you use collision mask shapes except the square on the objects */
	if (precise_mode == undefined)
	{
		precise_mode = false;
	}
	
	/* tilemap_layer_name is optional */
	if (tilemap_layer_name == undefined || tilemap_layer_name == noone)
	{
		tilemap_layer_name = "";
	}
	/* Current Positions */
	var cx = xx;
	var cy = yy;
	
	/* We will return this */
	raycast_data =
	{
		type : rc_type.nothing, /* all options nothing, tilemap, object */
		index : noone, /* instance id or tilemap index of the collision */
		x : -1, /* collision position x */
		y : -1 /* collision position y */
	}

	/* Checking tilemap_layer_name argument */
	var no_tilemaps = true;
	if (tilemap_layer_name != "")
	{
		var layer_id = layer_get_id(tilemap_layer_name);
		var tilemap_id = layer_tilemap_get_id(layer_id);
		no_tilemaps = false;
	}
	
	/* Playing while loop to check ray collisions */
	while(point_distance(xx, yy, cx, cy) < length)
	{
		cx += lengthdir_x(per_pixel, dir);
		cy += lengthdir_y(per_pixel, dir);
		/* For Tilemap */
		if (no_tilemaps == false)
		{
			var col_tile = tilemap_get_at_pixel(tilemap_id, cx, cy);
			if (col_tile > 0)
			{
				/* Setting true positions of collision */
				while(tilemap_get_at_pixel(tilemap_id, cx, cy))
				{
					cx -= lengthdir_x(1, dir);
					cy -= lengthdir_y(1, dir);
				}
				/* We finded a collision and we're setting raycast_data */
				raycast_data.type = rc_type.tilemap;
				raycast_data.index = col_tile;
				raycast_data.x = cx;
				raycast_data.y = cy;
				break;
			}
		}
		/* For Objects */
		if (is_array(object))
		{
			var obj_finded = false;
			var i;
			for(i = 0; i < array_length(object); i++)
			{
				var obj = object[i];
				var col_obj = collision_point(cx, cy, obj, precise_mode, true);
				if (col_obj != noone)
				{
					/* Setting true positions of collision */
					while(collision_point(cx, cy, obj, precise_mode, true) != noone)
					{
						cx -= lengthdir_x(1, dir);
						cy -= lengthdir_y(1, dir);
					}
					/* We finded a collision and we're setting raycast_data */
					raycast_data.type = rc_type.object;
					raycast_data.index = col_obj;
					raycast_data.x = cx;
					raycast_data.y = cy;
					obj_finded = true;
					break;
				}
			}
			if (obj_finded)
			{
				break;
			}
		}
		else
		if (object != noone)
		{
			var col_obj = collision_point(cx, cy, object, precise_mode, true);
			if (col_obj != noone)
			{
				/* Setting true positions of collision */
				while(collision_point(cx, cy, object, precise_mode, true) != noone)
				{
					cx -= lengthdir_x(1, dir);
					cy -= lengthdir_y(1, dir);
				}
				/* We finded a collision and we're setting raycast_data */
				raycast_data.type = rc_type.object;
				raycast_data.index = col_obj;
				raycast_data.x = cx;
				raycast_data.y = cy;
				break;
			}
		}
	}
	if (raycast_data.type == rc_type.nothing)
	{
		raycast_data.x = cx;
		raycast_data.y = cy;
	}
	return raycast_data;
}
/* Raycast Types */
enum rc_type
{
	nothing,
	tilemap,
	object
}