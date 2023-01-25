var mouse_get_x = display_mouse_get_x();
var mouse_get_y = display_mouse_get_y();

///Draw Event
draw_set_alpha(0.5);
draw_rectangle_color(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 0, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_line_width_color(0, camera_get_view_y(view_camera[0]), 0, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 4, c_white, c_white);
draw_line_width_color(0, camera_get_view_y(view_camera[0]), 0, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 2, c_black, c_black);

draw_set_alpha(0.5);
draw_rectangle_color(1, camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), 0, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_line_width_color(camera_get_view_x(view_camera[0]), 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), 0, 4, c_white, c_white);
draw_line_width_color(camera_get_view_x(view_camera[0]), 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), 0, 2, c_black, c_black);

#region /* Level Height Line / Level Height Line / Water Level Height Line */

#region /* Level Height Line */
if (instance_exists(obj_level_height))
{
	draw_line_width_color(camera_get_view_x(view_camera[0]), obj_level_height.y - 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), obj_level_height.y - 16, 4, c_white, c_white);
}
if (instance_exists(obj_level_height))
{
	draw_line_width_color(camera_get_view_x(view_camera[0]), obj_level_height.y - 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), obj_level_height.y - 16, 2, c_black, c_black);
}
#endregion /* Level Height Line END */

#region /* Level Width Line */
if (instance_exists(obj_level_width))
{
	draw_line_width_color(obj_level_width.x - 16, camera_get_view_y(view_camera[0]), obj_level_width.x - 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 4, c_white, c_white);
}
if (instance_exists(obj_level_width))
{
	draw_line_width_color(obj_level_width.x - 16, camera_get_view_y(view_camera[0]), obj_level_width.x - 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 2, c_black, c_black);
}
#endregion /* Level Width Line END */

#region /* Water Level Height Line */
if (instance_exists(obj_water_level_height))
{
	draw_line_width_color(camera_get_view_x(view_camera[0]), obj_water_level_height.y - 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), obj_water_level_height.y - 16, 4, c_white, c_white);
}
if (instance_exists(obj_water_level_height))
{
	draw_line_width_color(camera_get_view_x(view_camera[0]), obj_water_level_height.y - 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), obj_water_level_height.y - 16, 2, c_black, c_black);
}
#endregion /* Water Level Height Line END */

#endregion /* Level Height Line / Level Height Line / Water Level Height Line END */

scr_set_controls_used_to_navigate();

#region /* Backgrounds */
layer_background_sprite(layer_background_get_id(layer_get_id("Background")), global.custom_background1);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), global.custom_background2);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), global.custom_background3);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), global.custom_background4);
#endregion /* Backgrounds END */

#region /* Make background visible */
if (room = room_leveleditor)
{
	if (global.custom_background1 > noone)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background")), false)
	}

	if (global.custom_background2 > noone)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), false)
	}

	if (global.custom_background3 > noone)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), false)
	}

	if (global.custom_background4 > noone)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), false)
	}
}
#endregion /* Make background visible END */

#region /* Spawn transparent foreground */
if (asset_get_type("obj_foreground2") == asset_object)
and (!instance_exists(obj_foreground2))
{
	instance_create_depth(0, 0, 0, obj_foreground2);
}
if (asset_get_type("obj_foreground_secret") == asset_object)
and (!instance_exists(obj_foreground_secret))
{
	instance_create_depth(0, 0, 0, obj_foreground_secret);
}
#endregion /* Spawn transparent foreground END */

if (quit_level_editor <= 0)
{
	var cagetgory_x_terrain = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + 64 *	16	+ 32;
	var cagetgory_x_items = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + 64 *		21	+ 32;
	var cagetgory_x_enemies = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + 64 *	25	+ 32;
	var cagetgory_x_gizmos = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + 64 *	36	+ 32;
	
	draw_set_alpha(selected_menu_alpha);
	draw_rectangle_color(camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]), camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + 128, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(selected_menu_alpha * 0.1);
	draw_rectangle_color(camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]), cagetgory_x_terrain, camera_get_view_y(view_camera[view_current]) + 128, c_aqua, c_aqua, c_aqua, c_aqua, false);
	draw_rectangle_color(cagetgory_x_terrain, camera_get_view_y(view_camera[view_current]), cagetgory_x_items, camera_get_view_y(view_camera[view_current]) + 128, c_purple, c_purple, c_purple, c_purple, false);
	draw_rectangle_color(cagetgory_x_items, camera_get_view_y(view_camera[view_current]), cagetgory_x_enemies, camera_get_view_y(view_camera[view_current]) + 128, c_lime, c_lime, c_lime, c_lime, false);
	draw_rectangle_color(cagetgory_x_enemies, camera_get_view_y(view_camera[view_current]), cagetgory_x_gizmos, camera_get_view_y(view_camera[view_current]) + 128, c_yellow, c_yellow, c_yellow, c_yellow, false);
	draw_rectangle_color(cagetgory_x_gizmos, camera_get_view_y(view_camera[view_current]), camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + 128, c_red, c_red, c_red, c_red, false);
	
	draw_set_alpha(selected_menu_alpha);
	draw_rectangle_color(camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]), cagetgory_x_terrain, camera_get_view_y(view_camera[view_current]) + 3, c_aqua, c_aqua, c_aqua, c_aqua, false);
	draw_rectangle_color(cagetgory_x_terrain, camera_get_view_y(view_camera[view_current]), cagetgory_x_items, camera_get_view_y(view_camera[view_current]) + 3, c_purple, c_purple, c_purple, c_purple, false);
	draw_rectangle_color(cagetgory_x_items, camera_get_view_y(view_camera[view_current]), cagetgory_x_enemies, camera_get_view_y(view_camera[view_current]) + 3, c_lime, c_lime, c_lime, c_lime, false);
	draw_rectangle_color(cagetgory_x_enemies, camera_get_view_y(view_camera[view_current]), cagetgory_x_gizmos, camera_get_view_y(view_camera[view_current]) + 3, c_yellow, c_yellow, c_yellow, c_yellow, false);
	draw_rectangle_color(cagetgory_x_gizmos, camera_get_view_y(view_camera[view_current]), camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + 3, c_red, c_red, c_red, c_red, false);
}

