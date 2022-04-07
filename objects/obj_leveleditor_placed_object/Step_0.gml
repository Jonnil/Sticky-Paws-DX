key_a = (gamepad_button_check(0, gp_face1))or(keyboard_check(global.player1_key_jump));
key_a_pressed = (gamepad_button_check_pressed(0, gp_face1))or(keyboard_check_pressed(global.player1_key_jump));
key_a_released = (gamepad_button_check_released(0, gp_face1))or(keyboard_check_released(global.player1_key_jump));
key_b = (gamepad_button_check(0, gp_face2))or(keyboard_check(global.player1_key_sprint));

#region /*All code before initializing the object*/

#region /*Make sprite transparent if you're setting difficulty levels*/
if (asset_get_type("obj_leveleditor") == asset_object)
and (instance_exists(obj_leveleditor))
and (sprite_index > 0)
and (global.character_select_in_this_menu = "level_editor")
{

	#region /*Show only normal difficulty layer in regular colors when saving a thumbnail*/
	if (obj_leveleditor.quit_level_editor >= true)
	and (normal = true)
	and (sprite_index > 0)
	{
		image_alpha = 1;
		image_blend = c_white;
	}
	#endregion /*Show only normal difficulty layer in regular colors when saving a thumbnail END*/
	
	else
	
	#region /*All layer*/
	if (obj_leveleditor.difficulty_layer = 0)
	and (obj_leveleditor.quit_level_editor = false)
	{
		#region /*Transparent Object*/
		if (easy = true)
		and (normal = false)
		and (hard = false)
		and (sprite_index > 0)
		{
			image_alpha = 0.1;
			image_blend = c_lime;
		}
		else
		if (easy = true)
		and (normal = true)
		and (hard = false)
		and (sprite_index > 0)
		{
			image_alpha = 0.1;
			image_blend = c_white;
		}
		else
		if (easy = false)
		and (normal = true)
		and (hard = false)
		and (sprite_index > 0)
		{
			image_alpha = 0.1;
			image_blend = c_yellow;
		}
		else
		if (easy = false)
		and (normal = true)
		and (hard = true)
		and (sprite_index > 0)
		{
			image_alpha = 0.1;
			image_blend = c_white;
		}
		else
		if (easy = false)
		and (normal = false)
		and (hard = true)
		and (sprite_index > 0)
		{
			image_alpha = 0.1;
			image_blend = c_red;
		}
		else
		if (easy = true)
		and (normal = false)
		and (hard = true)
		and (sprite_index > 0)
		{
			image_alpha = 0.1;
			image_blend = c_white;
		}
		#endregion /*Transparent Object END*/
	
		else
		if (easy = true)
		and (normal = true)
		and (hard = true)
		and (sprite_index > 0)
		{
			image_alpha = 1;
			image_blend = c_white;
		}
	}
	else
	#endregion /*All layer END*/

	#region /*Easy layer*/
	if (obj_leveleditor.difficulty_layer = 1)
	and (obj_leveleditor.quit_level_editor = false)
	{
		if (easy = true)
		and (sprite_index > 0)
		{
			image_alpha = 1;
			image_blend = c_lime;
		}
		else
		{
			#region /*Transparent Object*/
			if (easy = true)
			and (normal = false)
			and (hard = false)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_lime;
			}
			else
			if (easy = true)
			and (normal = true)
			and (hard = false)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy = false)
			and (normal = true)
			and (hard = false)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_yellow;
			}
			else
			if (easy = false)
			and (normal = true)
			and (hard = true)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy = false)
			and (normal = false)
			and (hard = true)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_red;
			}
			else
			if (easy = true)
			and (normal = false)
			and (hard = true)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_white;
			}
			#endregion /*Transparent Object END*/
		}
	}
	#endregion /*Easy layer END*/

	#region /*Normal layer*/
	if (obj_leveleditor.difficulty_layer = 2)
	and (obj_leveleditor.quit_level_editor = false)
	{
		if (normal = true)
		and (sprite_index > 0)
		{
			image_alpha = 1;
			image_blend = c_yellow;
		}
		else
		{
			#region /*Transparent Object*/
			if (easy = true)
			and (normal = false)
			and (hard = false)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_lime;
			}
			else
			if (easy = true)
			and (normal = true)
			and (hard = false)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy = false)
			and (normal = true)
			and (hard = false)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_yellow;
			}
			else
			if (easy = false)
			and (normal = true)
			and (hard = true)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy = false)
			and (normal = false)
			and (hard = true)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_red;
			}
			else
			if (easy = true)
			and (normal = false)
			and (hard = true)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_white;
			}
			#endregion /*Transparent Object END*/
		}
	}
	#endregion /*Normal layer END*/

	#region /*Hard layer*/
	if (obj_leveleditor.difficulty_layer = 3)
	and (obj_leveleditor.quit_level_editor = false)
	{
		if (hard = true)
		and (sprite_index > 0)
		{
			image_alpha = 1;
			image_blend = c_red;
		}
		else
		{
			#region /*Transparent Object*/
			if (easy = true)
			and (normal = false)
			and (hard = false)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_lime;
			}
			else
			if (easy = true)
			and (normal = true)
			and (hard = false)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy = false)
			and (normal = true)
			and (hard = false)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_yellow;
			}
			else
			if (easy = false)
			and (normal = true)
			and (hard = true)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy = false)
			and (normal = false)
			and (hard = true)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_red;
			}
			else
			if (easy = true)
			and (normal = false)
			and (hard = true)
			and (sprite_index > 0)
			{
				image_alpha = 0.1;
				image_blend = c_white;
			}
			#endregion /*Transparent Object END*/
		}
	}
	#endregion /*Hard layer END*/
	
}
else
if (sprite_index > 0)
and (global.character_select_in_this_menu = "level_editor")
{
	image_alpha = 1;
	image_blend = c_white;
}
#endregion /*Make sprite transparent if you're setting difficulty levels END*/

#region /*If all dificulty variables are false, then delete the object*/
if (easy = false)
and (normal = false)
and (hard = false)
{
	instance_destroy();
}
#endregion /*If all dificulty variables are false, then delete the object END*/

