scr_set_screen_size();
scr_toggle_fullscreen();
scr_set_controls_used_to_navigate();

if (goto_title_screen)
{
	room_goto(rm_title);
}

#region /* Skip company logo screen when pressing skip button */
if (gamepad_button_check_pressed(global.player_slot[1], gp_face1))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_face2))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_start))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_select))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face1))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face2))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_start))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_select))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face1))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face2))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_start))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_select))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face1))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face2))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_start))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_select))
|| (keyboard_check_pressed(vk_anykey))
|| (window_has_focus())
&& (mouse_check_button_released(mb_any))
{
	if (can_navigate)
	&& (show_skip_button == false)
	{
		if (gamepad_button_check_pressed(global.player_slot[1], gp_face1))
		|| (gamepad_button_check_pressed(global.player_slot[2], gp_face1))
		|| (gamepad_button_check_pressed(global.player_slot[3], gp_face1))
		|| (gamepad_button_check_pressed(global.player_slot[4], gp_face1))
		{
			skip_button = gp_face1;
		}
		else
		if (gamepad_button_check_pressed(global.player_slot[1], gp_face2))
		|| (gamepad_button_check_pressed(global.player_slot[2], gp_face2))
		|| (gamepad_button_check_pressed(global.player_slot[3], gp_face2))
		|| (gamepad_button_check_pressed(global.player_slot[4], gp_face2))
		{
			skip_button = gp_face2;
		}
		if (gamepad_button_check_pressed(global.player_slot[1], gp_start))
		|| (gamepad_button_check_pressed(global.player_slot[2], gp_start))
		|| (gamepad_button_check_pressed(global.player_slot[3], gp_start))
		|| (gamepad_button_check_pressed(global.player_slot[4], gp_start))
		{
			skip_button = gp_start;
		}
		else
		if (gamepad_button_check_pressed(global.player_slot[1], gp_select))
		|| (gamepad_button_check_pressed(global.player_slot[2], gp_select))
		|| (gamepad_button_check_pressed(global.player_slot[3], gp_select))
		|| (gamepad_button_check_pressed(global.player_slot[4], gp_select))
		{
			skip_button = gp_select;
		}
		
		if (keyboard_check_pressed(vk_enter))
		{
			skip_key = vk_enter;
		}
		else
		if (keyboard_check_pressed(vk_escape))
		{
			skip_key = vk_escape;
		}
		else
		if (keyboard_check_pressed(vk_space))
		{
			skip_key = vk_space;
		}
		else
		if (keyboard_check_pressed(ord("X")))
		{
			skip_key = ord("X");
		}
		else
		if (keyboard_check_pressed(ord("Z")))
		{
			skip_key = ord("Z");
		}
		show_skip_button = true;
	}
	else
	if (can_navigate) /* Can only go to the title screen when everything is loaded */
	{
		goto_title_screen = true;
	}
}
#endregion /* Skip company logo screen when pressing skip button END */

#region /* Go to "made with gamemaker" when company logo is done showing */
if (image_index > image_number - 2)
&& (sprite_index == spr_company_logo)
{
	sprite_index = spr_made_with_gamemaker;
	image_index = 0;
	time = 0;
}
#endregion /* Go to "made with gamemaker" when company logo is done showing END */

#region /* Go to the title screen automatically when "made with gamemaker" and controller prompt is done showing */
if (sprite_index == spr_made_with_gamemaker)
{
	time ++;
	if (time > 200)
	{
		if (!gamepad_is_connected(global.player_slot[1])) /* If there are no controllers connected to the game, then show a controller prompt to let players know they can use controllers */
		&& (!gamepad_is_connected(global.player_slot[2]))
		&& (!gamepad_is_connected(global.player_slot[3]))
		&& (!gamepad_is_connected(global.player_slot[4]))
		{
			if (global.resource_pack_sprite_splash_controller >= 0) /* Check if the controller splash sprite exists before trying to switch sprite to it */
			{
				time = 0;
				sprite_index = global.resource_pack_sprite_splash_controller;
			}
			else
			if (can_navigate) /* Can only go to the title screen when everything is loaded */
			{
				goto_title_screen = true;
			}
		}
		else
		if (can_navigate) /* Can only go to the title screen when everything is loaded */
		{
			goto_title_screen = true;
		}
	}
	image_speed = 0.2;
}
#endregion /* Go to the title screen automatically when "made with gamemaker" and controller prompt is done showing END */

#region /* If controller splash sprite is currently used, then go to the title screen after a couple of seconds */
if (global.resource_pack_sprite_splash_controller > noone)
&& (sprite_index == global.resource_pack_sprite_splash_controller)
{
	if (!audio_is_playing(controller_splash)) /* If there is no controller splash voice playing, then advance the timer */
	{
		time ++;
	}
	if (time > 100) /* After a couple of seconds, go to the title screen */
	&& (!audio_is_playing(controller_splash))
	&& (can_navigate) /* Can only go to the title screen when everything is loaded */
	{
		goto_title_screen = true;
	}
	image_speed = 0.2;
}
#endregion /* If controller splash sprite is currently used, then go to the title screen after a couple of seconds END */