#region /* List of Placable Objects */
if (global.world_editor == false)
{
	total_number_of_objects = 55; /* This is the total number of objects you have in the list to let the level editor know (0 is counted as object number 1) */
	//scr_draw_level_editor_placable_object(0, ds_grid_get(global.object_grid, 0, 0), ds_grid_get(global.object_grid, 10, 0), ds_grid_get(global.object_grid, 1, 0), ds_grid_get(global.object_grid, 3, 0), 0 * 64 + ds_grid_get(global.object_grid, 11, 0), ds_grid_get(global.object_grid, 4, 0), ds_grid_get(global.object_grid, 5, 0), ds_grid_get(global.object_grid, 6, 0));
	
	order_index = 0;
	
	#region /* Terrain Objects */
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall, true, spr_wall, spr_wall, 0, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_dirt, true, spr_wall_dirt, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_glass, true, spr_wall_glass, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_grass, true, spr_wall_grass, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_gravel, true, spr_wall_gravel, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_metal, true, spr_wall_metal, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_stone, true, spr_wall_stone, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_wood, true, spr_wall_wood, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_spikes, true, spr_spikes, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_semisolid_platform, true, spr_semisolid_platform, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_brick_block, true, spr_brick_block, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_question_block, true, spr_question_block, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_hard_block, true, spr_hard_block, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_falling_block, true, spr_falling_block, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_falling_block_long, true, spr_falling_block_long, spr_falling_block_long, + 64, 1, 0, c_white, 0, -16);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_cloud_block, true, spr_cloud_block, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_ice_block, true, spr_ice_block, spr_wall, + 64, 1, 0, c_white);
	#endregion /* Terrain Objects END*/
	
	#region /* Item Objects */
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_basic_collectible, true, global.resource_pack_sprite_basic_collectible, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_big_collectible_1, false, global.resource_pack_sprite_big_collectible, spr_wall, 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_heart, true, spr_heart, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_invincibility_powerup, true, global.resource_pack_sprite_invincibility_powerup, spr_wall, + 64, 1, 0, c_white);
	var one_up_x = 64 * order_index; scr_draw_level_editor_placable_object(21, level_object_id.id_one_up, true, sprite_lives_icon, spr_wall, + 64, 1, 0, c_white);draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + one_up_x, camera_get_view_y(view_camera[view_current]) + 64, "1-up", global.default_text_size / 2, c_white, c_black, selected_menu_alpha);
	#endregion /* Item Objects END */
	
	#region /* Enemy Objects */
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_basic_enemy, true, sprite_basic_enemy, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_enemy_bowlingball, true, sprite_enemy_bowlingball, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_big_stationary_enemy, true, sprite_big_stationary_enemy, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_boss, false, spr_boss_stand, spr_wall, + 64, 0.5, 0, c_white);
	#endregion /* Enemy Objects END */
	
	#region /* Gizmo Objects */
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_blaster, true, global.resource_pack_sprite_blaster, spr_wall, + 64, 1, 0, c_white, -16);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_door, false, spr_door, spr_wall, + 64, 1, 0, c_white, -16);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_spring, false, spr_spring, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_ladder, true, spr_ladder, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_arrow_sign, false, spr_arrow_sign, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_checkpoint, false, spr_checkpoint, spr_wall, + 64, 1, 0, c_white, -32);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_spikes_emerge_block, true, spr_spikes_emerge_block, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_oneway, false, spr_oneway, spr_wall, + 64, 1, 0, c_white, -16,);
	#endregion /* Gizmo Objects END */
	
	#region /* Special Items */
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_cardboard_block, true, spr_cardboard_block, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_cardboard, true, spr_cardboard, spr_cardboard, + 64, 0.75, 0, c_white, 0, -8);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_cardboard_long, true, spr_cardboard_long, spr_cardboard_long, + 64, 0.5, 0, c_white, 0, -16);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_bump_in_ground, true, spr_bump_in_ground, spr_wall, + 64, 1, 0, c_white, -16);
	var num_wall_jump_panel = order_index; scr_draw_level_editor_placable_object(num_wall_jump_panel, level_object_id.id_wall_jump_panel, true, spr_wall_jump_panel, spr_wall, + 64, 1.5, 0, c_white, 0, +16);if (selected_object == num_wall_jump_panel){draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + 144, l10n_text("Wall Jump Panel - When a character doesn't have the wall jump ability, lets even these characters wall jump"), global.default_text_size * 0.75, c_black, c_white, selected_menu_alpha);}
	var num_wall_climb_panel = order_index; scr_draw_level_editor_placable_object(num_wall_climb_panel, level_object_id.id_wall_climb_panel, true, spr_wall_climb_panel, spr_wall, + 64, 1.5, 0, c_white, 0, +16);if (selected_object == num_wall_climb_panel){draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + 144, l10n_text("Wall Climb Panel - When a character doesn't have the wall climb ability, lets even these characters wall climb"), global.default_text_size * 0.75, c_black, c_white, selected_menu_alpha);}
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_melon_block, true, spr_melon_block, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_horizontal_rope, true, spr_horizontal_rope, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_water, false, spr_water_surface, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_breathable_water, false, spr_water_surface, spr_wall, + 64, 1, 0, c_white, 0, 0, 0.5);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_air_bubbles_spawner, true, spr_air_bubbles_spawner, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_water_level_change_slow, false, spr_water_level_change_slow, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_water_level_change_fast, false, spr_water_level_change_fast, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_water_level_change_faster, false, spr_water_level_change_faster, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_clipped_shirt, true, spr_clipped_shirt, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_bucket, true, spr_bucket, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_bird, true, spr_bird, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_sign_crouch, true, spr_sign_crouch, spr_wall, + 64, 0.5, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_boss_barrier, true, spr_boss_barrier, spr_wall, + 64, 1, 0, c_white);
	var num_cake_stealing_enemy = order_index; scr_draw_level_editor_placable_object(num_cake_stealing_enemy, level_object_id.id_cake_stealing_enemy, false, global.resource_pack_sprite_cake, spr_wall, + 64, 1, 0, c_white, -16, 0, 1, 0);scr_draw_level_editor_placable_object(num_cake_stealing_enemy, level_object_id.id_cake_stealing_enemy, false, sprite_basic_enemy, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_artwork_collection, false, spr_artwork_collection, spr_wall, + 64, 1, 0, c_white);
	scr_draw_level_editor_placable_object(order_index, level_object_id.id_block_only_when_player_is_near, true, global.resource_pack_sprite_block_only_when_player_is_near, spr_wall, + 64, 1, 0, c_white);
	#endregion /* Special Items END*/
	
}
else
{
	total_number_of_objects = 6; /* This is the total number of objects you have in the list to let the level editor know (0 is counted as object number 1) */
	if (selected_object == 0){place_object = world_object_id.id_wall;can_make_place_brush_size_bigger = true; if (asset_get_type("spr_wall") == asset_sprite){sprite_index = spr_wall;}mask_index = spr_wall;}
	if (selected_object == 1)
	{
		place_object = world_object_id.id_level;
		can_make_place_brush_size_bigger = false;
		if (asset_get_type("spr_level_ring") == asset_sprite)
		{
			draw_sprite_ext(spr_level_ring, 0, x, y, 1, 1, 0, c_yellow, 0.5);
		}
		if (asset_get_type("spr_level") == asset_sprite)
		{
			draw_sprite_ext(spr_level, 0, x, y, 1, 1, 0, c_black, 0.5);
		}
		sprite_index = spr_noone; 
		mask_index = spr_wall;
	}
	if (selected_object == 2){place_object = world_object_id.id_exit;can_make_place_brush_size_bigger = false; if (asset_get_type("spr_map_exit") == asset_sprite){sprite_index = spr_map_exit;}mask_index = spr_wall;}
	if (selected_object == 3)
	{
		place_object = world_object_id.id_right_down;
		can_make_place_brush_size_bigger = false;
		if (asset_get_type("spr_map_turn_right_down") == asset_sprite)
		{
			draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 0, c_white, 0.5);
		}
		sprite_index = spr_noone;
		mask_index = spr_wall;
	}
	if (selected_object == 4)
	{
		place_object = world_object_id.id_up_right;
		can_make_place_brush_size_bigger = false;
		if (asset_get_type("spr_map_turn_right_down") == asset_sprite)
		{
			draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 90, c_white, 0.5);
		}
		sprite_index = spr_noone;
		mask_index = spr_wall;
	}
	if (selected_object == 5)
	{
		place_object = world_object_id.id_up_left;
		can_make_place_brush_size_bigger = false;
		if (asset_get_type("spr_map_turn_right_down") == asset_sprite)
		{
			draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 180, c_white, 0.5);
		}
		sprite_index = spr_noone;
		mask_index = spr_wall;
	}
	if (selected_object == 6)
	{
		place_object = world_object_id.id_left_down;
		can_make_place_brush_size_bigger = false;
		if (asset_get_type("spr_map_turn_right_down") == asset_sprite)
		{
			draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 270, c_white, 0.5);
		}
		sprite_index = spr_noone;
		mask_index = spr_wall;
	}
}
#endregion /* List of Placable Objects END */