#region /*Make object change difficulty layer depending on what difficulty layer is selected*/
if (asset_get_type("obj_leveleditor") == asset_object)
and (instance_exists(obj_leveleditor))
and (obj_leveleditor.difficulty_layer > 0)
and (obj_leveleditor.drag_object = false)
and (obj_leveleditor.pause = false)
and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
and (!keyboard_check(vk_space))
and (!mouse_check_button(mb_middle))
{
	if (obj_leveleditor.erase_mode = true)
	and (mouse_check_button(mb_left))
	or(mouse_check_button(mb_right))
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.erase_mode = true)
	and (obj_leveleditor.key_a_hold)
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_b_hold)
	{
		if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
		
		/*Erase brush size 1*/
		or(obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y, id))
		or(obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 32, id))
		or(obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 32, id))
		/*Erase brush size 1 END*/
		
		/*Erase brush size 2*/
		or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y, id))
		or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y + 32, id))
		/*Erase brush size 2 END*/
		
		/*Erase brush size 3*/
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y, id))
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 32, id))
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y+64, id))
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y+64, id))
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y+64, id))
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y+64, id))
		/*Erase brush size 3 END*/
		
		/*Erase brush size 4 */
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 32, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y+64, id))
		/*Erase brush size 4 END*/
		
		/*Erase brush size 5*/
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y + 32, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y+64, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y+96, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y+96, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y+96, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y+96, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y+96, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y+96, id))
		/*Erase brush size 5 END*/
		
		{
			if (obj_leveleditor.difficulty_layer = 1)
			{
				if (easy = true)
				{
					easy = false;
				}
			}
			else
			if (obj_leveleditor.difficulty_layer = 2)
			{
				if (normal = true)
				{
					normal = false;
				}
			}
			else
			if (obj_leveleditor.difficulty_layer = 3)
			{
				if (hard = true)
				{
					hard = false;
				}
			}
		}
	}
}
#endregion /*Make object change difficulty layer depending on what difficulty layer is selected END*/

if (delay <3)
{
	delay += 1;
}

if (asset_get_type("obj_leveleditor") == asset_object)
and (instance_exists(obj_leveleditor))
and (delay = 3)
{
	
	#region /*Destroy if erased*/
	if (asset_get_type("obj_level_player_1_start") == asset_object)
	and (instance_exists(obj_level_player_1_start))
	and (place_meeting(x, y, obj_level_player_1_start))
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (instance_exists(obj_level_player_2_start))
	and (place_meeting(x, y, obj_level_player_2_start))
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (instance_exists(obj_level_player_3_start))
	and (place_meeting(x, y, obj_level_player_3_start))
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	and (instance_exists(obj_level_player_4_start))
	and (place_meeting(x, y, obj_level_player_4_start))
	and (obj_leveleditor.drag_object = false)
	and (obj_level_player_1_start.drag_object = false)
	and (obj_level_player_2_start.drag_object = false)
	and (obj_level_player_3_start.drag_object = false)
	and (obj_level_player_4_start.drag_object = false)
	{
		
		#region /*Reset Level Editor Checkpoint*/
		if (asset_get_type("room_leveleditor") == asset_room)
		and (room =room_leveleditor)
		and (global.character_select_in_this_menu = "level_editor")
		{
			ini_open(working_directory + "/save_files/custom_level_save.ini");
			ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "x_checkpoint");
			ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "y_checkpoint");
			ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_millisecond");
			ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_second");
			ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_minute");
			ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_realmillisecond");
			ini_close();			
		}
		#endregion /*Reset Level Editor Checkpoint END*/
		
		instance_destroy();
	}
	#endregion /*Destroy if erased END*/
	
}

