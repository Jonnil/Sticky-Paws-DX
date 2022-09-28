///Post -Draw Event

#region /*End Game*/
if (quit_level_editor >= true)
{
	quit_level_editor += 1;
	instance_activate_all(); /*Activate all instances before saving the custom level*/
	
	#region /*Save Thumbnail*/
	if (quit_level_editor == 3)
	{
		
		#region /*Limit so cursor and view can't go outside room*/
		if (camera_get_view_width(view_camera[view_current]) < 1920)
		or(camera_get_view_height(view_camera[view_current]) < 1080)
		{
			camera_set_view_size(view_camera[view_current], 1920, 1080);
		}
		scr_set_screen_size();
		#region /*Limit controller x and controller y inside room*/
		if (controller_x < camera_get_view_x(view_camera[view_current]))
		{
			controller_x = camera_get_view_x(view_camera[view_current]);
		}
		if (controller_x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		{
			controller_x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
		}
		if (controller_y < camera_get_view_y(view_camera[view_current]))
		{
			controller_y = camera_get_view_y(view_camera[view_current]);
		}
		if (controller_y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		{
			controller_y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]);
		}
		#endregion /*Limit controller x and controller y inside room END*/
		#region /*Limit x and y inside room*/
		if (x < camera_get_view_x(view_camera[view_current]))
		{
			x = camera_get_view_x(view_camera[view_current]);
		}
		if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		{
			x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
		}
		if (y < camera_get_view_y(view_camera[view_current]))
		{
			y = camera_get_view_y(view_camera[view_current]);
		}
		if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		{
			y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]);
		}
		#endregion /*Limit x and y inside room END*/
		#region /*Limit view inside room*/
		camera_set_view_pos(view_camera[view_current],
		max(0, min(camera_get_view_x(view_camera[view_current]), room_width - camera_get_view_width(view_camera[view_current]))),
		max(0, min(camera_get_view_y(view_camera[view_current]), room_height - camera_get_view_height(view_camera[view_current]))));
		#endregion /*Limit view inside room END*/
		#endregion /*Limit so view and cursor can't go outside room END*/
		
		global.x_checkpoint = 0;
		global.y_checkpoint = 0;
		global.checkpoint_millisecond = 0;
		global.checkpoint_second = 0;
		global.checkpoint_minute = 0;
		global.checkpoint_realmillisecond = 0;
		
		ini_open(working_directory + "/save_files/custom_level_save.ini");
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "x_checkpoint", 0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "y_checkpoint", 0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_millisecond", 0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_second", 0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_minute", 0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_realmillisecond", 0);
		ini_close();
		
		#region /*Save Thumbnail*/
		var thumbnail_sprite;
		thumbnail_sprite = sprite_create_from_surface(application_surface,
		camera_get_view_x(view_camera[view_current]),
		camera_get_view_y(view_camera[view_current]),
		camera_get_view_width(view_camera[view_current]),
		camera_get_view_height(view_camera[view_current]), false, true, 0, 0);
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		{
			sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/automatic_thumbnail.png");
		}
		else
		if (global.level_name != "")
		{
			sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
		}
		sprite_delete(thumbnail_sprite);
		#endregion /*Save Thumbnail END*/
		
		menu_delay = 9999; /*Disable all menu control*/
		scr_save_custom_level();
		lives = 5;
		global.lives_until_assist = 0;
		global.actually_play_edited_level = false;
		global.play_edited_level = false; /*Set this to false so you don't playtest the level*/
		global.character_select_in_this_menu = "level_editor";
	}
	#endregion /*Save Thumbnail END*/
	
	if (quit_level_editor > 5)
	{
		global.create_level_from_template = false; /*Disable global.create_level_from_template after loading everything and quitting the level editor, to let every object have time to load and save*/
		global.level_name = "";
		global.select_level_index = 0;
		room_goto(room_title);
	}
}
#endregion /*End Game END*/