#region /* Keyboard Shortcuts */

#region /* Press D key to change to drawing tool in level editor */
if (keyboard_check_pressed(ord("D")))
{
	if (fill_mode == false)
	and (erase_mode == false)
	{
		if (place_brush_size == 0)
		{
			place_brush_size = 1;
		}
		else
		if (place_brush_size == 1)
		{
			place_brush_size = 2;
		}
		else
		if (place_brush_size == 2)
		{
			place_brush_size = 3;
		}
		else
		if (place_brush_size == 3)
		{
			place_brush_size = 4;
		}
		else
		if (place_brush_size == 4)
		{
			place_brush_size = 5;
		}
		else
		if (place_brush_size == 5)
		{
			place_brush_size = 0;
		}
	}
	else
	{
		fill_mode = false;
		erase_mode = false;
	}
}
#endregion /* Press D key to change to drawing tool in level editor END */

#region /* Press E key to change to erase tool in level editor */
if (keyboard_check_pressed(ord("E")))
and (pause == false)
{
	if (erase_mode == false)
	{
		erase_mode = true;
		fill_mode = false;
	}
	else
	if (erase_mode == true)
	{
		fill_mode = false;
		if (erase_brush_size == 0)
		{
			erase_brush_size = 1;
		}
		else
		if (erase_brush_size == 1)
		{
			erase_brush_size = 2;
		}
		else
		if (erase_brush_size == 2)
		{
			erase_brush_size = 3;
		}
		else
		if (erase_brush_size == 3)
		{
			erase_brush_size = 4;
		}
		else
		if (erase_brush_size == 4)
		{
			erase_brush_size = 5;
		}
		else
		if (erase_brush_size == 5)
		{
			erase_brush_size = 0;
		}
	}
}
#endregion /* Press E key to change to erase tool in level editor */

#region /* Press F key to change to fill tool in level editor */
if (keyboard_check_pressed(ord("F")))
{
	if (fill_mode == false)
	{
		erase_mode = false;
		fill_mode = true;
	}
	else
	if (fill_mode_type == "fill")
	and (erase_mode == false)
	and (fill_mode == true)
	{
		erase_mode = false;
		fill_mode_type = "horizontal";
	}
	else
	if (fill_mode_type == "horizontal")
	and (erase_mode == false)
	and (fill_mode == true)
	{
		erase_mode = false;
		fill_mode_type = "vertical";
	}
	else
	if (fill_mode_type == "vertical")
	and (erase_mode == false)
	and (fill_mode == true)
	{
		erase_mode = false;
		fill_mode_type = "fill";
	}
}
#endregion /* Press F key to change to fill tool in level editor */

#region /* Scroll mouse wheel to change drawing tool size in level editor */
if (fill_mode == false)
and (erase_mode == false)
and (mouse_check_button(mb_left))
and (pause == false)
{
	if (mouse_wheel_down())
	{
		if (place_brush_size > 0)
		{
			place_brush_size -= 1;
		}
	}
	else
	if (mouse_wheel_up())
	{
		if (place_brush_size < 5)
		{
			place_brush_size += 1;
		}
	}
}
#endregion /* Scroll mouse wheel to change drawing tool size in level editor End */