#region /*Modify Objects*/
if (!keyboard_check(vk_space))
and (!mouse_check_button(mb_middle))
and (!mouse_check_button(mb_right))
and (delay > 1)
{
	if (instance_exists(obj_leveleditor))
	and (!keyboard_check(vk_space))
	and (!mouse_check_button(mb_middle))
	and (!mouse_check_button(mb_right))
	and (obj_leveleditor.fill_mode = false)
	and (obj_leveleditor.erase_mode = false)
	and (obj_leveleditor.pause = false)
	and (obj_leveleditor.menu_delay = 0)
	and (asset_get_type("obj_leveleditor_placed_object") == asset_object)
	and (asset_get_type("obj_level_player_1_start") == asset_object)
	and (!place_meeting(x, y, obj_level_player_1_start))
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (!place_meeting(x, y, obj_level_player_2_start))
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (!place_meeting(x, y, obj_level_player_3_start))
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	and (!place_meeting(x, y, obj_level_player_4_start))
	and (asset_get_type("obj_level_height") == asset_object)
	and (!position_meeting(x, y, obj_level_height))
	and (asset_get_type("obj_level_width") == asset_object)
	and (!position_meeting(x, y, obj_level_width))
	and (asset_get_type("obj_water_level_height") == asset_object)
	and (!position_meeting(x, y, obj_water_level_height))
	and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2)) /*Can't place objects when clicking the bottom buttons*/
	and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /*Can't place objects when clicking the top buttons*/
	and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() - 64, window_get_height()/ 2 - 32, window_get_width(), window_get_height()/ 2 + 32)) /*Can't place objects when clicking the play button*/
	{
		if (obj_leveleditor.show_grid = true)
		and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 32 - 32 - 32, 80 + obj_leveleditor.icons_at_top_y + 16 - 32 -32, display_get_gui_width() + 64 + 32, 80 + obj_leveleditor.icons_at_top_y + 16 + 32 + 32)) /*Up and down buttons when grid is on*/
		or (obj_leveleditor.show_grid = false)
		{
			if (keyboard_check_pressed(ord("A")))
			and (!keyboard_check(vk_control))
			or (mouse_check_button_released(mb_left))
			and (dragged_from_original_place = false)
			and (placed_for_the_first_time = false)
			or (instance_exists(obj_leveleditor))
			and (obj_leveleditor.key_a_released)
			and (dragged_from_original_place = false)
			and (placed_for_the_first_time = false)
			{
				if (asset_get_type("obj_leveleditor") == asset_object)
				and (instance_exists(obj_leveleditor))
				{
					if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
					and (obj_leveleditor.pause = false)
					{
						/*Don't put a move_snap here! We don't want the object to change position when modifying it*/
						
						#region /*Object ID's to modify*/
						
						#region /*Change wall into it's different forms*/
						if (object = 1)
						{
							object = 1001;
							obj_leveleditor.wall_surface_selected = 1;
						}
						else
						if (object = 1001)
						{
							object = 1002;
							obj_leveleditor.wall_surface_selected = 2;
						}
						else
						if (object = 1002)
						{
							object = 1003;
							obj_leveleditor.wall_surface_selected = 3;
						}
						else
						if (object = 1003)
						{
							object = 1004;
							obj_leveleditor.wall_surface_selected = 4;
						}
						else
						if (object = 1004)
						{
							object = 1005;
							obj_leveleditor.wall_surface_selected = 5;
						}
						else
						if (object = 1005)
						{
							object = 1006;
							obj_leveleditor.wall_surface_selected = 6;
						}
						else
						if (object = 1006)
						{
							object = 1007;
							obj_leveleditor.wall_surface_selected = 7;
						}
						else
						if (object = 1007)
						{
							object = 1;
							obj_leveleditor.wall_surface_selected = 0;
						}
						#endregion /*Change wall into it's different forms END*/
				
						#region /*Change bump in ground to it's different forms*/
						if (object = 28)
						{
							object = 29;
						}
						else
						if (object = 29)
						{
							object = 30;
						}
						else
						if (object = 30)
						{
							object = 31;
						}
						else
						if (object = 31)
						{
							object = 32;
						}
						else
						if (object = 32)
						{
							object = 33;
						}
						else
						if (object = 33)
						{
							object = 34;
						}
						else
						if (object = 34)
						{
							object = 35;
						}
						else
						if (object = 35)
						{
							object = 36;
						}
						else
						if (object = 36)
						{
							object = 37;
						}
						else
						if (object = 37)
						{
							object = 38;
						}
						else
						if (object = 38)
						{
							object = 39;
						}
						else
						if (object = 39)
						{
							object = 28;
						}
						#endregion /*Change bump in ground to it's different forms END*/				
				
						#region /*Change Basic Collectible Direction*/
						else
						if (object = 40)
						{
							object = 41;
						}
						else
						if (object = 41)
						{
							object = 42;
						}
						else
						if (object = 42)
						{
							object = 43;
						}
						else
						if (object = 43)
						{
							object = 44;
						}
						else
						if (object = 44)
						{
							object = 45;
						}
						else
						if (object = 45)
						{
							object = 46;
						}
						else
						if (object = 46)
						{
							object = 47;
						}
						else
						if (object = 47)
						{
							object = 40;
						}
						#endregion /*Change Basic Collectible Direction*/
				
						#region /*Change Big Collectible*/
						else
						if (object = 48)
						{
							object = 49;
						}
						else
						if (object = 49)
						{
							object = 50;
						}
						else
						if (object = 50)
						{
							object = 51;
						}
						else
						if (object = 51)
						{
							object = 52;
						}
						else
						if (object = 52)
						{
							object = 48;
						}
						#endregion /*Change Big Collectible*/
				
						else
				
						#region /*Falling Block*/
						if (object = 19)
						{
							object = 20;
						}
						else
						if (object = 20)
						{
							object = 19;
						}
						else
						if (object = 21)
						{
							object = 22;
						}
						else
						if (object = 22)
						{
							object = 21;
						}
						#endregion /*Falling Block END*/
				
						else
				
						#region /*Brick Block*/
						if (object = 4)
						{
							object = 5;
						}
						else
						if (object = 5)
						{
							object = 6;
						}
						else
						if (object = 6)
						{
							object = 7;
						}
						else
						if (object = 7)
						{
							object = 8;
						}
						else
						if (object = 8)
						{
							object = 9;
						}
						else
						if (object = 9)
						{
							object = 10;
						}
						else
						if (object = 10)
						{
							object = 10001;
						}
						else
						if (object = 10001)
						{
							object = 4;
						}
						#endregion /*Brick Block*/
				
						#region /*Question Block*/
						else
						if (object = 11)
						{
							object = 12;
						}
						else
						if (object = 12)
						{
							object = 13;
						}
						else
						if (object = 13)
						{
							object = 14;
						}
						else
						if (object = 14)
						{
							object = 15;
						}
						else
						if (object = 15)
						{
							object = 16;
						}
						else
						if (object = 16)
						{
							object = 17;
						}
						else
						if (object = 17)
						{
							object = 17001;
						}
						else
						if (object = 17001)
						{
							object = 11;
						}
						#endregion /*Question Block*/
				
						else
				
						#region /*Invincibility Powerup*/
						if (object = 55)
						{
							object = 55001;
						}
						else
						if (object = 55001)
						{
							object = 55;
						}
						#endregion /*Invincibility Powerup END*/
				
						else
				
						#region /*Extra Lives Pickup*/
						if (object = 56)
						{
							object = 57;
						}
						else
						if (object = 57)
						{
							object = 58;
						}
						else
						if (object = 58)
						{
							object = 56;
						}
						#endregion /*Extra Lives Pickup END*/
				
						else
				
						#region /*Basic enemy*/
						if (object = 59)
						{
							object = 5901;
						}
						else
						if (object = 5901)
						{
							object = 5902;
						}
						else
						if (object = 5902)
						{
							object = 5903;
						}
						else
						if (object = 5903)
						{
							object = 59;
						}
						#endregion /*Basic enemy END*/
				
						else
				
						#region /*Bowling ball enemy*/
						if (object = 591)
						{
							object = 592;
						}
						else
						if (object = 592)
						{
							object = 5911;
						}
						else
						if (object = 5911)
						{
							object = 5912;
						}
						else
						if (object = 5912)
						{
							object = 591;
						}
						#endregion /*Bowling ball enemy END*/
				
						else
				
						#region /*Spikes Emerge Direction*/
						if (object = 67)
						{
							object = 671;
						}
						else
						if (object = 671)
						{
							object = 672;
						}
						else
						if (object = 672)
						{
							object = 673;
						}
						else
						if (object = 673)
						{
							object = 67;
						}
						#endregion /*Spikes Emerge Direction END*/
				
						#region /*Change Oneway Direction*/
						if (object = 68)
						{
							object = 69;
						}
						else
						if (object = 69)
						{
							object = 70;
						}
						else
						if (object = 70)
						{
							object = 71;
						}
						else
						if (object = 71)
						{
							object = 68;
						}
						#endregion /*Change Oneway Direction END*/
				
						#region /*Change Water Rope*/
						if (object = 73)
						{
							object = 731;
						}
						else
						if (object = 731)
						{
							object = 73;
						}
						#endregion /*Change Water END*/
				
						else
				
						#region /*Change Clipped Clothing on Rope*/
						if (object = 74)
						{
							object = 75;
						}
						else
						if (object = 75)
						{
							object = 76;
						}
						else
						if (object = 76)
						{
							object = 74;
						}
						#endregion /*Change Clipped Clothing on Rope END*/
				
						#region /*Change bucket to it's different forms*/
						if (object = 77)
						{
							object = 78;
						}
						else
						if (object = 78)
						{
							object = 79;
						}
						else
						if (object = 79)
						{
							object = 80;
						}
						else
						if (object = 80)
						{
							object = 81;
						}
						else
						if (object = 81)
						{
							object = 82;
						}
						else
						if (object = 82)
						{
							object = 83;
						}
						else
						if (object = 83)
						{
							object = 84;
						}
						else
						if (object = 84)
						{
							object = 85;
						}
						else
						if (object = 85)
						{
							object = 86;
						}
						else
						if (object = 86)
						{
							object = 87;
						}
						else
						if (object = 87)
						{
							object = 88;
						}
						else
						if (object = 88)
						{
							object = 77;
						}
						#endregion /*Change bucket to it's different forms END*/
				
						#region /*Change Moveset Signs*/
						else
						if (object = 90)
						{
							object = 91;
						}
						else
						if (object = 91)
						{
							object = 92;
						}
						else
						if (object = 92)
						{
							object = 93;
						}
						else
						if (object = 93)
						{
							object = 94;
						}
						else
						if (object = 94)
						{
							object = 90;
						}
						#endregion /*Change Moveset Signs END*/
				
						alarm[0] = 1; /*Update sprite initializing. That code is in alarm event, so it's not running every frame in step event*/
						
						#endregion /*Object ID's to modify END*/
						
					}
				}
			}
		}
	}
}
#endregion /*Modify Objects END*/

