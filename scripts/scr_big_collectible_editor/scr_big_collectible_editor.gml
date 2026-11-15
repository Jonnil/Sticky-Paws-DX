function scr_big_collectible_editor_new_id()
{
	return "c_" + string(current_time) + "_" + string(irandom(2147483646)) + "_" + string(irandom(2147483646));
}

function scr_big_collectible_editor_is_active(placed)
{
	if (!instance_exists(placed)) return false;
	if (placed.object != LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE) return true;
	return placed.big_collectible_tier == global.big_collectible_editor_tier;
}

function scr_big_collectible_editor_initialize_placement(placed)
{
	if (!scr_big_collectible_is_source(placed.object, placed.item_inside)) return;
	placed.big_collectible_tier = global.big_collectible_editor_tier;
	if (global.big_collectible_editor_tier > 0 && !global.big_collectible_tiers_enabled)
	{
		scr_big_collectible_tiers_seed_legacy_ids();
		global.big_collectible_tiers_enabled = true;
	}
	if (global.big_collectible_tiers_enabled)
	{
		placed.big_collectible_id = scr_big_collectible_editor_new_id();
	}
}

function scr_big_collectible_editor_can_place(place_x, place_y, object_id)
{
	var overlaps = ds_list_create();
	var overlap_count = instance_position_list(place_x, place_y, obj_leveleditor_placed_object, overlaps, false);
	var allowed = true;
	for (var overlap_index = 0; overlap_index < overlap_count; overlap_index++)
	{
		var placed = overlaps[| overlap_index];
		if (object_id != LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE
		|| placed.object != LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE
		|| placed.big_collectible_tier == global.big_collectible_editor_tier)
		{
			allowed = false;
			break;
		}
	}
	ds_list_destroy(overlaps);
	return allowed;
}

function scr_big_collectible_editor_slot_occupied(source, tier, place_x, place_y)
{
	var overlaps = ds_list_create();
	var overlap_count = instance_position_list(place_x, place_y, obj_leveleditor_placed_object, overlaps, false);
	var occupied = false;
	for (var overlap_index = 0; overlap_index < overlap_count; overlap_index++)
	{
		var placed = overlaps[| overlap_index];
		if (placed == source || placed.object != source.object || placed.x != place_x || placed.y != place_y) continue;
		if (!scr_big_collectible_is_source(source.object, source.item_inside)
		&& !scr_big_collectible_is_source(placed.object, placed.item_inside)) continue;
		if (source.object == LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE && placed.big_collectible_tier != tier) continue;
		occupied = true;
		break;
	}
	ds_list_destroy(overlaps);
	return occupied;
}

function scr_big_collectible_editor_validate()
{
	if (instance_exists(obj_leveleditor) && !global.actually_play_edited_level)
	{
		instance_activate_all();
		global.deactivate_timer = 4;
	}
	var result = {counts: [0, 0, 0], difficulty_counts: [[0, 0, 0], [0, 0, 0], [0, 0, 0]], warning: "", tiered: false};
	if (variable_global_exists("big_collectible_tier_format_unsupported") && global.big_collectible_tier_format_unsupported)
	{
		result.warning = "Unsupported collectible format. Loading and saving are disabled.";
		return result;
	}
	var missing_identity = false;
	var identities = ds_map_create();
	var source_count = instance_number(obj_leveleditor_placed_object);
	for (var source_index = 0; source_index < source_count; source_index++)
	{
		var placed = instance_find(obj_leveleditor_placed_object, source_index);
		if (!scr_big_collectible_is_source(placed.object, placed.item_inside)) continue;
		var tier = placed.big_collectible_tier;
		result.counts[tier]++;
		if (placed.easy) result.difficulty_counts[0][tier]++;
		if (placed.normal) result.difficulty_counts[1][tier]++;
		if (placed.hard) result.difficulty_counts[2][tier]++;
		if (tier > 0 || placed.big_collectible_id != "") result.tiered = true;
		if (placed.big_collectible_id == "") missing_identity = true;
		var identity = string(tier) + ":" + placed.big_collectible_id;
		if (placed.big_collectible_id != "")
		{
			if (ds_map_exists(identities, identity)) result.warning = "Duplicate collectible identity. Replace the conflicting collectible.";
			ds_map_set(identities, identity, true);
		}
	}
	ds_map_destroy(identities);
	if (result.tiered)
	{
		if (missing_identity && result.warning == "") result.warning = "Missing collectible identity. Replace the affected collectible before normal play.";
	}
	return result;
}

function scr_big_collectible_editor_brush_selected()
{
	return instance_exists(obj_leveleditor) && !global.world_editor
		&& obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE;
}

function scr_big_collectible_editor_select_tier(tier)
{
	global.big_collectible_editor_tier = clamp(floor(tier), 0, 2);
	if (!scr_big_collectible_editor_brush_selected()) return;
	var editor = instance_find(obj_leveleditor, 0);
	if (editor.big_collectible_palette_category != editor.current_object_category) return;
	var palette_index = editor.big_collectible_palette_indices[global.big_collectible_editor_tier];
	if (palette_index >= 0)
	{
		editor.selected_object = palette_index;
		editor.select_object_menu_actual_x = -100 * palette_index;
	}
}

function scr_big_collectible_editor_panel_bounds()
{
	var authored_rows = 0;
	for (var tier = 0; tier < 3; tier++)
	{
		if (big_collectible_editor_validation.counts[tier] > 0) authored_rows++;
	}
	var panel_height = 44 + authored_rows * 22;
	var panel_left = display_get_gui_width() * 0.5 - 250;
	var panel_bottom = display_get_gui_height() - 114;
	return [panel_left, panel_bottom - panel_height, panel_left + 500, panel_bottom];
}

