scr_set_screen_size();
scr_toggle_fullscreen();
scr_set_controls_used_to_navigate();

if (goto_title_screen == true)
{
	if (current_month == 12)
	{
		var christmas_logo_index = 4;
		global.selected_title_logo = christmas_logo_index; /* Set the selected title logo to use Christmas logo */
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "selected_title_logo", christmas_logo_index); /* Save in config that game should be using Christmas logo, otherwise it will load the previously saved logo when going to title screen */
		ini_close();
		if (file_exists("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, christmas_logo_index))))
		{
			global.title_logo_index = sprite_add("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, christmas_logo_index)), 1, false, false, 0, 0);
			sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) * 0.5, sprite_get_height(global.title_logo_index) * 0.5);
		}
	}
	if (asset_get_type("room_title") == asset_room) /* Only go to room_title if that room exists */
	{
		room_goto(room_title);
	}
	else
	if (room_next(room) <>- 1) /* Otherwise, just go to the next room that exists */
	{
		room_goto_next();
	}
}

#region /* Skip company logo screen when pressing skip button */
if (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_accept))
or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_accept))
or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_accept))
or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_accept))
or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_accept))
or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_accept))
or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_accept))
or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_accept))
or (keyboard_check_pressed(global.player1_key_accept))
or (keyboard_check_pressed(global.player1_key2_accept))
or (keyboard_check_pressed(global.player2_key_accept))
or (keyboard_check_pressed(global.player2_key2_accept))
or (keyboard_check_pressed(global.player3_key_accept))
or (keyboard_check_pressed(global.player3_key2_accept))
or (keyboard_check_pressed(global.player4_key_accept))
or (keyboard_check_pressed(global.player4_key2_accept))
or (keyboard_check_pressed(vk_space))
or (keyboard_check_pressed(vk_escape))
or (window_has_focus())
and (mouse_check_button_pressed(mb_left))
{
	if (can_navigate == true) /* Can only go to the title screen when everything is loaded */
	{
		goto_title_screen = true;
	}
}
#endregion /* Skip company logo screen when pressing skip button END */

#region /* Go to the title screen automatically when company logos and controller prompt is done showing */
if (image_index > image_number - 2)
and (sprite_index = spr_company_logo)
{
	if (!gamepad_is_connected(global.player1_slot)) /* If there are no controllers connected to the game, then show a controller prompt to let players know they can use controllers */
	and (!gamepad_is_connected(global.player2_slot))
	and (!gamepad_is_connected(global.player3_slot))
	and (!gamepad_is_connected(3))
	{
		if (global.resource_pack_sprite_splash_controller >= 0) /* Check if the controller splash sprite exists before trying to switch sprite to it */
		{
			sprite_index = global.resource_pack_sprite_splash_controller;
		}
		else
		if (can_navigate == true) /* Can only go to the title screen when everything is loaded */
		{
			goto_title_screen = true;
		}
	}
	else
	if (can_navigate == true) /* Can only go to the title screen when everything is loaded */
	{
		goto_title_screen = true;
	}
	image_index = image_number - 2;
}
#endregion /* Go to the title screen automatically when company logos and controller prompt is done showing END */

#region /* If controller splash sprite is currently used, then go to the title screen after a couple of seconds */
if (global.resource_pack_sprite_splash_controller > noone)
and (sprite_index == global.resource_pack_sprite_splash_controller)
{
	if (!audio_is_playing(controller_splash)) /* If there is no controller splash voice playing, then advance the timer */
	{
		time += 1;
	}
	if (time > 100) /* After a couple of seconds, go to the title screen */
	and (!audio_is_playing(controller_splash))
	and (can_navigate == true) /* Can only go to the title screen when everything is loaded */
	{
		goto_title_screen = true;
	}
}
#endregion /* If controller splash sprite is currently used, then go to the title screen after a couple of seconds END */

#region /* Play company splash voice or controller splash voice if the sounds exists */
if (image_index == 20) /* If company splash sound exists, and is currently not playing, then play company splash sound */
and (company_splash > noone)
and (!audio_is_playing(company_splash))
{
	scr_audio_play(company_splash, volume_source.voice);
}
if (time == 10) /* If controller splash sound exists, and is currently not playing, then play controller splash sound */
and (controller_splash > noone)
and (!audio_is_playing(controller_splash))
{
	scr_audio_play(controller_splash, volume_source.voice);
}
#endregion /* Play company splash voice or controller splash voice if the sounds exists END */