#region /*Change certain objects angle*/
if (place_object_angle = true)
{	
	if (instance_exists(obj_leveleditor))
	{
		second_x = obj_leveleditor.x;
		second_y = obj_leveleditor.y;
	}
	if (mouse_check_button_released(mb_left))
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_a_released)
	{
		place_object_angle = false;
	}
}
#endregion /*Change certain objects angle END*/

#region /*Delete / Erase Objects*/
if (asset_get_type("obj_leveleditor") == asset_object)
and (instance_exists(obj_leveleditor))
and (obj_leveleditor.difficulty_layer = 0)
and (obj_leveleditor.drag_object = false)
and (obj_leveleditor.erase_mode = true)
and (obj_leveleditor.scroll_view = false)
and (obj_leveleditor.pause = false)
and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64))
and (!keyboard_check(vk_space))
and (!mouse_check_button(mb_middle))
{
	if (obj_leveleditor.set_difficulty_mode = true)
	and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom right buttons*/
	or(obj_leveleditor.set_difficulty_mode = false)
	and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom right buttons*/
	{
		if (mouse_check_button(mb_right))
		or (mouse_check_button(mb_left))
		or (instance_exists(obj_leveleditor))
		and (obj_leveleditor.key_a_hold)
		or (instance_exists(obj_leveleditor))
		and (obj_leveleditor.key_b_hold)
		{
			if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
		
			/*Erase brush size 1*/
			or(obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y, id))
			or(obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 32, id))
			or(obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 32, id))
			/*Erase brush size 1 END*/
		
			/*Erase brush size 2*/
			or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 32, id))
			or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 32, id))
			or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y - 32, id))
			or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y, id))
			or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y + 32, id))
			/*Erase brush size 2 END*/
		
			/*Erase brush size 3*/
			or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 32, id))
			or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y, id))
			or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 32, id))
			or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y+64, id))
			or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y+64, id))
			or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y+64, id))
			or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y+64, id))
			/*Erase brush size 3 END*/
		
			/*Erase brush size 4 */
			or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 64, id))
			or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 64, id))
			or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 64, id))
			or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y - 64, id))
			or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 64, id))
			or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 32, id))
			or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y, id))
			or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 32, id))
			or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y+64, id))
			/*Erase brush size 4 END*/
		
			/*Erase brush size 5*/
			or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y - 64, id))
			or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y - 32, id))
			or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y, id))
			or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y + 32, id))
			or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y+64, id))
			or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y+96, id))
			or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y+96, id))
			or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y+96, id))
			or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y+96, id))
			or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y+96, id))
			or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y+96, id))
			/*Erase brush size 5 END*/
		
			{
				if (asset_get_type("snd_leveleditor_erase_object") == asset_sound)
				{
					audio_sound_pitch(snd_leveleditor_erase_object, random_range(0.9, 1.1));
					audio_play_sound(snd_leveleditor_erase_object, 0, 0);
					audio_sound_gain(snd_leveleditor_erase_object, global.sound_volume * global.main_volume, 0);
				}
				with(obj_leveleditor)
				{
					move_snap(global.grid_hsnap, global.grid_vsnap); /*Make sure to always move snap*/
				}
				instance_destroy();
			}
		}
	}
}
#endregion /*Delete / Erase Objects END*/