#region /* Scroll mouse wheel to change erase tool size in level editor */
if (erase_mode == true)
and (pause == false)
{
	if (mouse_wheel_down())
	{
		fill_mode = false;
		if (erase_brush_size > 0)
		{
			erase_brush_size -= 1;
		}
	}
	else
	if (mouse_wheel_up())
	{
		fill_mode = false;
		if (erase_brush_size < 5)
		{
			erase_brush_size += 1;
		}
	}
}
#endregion /* Scroll mouse wheel to change erase tool size in level editor END */

#region /* Grid hotkeys */
if (keyboard_check(vk_control))
and (keyboard_check(vk_shift))
and (keyboard_check_pressed(ord("A")))
and (pause == false)
{
	show_grid = true;
	if (global.grid_hsnap > 16)
	or (global.grid_vsnap > 16)
	{
		global.grid_hsnap -= 16;
		global.grid_vsnap -= 16;
	}
}
else
if (keyboard_check(vk_control))
and (keyboard_check(vk_shift))
and (keyboard_check_pressed(ord("S")))
and (pause == false)
{
	show_grid = true;
	global.grid_hsnap += 16;
	global.grid_vsnap += 16;
}
else
if (keyboard_check(vk_control))
and (!keyboard_check(vk_shift))
and (keyboard_check_pressed(ord("A")))
and (pause == false)
{
	show_grid = true;
	if (global.grid_hsnap > 1)
	or (global.grid_vsnap > 1)
	{
		global.grid_hsnap -= 1;
		global.grid_vsnap -= 1;
	}
}
else
if (keyboard_check(vk_control))
and (!keyboard_check(vk_shift))
and (keyboard_check_pressed(ord("S")))
and (pause == false)
{
	show_grid = true;
	global.grid_hsnap += 1;
	global.grid_vsnap += 1;
}
#endregion /* Grid hotkeys END */

#endregion /* Keyboard Shortcuts END */

#region /* Draw Grid */

#region /* Show or hide grid hotkey */
if (keyboard_check_pressed(ord("G")))
and (pause == false)
{
	if (show_grid == false)
	{
		show_grid = true;
	}
	else
	{
		show_grid = false;
	}
}
#endregion /* Show or hide grid hotkey END */

#region /* Fade grid in and out when toggeling */
if (show_grid == true)
{
	grid_alpha = lerp(grid_alpha, 0.25, 0.1);
}
else
{
	grid_alpha = lerp(grid_alpha, 0, 0.1);
}
#endregion /* Fade grid in and out when toggeling END */

var grid_width = 1,
grid_offset = 16; /* If the grid should have an offset from the top_left corner of the screen, normally this should be 16 */
draw_set_alpha(grid_alpha);

if (quit_level_editor <= 0)
{
	
	#region /* Draw Horizontal Line in the Grid */
	for(var i = 0; i < room_width; i += global.grid_hsnap)
	{
		if (global.grid_hsnap > 1)
		{
			draw_line_width_color(i + grid_offset, - 16 + grid_offset, i + grid_offset, room_height + 16 + grid_offset, grid_width, c_white, c_white);
		}
	}
	#endregion /* Draw Horizontal Line in the Grid END */
	
	#region /* Draw Vertical Line in the Grid */
	for(var i = 0; i < room_height; i += global.grid_vsnap)
	{
		if (global.grid_vsnap > 1)
		{
			draw_line_width_color(- 16 + grid_offset, i + grid_offset, room_width + 16 + grid_offset, i + grid_offset, grid_width, c_white, c_white);
		}
	}
	#endregion /* Draw Vertical Line in the Grid END */
	
	#region /* Draw Horizontal Line in the Grid for indicating rooms */
	for(var i = 0; i < room_width; i += global.grid_hsnap * 24)
	{
		if (global.grid_hsnap > 1)
		{
			draw_line_width_color(i + grid_offset, - 16 + grid_offset, i + grid_offset, room_height + 16 + grid_offset, grid_width * 3, c_white, c_white);
		}
	}
	#endregion /* Draw Horizontal Line in the Grid for indicating rooms END */
	
	#region /* Draw Vertical Line in the Grid for indicating rooms */
	for(var i = 0; i < room_height; i += global.grid_vsnap * 13)
	{
		if (global.grid_vsnap > 1)
		{
			draw_line_width_color(- 16 + grid_offset, i + grid_offset, room_width + 16 + grid_offset, i + grid_offset, grid_width * 3, c_white, c_white);
		}
	}
	#endregion /* Draw Vertical Line in the Grid for indicating rooms END */
	
	if (instance_exists(obj_level_height))
	{
		draw_line_width_color(0, obj_level_height.y/ 2, room_width, obj_level_height.y/ 2, grid_width + 1, c_purple, c_purple); /* Draw Horizontal Line in the middle of the level */
	}
	if (instance_exists(obj_level_width))
	{
		draw_line_width_color(obj_level_width.x / 2, 0, obj_level_width.x / 2, room_height, grid_width + 1, c_purple, c_purple); /* Draw Vertical Line in the middle of the level */
	}
}

draw_set_alpha(1);
#endregion /* Draw Grid END */

