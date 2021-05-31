/// @function scr_load_resource_pack_sprite()
/// @description scr_load_resource_pack_sprite()

function scr_load_resource_pack_sprite()
{
	var file_name = 0;
	var xorig_variable = 0;
	var yorig_variable = 0;
	
	if (file_exists("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Data/sprite_origin_point.ini"))
	or(file_exists(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Data/sprite_origin_point.ini"))
	{
		if (file_exists("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Data/sprite_origin_point.ini"))
		{
			ini_open("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Data/sprite_origin_point.ini");
		}
		else
		if (file_exists(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Data/sprite_origin_point.ini"))
		{
			ini_open(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Data/sprite_origin_point.ini");
		}
		
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
		index=0
		repeat(50)
		{
			if (file_exists("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+"_strip"+string(index)+".png"))
			{
				global.resourcepack_sprite_basic_collectible = sprite_add("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+"_strip"+string(index)+".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+"_strip"+string(index)+".png"))
			{
				global.resourcepack_sprite_basic_collectible = sprite_add(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+"_strip"+string(index)+".png", index, false, false, xorig_variable, yorig_variable);
			}
			index+=1
		}
		if (file_exists("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_basic_collectible = sprite_add("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_basic_collectible = sprite_add(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Big Collectible END*/
		
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
		index=0
		repeat(50)
		{
			if (file_exists("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+"_strip"+string(index)+".png"))
			{
				global.resourcepack_sprite_big_collectible = sprite_add("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+"_strip"+string(index)+".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+"_strip"+string(index)+".png"))
			{
				global.resourcepack_sprite_big_collectible = sprite_add(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+"_strip"+string(index)+".png", index, false, false, xorig_variable, yorig_variable);
			}
			index+=1
		}
		if (file_exists("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_big_collectible = sprite_add("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_big_collectible = sprite_add(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
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
		index=0
		repeat(50)
		{
			if (file_exists("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+"_strip"+string(index)+".png"))
			{
				global.resourcepack_sprite_bullet = sprite_add("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+"_strip"+string(index)+".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+"_strip"+string(index)+".png"))
			{
				global.resourcepack_sprite_bullet = sprite_add(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+"_strip"+string(index)+".png", index, false, false, xorig_variable, yorig_variable);
			}
			index+=1
		}
		if (file_exists("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_bullet = sprite_add("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_bullet = sprite_add(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Bullet END*/
		
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
		index=0
		repeat(50)
		{
			if (file_exists("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+"_strip"+string(index)+".png"))
			{
				global.resourcepack_sprite_hp_pickup = sprite_add("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+"_strip"+string(index)+".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+"_strip"+string(index)+".png"))
			{
				global.resourcepack_sprite_hp_pickup= sprite_add(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+"_strip"+string(index)+".png", index, false, false, xorig_variable, yorig_variable);
			}
			index+=1
		}
		if (file_exists("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_hp_pickup = sprite_add("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_hp_pickup = sprite_add(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
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
		index=0
		repeat(50)
		{
			if (file_exists("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+"_strip"+string(index)+".png"))
			{
				global.resourcepack_sprite_invincibility_powerup = sprite_add("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+"_strip"+string(index)+".png", index, false, false, xorig_variable, yorig_variable);
			}
			else
			if (file_exists(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+"_strip"+string(index)+".png"))
			{
				global.resourcepack_sprite_invincibility_powerup = sprite_add(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+"_strip"+string(index)+".png", index, false, false, xorig_variable, yorig_variable);
			}
			index+=1
		}
		if (file_exists("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_invincibility_powerup = sprite_add("Resourcepacks/Resourcepack"+string(global.selected_resourcepack)+"/Sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+".png"))
		{
			global.resourcepack_sprite_invincibility_powerup = sprite_add(working_directory + "/Custom Resourcepacks/Resourcepack"+string(global.selected_resourcepack-global.max_number_of_official_resourcepacks)+"/Sprites/"+file_name+".png", 1, false, false, xorig_variable, yorig_variable);
		}
		#endregion /*Sprite Add END*/
		
		#endregion /*Invincibility Powerup END*/
		
		ini_close();
	}
}