#region /*Drag Object*/
if (asset_get_type("obj_leveleditor") == asset_object)
and (instance_exists(obj_leveleditor))
and (obj_leveleditor.set_difficulty_mode = false)
and (obj_leveleditor.can_put_objects_above_other_objects = false)
and (delay > 1)
{
	if (instance_exists(obj_leveleditor))
	and (!keyboard_check(vk_space))
	and (!mouse_check_button(mb_middle))
	and (!mouse_check_button(mb_right))
	and (obj_leveleditor.drag_object = false)
	and (obj_leveleditor.fill_mode = false)
	and (obj_leveleditor.erase_mode = false)
	and (obj_leveleditor.pause = false)
	and (obj_leveleditor.menu_delay = 0)
	and (asset_get_type("obj_leveleditor_placed_object") == asset_object)
	and (asset_get_type("obj_level_player_1_start") == asset_object)
	and (!place_meeting(x, y, obj_level_player_1_start))
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (!place_meeting(x, y, obj_level_player_2_start))
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (!place_meeting(x, y, obj_level_player_3_start))
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	and (!place_meeting(x, y, obj_level_player_4_start))
	and (asset_get_type("obj_level_height") == asset_object)
	and (!position_meeting(x, y, obj_level_height))
	and (asset_get_type("obj_level_width") == asset_object)
	and (!position_meeting(x, y, obj_level_width))
	and (asset_get_type("obj_water_level_height") == asset_object)
	and (!position_meeting(x, y, obj_water_level_height))
	and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2)) /*Can't place objects when clicking the bottom buttons*/
	and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /*Can't place objects when clicking the top buttons*/
	and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() - 64, window_get_height()/ 2 - 32, window_get_width(), window_get_height()/ 2 + 32)) /*Can't place objects when clicking the play button*/
	{
		if (obj_leveleditor.show_grid = true)
		and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 32 - 32 - 32, 80 + obj_leveleditor.icons_at_top_y + 16 - 32 -32, display_get_gui_width() + 64 + 32, 80 + obj_leveleditor.icons_at_top_y + 16 + 32 + 32)) /*Up and down buttons when grid is on*/
		or (obj_leveleditor.show_grid = false)
		{
			if (!keyboard_check(vk_space))
			and (!mouse_check_button(mb_middle))
			{
				if (mouse_check_button_pressed(mb_left))
				or (instance_exists(obj_leveleditor))
				and (obj_leveleditor.key_a_pressed)
				{
					if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
					{
						if (drag_object <= false)
						and (obj_leveleditor.pause = false)
						and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
						and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64))
						{
							if (obj_leveleditor.set_difficulty_mode = true)
							and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom right buttons*/
							or(obj_leveleditor.set_difficulty_mode = false)
							and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom right buttons*/
							{
								if (instance_exists(obj_leveleditor))
								and (obj_leveleditor.show_grid = true)
								and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 32 - 32, 80 + 32 + 16 - 32, display_get_gui_width() + 64, 80 + 32 + 16 + 32)) /*Up and down buttons when grid is on*/
								or (instance_exists(obj_leveleditor))
								and (obj_leveleditor.show_grid = false)
								{
									drag_object = true;
									drag_xstart = x;
									drag_ystart = y;
									obj_leveleditor.drag_object = true;
								}
							}
						}
					}
				}
			}
		}
	}
	#region /*Drag the object*/
	
	if (drag_object = true)
	{
		depth = -300;
		x = obj_leveleditor.x;
		y = obj_leveleditor.y;
	}
	else
	{
		if (object = 73)
		or(object = 731)
		{
			depth = -20;
		}
		else
		{
			depth = -19;
		}
	}
	#endregion /*Drag the object END*/
	
	#region /*Release the object*/
	if (mouse_check_button_released(mb_left))
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_a_released)
	{
		if (drag_object = true)
		{
			drag_release_timer = 3;
			drag_object = 0.5;
			obj_leveleditor.drag_object = false;
			dragged_from_original_place = false;
		}
	}
	#endregion /*Release the object END*/
}

if (drag_release_timer > 0)
{
	drag_release_timer -= 1;
}
else
{
	if (drag_object = 0.5)
	{
		drag_object = false;
		dragged_from_original_place = false;
	}
}

if (drag_xstart != x)
or (drag_ystart != y)
{
	dragged_from_original_place = true;
}
#endregion /*Drag Object END*/

if (mouse_check_button_released(mb_left))
or (instance_exists(obj_leveleditor))
and (obj_leveleditor.key_a_released)
{
	placed_for_the_first_time = false;
}