#region /* Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more) */
if (pause == false)
{

	#region /* Zoom Out */
	if (zoom_out == true)
	{
		if (camera_get_view_width(view_camera[view_current]) < room_width)
		and (camera_get_view_height(view_camera[view_current]) < room_height)
		{
			camera_set_view_size((view_camera[view_current]), camera_get_view_width(view_camera[view_current]) + 8, camera_get_view_height(view_camera[view_current]) + 4.5);
			camera_set_view_pos((view_camera[view_current]), camera_get_view_x(view_camera[view_current]) -4, camera_get_view_y(view_camera[view_current]) - 2.5); /* Move camera position when zooming out so it doesn't look too weird */
		}
		else
		{
			draw_rectangle_color(0, 0, camera_get_view_x(view_camera[view_current]) + 8, room_height, c_red, c_red, c_red, c_red, false);
			draw_rectangle_color(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 8, 0, room_width, room_height, c_red, c_red, c_red, c_red, false);
			draw_rectangle_color(0, 0, room_width, camera_get_view_y(view_camera[view_current]) + 8, c_red, c_red, c_red, c_red, false);
			draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 8, room_width, room_height, c_red, c_red, c_red, c_red, false);
		}
	}
	#endregion /* Zoom Out END */
	
	else
	
	#region /* Reset Zoom */
	if (zoom_reset == true)
	{
		
		#region /* Limit so cursor and view can't go outside room */
		scr_set_screen_size();
		
		#region /* Limit controller x and controller y inside room */
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
		#endregion /* Limit controller x and controller y inside room END */
		
		#region /* Limit x and y inside room */
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
		#endregion /* Limit x and y inside room END */
		
		#region /* Limit view inside room */
		camera_set_view_pos(view_camera[view_current],
		max(0, min(camera_get_view_x(view_camera[view_current]), room_width - camera_get_view_width(view_camera[view_current]))),
		max(0, min(camera_get_view_y(view_camera[view_current]), room_height - camera_get_view_height(view_camera[view_current]))));
		#endregion /* Limit view inside room END */
		
		#endregion /* Limit so view and cursor can't go outside room END */
		
	}
	#endregion /* Reset Zoom END */
	
	else
	
	#region /* Zoom In */
	if (zoom_in == true)
	{
		if (camera_get_view_width(view_camera[view_current]) > 696)
		and (camera_get_view_height(view_camera[view_current]) > 368)
		{
			camera_set_view_size((view_camera[view_current]), camera_get_view_width(view_camera[view_current]) - 8, camera_get_view_height(view_camera[view_current]) -4.5);
			camera_set_view_pos((view_camera[view_current]), camera_get_view_x(view_camera[view_current]) + 4, camera_get_view_y(view_camera[view_current]) + 2.5); /* Move camera position when zooming in so it doesn't look too weird */
		}
		else
		{
			draw_rectangle_color(0, 0, camera_get_view_x(view_camera[view_current]) + 1, room_height, c_red, c_red, c_red, c_red, false);
			draw_rectangle_color(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 1, 0, room_width, room_height, c_red, c_red, c_red, c_red, false);
			draw_rectangle_color(0, 0, room_width, camera_get_view_y(view_camera[view_current]) + 1, c_red, c_red, c_red, c_red, false);
			draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 1, room_width, room_height, c_red, c_red, c_red, c_red, false);
		}
	}
	#endregion /* Zoom In END */

}
#endregion /* Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more) END */

#region /* Select Object Menu */
if (mouse_check_button(mb_any))
or (keyboard_check(vk_anykey))
or (key_a_hold)
{
	selected_menu_alpha = lerp(selected_menu_alpha, 0, 0.1);
}
else
{
	selected_menu_alpha = lerp(selected_menu_alpha, 0, 0.01);
}
if (quit_level_editor <= 0)
{
	if (global.world_editor == true)
	{
		if (asset_get_type("spr_wall") == asset_sprite){draw_sprite_ext(spr_wall, 0,											camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white, selected_menu_alpha);}
		if (asset_get_type("spr_level_ring") == asset_sprite){draw_sprite_ext(spr_level_ring, 0,								camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + 64, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_yellow, selected_menu_alpha);}
		if (asset_get_type("spr_level") == asset_sprite){draw_sprite_ext(spr_level, 0,											camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + 64, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_black, selected_menu_alpha);}
		if (asset_get_type("spr_map_exit") == asset_sprite){draw_sprite_ext(spr_map_exit, 0,									camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + 64 * 2, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white, selected_menu_alpha);}
		if (asset_get_type("spr_map_turn_right_down") == asset_sprite){draw_sprite_ext(spr_map_turn_right_down, 0,				camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + 64 * 3, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 0, c_white, selected_menu_alpha);}
		if (asset_get_type("spr_map_turn_right_down") == asset_sprite){draw_sprite_ext(spr_map_turn_right_down, 0,				camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + 64 * 4, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 90, c_white, selected_menu_alpha);}
		if (asset_get_type("spr_map_turn_right_down") == asset_sprite){draw_sprite_ext(spr_map_turn_right_down, 0,				camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + 64 * 5, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 180, c_white, selected_menu_alpha);}
		if (asset_get_type("spr_map_turn_right_down") == asset_sprite){draw_sprite_ext(spr_map_turn_right_down, 0,				camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + 64 * 6, camera_get_view_y(view_camera[view_current]) + 64, 1, 1, 270, c_white, selected_menu_alpha);}
	}
	
	#region /* Draw an arrow pointing to currently selected object */
	draw_set_color(c_black);
	draw_set_alpha(selected_menu_alpha);
	draw_arrow(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + 16 - 8, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + 16 + 8, 40);
	draw_set_color(c_white);
	draw_arrow(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + 16 - 8, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + 16 + 8, 30);
	draw_set_color(c_black);
	draw_arrow(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + 128 - 16 + 8, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + 128 - 16 - 8, 40);
	draw_set_color(c_white);
	draw_arrow(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + 128 - 16 + 8, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + 128 - 16 - 8, 30);
	draw_set_alpha(1);
	#endregion /* Draw an arrow pointing to currently selected object END */
	
}
#endregion /* Select Object Menu END */

#region /* Position the Cursor */
if (quit_level_editor <= 0)
{

#region /* Scroll Cursor */
if (keyboard_check(vk_space))
and (mouse_check_button(mb_left))
or (mouse_check_button(mb_middle))
{
	if (asset_get_type("spr_cursor_scroll") == asset_sprite)
	{
		mouse_sprite = spr_cursor_scroll;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_size_all);
	}
}
else
if (keyboard_check(vk_space))
{
	if (asset_get_type("spr_cursor_scroll") == asset_sprite)
	{
		mouse_sprite = spr_cursor_scroll;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_size_all);
	}
}
#endregion /* Scroll Cursor END */

else

#region /* Fill Cursor */
if (fill_mode == true)
and (erase_mode == false)
and (scroll_view == false)
and (!place_meeting(x, y, obj_level_player_1_start))
and (!place_meeting(x, y, obj_level_player_2_start))
and (!place_meeting(x, y, obj_level_player_3_start))
and (!place_meeting(x, y, obj_level_player_4_start))
and (!place_meeting(x, y, obj_level_end))
{
	if (!place_meeting(x, y, obj_leveleditor_placed_object))
	and (sprite_index >= 0)
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 0.2);
	}
	draw_set_alpha(0.5);
	draw_set_alpha(1);
	if (asset_get_type("spr_cursor_fill") == asset_sprite)
	{
		mouse_sprite = spr_cursor_fill;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_arrow);
	}
}
#endregion /* Fill Cursor END */

