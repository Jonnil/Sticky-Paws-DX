function scr_load_all_character_portraits()
{
	
	#region /*Character select portrait x and y origin points*/
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini"))
	or(file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini"))
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini"))
		{
			ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini");
		}
		else
		{
			ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini");
		}
		
		#region /*Character select portrait x and y origin points*/
		#region /*Character select portrait y origin point*/
		if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
		{
			character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
		}
		else
		{
			character_select_portrait_yorig = 0;
		}
		#endregion /*Character select portrait y origin point END*/
		
		#region /*Character select portrait x origin point*/
		if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
		{
			character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
		}
		else
		{
			character_select_portrait_xorig = 0;
		}
		#endregion /*Character select portrait x origin point END*/
		#endregion /*Character select portrait x and y origin points END*/
		
		#region /*Sprite stand x and y origin points*/
		#region /*Sprite stand y origin point*/
		if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
		{
			sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
		}
		else
		{
			sprite_stand_yorig = 0;
		}
		#endregion /*Sprite stand y origin point END*/
		
		#region /*Sprite stand x origin point*/
		if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
		{
			sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
		}
		else
		{
			sprite_stand_xorig = 0;
		}
		#endregion /*Sprite stand x origin point END*/
		#endregion /*Sprite stand x and y origin points END*/
		
		#region /*Sprite walk x and y origin points*/
		#region /*Sprite walk y origin point*/
		if (ini_key_exists("sprite origin points", "sprite_walk_yorig"))
		{
			sprite_walk_yorig = ini_read_real("sprite origin points", "sprite_walk_yorig", 0);
		}
		else
		{
			sprite_walk_yorig = 0;
		}
		#endregion /*Sprite walk y origin point END*/
		
		#region /*Sprite walk x origin point*/
		if (ini_key_exists("sprite origin points", "sprite_walk_xorig"))
		{
			sprite_walk_xorig = ini_read_real("sprite origin points", "sprite_walk_xorig", 0);
		}
		else
		{
			sprite_walk_xorig = 0;
		}
		#endregion /*Sprite walk x origin point END*/
		#endregion /*Sprite walk x and y origin points END*/
		
		#region /*Character select portrait x_scale and y_scale origin points*/
		#region /*Character select portrait y_scale origin point*/
		if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
		{
			player1_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
		}
		else
		{
			player1_select_portrait_yscale = 1;
		}
		#endregion /*Character select portrait y_scale origin point END*/
		
		#region /*Character select portrait x_scale origin point*/
		if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
		{
			player1_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
		}
		else
		{
			player1_select_portrait_xscale = 1;
		}
		#endregion /*Character select portrait x_scale origin point END*/
		#endregion /*Character select portrait x_scale and y_scale origin points END*/
		
		ini_close();
	}
	else
	{
		character_select_portrait_xorig = 0;
		character_select_portrait_yorig = 0;
		sprite_stand_xorig = 0;
		sprite_stand_yorig = 0;
		sprite_walk_xorig = 0;
		sprite_walk_yorig = 0;
		player1_select_portrait_xscale = 1;
		player1_select_portrait_yscale = 1;
	}
	#endregion /*Character select portrait x and y origin points END*/
	
	#region /*Player 1 character select portrait sprite*/
	global.sprite_select_player_1 = spr_noone;
	global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, sprite_walk_xorig, sprite_walk_yorig, 0, global.skin_for_player_1);
	global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, sprite_stand_xorig, sprite_stand_yorig, 0, global.skin_for_player_1);
	global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, sprite_stand_xorig, sprite_stand_yorig, 0, global.skin_for_player_1);
	global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, character_select_portrait_xorig, character_select_portrait_yorig, 0, global.skin_for_player_1);
	#endregion /*Player 1 character select portrait sprite END*/
	
	#region /*Character select portrait x and y origin points*/
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/data/sprite_origin_point.ini"))
	or(file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/data/sprite_origin_point.ini"))
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/data/sprite_origin_point.ini"))
		{
			ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/data/sprite_origin_point.ini");
		}
		else
		{
			ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/data/sprite_origin_point.ini");
		}
						
		#region /*Character select portrait x and y origin points*/
		#region /*Character select portrait y origin point*/
		if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
		{
			character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
		}
		else
		{
			character_select_portrait_yorig = 0;
		}
		#endregion /*Character select portrait y origin point END*/

		#region /*Character select portrait x origin point*/
		if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
		{
			character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
		}
		else
		{
			character_select_portrait_xorig = 0;
		}
		#endregion /*Character select portrait x origin point END*/
		#endregion /*Character select portrait x and y origin points END*/
						
		#region /*Sprite stand x and y origin points*/
		#region /*Sprite stand y origin point*/
		if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
		{
			sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
		}
		else
		{
			sprite_stand_yorig = 0;
		}
		#endregion /*Sprite stand y origin point END*/

		#region /*Sprite stand x origin point*/
		if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
		{
			sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
		}
		else
		{
			sprite_stand_xorig = 0;
		}
		#endregion /*Sprite stand x origin point END*/
		#endregion /*Sprite stand x and y origin points END*/
		
		#region /*Sprite walk x and y origin points*/
		#region /*Sprite walk y origin point*/
		if (ini_key_exists("sprite origin points", "sprite_walk_yorig"))
		{
			sprite_walk_yorig = ini_read_real("sprite origin points", "sprite_walk_yorig", 0);
		}
		else
		{
			sprite_walk_yorig = 0;
		}
		#endregion /*Sprite walk y origin point END*/
		
		#region /*Sprite walk x origin point*/
		if (ini_key_exists("sprite origin points", "sprite_walk_xorig"))
		{
			sprite_walk_xorig = ini_read_real("sprite origin points", "sprite_walk_xorig", 0);
		}
		else
		{
			sprite_walk_xorig = 0;
		}
		#endregion /*Sprite walk x origin point END*/
		#endregion /*Sprite walk x and y origin points END*/
		
		#region /*Character select portrait x_scale and y_scale origin points*/
		#region /*Character select portrait y_scale origin point*/
		if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
		{
			player2_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
		}
		else
		{
			player2_select_portrait_yscale = 1;
		}
		#endregion /*Character select portrait y_scale origin point END*/

		#region /*Character select portrait x_scale origin point*/
		if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
		{
			player2_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
		}
		else
		{
			player2_select_portrait_xscale = 1;
		}
		#endregion /*Character select portrait x_scale origin point END*/
		#endregion /*Character select portrait x_scale and y_scale origin points END*/
						
		ini_close();
	}
	else
	{
		character_select_portrait_xorig = 0;
		character_select_portrait_yorig = 0;
		sprite_stand_xorig = 0;
		sprite_stand_yorig = 0;
		sprite_walk_xorig = 0;
		sprite_walk_yorig = 0;
		player2_select_portrait_xscale = 1;
		player2_select_portrait_yscale = 1;
	}
	#endregion /*Character select portrait x and y origin points END*/
	
	#region /*Player 2 character select portrait sprite*/
	global.sprite_select_player_2 = spr_noone;
	global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_2, sprite_walk_xorig, sprite_walk_yorig, 1, global.skin_for_player_2);
	global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_2, sprite_stand_xorig, sprite_stand_yorig, 1, global.skin_for_player_2);
	global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_2, sprite_stand_xorig, sprite_stand_yorig, 1, global.skin_for_player_2);
	global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_2, character_select_portrait_xorig, character_select_portrait_yorig, 1, global.skin_for_player_2);
	#endregion /*Player 2 character select portrait sprite END*/
	
	#region /*Character select portrait x and y origin points*/
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/data/sprite_origin_point.ini"))
	or(file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/data/sprite_origin_point.ini"))
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/data/sprite_origin_point.ini"))
		{
			ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/data/sprite_origin_point.ini");
		}
		else
		{
			ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/data/sprite_origin_point.ini");
		}
						
		#region /*Character select portrait x and y origin points*/
		#region /*Character select portrait y origin point*/
		if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
		{
			character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
		}
		else
		{
			character_select_portrait_yorig = 0;
		}
		#endregion /*Character select portrait y origin point END*/

		#region /*Character select portrait x origin point*/
		if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
		{
			character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
		}
		else
		{
			character_select_portrait_xorig = 0;
		}
		#endregion /*Character select portrait x origin point END*/
		#endregion /*Character select portrait x and y origin points END*/
						
		#region /*Sprite stand x and y origin points*/
		#region /*Sprite stand y origin point*/
		if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
		{
			sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
		}
		else
		{
			sprite_stand_yorig = 0;
		}
		#endregion /*Sprite stand y origin point END*/

		#region /*Sprite stand x origin point*/
		if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
		{
			sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
		}
		else
		{
			sprite_stand_xorig = 0;
		}
		#endregion /*Sprite stand x origin point END*/
		#endregion /*Sprite stand x and y origin points END*/
						
		#region /*Sprite walk x and y origin points*/
		#region /*Sprite walk y origin point*/
		if (ini_key_exists("sprite origin points", "sprite_walk_yorig"))
		{
			sprite_walk_yorig = ini_read_real("sprite origin points", "sprite_walk_yorig", 0);
		}
		else
		{
			sprite_walk_yorig = 0;
		}
		#endregion /*Sprite walk y origin point END*/
		
		#region /*Sprite walk x origin point*/
		if (ini_key_exists("sprite origin points", "sprite_walk_xorig"))
		{
			sprite_walk_xorig = ini_read_real("sprite origin points", "sprite_walk_xorig", 0);
		}
		else
		{
			sprite_walk_xorig = 0;
		}
		#endregion /*Sprite walk x origin point END*/
		#endregion /*Sprite walk x and y origin points END*/
						
		#region /*Character select portrait x_scale and y_scale origin points*/
		#region /*Character select portrait y_scale origin point*/
		if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
		{
			player3_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
		}
		else
		{
			player3_select_portrait_yscale = 1;
		}
		#endregion /*Character select portrait y_scale origin point END*/

		#region /*Character select portrait x_scale origin point*/
		if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
		{
			player3_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
		}
		else
		{
			player3_select_portrait_xscale = 1;
		}
		#endregion /*Character select portrait x_scale origin point END*/
		#endregion /*Character select portrait x_scale and y_scale origin points END*/
						
		ini_close();
	}
	else
	{
		character_select_portrait_xorig = 0;
		character_select_portrait_yorig = 0;
		sprite_stand_xorig = 0;
		sprite_stand_yorig = 0;
		sprite_walk_xorig = 0;
		sprite_walk_yorig = 0;
		player3_select_portrait_xscale = 1;
		player3_select_portrait_yscale = 1;
	}
	#endregion /*Character select portrait x and y origin points END*/
	
	#region /*Player 3 character select portrait sprite*/
	global.sprite_select_player_3 = spr_noone;
	global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_3, sprite_walk_xorig, sprite_walk_yorig, 2, global.skin_for_player_3);
	global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_2, sprite_stand_xorig, sprite_stand_yorig, 1, global.skin_for_player_2);
	global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_3, sprite_stand_xorig, sprite_stand_yorig, 2, global.skin_for_player_3);
	global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_3, character_select_portrait_xorig, character_select_portrait_yorig, 2, global.skin_for_player_3);
	#endregion /*Player 3 character select portrait sprite END*/
	
	#region /*Character select portrait x and y origin points*/
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/data/sprite_origin_point.ini"))
	or(file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/data/sprite_origin_point.ini"))
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/data/sprite_origin_point.ini"))
		{
			ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/data/sprite_origin_point.ini");
		}
		else
		{
			ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/data/sprite_origin_point.ini");
		}
						
		#region /*Character select portrait x and y origin points*/
		#region /*Character select portrait y origin point*/
		if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
		{
			character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
		}
		else
		{
			character_select_portrait_yorig = 0;
		}
		#endregion /*Character select portrait y origin point END*/

		#region /*Character select portrait x origin point*/
		if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
		{
			character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
		}
		else
		{
			character_select_portrait_xorig = 0;
		}
		#endregion /*Character select portrait x origin point END*/
		#endregion /*Character select portrait x and y origin points END*/
						
		#region /*Sprite stand x and y origin points*/
		#region /*Sprite stand y origin point*/
		if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
		{
			sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
		}
		else
		{
			sprite_stand_yorig = 0;
		}
		#endregion /*Sprite stand y origin point END*/

		#region /*Sprite stand x origin point*/
		if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
		{
			sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
		}
		else
		{
			sprite_stand_xorig = 0;
		}
		#endregion /*Sprite stand x origin point END*/
		#endregion /*Sprite stand x and y origin points END*/
						
		#region /*Sprite walk x and y origin points*/
		#region /*Sprite walk y origin point*/
		if (ini_key_exists("sprite origin points", "sprite_walk_yorig"))
		{
			sprite_walk_yorig = ini_read_real("sprite origin points", "sprite_walk_yorig", 0);
		}
		else
		{
			sprite_walk_yorig = 0;
		}
		#endregion /*Sprite walk y origin point END*/
		
		#region /*Sprite walk x origin point*/
		if (ini_key_exists("sprite origin points", "sprite_walk_xorig"))
		{
			sprite_walk_xorig = ini_read_real("sprite origin points", "sprite_walk_xorig", 0);
		}
		else
		{
			sprite_walk_xorig = 0;
		}
		#endregion /*Sprite walk x origin point END*/
		#endregion /*Sprite walk x and y origin points END*/
						
		#region /*Character select portrait x_scale and y_scale origin points*/
		#region /*Character select portrait y_scale origin point*/
		if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
		{
			player4_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
		}
		else
		{
			player4_select_portrait_yscale = 1;
		}
		#endregion /*Character select portrait y_scale origin point END*/

		#region /*Character select portrait x_scale origin point*/
		if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
		{
			player4_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
		}
		else
		{
			player4_select_portrait_xscale = 1;
		}
		#endregion /*Character select portrait x_scale origin point END*/
		#endregion /*Character select portrait x_scale and y_scale origin points END*/
						
		ini_close();
	}
	else
	{
		character_select_portrait_xorig = 0;
		character_select_portrait_yorig = 0;
		sprite_stand_xorig = 0;
		sprite_stand_yorig = 0;
		sprite_walk_xorig = 0;
		sprite_walk_yorig = 0;
		player4_select_portrait_xscale = 1;
		player4_select_portrait_yscale = 1;
	}
	#endregion /*Character select portrait x and y origin points END*/
	
	#region /*Player 4 character select portrait sprite*/
	global.sprite_select_player_4 = spr_noone;
	global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_4, sprite_walk_xorig, sprite_walk_yorig, 3, global.skin_for_player_4);
	global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_4, sprite_stand_xorig, sprite_stand_yorig, 3, global.skin_for_player_4);
	global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_4, sprite_stand_xorig, sprite_stand_yorig, 3, global.skin_for_player_4);
	global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_4, character_select_portrait_xorig, character_select_portrait_yorig, 3, global.skin_for_player_4);
	#endregion /*Player 4 character select portrait sprite END*/
	
}