function scr_big_collectible_editor_toolbar_step()
{
	if (!scr_big_collectible_editor_brush_selected())
	{
		if (level_editor_menu == "collectible_tier") level_editor_menu = "play";
		return;
	}
	if (global.actually_play_edited_level || pause || in_modify_object_menu || drag_object) return;
	var bounds = scr_big_collectible_editor_panel_bounds();
	var panel_hover = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), bounds[0], bounds[1], bounds[2], bounds[3]);
	if (panel_hover) hovering_over_icon = true;
	if (menu_delay != 0 || menu_joystick_delay != 0) return;
	if (keyboard_check_pressed(ord("T"))
	|| (panel_hover && mouse_check_button_released(mb_left))
	|| (level_editor_menu == "collectible_tier" && key_accept_released))
	{
		scr_big_collectible_editor_select_tier((global.big_collectible_editor_tier + 1) mod 3);
		big_collectible_editor_validation = scr_big_collectible_editor_validate();
		menu_delay = 3;
	}
	if (big_collectible_editor_validation_timer > 0) big_collectible_editor_validation_timer--;
	else
	{
		big_collectible_editor_validation = scr_big_collectible_editor_validate();
		big_collectible_editor_validation_timer = 30;
	}
}

function scr_big_collectible_editor_toolbar_draw()
{
	if (!scr_big_collectible_editor_brush_selected() || pause || in_modify_object_menu) return;
	var bounds = scr_big_collectible_editor_panel_bounds();
	var panel_left = bounds[0];
	var panel_top = bounds[1];
	draw_roundrect_color_ext(bounds[0], bounds[1], bounds[2], bounds[3], 8, 8, c_black, c_black, false);
	if (level_editor_menu == "collectible_tier") draw_roundrect_color_ext(bounds[0], bounds[1], bounds[2], bounds[3], 8, 8, c_white, c_white, true);
	var tier = global.big_collectible_editor_tier;
	scr_draw_big_collectible_tier(global.resource_pack_sprite_big_collectible, 0, panel_left + 26, panel_top + 22, 0.5, 0.5, 0, tier, false, 1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(panel_left + 178, panel_top + 22, scr_big_collectible_tier_name(tier) + " Big Fish", global.default_text_size * 0.7, c_black, c_white, 1);
	if (global.controls_used_for_navigation != "gamepad" || level_editor_menu == "collectible_tier")
	{
		scr_draw_input_glyph(ord("T"), global.player_[inp.gp][1][1][action.accept], panel_left + 344, panel_top + 22, 0.4, 1);
		scr_draw_text_outlined(panel_left + 422, panel_top + 22, "Change tier", global.default_text_size * 0.55, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(panel_left + 393, panel_top + 22, "Choose in palette", global.default_text_size * 0.5, c_black, c_white, 1);
	}
	var row_y = panel_top + 51;
	for (var count_tier = 0; count_tier < 3; count_tier++)
	{
		var authored_count = big_collectible_editor_validation.counts[count_tier];
		if (authored_count <= 0) continue;
		scr_draw_big_collectible_tier(global.resource_pack_sprite_big_collectible, 0, panel_left + 28, row_y, 0.3, 0.3, 0, count_tier, false, 1);
		scr_draw_text_outlined(panel_left + 270, row_y, scr_big_collectible_tier_name(count_tier) + ": " + string(authored_count), global.default_text_size * 0.6, c_black, c_white, 1);
		row_y += 22;
	}
	if (big_collectible_editor_validation.warning != "")
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, panel_top - 16, big_collectible_editor_validation.warning, global.default_text_size * 0.55, c_black, c_yellow, 1);
	}
}

function scr_big_collectible_editor_restore_palette(objects)
{
	if (!initialize_recent_object_selected) return;
	var palette_index = 0;
	var matching_index = -1;
	var selection_matches = false;
	for (var entry_index = 0; entry_index < array_length(objects); entry_index++)
	{
		var entry = objects[entry_index];
		var in_category = !if_daily_build ? entry.o_category == current_object_category : entry.o_daily_build_category == current_object_category;
		if (!in_category || unlocked_object[entry.o_id] < true) continue;
		if (entry.o_id == place_object)
		{
			if (matching_index < 0) matching_index = palette_index;
			if (selected_object == palette_index) selection_matches = true;
		}
		palette_index += entry.o_add_order_index;
	}
	if (!selection_matches && matching_index >= 0)
	{
		selected_object = matching_index;
		select_object_menu_actual_x = -100 * matching_index;
	}
}

function scr_big_collectible_editor_extra_signature(data)
{
	var extra = json_parse(json_stringify(data));
	var known_keys = ["X", "Y", "O", "E", "N", "H", "Q", "W", "I", "L", "T", "C"];
	for (var key_index = 0; key_index < array_length(known_keys); key_index++)
	{
		if (variable_struct_exists(extra, known_keys[key_index])) variable_struct_remove(extra, known_keys[key_index]);
	}
	return json_stringify(extra);
}

function scr_big_collectible_editor_nearest_active(cursor_world_x, cursor_world_y)
{
	var nearest = instance_nearest(cursor_world_x, cursor_world_y, obj_leveleditor_placed_object);
	if (!instance_exists(nearest) || scr_big_collectible_editor_is_active(nearest)) return nearest;
	var overlaps = ds_list_create();
	var overlap_count = instance_position_list(cursor_world_x, cursor_world_y, obj_leveleditor_placed_object, overlaps, false);
	nearest = noone;
	for (var overlap_index = 0; overlap_index < overlap_count; overlap_index++)
	{
		var placed = overlaps[| overlap_index];
		if (scr_big_collectible_editor_is_active(placed))
		{
			nearest = placed;
			break;
		}
	}
	ds_list_destroy(overlaps);
	return nearest;
}