else

#region /* Erase Cursor */
if (erase_mode == true)
and (scroll_view == false)
and (pause == false)
{
	draw_set_alpha(0.5);
	{
		if (erase_brush_size == 5)
		{
			draw_rectangle_color(x - 80, y - 80, x + 112, y + 112, c_red, c_red, c_red, c_red, false);
		}
		else
		if (erase_brush_size == 4)
		{
			draw_rectangle_color(x - 80, y - 80, x + 80, y + 80, c_red, c_red, c_red, c_red, false);
		}
		else
		if (erase_brush_size == 3)
		{
			draw_rectangle_color(x - 48, y - 48, x + 80, y + 80, c_red, c_red, c_red, c_red, false);
		}
		else
		if (erase_brush_size == 2)
		{
			draw_rectangle_color(x - 48, y - 48, x + 48, y + 48, c_red, c_red, c_red, c_red, false);
		}
		else
		if (erase_brush_size == 1)
		{
			draw_rectangle_color(x - 16, y - 16, x + 48, y + 48, c_red, c_red, c_red, c_red, false);
		}
		else
		{
			draw_rectangle_color(x - 16, y - 16, x + 16, y + 16, c_red, c_red, c_red, c_red, false);
		}
	}
	draw_set_alpha(1);
	if (asset_get_type("spr_cursor_erase") == asset_sprite)
	{
		mouse_sprite = spr_cursor_erase;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_arrow);
	}
}
#endregion /* Erase Cursor END */

else

#region /* Default Cursor */
if (asset_get_type("obj_leveleditor_placed_object") == asset_object)
and (scroll_view == false)
and (drag_object == false)
and (fill_mode == false)
and (pause == false)
{
	if (!place_meeting(x, y, obj_leveleditor_placed_object))
	and (sprite_index >= 0)
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 0.2);
	}
	
	if (can_make_place_brush_size_bigger == true)
	and (sprite_index >= 0)
	{
		if (!place_meeting(x + 32, y, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 1){draw_sprite_ext(sprite_index, image_index, x + 32, y, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 32, y + 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 1){draw_sprite_ext(sprite_index, image_index, x + 32, y + 32, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x, y + 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 1){draw_sprite_ext(sprite_index, image_index, x, y + 32, 1, 1, 0, c_white, 0.2);}
		
		if (!place_meeting(x + 32, y - 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x + 32, y - 32, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x, y - 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x, y - 32, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x - 32, y - 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x - 32, y - 32, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x - 32, y, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x - 32, y, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x - 32, y + 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x - 32, y + 32, 1, 1, 0, c_white, 0.2);}
		
		if (!place_meeting(x + 64, y - 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 64, y - 32, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 64, y, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 64, y, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 64, y + 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 64, y + 32, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 64, y + 64, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 64, y + 64, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 32, y + 64, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 32, y + 64, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x, y + 64, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x, y + 64, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x - 32, y + 64, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x - 32, y + 64, 1, 1, 0, c_white, 0.2);}
		
		if (!place_meeting(x + 64, y - 64, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x + 64, y - 64, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 32, y - 64, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x + 32, y - 64, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x, y - 64, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x, y - 64, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x - 32, y - 64, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 32, y - 64, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x - 64, y - 64, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y - 64, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x - 64, y - 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y - 32, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x - 64, y, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x - 64, y + 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y + 32, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x - 64, y + 64, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y + 64, 1, 1, 0, c_white, 0.2);}
		
		if (!place_meeting(x + 96, y - 64, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 96, y - 64, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 96, y - 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 96, y - 32, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 96, y, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 96, y, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 96, y + 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 96, y + 32, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 96, y + 64, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 96, y + 64, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 96, y + 96, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 96, y + 96, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 64, y + 96, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 64, y + 96, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x + 32, y + 96, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 32, y + 96, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x, y + 96, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x, y + 96, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x - 32, y + 96, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x - 32, y + 96, 1, 1, 0, c_white, 0.2);}
		if (!place_meeting(x - 64, y + 96, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x - 64, y + 96, 1, 1, 0, c_white, 0.2);}
	}
	
	#region /* Draw a rectangle around the placable objects */
	if (place_brush_size == 5)
	and (can_make_place_brush_size_bigger == true)
	{
		draw_rectangle_color(x - 80, y - 80, x + 112, y + 112, c_black, c_black, c_black, c_black, true);
	}
	else
	if (place_brush_size == 4)
	and (can_make_place_brush_size_bigger == true)
	{
		draw_rectangle_color(x - 80, y - 80, x + 80, y + 80, c_black, c_black, c_black, c_black, true);
	}
	else
	if (place_brush_size == 3)
	and (can_make_place_brush_size_bigger == true)
	{
		draw_rectangle_color(x - 48, y - 48, x + 80, y + 80, c_black, c_black, c_black, c_black, true);
	}
	else
	if (place_brush_size == 2)
	and (can_make_place_brush_size_bigger == true)
	{
		draw_rectangle_color(x - 48, y - 48, x + 48, y + 48, c_black, c_black, c_black, c_black, true);
	}
	else
	if (place_brush_size == 1)
	and (can_make_place_brush_size_bigger == true)
	{
		draw_rectangle_color(x - 16, y - 16, x + 48, y + 48, c_black, c_black, c_black, c_black, true);
	}
	else
	{
		if (mask_index == spr_2x2_block)
		{
			draw_rectangle_color(x - 24, y - 24, x + 24, y + 24, c_black, c_black, c_black, c_black, true);
		}
		else
		{
			draw_rectangle_color(x - 16, y - 16, x + 16, y + 16, c_black, c_black, c_black, c_black, true);
		}
	}
	#endregion /* Draw a rectangle around the placable objects END */

	if (asset_get_type("spr_cursor_brush") == asset_sprite)
	{
		mouse_sprite = spr_cursor_brush;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_arrow);
	}
}
#endregion /* Default Cursor END */

else

#region /* Drag Cursor */
if (asset_get_type("obj_leveleditor_placed_object") == asset_object)
and (place_meeting(x, y, obj_leveleditor_placed_object))
or (asset_get_type("obj_level_player_1_start") == asset_object)
and (place_meeting(x, y, obj_level_player_1_start))
or (asset_get_type("obj_level_player_2_start") == asset_object)
and (place_meeting(x, y, obj_level_player_2_start))
or (asset_get_type("obj_level_player_3_start") == asset_object)
and (place_meeting(x, y, obj_level_player_3_start))
or (asset_get_type("obj_level_player_4_start") == asset_object)
and (place_meeting(x, y, obj_level_player_4_start))
or (asset_get_type("obj_level_end") == asset_object)
and (place_meeting(x, y, obj_level_end))
{
	if (drag_object == false)
	and (fill_mode == false)
	and (erase_mode == false)
	and (!mouse_check_button(mb_left))
	or (!key_a_hold)
	{
		if (asset_get_type("spr_cursor_grab") == asset_sprite)
		{
			mouse_sprite = spr_cursor_grab;
			window_set_cursor(cr_none);
		}
	}
	else
	if (drag_object == true)
	and (erase_mode == false)
	{
		if (asset_get_type("spr_cursor_grab") == asset_sprite)
		{
			mouse_sprite = spr_cursor_grab;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_drag);
		}
	}
}
#endregion /* Drag Cursor END */

}
#endregion /* Position the Cursor END */