#region /* Play company splash voice or controller splash voice if the sounds exists */
if (image_index == 20) /* If company splash sound exists, and is currently not playing, then play company splash sound */
&& (company_splash > noone)
&& (!audio_is_playing(company_splash))
{
	scr_audio_play(company_splash, volume_source.voice);
}
if (time == 10) /* If controller splash sound exists, and is currently not playing, then play controller splash sound */
&& (controller_splash > noone)
&& (!audio_is_playing(controller_splash))
&& (sprite_index == global.resource_pack_sprite_splash_controller)
{
	scr_audio_play(controller_splash, volume_source.voice);
}
#endregion /* Play company splash voice or controller splash voice if the sounds exists END */

if (can_navigate == false)
{
	file_load_timer ++;
	
	if (global.can_load_official_and_custom_resources)
	{
		
		#region /* Load Characters */
		if (file_load_timer > 1)
		&& (load_ok == 0)
		{
			if (initialized_characters == false)
			{
				scr_load_character_initializing();
				initialized_characters = true;
			}
			file_found = file_find_next()
			if (file_found == "")
			{
				file_find_close();
				
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
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash.ogg"))
					{
						company_splash_1 = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_1.ogg"))
					{
						company_splash_1 = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_1.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash1.ogg"))
					{
						company_splash_1 = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash1.ogg");
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
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_2.ogg"))
					{
						company_splash_2 = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_2.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash2.ogg"))
					{
						company_splash_2 = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash2.ogg");
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
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_3.ogg"))
					{
						company_splash_3 = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash_3.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash3.ogg"))
					{
						company_splash_3 = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash3.ogg");
					}
					else
					{
						company_splash_3 = noone;
					}
					#endregion /* Company Splash 3 END */
					
					if (company_splash_1 > noone)
					&& (company_splash_2 == noone)
					&& (company_splash_3 == noone)
					{
						company_splash = choose(company_splash_1);
					}
					else
					if (company_splash_1 > noone)
					&& (company_splash_2 > noone)
					&& (company_splash_3 == noone)
					{
						company_splash = choose(company_splash_1, company_splash_2);
					}
					else
					if (company_splash_1 > noone)
					&& (company_splash_2 > noone)
					&& (company_splash_3 > noone)
					{
						company_splash = choose(company_splash_1, company_splash_2, company_splash_3);
					}
					
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/controller_splash.ogg"))
					{
						controller_splash = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/controller_splash.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/controller_splash.ogg"))
					{
						controller_splash = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/controller_splash.ogg");
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
				
				file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
			}
		}
		#endregion /* Load Characters END */
		
		else
		
		#region /* Load Resource Packs */
		if (file_load_timer > 1)
		&& (load_ok == 1)
		{
			if (initialized_resource_pack == false)
			{
				scr_load_resource_pack_initializing();
				initialized_resource_pack = true;
			}
			file_found = file_find_next()
			if (file_found == "")
			{
				file_find_close();
			
				if (directory_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound"))
				&& (!directory_exists("resource_pack/" + "" + "/sound"))
				|| (directory_exists(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound"))
				&& (!directory_exists(working_directory + "custom_resource_pack/" + "" + "/sound"))
				{
					#region /* Sound Add */
					if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/splash_easteregg.ogg"))
					{
						audio_splash_easteregg = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/splash_easteregg.ogg");
					}
					else
					if (file_exists(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/splash_easteregg.ogg"))
					{
						audio_splash_easteregg = audio_create_stream(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/splash_easteregg.ogg");
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
			
				file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
			}
		}
		#endregion /* Load Resource Packs END */
		
		else
		
		#region /* Load Title Backgrounds */
		if (file_load_timer > 1)
		&& (load_ok == 2)
		{
			if (initialized_title_backgrounds == false)
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
				if (file_exists(working_directory + "custom_title_background/" + file_found))
				{
					ds_list_add(global.all_loaded_title_backgrounds, file_found)
				}
			
				file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
			}
		}
		#endregion /* Load Title Background END */
		
		else
		
		#region /* Load Title Logo */
		if (file_load_timer > 1)
		&& (load_ok == 3)
		{
			if (initialized_title_logos == false)
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
				if (file_exists(working_directory + "custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
				{
					global.title_logo_index = sprite_add(working_directory + "custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
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
			
				file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
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
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	if (global.selected_title_background > ds_list_size(global.all_loaded_title_backgrounds) - 1)
	{
		global.selected_title_background = ds_list_size(global.all_loaded_title_backgrounds) - 1;
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "selected_title_background", global.selected_title_background);
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	if (global.selected_title_logo > ds_list_size(global.all_loaded_title_logos) - 1)
	{
		global.selected_title_logo = ds_list_size(global.all_loaded_title_logos) - 1;
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "selected_title_logo", global.selected_title_logo);
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	#endregion /* Set so custom assets can't go above what it finds END */
	
	can_navigate = true;
}

#region /* Show easter egg on company logo screen when pressing specific button */
if (gamepad_button_check_pressed(global.player_slot[1], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face4))
|| (keyboard_check_pressed(ord("Y")))
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