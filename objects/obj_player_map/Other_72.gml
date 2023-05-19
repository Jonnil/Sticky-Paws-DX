var ident = async_load[? "id" ];
var status = async_load[? "status"];
var error = async_load[? "error"];

// Saving 
if (ident == global.saveid)
{
   buffer_delete(global.savebuff);
   show_debug_message("saved data status " + string(status) + " error " + string(error));
}
else if (ident == global.loadid)
{
   var buffstring = buffer_read(global.loadbuff, buffer_string);
   ini_open_from_string(buffstring);

brand_new_file = ini_read_real("Player", "brand_new_file", true);
	
	#region /* Load Player Position */
	if (ini_read_real("Player", "player_x", 0) > 0)
	and (ini_read_real("Player", "player_y", 0) > 0)
	{
		x = ini_read_real("Player", "player_x", 0);
		y = ini_read_real("Player", "player_y", 0);
		obj_camera_map.x = ini_read_real("Player", "player_x", 0);
		obj_camera_map.y = ini_read_real("Player", "player_y", 0);
		xx = ini_read_real("Player", "player_x", 0);
		yy = ini_read_real("Player", "player_y", 0);
		if (instance_exists(obj_level))
		and (position_meeting(x, y, obj_level))
		{
			x = instance_nearest(x, y, obj_level).x;
			y = instance_nearest(x, y, obj_level).y;
			xx = instance_nearest(x, y, obj_level).x;
			yy = instance_nearest(x, y, obj_level).y;
		}
	}
	#endregion /* Load Player Position END */
	
	xx_heart = x;
	yy_heart = y - 64;
	
	#region /* Have Heart Balloon */
	if (player == 1)
	{
		if (ini_key_exists("Player", "player_1_have_heart_balloon"))
		{
			have_heart_balloon = ini_read_real("Player", "player_1_have_heart_balloon", false); /* If you have the heart balloon upgrade or not */
		}
		else
		{
			ini_write_real("Player", "player_1_have_heart_balloon", false);
			have_heart_balloon = false; /* If you have the heart balloon upgrade or not. You start without it */
		}
	}
	if (player == 2)
	{
		if (ini_key_exists("Player", "player_2_have_heart_balloon"))
		{
			have_heart_balloon = ini_read_real("Player", "player_2_have_heart_balloon", false); /* If you have the heart balloon upgrade or not */
		}
		else
		{
			ini_write_real("Player", "player_2_have_heart_balloon", false);
			have_heart_balloon = false; /* If you have the heart balloon upgrade or not. You start without it */
		}
	}
	if (player == 3)
	{
		if (ini_key_exists("Player", "player_3_have_heart_balloon"))
		{
			have_heart_balloon = ini_read_real("Player", "player_3_have_heart_balloon", false); /* If you have the heart balloon upgrade or not */
		}
		else
		{
			ini_write_real("Player", "player_3_have_heart_balloon", false);
			have_heart_balloon = false; /* If you have the heart balloon upgrade or not. You start without it */
		}
	}
	if (player == 4)
	{
		if (ini_key_exists("Player", "player_4_have_heart_balloon"))
		{
			have_heart_balloon = ini_read_real("Player", "player_4_have_heart_balloon", false); /* If you have the heart balloon upgrade or not */
		}
		else
		{
			ini_write_real("Player", "player_4_have_heart_balloon", false);
			have_heart_balloon = false; /* If you have the heart balloon upgrade or not. You start without it */
		}
	}
	#endregion /* Have Heart Balloon END */
	
	
   ini_close();
   buffer_delete(global.loadbuff);
   show_debug_message("read string from buffer " + buffstring);
}