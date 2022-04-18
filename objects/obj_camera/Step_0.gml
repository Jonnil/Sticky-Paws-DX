view_x_center = camera_get_view_x(view_camera[view_current]) + (camera_get_view_width(view_camera[view_current]) / 2);
view_y_center = camera_get_view_y(view_camera[view_current]) + (camera_get_view_height(view_camera[view_current]) / 2);

#region /*Deactivate instances outside view*/
if (delay = 2)
{
	instance_activate_all();
	if (global.deactivate_objects_outsiede_view = true) /*This global variable is for debug purposes, and should always be set to true when playing the game normally*/
	{
		instance_deactivate_region(view_x_center - 1000, view_y_center - 1000, 2000, 2000, false, true);
	}
}
else
{
	delay += 1;
}
#endregion /*Deactivate instances outside view END*/

#region /*Activate objects that always should be active*/
if (asset_get_type("obj_level_player_1_start") == asset_object)
{
	instance_activate_object(obj_level_player_1_start);
}
if (asset_get_type("obj_level_player_2_start") == asset_object)
{
	instance_activate_object(obj_level_player_2_start);
}
if (asset_get_type("obj_level_player_3_start") == asset_object)
{
	instance_activate_object(obj_level_player_3_start);
}
if (asset_get_type("obj_level_player_4_start") == asset_object)
{
	instance_activate_object(obj_level_player_4_start);
}
if (asset_get_type("obj_player") == asset_object)
{
	instance_activate_object(obj_player);
}
if (asset_get_type("obj_player_map") == asset_object)
{
	instance_activate_object(obj_player_map);
}
if (asset_get_type("obj_player_die") == asset_object)
{
	instance_activate_object(obj_player_die);
}
if (asset_get_type("obj_foreground1") == asset_object)
{
	instance_activate_object(obj_foreground1);
}
if (asset_get_type("obj_foreground_above_static_objects") == asset_object)
{
	instance_activate_object(obj_foreground_above_static_objects);
}
if (asset_get_type("obj_foreground2") == asset_object)
{
	instance_activate_object(obj_foreground2);
}
if (asset_get_type("obj_foreground_secret") == asset_object)
{
	instance_activate_object(obj_foreground_secret);
}
if (asset_get_type("obj_background_brightness_gameplay") == asset_object)
{
	instance_activate_object(obj_background_brightness_gameplay);
}
if (asset_get_type("obj_water_level") == asset_object)
{
	instance_activate_object(obj_water_level);
}
if (asset_get_type("obj_level_height") == asset_object)
{
	instance_activate_object(obj_level_height);
}
if (asset_get_type("obj_level_width") == asset_object)
{
	instance_activate_object(obj_level_width);
}
if (asset_get_type("obj_credits") == asset_object)
{
	instance_activate_object(obj_credits);
}
if (asset_get_type("obj_title") == asset_object)
{
	instance_activate_object(obj_title);
}
#endregion /*Activate objects that always should be active END*/

#region /*Make sure the lives counter never goes below 0*/
if (lives < 0)
{
	lives = 0;
}
#endregion /*Make sure the lives counter never goes below 0 END*/

#region /*Spawn Players in multiplayer*/
if (instance_exists(obj_player))
and (global.pause = false)
and (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	if (gamepad_button_check_pressed(0, gp_face1))
	or(keyboard_check_pressed(global.player1_key_jump))
	or(keyboard_check_pressed(global.player1_key2_jump))
	{
		if (player1 <= 0)
		and (can_spawn_player1 = true)
		and (lives > 0)
		{
			if (global.player1_can_play = false)
			{
				global.player1_can_play = true;
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				player1 = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player);
				with(player1)
				{
					custom_character = global.character_for_player_1;
					selected_voice_pack = global.voicepack_for_player_1;
					selected_skin = global.skin_for_player_1;
					player = 1;
				}
			}
		}
		else
		if (lives <= 0)
		{
			global.hud_show_lives = true;
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(1, gp_face1))
	or(keyboard_check_pressed(global.player2_key_jump))
	or(keyboard_check_pressed(global.player2_key2_jump))
	{
		if (player2 <= 0)
		and (can_spawn_player2 = true)
		and (lives > 0)
		{
			if (global.player2_can_play = false)
			{
				global.player2_can_play = true;
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				player2 = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player)
				with(player2)
				{
					custom_character = global.character_for_player_2;
					selected_voice_pack = global.voicepack_for_player_2;
					selected_skin = global.skin_for_player_2;
					player = 2;
				}
			}
		}
		else
		if (lives <= 0)
		{
			global.hud_show_lives = true;
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(2, gp_face1))
	or(keyboard_check_pressed(global.player3_key_jump))
	or(keyboard_check_pressed(global.player3_key2_jump))
	{
		if (player3 <= 0)
		and (can_spawn_player3 = true)
		and (lives > 0)
		{
			if (global.player3_can_play = false)
			{
				global.player3_can_play = true;
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				player3 = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player)
				with(player3)
				{
					custom_character = global.character_for_player_3;
					selected_voice_pack = global.voicepack_for_player_3;
					selected_skin = global.skin_for_player_3;
					player = 3;
				}
			}
		}
		else
		if (lives <= 0)
		{
			global.hud_show_lives = true;
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(3, gp_face1))
	or(keyboard_check_pressed(global.player4_key_jump))
	or(keyboard_check_pressed(global.player4_key2_jump))
	{
		if (player4 <= 0)
		and (can_spawn_player4 = true)
		and (lives > 0)
		{
			if (global.player4_can_play = false)
			{
				global.player4_can_play = true;
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				player4 = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player)
				with(player4)
				{
					custom_character = global.character_for_player_4;
					selected_voice_pack = global.voicepack_for_player_4;
					selected_skin = global.skin_for_player_4;
					player = 4;
				}
			}
		}
		else
		if (lives <= 0)
		{
			global.hud_show_lives = true;
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
}
#endregion /*Spawn Players in multiplayer END*/