if (can_navigate = false)
{
	file_load_timer += 1;
	
	if (global.can_load_official_and_custom_resources == true)
	{
		
		#region /* Load Characters */
		if (file_load_timer > 1)
		and (load_ok == 0)
		{
			if (initialized_characters = false)
			{
				scr_load_character_initializing();
				initialized_characters = true;
			}
			file_found = file_find_next()
			if (file_found == "")
			{
				file_find_close();
				scr_load_all_character_portraits();
			
				#region /* Narrator Voice variable handeling */
			
				#region /* No Narrator */
				if (global.narrator = -1)
				{
					company_splash = noone;
					controller_splash = noone;
				}
				#endregion /* No Narrator END */
			
				else
			
				#region /* Character as Narrator */
				if (global.narrator >= 0)
				{
				
					#region /* Company Splash 1 */
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash.ogg"))
					{
						company_splash_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_1.ogg"))
					{
						company_splash_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_1.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash1.ogg"))
					{
						company_splash_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash1.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash.ogg"))
					{
						company_splash_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_1.ogg"))
					{
						company_splash_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_1.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash1.ogg"))
					{
						company_splash_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash1.ogg");
					}
					else
					{
						company_splash_1 = noone;
					}
					#endregion /* Company Splash 1 END */
				
					#region /* Company Splash 2 */
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_2.ogg"))
					{
						company_splash_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_2.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash2.ogg"))
					{
						company_splash_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash2.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_2.ogg"))
					{
						company_splash_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_2.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash2.ogg"))
					{
						company_splash_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash2.ogg");
					}
					else
					{
						company_splash_2 = noone;
					}
					#endregion /* Company Splash 2 END */
				
					#region /* Company Splash 3 */
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_3.ogg"))
					{
						company_splash_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_3.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash3.ogg"))
					{
						company_splash_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash3.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_3.ogg"))
					{
						company_splash_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_3.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash3.ogg"))
					{
						company_splash_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash3.ogg");
					}
					else
					{
						company_splash_3 = noone;
					}
					#endregion /* Company Splash 3 END */
				
					if (company_splash_1 > noone)
					and (company_splash_2 == noone)
					and (company_splash_3 == noone)
					{
						company_splash = choose(company_splash_1);
					}
					else
					if (company_splash_1 > noone)
					and (company_splash_2 > noone)
					and (company_splash_3 == noone)
					{
						company_splash = choose(company_splash_1, company_splash_2);
					}
					else
					if (company_splash_1 > noone)
					and (company_splash_2 > noone)
					and (company_splash_3 > noone)
					{
						company_splash = choose(company_splash_1, company_splash_2, company_splash_3);
					}
				
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/controller_splash.ogg"))
					{
						controller_splash = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/controller_splash.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/controller_splash.ogg"))
					{
						controller_splash = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/controller_splash.ogg");
					}
					else
					{
						controller_splash = noone;
					}
				}
				#endregion /* Character as Narrator END */
			
				#endregion /* Narrator Voice variable handeling END */
			
				load_ok = 1;
			}
			else
			{
				if (file_exists(working_directory + "custom_characters/" + file_found + "/data/character_config.ini"))
				{
					ds_list_add(global.all_loaded_characters, file_found);
				}
			
				file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
			}
		}
		#endregion /* Load Characters END */
		
		else
		
		#region /* Load Resource Packs */
		if (file_load_timer > 1)
		and (load_ok == 1)
		{
			if (initialized_resource_pack = false)
			{
				scr_load_resource_pack_initializing();
				initialized_resource_pack = true;
			}
			file_found = file_find_next()
			if (file_found == "")
			{
				file_find_close();
			
				if (directory_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound"))
				and (!directory_exists("resource_pack/" + "" + "/sound"))
				or (directory_exists(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound"))
				and (!directory_exists(working_directory + "/custom_resource_pack/" + "" + "/sound"))
				{
					#region /* Sound Add */
					if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/splash_easteregg.ogg"))
					{
						audio_splash_easteregg = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/splash_easteregg.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/splash_easteregg.ogg"))
					{
						audio_splash_easteregg = audio_create_stream(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/splash_easteregg.ogg");
					}
					#endregion /* Sound Add END */
				}
				scr_load_resource_pack_sprite();
				load_ok = 2;
			}
			else
			{
				if (file_exists(working_directory + "custom_resource_pack/" + file_found + "/data/sprite_origin_point.ini"))
				{
					ds_list_add(global.all_loaded_resource_pack, file_found)
				}
			
				file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
			}
		}
		#endregion /* Load Resource Packs END */
		
		else
		
		#region /* Load Title Backgrounds */
		if (file_load_timer > 1)
		and (load_ok = 2)
		{
			if (initialized_title_backgrounds = false)
			{
				scr_load_title_background_initializing();
				initialized_title_backgrounds = true;
			}
			file_found = file_find_next()
			if (file_found == "")
			{
				file_find_close();
				load_ok = 3;
			}
			else
			{
				if (file_exists(working_directory + "custom_title_backgrounds/" + file_found))
				{
					ds_list_add(global.all_loaded_title_backgrounds, file_found)
				}
			
				file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
			}
		}
		#endregion /* Load Title Background END */
		
		else
		
		#region /* Load Title Logo */
		if (file_load_timer > 1)
		and (load_ok = 3)
		{
			if (initialized_title_logos = false)
			{
				scr_load_title_logo_initializing();
				initialized_title_logos = true;
			}
			file_found = file_find_next()
			if (file_found == "")
			{
				file_find_close();
				if (file_exists("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
				{
					global.title_logo_index = sprite_add("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
					sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) * 0.5, sprite_get_height(global.title_logo_index) * 0.5);
				}
				else
				if (file_exists(working_directory + "/custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
				{
					global.title_logo_index = sprite_add(working_directory + "/custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
					sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) * 0.5, sprite_get_height(global.title_logo_index) * 0.5);
				}
				else
				{
					global.title_logo_index = spr_noone;
				}
				load_ok = 4;
			}
			else
			{
				if (file_exists(working_directory + "custom_title_logos/" + file_found))
				{
					ds_list_add(global.all_loaded_title_logos, file_found)
				}
			
				file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
			}
		}
		#endregion /* Load Title Logo END */
		
	}
	else
	{
		load_ok = 4;
	}
	
}

if (load_ok >= 4)
{
	
	#region /* Set so custom assets can't go above what it finds */
	if (global.selected_resource_pack > ds_list_size(global.all_loaded_resource_pack) - 1)
	{
		global.selected_resource_pack = ds_list_size(global.all_loaded_resource_pack) - 1;
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "selected_resource_pack", global.selected_resource_pack);
		ini_close();
	}
	if (global.selected_title_background > ds_list_size(global.all_loaded_title_backgrounds) - 1)
	{
		global.selected_title_background = ds_list_size(global.all_loaded_title_backgrounds) - 1;
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "selected_title_background", global.selected_title_background);
		ini_close();
	}
	if (global.selected_title_logo > ds_list_size(global.all_loaded_title_logos) - 1)
	{
		global.selected_title_logo = ds_list_size(global.all_loaded_title_logos) - 1;
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "selected_title_logo", global.selected_title_logo);
		ini_close();
	}
	#endregion /* Set so custom assets can't go above what it finds END */
	
	can_navigate = true;
}

#region /* Show easter egg on company logo screen when pressing specific button */
if (gamepad_button_check_pressed(global.player1_slot, gp_face4))
or (keyboard_check_pressed(ord("Y")))
and (sprite_splash_easteregg_yoffset = 128)
{
	sprite_splash_easteregg_yoffset = +127;
	if (audio_splash_easteregg > 0)
	{
		scr_audio_play(audio_splash_easteregg, volume_source.voice);
	}
	
}
if (sprite_splash_easteregg_yoffset <= 127) /* Lerp the easter egg movement */
{
	sprite_splash_easteregg_yoffset = lerp(sprite_splash_easteregg_yoffset, - 128, 0.1);
}
#endregion /* Show easter egg on company logo screen when pressing specific button END */