#region /*Spawn objects when starting room*/
if (global.play_edited_level = true)
{
	
	#region /*Delete objects according to difficulty settings*/
	if (global.difficulty <= 0)
	and (easy = true)
	or(global.difficulty = 1)
	and (normal = true)
	or(global.difficulty >= 2)
	and (hard = true)
	{
		if (object = 1) and (asset_get_type("obj_ground") == asset_object){instance_create_depth(x, y, 0, obj_ground); instance_destroy();}
		if (object = 1001) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 1;}instance_destroy();}
		if (object = 1002) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 2;}instance_destroy();}
		if (object = 1003) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 3;}instance_destroy();}
		if (object = 1004) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 4;}instance_destroy();}
		if (object = 1005) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 5;}instance_destroy();}
		if (object = 1006) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 6;}instance_destroy();}
		if (object = 1007) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 7;}instance_destroy();}
		
		if (object = 1008){if(asset_get_type("obj_wall_jump_panel") == asset_object){instance_create_depth(x, y, 0, obj_wall_jump_panel); instance_destroy();}else{if (asset_get_type("obj_wall_jump_panel") == asset_object){instance_create_depth(x, y, 0, obj_wall_jump_panel); instance_destroy();}}}
		if (object = 1009){if(asset_get_type("obj_wall_climb_panel") == asset_object){instance_create_depth(x, y, 0, obj_wall_climb_panel); instance_destroy();}else{if (asset_get_type("obj_wall_climb_panel") == asset_object){instance_create_depth(x, y, 0, obj_wall_climb_panel); instance_destroy();}}}
		if (object = 2){if(asset_get_type("obj_spikes") == asset_object){instance_create_depth(x, y, 0, obj_spikes); instance_destroy();}else{if (asset_get_type("obj_ground") == asset_object){instance_create_depth(x, y, 0, obj_ground); instance_destroy();}}}
		if (object = 3) and (asset_get_type("obj_semisolid_platform") == asset_object){instance_create_depth(x, y, 0, obj_semisolid_platform); instance_destroy();}
		
		#region /*Brick Block*/
		if (object = 4) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){brick_block = true;}instance_destroy();}
		if (object = 5) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){brick_block = true; item_inside = "10_basic_collectibles";}instance_destroy();}
		if (object = 6) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){brick_block = true; item_inside = "heart_balloon";}instance_destroy();}
		if (object = 7) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){brick_block = true; item_inside = "1-up";}instance_destroy();}
		if (object = 8) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){brick_block = true; item_inside = "2-up";}instance_destroy();}
		if (object = 9) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){brick_block = true; item_inside = "3-up";}instance_destroy();}
		if (object = 10) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){brick_block = true; item_inside = "invincibility_powerup";}instance_destroy();}
		if (object = 10001) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){brick_block = true; item_inside = "invincibility_powerup_coil_spring";}instance_destroy();}
		#endregion /*Brick Block END*/
		
		#region /*Question Block*/
		if (object = 11) and (asset_get_type("obj_question_block") == asset_object){instance_create_depth(x, y, 0, obj_question_block); instance_destroy();}
		if (object = 12) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){item_inside = "10_basic_collectibles";}instance_destroy();}
		if (object = 13) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){item_inside = "heart_balloon";}instance_destroy();}
		if (object = 14) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){item_inside = "1-up";}instance_destroy();}
		if (object = 15) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){item_inside = "2-up";}instance_destroy();}
		if (object = 16) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){item_inside = "3-up";}instance_destroy();}
		if (object = 17) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){item_inside = "invincibility_powerup";}instance_destroy();}
		if (object = 17001) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){item_inside = "invincibility_powerup_coil_spring";}instance_destroy();}
		#endregion /*Question Block END*/
		
		if (object = 18) and (asset_get_type("obj_hard_block") == asset_object){instance_create_depth(x, y, 0, obj_hard_block); instance_destroy();}
		
		#region /*Falling Block*/
		if (object = 19) and (asset_get_type("obj_falling_block") == asset_object){instance_create_depth(x, y, 0, obj_falling_block); instance_destroy();}
		if (object = 20) and (asset_get_type("obj_falling_block_solid") == asset_object){instance_create_depth(x, y, 0, obj_falling_block_solid); instance_destroy();}
		if (object = 21) and (asset_get_type("obj_falling_block_long") == asset_object){instance_create_depth(x, y, 0, obj_falling_block_long); instance_destroy();}
		if (object = 22) and (asset_get_type("obj_falling_block_long_solid") == asset_object){instance_create_depth(x, y, 0, obj_falling_block_long_solid); instance_destroy();}
		#endregion /*Falling Block END*/
		
		if (object = 23) and (asset_get_type("obj_cloud_block") == asset_object){instance_create_depth(x, y, 0, obj_cloud_block); instance_destroy();}
		if (object = 24) and (asset_get_type("obj_ice_block") == asset_object){instance_create_depth(x, y, 0, obj_ice_block); instance_destroy();}
		if (object = 25) and (asset_get_type("obj_cardboard_block") == asset_object){instance_create_depth(x, y, 0, obj_cardboard_block); instance_destroy();}
		if (object = 26) and (asset_get_type("obj_cardboard") == asset_object){instance_create_depth(x, y, 0, obj_cardboard); instance_destroy();}
		if (object = 27) and (asset_get_type("obj_cardboard_long") == asset_object){instance_create_depth(x, y, 0, obj_cardboard_long); instance_destroy();}
		
		#region /*Bump in ground*/
		if (object = 28) and (asset_get_type("obj_bump_in_ground") == asset_object){instance_create_depth(x, y, 0, obj_bump_in_ground); instance_destroy();}
		if (object = 29) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "8_basic_collectibles";}instance_destroy();}
		if (object = 30) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "heart_balloon";}instance_destroy();}
		if (object = 31) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "1-up";}instance_destroy();}
		if (object = 32) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "2-up";}instance_destroy();}
		if (object = 33) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "3-up";}instance_destroy();}
		if (object = 34) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_1";}instance_destroy();}
		if (object = 35) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_2";}instance_destroy();}
		if (object = 36) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_3";}instance_destroy();}
		if (object = 37) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_4";}instance_destroy();}
		if (object = 38) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_5";}instance_destroy();}
		if (object = 39) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup";}instance_destroy();}
		if (object = 39001) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup_coil_spring";}instance_destroy();}
		#endregion /*Bump in ground END*/
		
		#region /*Basic Collectible*/
		if (object = 40) and (asset_get_type("obj_basic_collectible") == asset_object){instance_create_depth(x, y, 0, obj_basic_collectible); instance_destroy();}
		if (object = 41) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 315;}instance_destroy();}
		if (object = 42) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 270;}instance_destroy();}
		if (object = 43) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 225; image_yscale = -1;}instance_destroy();}
		if (object = 44) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 180; image_yscale = -1;}instance_destroy();}
		if (object = 45) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 135; image_yscale = -1;}instance_destroy();}
		if (object = 46) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 90;}instance_destroy();}
		if (object = 47) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 45;}instance_destroy();}
		#endregion /*Basic Collectible END*/
		
		#region /*Big Collectibles*/
		if (object = 48) and (asset_get_type("obj_big_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_big_collectible)){big_collectible = 1;}instance_destroy();}
		if (object = 49) and (asset_get_type("obj_big_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_big_collectible)){big_collectible = 2;}instance_destroy();}
		if (object = 50) and (asset_get_type("obj_big_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_big_collectible)){big_collectible = 3;}instance_destroy();}
		if (object = 51) and (asset_get_type("obj_big_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_big_collectible)){big_collectible = 4;}instance_destroy();}
		if (object = 52) and (asset_get_type("obj_big_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_big_collectible)){big_collectible = 5;}instance_destroy();}
		#endregion /*Big Collectibles END*/
		
		if (object = 53) and (asset_get_type("obj_heart_balloon") == asset_object){instance_create_depth(x, y, 0, obj_heart_balloon); instance_destroy();}
		if (object = 54) and (asset_get_type("obj_hp_pickup") == asset_object){instance_create_depth(x, y, 0, obj_hp_pickup); instance_destroy();}
		if (object = 55) and (asset_get_type("obj_invincibility_powerup") == asset_object){with(instance_create_depth(x, y, 0, obj_invincibility_powerup)){coil_spring = false;}instance_destroy();}
		if (object = 55001) and (asset_get_type("obj_invincibility_powerup") == asset_object){with(instance_create_depth(x, y, 0, obj_invincibility_powerup)){coil_spring = true;}instance_destroy();}
		if (object = 56) and (asset_get_type("obj_extra_life_pickup") == asset_object){instance_create_depth(x, y, 0, obj_extra_life_pickup); instance_destroy();}
		if (object = 57) and (asset_get_type("obj_extra_life_pickup") == asset_object){with(instance_create_depth(x, y, 0, obj_extra_life_pickup)){number_of_extra_lives = 2;}instance_destroy();}
		if (object = 58) and (asset_get_type("obj_extra_life_pickup") == asset_object){with(instance_create_depth(x, y, 0, obj_extra_life_pickup)){number_of_extra_lives = 3;}instance_destroy();}
		
		if (object = 59){if(asset_get_type("obj_basic_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = false;}instance_destroy();}else{instance_destroy();}}
		if (object = 5901){if(asset_get_type("obj_basic_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = false;coil_spring = true;}instance_destroy();}else{instance_destroy();}}
		if (object = 5902){if(asset_get_type("obj_basic_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = true;}instance_destroy();}else{instance_destroy();}}
		if (object = 5903){if(asset_get_type("obj_basic_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = true;coil_spring = true;}instance_destroy();}else{instance_destroy();}}
		
		if (object = 591){if(asset_get_type("obj_enemy_bowlingball") == asset_object){with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = false;}instance_destroy();}else{instance_destroy();}}
		if (object = 592){if(asset_get_type("obj_enemy_bowlingball") == asset_object){with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = false;coil_spring = true;}instance_destroy();}else{instance_destroy();}}
		if (object = 5911){if(asset_get_type("obj_enemy_bowlingball") == asset_object){with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = true;}instance_destroy();}else{instance_destroy();}}
		if (object = 5912){if(asset_get_type("obj_enemy_bowlingball") == asset_object){with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = true;coil_spring = true;}instance_destroy();}else{instance_destroy();}}
		if (object = 60){if(asset_get_type("obj_big_stationary_enemy") == asset_object){instance_create_depth(x, y, 0, obj_big_stationary_enemy); instance_destroy();}else{instance_destroy();}}
		if (object = 61){if(asset_get_type("obj_blaster") == asset_object){instance_create_depth(x, y, 0, obj_blaster); instance_destroy();}else{instance_destroy();}}
		if (object = 62) and (asset_get_type("obj_spring") == asset_object){with(instance_create_depth(x, y, 0, obj_spring)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}instance_destroy();}
		if (object = 63) and (asset_get_type("obj_vine") == asset_object){instance_create_depth(x, y, 0, obj_vine); instance_destroy();}
		if (object = 64) and (asset_get_type("obj_arrow_sign") == asset_object){with(instance_create_depth(x, y, 0, obj_arrow_sign)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}instance_destroy();}
		if (object = 65) and (asset_get_type("obj_arrow_sign_small") == asset_object){with(instance_create_depth(x, y, 0, obj_arrow_sign_small)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}instance_destroy();}
		if (object = 66) and (asset_get_type("obj_checkpoint") == asset_object){instance_create_depth(x, y, 0, obj_checkpoint); instance_destroy();}
		if (object = 67){if(asset_get_type("obj_spikes_emerge") == asset_object){instance_create_depth(x, y + 16, 0, obj_spikes_emerge); instance_destroy();}}
		if (object = 671){if(asset_get_type("obj_spikes_emerge") == asset_object){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 90; x += 20; y -= 15;}instance_destroy();}}
		if (object = 672){if(asset_get_type("obj_spikes_emerge") == asset_object){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 180; y -= 30;}instance_destroy();}}
		if (object = 673){if(asset_get_type("obj_spikes_emerge") == asset_object){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 270; x -= 20; y -= 15;}instance_destroy();}}
		if (object = 68) and (asset_get_type("obj_oneway") == asset_object){instance_create_depth(x, y, 0, obj_oneway); instance_destroy();}
		if (object = 69) and (asset_get_type("obj_oneway") == asset_object){with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 90;}instance_destroy();}
		if (object = 70) and (asset_get_type("obj_oneway") == asset_object){with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 180;}instance_destroy();}
		if (object = 71) and (asset_get_type("obj_oneway") == asset_object){with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 270;}instance_destroy();}
		if (object = 72) and (asset_get_type("obj_horizontal_rope") == asset_object){instance_create_depth(x, y, 0, obj_horizontal_rope); instance_destroy();}
		
		#region /*Create Water*/
		if (object = 73)
		{
			if (asset_get_type("obj_water") == asset_object)
			{
				with(instance_create_depth(x, y, 0, obj_water))
				{
					second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;
					second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;
					if (asset_get_type("spr_water") == asset_sprite)
					{
						sprite_index = spr_water;
					}
				}
			}
			instance_destroy();
		}
		#endregion /*Create Water END*/
		
		#region /*Create Water Surface*/
		if (object = 731)
		{
			if (asset_get_type("obj_water") == asset_object)
			{
				with(instance_create_depth(x, y, 0, obj_water))
				{
					second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;
					second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;
					if (asset_get_type("spr_water_surface") == asset_sprite)
					{
						sprite_index = spr_water_surface;
					}
					else
					if (asset_get_type("spr_water") == asset_sprite)
					{
						sprite_index = spr_water;
					}
				}
			}
			instance_destroy();
		}
		#endregion /*Create Water Surface END*/
		
		if (object = 735) and (asset_get_type("obj_air_bubbles_spawner") == asset_object){instance_create_depth(x, y, 0, obj_air_bubbles_spawner); instance_destroy();}
		if (object = 732) and (asset_get_type("obj_water_level_change") == asset_object){with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 0; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}instance_destroy();}
		if (object = 733) and (asset_get_type("obj_water_level_change") == asset_object){with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 1; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}instance_destroy();}
		if (object = 734) and (asset_get_type("obj_water_level_change") == asset_object){with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 2; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}instance_destroy();}
		
		if (object = 74) and (asset_get_type("obj_clipped_clothes") == asset_object){with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_shirt;}instance_destroy();}
		if (object = 75) and (asset_get_type("obj_clipped_clothes") == asset_object){with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_pants;}instance_destroy();}
		if (object = 76) and (asset_get_type("obj_clipped_clothes") == asset_object){with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_sock;}instance_destroy();}
		
		#region /*Bucket*/
		if (object = 77) and (asset_get_type("obj_bucket") == asset_object){instance_create_depth(x, y, 0, obj_bucket); instance_destroy();}
		if (object = 78) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "8_basic_collectibles";}instance_destroy();}
		if (object = 79) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "heart_balloon";}instance_destroy();}
		if (object = 80) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "1-up";}instance_destroy();}
		if (object = 81) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "2-up";}instance_destroy();}
		if (object = 82) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "3-up";}instance_destroy();}
		if (object = 83) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "big_collectible_1";}instance_destroy();}
		if (object = 84) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "big_collectible_2";}instance_destroy();}
		if (object = 85) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "big_collectible_3";}instance_destroy();}
		if (object = 86) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "big_collectible_4";}instance_destroy();}
		if (object = 87) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "big_collectible_5";}instance_destroy();}
		if (object = 88) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "invincibility_powerup";}instance_destroy();}
		if (object = 88001) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "invincibility_powerup_coil_spring";}instance_destroy();}
		#endregion /*Bucket END*/
		
		if (object = 89) and (asset_get_type("obj_bird") == asset_object){instance_create_depth(x, y, 0, obj_bird); instance_destroy();}
		if (object = 90) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_crouch; sprite_sign = spr_sign_crouch;}instance_destroy();}
		if (object = 91) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_dive; sprite_sign = spr_sign_dive;}instance_destroy();}
		if (object = 92) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_ground_pound; sprite_sign = spr_sign_ground_pound;}instance_destroy();}
		if (object = 93) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_rope_spin; sprite_sign = spr_sign_rope_spin;}instance_destroy();}
		if (object = 94) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_walljump; sprite_sign = spr_sign_walljump;}instance_destroy();}
		if (object = 95) and (asset_get_type("obj_boss") == asset_object){instance_create_depth(x, y, 0, obj_boss); instance_destroy();}
		if (object = 96) and (asset_get_type("obj_boss_barrier") == asset_object){instance_create_depth(x, y, 0, obj_boss_barrier); instance_destroy();}
		if (object = 961)
		and (asset_get_type("obj_cake_stealing_enemy") == asset_object)
		{
			ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
			if (global.character_select_in_this_menu = "main_game")
			and (ini_read_string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index), "clear_rate", "closed") != "clear")
			{
				with(instance_create_depth(x, y, 0, obj_cake_stealing_enemy))
				{
					cutscene = 1;
					image_xscale = -1;
					visible = true;
				}
				with(instance_create_depth(x, y, 0, obj_cake))
				{
					cutscene = 1;
				}
			}
			ini_close();
			instance_destroy();
		}
		if (object = 97) and (asset_get_type("obj_artwork_collection") == asset_object){instance_create_depth(x, y, 0, obj_artwork_collection); instance_destroy();}
	}
	#endregion /*Delete objects according to difficulty settings END*/
	
	else
	{
		instance_destroy(); /*Destroy object if difficulty setting and difficulty on object doesn't match*/
	}
}
#endregion /*Spawn objects when starting room END*/

