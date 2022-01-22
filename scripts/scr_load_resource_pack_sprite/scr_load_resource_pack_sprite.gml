/// @function scr_load_resource_pack_sprite()
/// @description scr_load_resource_pack_sprite()

function scr_load_resource_pack_sprite()
{
	var file_name = 0;
	var xorig_variable = 0;
	var yorig_variable = 0;
	
	#region /*Delete sprites before loading new sprites*/
	if (room != room_splash_screen)
	{
		if (global.resourcepack_sprite_title_logo > 0){sprite_delete(global.resourcepack_sprite_title_logo);}
		if (global.resourcepack_sprite_title_logo_christmas > 0){sprite_delete(global.resourcepack_sprite_title_logo_christmas);}
		if (global.resourcepack_sprite_artwork_collection > 0){sprite_delete(global.resourcepack_sprite_artwork_collection);}
		if (global.resourcepack_sprite_basic_collectible > 0){sprite_delete(global.resourcepack_sprite_basic_collectible);}
		if (global.resourcepack_sprite_basic_enemy > 0){sprite_delete(global.resourcepack_sprite_basic_enemy);}
		if (global.resourcepack_sprite_basic_enemy_angry > 0){sprite_delete(global.resourcepack_sprite_basic_enemy_angry);}
		if (global.resourcepack_sprite_basic_enemy_flattened > 0){sprite_delete(global.resourcepack_sprite_basic_enemy_flattened);}
		if (global.resourcepack_sprite_big_collectible > 0){sprite_delete(global.resourcepack_sprite_big_collectible);}
		if (global.resourcepack_sprite_big_stationary_enemy > 0){sprite_delete(global.resourcepack_sprite_big_stationary_enemy);}
		if (global.resourcepack_sprite_big_stationary_enemy_flattened > 0){sprite_delete(global.resourcepack_sprite_big_stationary_enemy_flattened);}
		if (global.resourcepack_sprite_blaster > 0){sprite_delete(global.resourcepack_sprite_blaster);}
		if (global.resourcepack_sprite_bullet > 0){sprite_delete(global.resourcepack_sprite_bullet);}
		if (global.resourcepack_sprite_bullet_flattened > 0){sprite_delete(global.resourcepack_sprite_bullet_flattened);}
		if (global.resourcepack_sprite_hp_pickup > 0){sprite_delete(global.resourcepack_sprite_hp_pickup);}
		if (global.resourcepack_sprite_invincibility_powerup > 0){sprite_delete(global.resourcepack_sprite_invincibility_powerup);}
	}
	#endregion /*Delete sprites before loading new sprites END*/
	
	if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/data/sprite_origin_point.ini"))
	or (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/data/sprite_origin_point.ini"))
	{
		
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/data/sprite_origin_point.ini"))
		{
			ini_open("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/data/sprite_origin_point.ini");
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/data/sprite_origin_point.ini"))
		{
			ini_open(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/data/sprite_origin_point.ini");
		}
		
		#region /*Title Logo*/
		file_name = "title_logo";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_title_logo = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_title_logo = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_title_logo = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_title_logo = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Title Logo END*/
		
		#region /*Title Logo Christmas*/
		file_name = "title_logo_christmas";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_title_logo_christmas = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_title_logo_christmas = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_title_logo_christmas = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_title_logo_christmas = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Title Logo Christmas END*/
		
		#region /*Artwork Collection*/
		file_name = "artwork_collection";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(100)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_artwork_collection = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_artwork_collection = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_artwork_collection = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_artwork_collection = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Artwork Collection END*/
		
		#region /*Basic Collectible*/
		file_name = "basic_collectible";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_basic_collectible = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_basic_collectible = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_basic_collectible = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_basic_collectible = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Basic Collectible END*/
		
		#region /*Big Collectible*/
		file_name = "big_collectible";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_big_collectible = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_big_collectible = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_big_collectible = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_big_collectible = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Big Collectible END*/
		
		#region /*Bullet*/
		file_name = "bullet";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_bullet = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_bullet = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_bullet = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_bullet = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Bullet END*/
		
		#region /*Bullet Defeated*/
		file_name = "bullet_flattened";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_bullet_flattened = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_bullet_flattened = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_bullet_flattened = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_bullet_flattened = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Bullet Defeated END*/
		
		#region /*Blaster*/
		file_name = "blaster";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_blaster = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_blaster = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_blaster = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_blaster = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Blaster END*/
		
		#region /*Basic Enemy*/
		file_name = "basic_enemy";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_basic_enemy = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_basic_enemy = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_basic_enemy = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_basic_enemy = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Basic Enemy END*/
		
		#region /*Basic Enemy Angry*/
		file_name = "basic_enemy_angry";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_basic_enemy_angry = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_basic_enemy_angry = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_basic_enemy_angry = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_basic_enemy_angry = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Basic Enemy Angry END*/
		
		#region /*Basic Enemy Flattened*/
		file_name = "basic_enemy_flattened";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_basic_enemy_flattened = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_basic_enemy_flattened = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_basic_enemy_flattened = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_basic_enemy_flattened = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Basic Enemy Flattened END*/
		
		#region /*Big Stationary Enemy*/
		file_name = "big_stationary_enemy";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_big_stationary_enemy = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_big_stationary_enemy = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_big_stationary_enemy = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_big_stationary_enemy = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Big Stationary Enemy END*/
		
		#region /*Big Stationary Enemy Flattened*/
		file_name = "big_stationary_enemy_flattened";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_big_stationary_enemy_flattened = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_big_stationary_enemy_flattened = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_big_stationary_enemy_flattened = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_big_stationary_enemy_flattened = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Big Stationary Enemy Flattened END*/
		
		#region /*HP Pickup*/
		file_name = "hp_pickup";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_hp_pickup = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_hp_pickup = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_hp_pickup = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_hp_pickup = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*HP Pickup END*/
		
		#region /*Invincibility Powerup*/
		file_name = "invincibility_powerup";
		
		#region /*x origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_xorig"))
		{
			xorig_variable = ini_read_real("sprite origin points", file_name+"_xorig", 0);
		}
		else
		{
			xorig_variable = 0;
		}
		#endregion /*x origin point END*/
		
		#region /*y origin point*/
		if (ini_key_exists("sprite origin points", file_name+"_yorig"))
		{
			yorig_variable = ini_read_real("sprite origin points", file_name+"_yorig", 0);
		}
		else
		{
			yorig_variable = 0;
		}
		#endregion /*y origin point END*/
		
		#region /*Sprite Add*/
		index= 0
		repeat(50)
		{
			if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_invincibility_powerup = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png"))
			{
				global.resourcepack_sprite_invincibility_powerup = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+"_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
			}
			index +=1
		}
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_invincibility_powerup = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_invincibility_powerup = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Invincibility Powerup END*/
		
		ini_close();
	}
}