#region /* Change modes */
if (mouse_check_button_pressed(mb_right))
{
	if (pause == false)
	and (menu_delay == 0)
	{
		erase_mode = true;
	}
}
if (mouse_check_button_released(mb_right))
{
	if (pause == false)
	and (menu_delay == 0)
	{
		erase_mode = false;
	}
}
#endregion /* Change modes END */

if (quit_level_editor <= 0)
{
	
	#region /* When pressing left click, increase current undo value */
	if (mouse_check_button_pressed(mb_left))
	{
		current_undo_value += 1;
	}
	#endregion /* When pressing left click, increase current undo value END */
	
	#region /* Minimum undo value */
	if (current_undo_value <= 0)
	{
		current_undo_value = 0;
	}
	#endregion /* Minimum undo value END */
	
	#region /* Can put objects above other objects toggle */
	if (keyboard_check_pressed(ord("S")))
	and (!keyboard_check(vk_control))
	{
		if (can_put_objects_above_other_objects == false)
		{
			can_put_objects_above_other_objects = true;
		}
		else
		{
			can_put_objects_above_other_objects = false;
		}
	}
	#endregion /* Can put objects above other objects toggle END */
	
	#region /* Fill with Objects */
	if (mouse_check_button(mb_left))
	and (!keyboard_check(vk_space))
	and (!mouse_check_button(mb_middle))
	and (!mouse_check_button(mb_right))
	and (!key_b_hold)
	and (scroll_view == false)
	and (drag_object == false)
	and (fill_mode == true)
	and (erase_mode == false)
	and (pause == false)
	and (menu_delay == 0)
	and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2)) /* Can't place objects when clicking the bottom buttons */
	and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom buttons */
	and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /* Can't place objects when clicking the top buttons */
	{
		if (!place_meeting(x, y, obj_leveleditor_placed_object))
		and (!place_meeting(x, y, obj_leveleditor_fill))
		{
			if (fill_mode_type == "fill")
			{
				with (instance_create_depth(x, y, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "fill";
				}
			}
			else
			if (fill_mode_type == "horizontal")
			{
				with (instance_create_depth(x, y, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "horizontal";
				}
			}
			else
			if (fill_mode_type == "vertical")
			{
				with (instance_create_depth(x, y, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "vertical";
				}
			}
		}
	}
	#endregion /* Fill with Objects END */
	
	#region /* SELECT WHAT OBJECT TO PLACe */
	
	#region /* Scroll Objects Left */
	if (mouse_wheel_up())
	and (!mouse_check_button(mb_middle))
	and (!key_a_pressed)
	and (!mouse_check_button(mb_left))
	and (erase_mode == false)
	and (pause == false)
	or (keyboard_check_pressed(ord("Q")))
	and (!mouse_check_button(mb_middle))
	and (!key_a_pressed)
	and (!mouse_check_button(mb_left))
	and (erase_mode == false)
	and (pause == false)
	or (gamepad_button_check_pressed(0, gp_shoulderl))
	and (erase_mode == false)
	and (pause == false)
	{
		if (asset_get_type("obj_leveleditor_fill") == asset_object)
		and (!instance_exists(obj_leveleditor_fill))
		{
			scr_audio_play(snd_leveleditor_cycle_item_left, volume_source.sound);
			if (selected_object > 0)
			{
				selected_object -= 1;
				selected_object_menu_x += 64;
			}
			else
			{
				selected_object = total_number_of_objects;
				selected_object_menu_x =- 64 *total_number_of_objects;
			}
			selected_menu_alpha = 2;
		}
	}
	#endregion /* Scroll Objects Left END */
	
	#region /* Scroll Objects Right */
	if (mouse_wheel_down())
	and (!mouse_check_button(mb_middle))
	and (!key_a_pressed)
	and (!mouse_check_button(mb_left))
	and (erase_mode == false)
	and (pause == false)
	or (keyboard_check_pressed(ord("W")))
	and (!mouse_check_button(mb_middle))
	and (!key_a_pressed)
	and (!mouse_check_button(mb_left))
	and (erase_mode == false)
	and (pause == false)
	or (gamepad_button_check_pressed(0, gp_shoulderr))
	and (erase_mode == false)
	and (pause == false)
	{
		if (asset_get_type("obj_leveleditor_fill") == asset_object)
		and (!instance_exists(obj_leveleditor_fill))
		{
			scr_audio_play(snd_leveleditor_cycle_item_right, volume_source.sound);
			if (selected_object < total_number_of_objects)
			{
				selected_object += 1;
				selected_object_menu_x -= 64;
			}
			else
			{
				selected_object = 0;
				selected_object_menu_x = 0;
			}
			selected_menu_alpha = 2;
		}
	}
	#endregion /* Scroll Objects Right END */
	
	#endregion /* SELECT WHAT OBJECT TO PLACE END */
	
}

#region /* Menu Navigation Delay */
if (menu_delay > 0)
{
	menu_delay -= 1;
}
if (menu_delay < 0)
{
	menu_delay = 0;
}
#endregion /* Menu Navigation Delay END */

#region /* Pause virtual key */
if (os_type == os_ios)
or (os_type == os_android)
{
	virtual_key_add(1100 - 128, 0, 400, 128, vk_escape); /* Pause virtual key */
	if (keyboard_check(vk_escape))
	{
		draw_sprite_ext(spr_virtual_key_pause, 0, camera_get_view_x(view_camera[view_current]) + 1100 - 64, camera_get_view_y(view_camera[view_current]) + 32, 0.9, 0.9, 0, c_gray, 0.5);
	}
	else
	{
		draw_sprite_ext(spr_virtual_key_pause, 0, camera_get_view_x(view_camera[view_current]) + 1100 - 64, camera_get_view_y(view_camera[view_current]) + 32, 1, 1, 0, c_white, 0.5);
	}
}
#endregion /* Pause virtual key END */

#region /* Change mouse cursor. Draw mouse cursor for menu navigation */
if (global.controls_used_for_menu_navigation == "controller")
{
	
	#region /* Scroll mouse cursor */
	if (scroll_view == true)
	and (pause == false)
	and (asset_get_type("spr_cursor_scroll") == asset_sprite)
	{
		draw_sprite_ext(spr_cursor_scroll, 1, cursor_x, cursor_y, 1, 1, 0, c_red, 1);
	}
	else
	if (asset_get_type("spr_cursor_scroll") == asset_sprite)
	and (keyboard_check(vk_space))
	and (pause == false)
	{
		draw_sprite_ext(spr_cursor_scroll, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Scroll mouse cursor END */
	
	else
	
	#region /* Grab mouse cursor */
	if (asset_get_type("spr_cursor_grab") == asset_sprite)
	and (position_meeting(cursor_x, cursor_y, obj_leveleditor_placed_object))
	and (!mouse_check_button(mb_left))
	and (!mouse_check_button(mb_right))
	and (drag_object == false)
	and (asset_get_type("obj_level_player_1_start") == asset_object)
	and (instance_exists(obj_level_player_1_start))
	and (obj_level_player_1_start.drag_object == false)
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (instance_exists(obj_level_player_2_start))
	and (obj_level_player_2_start.drag_object == false)
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (instance_exists(obj_level_player_3_start))
	and (obj_level_player_3_start.drag_object == false)
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	and (instance_exists(obj_level_player_4_start))
	and (obj_level_player_4_start.drag_object == false)
	and (asset_get_type("obj_level_end") == asset_object)
	and (instance_exists(obj_level_end))
	and (obj_level_end.drag_object == false)
	and (erase_mode == false)
	and (set_difficulty_mode == false)
	and (pause == false)
	and (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	and (!point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	and (!point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
	{
		draw_sprite_ext(spr_cursor_grab, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	else
	if (position_meeting(cursor_x, cursor_y, obj_leveleditor_placed_object))
	and (drag_object == true)
	and (set_difficulty_mode == false)
	and (pause == false)
	and (asset_get_type("obj_level_player_1_start") == asset_object)
	and (instance_exists(obj_level_player_1_start))
	and (obj_level_player_1_start.drag_object == false)
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (instance_exists(obj_level_player_2_start))
	and (obj_level_player_2_start.drag_object == false)
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (instance_exists(obj_level_player_3_start))
	and (obj_level_player_3_start.drag_object == false)
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	and (instance_exists(obj_level_player_4_start))
	and (obj_level_player_4_start.drag_object == false)
	and (pause == false)
	or (asset_get_type("obj_level_end") == asset_object)
	and (instance_exists(obj_level_end))
	and (obj_level_end.drag_object == true)
	and (pause == false)
	and (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	and (!point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	and (!point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
	{
		draw_sprite_ext(spr_cursor_grab, 1, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Grab mouse cursor END */
	
	else
	
	#region /* Default mouse cursor */
	if (point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	and (asset_get_type("spr_cursor") == asset_sprite)
	or (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	and (asset_get_type("spr_cursor") == asset_sprite)
	or (point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
	and (asset_get_type("spr_cursor") == asset_sprite)
	or (pause == true)
	and (asset_get_type("spr_cursor") == asset_sprite)
	{
		draw_sprite_ext(spr_cursor, erase_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Default mouse cursor END */
	
	else
	
	#region /* Erase mouse cursor */
	if (asset_get_type("spr_cursor_erase") == asset_sprite)
	and (erase_mode == true)
	and (pause == false)
	{
		draw_sprite_ext(spr_cursor_erase, erase_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Erase mouse cursor END */
	
	else
	
	#region /* Fill mouse cursor */
	if (asset_get_type("spr_cursor_fill") == asset_sprite)
	and (fill_mode == true)
	and (fill_mode_type == "fill")
	and (drag_object == false)
	and (erase_mode == false)
	and (set_difficulty_mode == false)
	and (pause == false)
	{
		draw_sprite_ext(spr_cursor_fill_full, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Fill mouse cursor END */
	
	else
	
	#region /* Fill Horizontal mouse cursor */
	if (asset_get_type("spr_cursor_fill") == asset_sprite)
	and (fill_mode == true)
	and (fill_mode_type == "horizontal")
	and (drag_object == false)
	and (erase_mode == false)
	and (set_difficulty_mode == false)
	and (pause == false)
	{
		draw_sprite_ext(spr_cursor_fill, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Fill Horizontal mouse cursor END */
	
	else
	
	#region /* Fill Vertical mouse cursor */
	if (asset_get_type("spr_cursor_fill") == asset_sprite)
	and (fill_mode == true)
	and (fill_mode_type == "vertical")
	and (drag_object == false)
	and (erase_mode == false)
	and (set_difficulty_mode == false)
	and (pause == false)
	{
		draw_sprite_ext(spr_cursor_fill, 0, cursor_x, cursor_y, 1, 1, 90, c_white, 1);
	}
	#endregion /* Fill Vertical mouse cursor END */
	
	else
	
	#region /* Brush mouse cursor */
	if (asset_get_type("spr_cursor_brush") == asset_sprite)
	and (pause == false)
	{
		draw_sprite_ext(spr_cursor_brush, place_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Brush mouse cursor END */
	
}
#endregion /* Change mouse cursor. Draw mouse cursor for menu navigation END */