#endregion /*All code before initializing the object*/

#region /*Difficulty settings per object*/
if (instance_exists(obj_leveleditor))
and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
{
	
	#region /*Set to appear on difficulty level*/
	if (mouse_check_button(mb_left))
	and (!mouse_check_button(mb_right))
	and (obj_leveleditor.erase_mode = false)
	and (obj_leveleditor.drag_object = false)
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_a_hold)
	and (!obj_leveleditor.key_b_hold)
	and (obj_leveleditor.erase_mode = false)
	and (obj_leveleditor.drag_object = false)
	{
		if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
		
		/*Place Brush Size 1*/
		or(obj_leveleditor.place_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y, id))
		or(obj_leveleditor.place_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 32, id))
		or(obj_leveleditor.place_brush_size >= 1) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 32, id))
		/*Place Brush Size 1 END*/
		
		/*Place Brush Size 2*/
		or(obj_leveleditor.place_brush_size >= 2) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.place_brush_size >= 2) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.place_brush_size >= 2) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.place_brush_size >= 2) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y, id))
		or(obj_leveleditor.place_brush_size >= 2) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y + 32, id))
		/*Place Brush Size 2 END*/
		
		/*Place Brush Size 3*/
		or(obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y, id))
		or(obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 32, id))
		or(obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y+64, id))
		or(obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y+64, id))
		or(obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y+64, id))
		or(obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y+64, id))
		/*Place Brush Size 3 END*/
		
		/*Place Brush Size 4 */
		or(obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y, id))
		or(obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 32, id))
		or(obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y+64, id))
		/*Place Brush Size 4 END*/
		
		/*Place Brush Size 5*/
		or(obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y, id))
		or(obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y + 32, id))
		or(obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y+64, id))
		or(obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y+96, id))
		or(obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y+96, id))
		or(obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y+96, id))
		or(obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y+96, id))
		or(obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y+96, id))
		or(obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y+96, id))
		/*Place Brush Size 5 END*/
	
		{
			if (obj_leveleditor.difficulty_layer = 1)
			and (obj_leveleditor.set_difficulty_mode = true)
			{
				if (easy = false)
				{
					easy = true;
				}
			}
			else
			if (obj_leveleditor.difficulty_layer = 2)
			and (obj_leveleditor.set_difficulty_mode = true)
			{
				if (normal = false)
				{
					normal = true;
				}
			}
			else
			if (obj_leveleditor.difficulty_layer = 3)
			and (obj_leveleditor.set_difficulty_mode = true)
			{
				if (hard = false)
				{
					hard = true;
				}
			}
		}
	}
	#endregion /*Set to appear on difficulty level END*/
	
	#region /*Set to dissapear on difficulty level*/
	if (mouse_check_button(mb_right))
	and (!mouse_check_button(mb_left))
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_b_hold)
	and (!obj_leveleditor.key_a_hold)
	{
		if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
		/*erase_brush_size >= 1*/
		or(obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y, id))
		or(obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 32, id))
		or(obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 32, id))
		/*erase_brush_size >= 2*/
		or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y, id))
		or(obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y + 32, id))
		/*erase_brush_size >= 3*/
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y, id))
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 32, id))
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y+64, id))
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y+64, id))
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y+64, id))
		or(obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y+64, id))
		/*erase_brush_size >= 4*/
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 32, id))
		or(obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y+64, id))
		/*erase_brush_size >= 5*/
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y - 64, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y - 32, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y + 32, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y+64, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x +96, obj_leveleditor.y+96, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y+96, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y+96, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y+96, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x -32, obj_leveleditor.y+96, id))
		or(obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y+96, id))
		{
			if (obj_leveleditor.difficulty_layer = 0)
			{
				if (easy = true)
				{
					easy = false;
				}
				if (normal = true)
				{
					normal = false;
				}
				if (hard = true)
				{
					hard = false;
				}
			}
			else
			if (obj_leveleditor.difficulty_layer = 1)
			and (obj_leveleditor.set_difficulty_mode = true)
			{
				if (easy = true)
				{
					easy = false;
				}
			}
			else
			if (obj_leveleditor.difficulty_layer = 2)
			and (obj_leveleditor.set_difficulty_mode = true)
			{
				if (normal = true)
				{
					normal = false;
				}
			}
			else
			if (obj_leveleditor.difficulty_layer = 3)
			and (obj_leveleditor.set_difficulty_mode = true)
			{
				if (hard = true)
				{
					hard = false;
				}
			}
		}
		#endregion /*Set to dissapear on difficulty level END*/
		
	}
}
#endregion /*Difficulty settings per object END*/