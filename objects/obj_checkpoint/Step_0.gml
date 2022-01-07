if (global.x_checkpoint = x)
and(global.y_checkpoint = y)
{
	image_index = 1;
	image_speed = 0;
}
if (asset_get_type("obj_player")==asset_object)
and(instance_exists(obj_player))
{
	if (instance_nearest(x,y,obj_player).x>x-32)
	and(instance_nearest(x,y,obj_player).x<x+32)
	and(instance_nearest(x,y,obj_player).y<y)
	or(place_meeting(x,y,instance_nearest(x,y,obj_player)))
	{
		if (asset_get_type("obj_wall")==asset_object)
		and(!collision_line(x,y,instance_nearest(x,y,obj_player).x,instance_nearest(x,y,obj_player).y,obj_wall,false,true))
		{
			if (image_index=0)
			{
				image_index=1;
				image_speed=0;
				with(instance_nearest(x,y,obj_player))
				{
					hp+=1;
				}
				effect_create_below(ef_ring,x,y,2,c_white);
				
				#region /*Collect 10 basic collectibles*/
				if (asset_get_type("obj_basic_collectible")==asset_object)
				{
					if (asset_get_type("snd_basic_collectible")==asset_sound)
					{
						audio_play_sound(snd_basic_collectible,0,0);
					}
					var obj;
					obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
					with(obj)
					{
						image_speed=1;
						motion_set(90,10);
						bounceup=true;
					}
					obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
					with(obj)
					{
						image_speed=1;
						motion_set(90,10);
						bounceup=true;
						delay_time=10;
					}
					obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
					with(obj)
					{
						image_speed=1;
						motion_set(90,10);
						bounceup=true;
						delay_time=20;
					}
					obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
					with(obj)
					{
						image_speed=1;
						motion_set(90,10);
						bounceup=true;
						delay_time=30;
					}
					obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
					with(obj)
					{
						image_speed=1;
						motion_set(90,10);
						bounceup=true;
						delay_time=40;
					}
					obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
					with(obj)
					{
						image_speed=1;
						motion_set(90,10);
						bounceup=true;
						delay_time=50;
					}
					obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
					with(obj)
					{
						image_speed=1;
						motion_set(90,10);
						bounceup=true;
						delay_time=60;
					}
					obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
					with(obj)
					{
						image_speed=1;
						motion_set(90,10);
						bounceup=true;
						delay_time=70;
					}
					obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
					with(obj)
					{
						image_speed=1;
						motion_set(90,10);
						bounceup=true;
						delay_time=80;
					}
					obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
					with(obj)
					{
						image_speed=1;
						motion_set(90,10);
						bounceup=true;
						delay_time=90;
					}
					
					#region /*2000 Score*/
					score+=2000;
					if (asset_get_type("obj_scoreup")==asset_object)
					{
						obj=instance_create_depth(x, y, 0, obj_scoreup);
						with(obj)
						{
							scoreup=2000;
						}
					}
					#endregion /*2000 Score END*/
					
					#region /*Checkpoint text when touching the checkpoint, so everybody knows that this is a checkpoint. Make sure it gets translated into other languages too*/
					if (asset_get_type("obj_scoreup")==asset_object)
					{
						obj=instance_create_depth(x,y-20,0,obj_scoreup);
						with(obj)
						{
							scoreup="CHECKPOINT";
						}
					}
					#endregion /*Checkpoint text when touching the checkpoint, so everybody knows that this is a checkpoint. Make sure it gets translated into other languages too END*/
				}
				#endregion /*Collect 10 basic collectibles END*/
				
				global.x_checkpoint = x;
				global.y_checkpoint = y;
				global.checkpoint_millisecond = global.timeattack_millisecond;
				global.checkpoint_second = global.timeattack_second;
				global.checkpoint_minute = global.timeattack_minute;
				global.checkpoint_realmillisecond = global.timeattack_realmillisecond;
				
				#region /*Save Level Editor Checkpoint*/
				if (asset_get_type("room_leveleditor")==asset_room)
				and (room = room_leveleditor)
				and (global.character_select_in_this_menu = "main_game")
				and (global.actually_play_edited_level = true)
				{
					ini_open(working_directory+"/File" + string(global.file) + ".ini");
					ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"x_checkpoint",x);
					ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"y_checkpoint",y);
					ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"checkpoint_millisecond",global.timeattack_millisecond);
					ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"checkpoint_second",global.timeattack_second);
					ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"checkpoint_minute",global.timeattack_minute);
					ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"checkpoint_realmillisecond",global.timeattack_realmillisecond);
					ini_close();
				}
				else
				if (asset_get_type("room_leveleditor")==asset_room)
				and (room = room_leveleditor)
				and (global.character_select_in_this_menu = "level_editor")
				and (global.actually_play_edited_level = true)
				{
					ini_open(working_directory+"/custom_level_save.ini");
					ini_write_real(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index),"x_checkpoint",x);
					ini_write_real(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index),"y_checkpoint",y);
					ini_write_real(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index),"checkpoint_millisecond",global.timeattack_millisecond);
					ini_write_real(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index),"checkpoint_second",global.timeattack_second);
					ini_write_real(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index),"checkpoint_minute",global.timeattack_minute);
					ini_write_real(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index),"checkpoint_realmillisecond",global.timeattack_realmillisecond);
					ini_close();
				}
				#endregion /*Save Level Editor Checkpoint END*/
				
			}
		}
	}
}