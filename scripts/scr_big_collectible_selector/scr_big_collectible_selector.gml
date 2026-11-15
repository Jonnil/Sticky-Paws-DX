function scr_big_collectible_selector_create()
{
	return {model_key:"", scroll:0, hover_tier:-1, hover_slot:-1, hover_cycle:false,
		focus_tier:-1, focus_frames:0, pointer_inside:false};
}

function scr_big_collectible_runtime_has_tier_choice()
{
	if (global.doing_clear_check_level || global.doing_clear_check_character) return false;
	var available_count = 0;
	for (var tier = 0; tier <= 2; tier++) if (scr_big_collectible_tier_available(tier)) available_count++;
	return available_count > 1;
}

function scr_big_collectible_selector_next_tier(model)
{
	for (var offset = 1; offset < 3; offset++)
	{
		var candidate = (model.selected_tier + offset + 3) mod 3;
		if (model.counts[candidate] > 0 && model.unlocked[candidate]) return candidate;
	}
	return -1;
}

function scr_big_collectible_selector_layout(model, left, top, width, height, scroll, icon_scale_limit = 0.5)
{
	var rows = [];
	var largest_count = 0;
	var read_only = variable_struct_exists(model, "read_only") && model.read_only;
	for (var tier = 0; tier <= 2; tier++)
	{
		if (model.counts[tier] > 0 && model.unlocked[tier])
		{
			array_push(rows, {tier:tier, count:model.counts[tier], icons:[]});
			largest_count = max(largest_count, model.counts[tier]);
		}
	}
	var capacity_width = max(32, width);
	var capacity_height = max(1, height);
	var can_choose_tier = !read_only && array_length(rows) > 1;
	var footer_height = can_choose_tier && capacity_width >= 52 && capacity_height >= 64 ? 22 : 0;
	var fill_sprite = global.resource_pack_sprite_big_collectible;
	var outline_sprite = global.resource_pack_sprite_big_collectible_outline;
	var source_left = max(sprite_get_xoffset(fill_sprite), sprite_get_xoffset(outline_sprite));
	var source_right = max(sprite_get_width(fill_sprite) - sprite_get_xoffset(fill_sprite), sprite_get_width(outline_sprite) - sprite_get_xoffset(outline_sprite));
	var source_top = max(sprite_get_yoffset(fill_sprite), sprite_get_yoffset(outline_sprite));
	var source_bottom = max(sprite_get_height(fill_sprite) - sprite_get_yoffset(fill_sprite), sprite_get_height(outline_sprite) - sprite_get_yoffset(outline_sprite));
	var gutter = can_choose_tier ? 24 : 8;
	/* Context density affects drawing and input together. Hover labels need no extra space. */
	var icon_scale = min(max(0.05, icon_scale_limit), max(1, capacity_width - gutter - 8) / max(1, source_left + source_right), max(1, floor(capacity_height - footer_height) - 4) / max(1, source_top + source_bottom));
	var cell_width = ceil((source_left + source_right) * icon_scale) + 4;
	var cell_height = ceil((source_top + source_bottom) * icon_scale) + 4;
	var columns = max(1, floor(max(1, capacity_width - gutter - 8) / cell_width));
	var content_height = 0;
	for (var row_index = 0; row_index < array_length(rows); row_index++)
	{
		var row = rows[row_index];
		row.content_y = content_height;
		row.height = ceil(row.count / columns) * cell_height;
		row.header_height = 0;
		content_height += row.height;
	}
	/* Page complete sprite lines. A fractional scroll must not discard an entire line. */
	var visible_lines = max(0, floor((capacity_height - footer_height) / cell_height));
	var viewport_height = min(content_height, visible_lines * cell_height);
	var fitted_width = largest_count > 0 ? min(capacity_width, max(footer_height > 0 ? 52 : 0, gutter + min(largest_count, columns) * cell_width + 4)) : 0;
	var max_scroll = visible_lines > 0 ? max(0, content_height - viewport_height) : 0;
	scroll = clamp(round(scroll / cell_height) * cell_height, 0, max_scroll);
	for (var row_index = 0; row_index < array_length(rows); row_index++)
	{
		var row = rows[row_index];
		row.header_y = top + row.content_y - scroll;
		row.visible_top = max(top, row.header_y);
		row.visible_bottom = min(top + viewport_height, row.header_y + row.height);
		row.marker_y = row.header_y + cell_height * 0.5;
		var items = model.items[row.tier];
		for (var slot = 0; slot < row.count; slot++)
		{
			var line_count = min(columns, row.count - floor(slot / columns) * columns);
			var line_offset = max(0, (fitted_width - gutter - 4 - line_count * cell_width) * 0.5);
			var cell_left = left + gutter + line_offset + (slot mod columns) * cell_width;
			var cell_top = row.header_y + floor(slot / columns) * cell_height;
			var px = cell_left + 2 + source_left * icon_scale;
			var py = cell_top + 2 + source_top * icon_scale;
			var icon_left = px - source_left * icon_scale;
			var icon_right = px + source_right * icon_scale;
			var icon_top = py - source_top * icon_scale;
			var icon_bottom = py + source_bottom * icon_scale;
			if (icon_top - 2 < top || icon_bottom + 2 > top + viewport_height) continue;
			var ordinal = slot + 1;
			if (slot < array_length(items))
			{
				var item = items[slot];
				if (variable_struct_exists(item, "ordinal")) ordinal = item.ordinal;
				if (variable_struct_exists(item, "ordinal_known") && !item.ordinal_known) ordinal = -1;
			}
			array_push(row.icons, {tier:row.tier, slot:slot + 1, ordinal:ordinal, px:px, py:py, scale:icon_scale,
				left:icon_left, right:icon_right, top:icon_top, bottom:icon_bottom,
				half_width:(icon_right - icon_left) * 0.5, half_height:(icon_bottom - icon_top) * 0.5});
		}
	}
	return {left:left, right:left + fitted_width, width:fitted_width, top:top, bottom:top + viewport_height,
		height:viewport_height, content_height:content_height, footer_height:footer_height, total_height:viewport_height + footer_height,
		footer_bottom:top + viewport_height + footer_height, max_scroll:max_scroll, scroll:scroll, rows:rows,
		line_pitch:cell_height, visible_lines:visible_lines, can_choose_tier:can_choose_tier};
}

function scr_big_collectible_selector_step(state, model, left, top, width, height, player = 1, allow_cycle = true, icon_scale_limit = 0.5)
{
	if (state.model_key != model.key)
	{
		state.model_key = model.key;
		state.scroll = 0;
		state.focus_tier = -1;
		state.focus_frames = 0;
	}
	state.hover_tier = -1;
	state.hover_slot = -1;
	state.hover_cycle = false;
	if (state.focus_frames > 0) state.focus_frames--;
	var layout = scr_big_collectible_selector_layout(model, left, top, width, height, state.scroll, icon_scale_limit);
	state.scroll = layout.scroll;
	var pointer_x = device_mouse_x_to_gui(0);
	var pointer_y = device_mouse_y_to_gui(0);
	state.pointer_inside = point_in_rectangle(pointer_x, pointer_y, left, top, layout.right, layout.footer_bottom);
	if (scr_block_menu_input_for_network_request()) return -1;
	var scroll_amount = state.pointer_inside ? layout.line_pitch * (mouse_wheel_down() - mouse_wheel_up()) : 0;
	var page_amount = max(1, layout.visible_lines - 1) * layout.line_pitch;
	if (keyboard_check_pressed(vk_pageup) || gamepad_button_check_pressed(global.player_slot[player], gp_shoulderlb)) scroll_amount -= page_amount;
	if (keyboard_check_pressed(vk_pagedown) || gamepad_button_check_pressed(global.player_slot[player], gp_shoulderrb)) scroll_amount += page_amount;
	if (scroll_amount != 0)
	{
		state.scroll = clamp(state.scroll + scroll_amount, 0, layout.max_scroll);
		layout = scr_big_collectible_selector_layout(model, left, top, width, height, state.scroll, icon_scale_limit);
		state.scroll = layout.scroll;
	}
	for (var row_index = 0; row_index < array_length(layout.rows); row_index++)
	{
		var row = layout.rows[row_index];
		if (row.visible_bottom <= row.visible_top) continue;
		if (point_in_rectangle(pointer_x, pointer_y, left, row.visible_top, layout.right, row.visible_bottom)) state.hover_tier = row.tier;
		for (var icon_index = 0; icon_index < array_length(row.icons); icon_index++)
		{
			var icon = row.icons[icon_index];
			if (point_in_rectangle(pointer_x, pointer_y, icon.left, icon.top, icon.right, icon.bottom)) state.hover_slot = icon.slot;
		}
	}
	var choice = -1;
	if (!layout.can_choose_tier) return -1;
	var cycle = allow_cycle
		&& (keyboard_check_pressed(ord("T")) || gamepad_button_check_pressed(global.player_slot[player], gp_shoulderr));
	if (layout.footer_height > 0 && point_in_rectangle(pointer_x, pointer_y, left, layout.bottom, left + 52, layout.footer_bottom))
	{
		state.hover_cycle = true;
		if (allow_cycle && mouse_check_button_released(mb_left)) cycle = true;
	}
	if (cycle)
	{
		choice = scr_big_collectible_selector_next_tier(model);
	}
	else if (state.hover_tier >= 0 && mouse_check_button_released(mb_left)) choice = state.hover_tier;
	if (choice >= 0)
	{
		state.focus_tier = choice;
		state.focus_frames = 120;
		for (var row_index = 0; row_index < array_length(layout.rows); row_index++)
		{
			var row = layout.rows[row_index];
			if (row.tier == choice && (row.content_y < state.scroll || row.content_y + row.height > state.scroll + layout.height))
			{
				state.scroll = clamp(row.content_y, 0, layout.max_scroll);
			}
		}
	}
	return choice;
}

function scr_big_collectible_selector_draw(state, model, left, top, width, height, alpha = 1, player = 1, tooltip_right = -1, icon_scale_limit = 0.5)
{
	var layout = scr_big_collectible_selector_layout(model, left, top, width, height, state.scroll, icon_scale_limit);
	var previous_alpha = draw_get_alpha();
	var previous_halign = draw_get_halign();
	var previous_valign = draw_get_valign();
	var pointer_device = global.controls_used_for_navigation == "mouse";
	var focused_tier = pointer_device ? state.hover_tier : (state.focus_frames > 0 ? state.focus_tier : -1);
	var focus_visible = false;
	for (var row_index = 0; row_index < array_length(layout.rows); row_index++) if (layout.rows[row_index].tier == focused_tier) focus_visible = true;
	if (!focus_visible) focused_tier = -1;
	for (var row_index = 0; row_index < array_length(layout.rows); row_index++)
	{
		var row = layout.rows[row_index];
		if (row.visible_bottom <= row.visible_top) continue;
		if (layout.can_choose_tier && focused_tier == row.tier)
		{
			draw_set_alpha(0.15 * alpha);
			draw_roundrect_color(left, row.visible_top, layout.right, row.visible_bottom, c_white, c_white, false);
		}
		if (layout.can_choose_tier && row.marker_y >= layout.top + 8 && row.marker_y <= layout.bottom - 8)
		{
			if (row.tier == model.active_tier || (model.active_tier < 0 && row.tier == model.selected_tier))
			{
				draw_sprite_ext(spr_menu_button_play, 0, left + 11, row.marker_y, 0.24, 0.24, 0, c_white, alpha);
			}
			if (model.active_tier >= 0 && row.tier == model.selected_tier && row.tier != model.active_tier)
			{
				draw_sprite_ext(spr_icon_back, 0, left + 11, row.marker_y, 0.5, 0.5, 0, c_white, alpha);
			}
		}
		var items = model.items[row.tier];
		for (var icon_index = 0; icon_index < array_length(row.icons); icon_index++)
		{
			var icon = row.icons[icon_index];
			var owned = icon.slot <= array_length(items) ? items[icon.slot - 1].owned : false;
			if (model.is_runtime && row.tier == model.active_tier)
			{
				owned = model.run_owned[icon.slot];
			}
			scr_draw_big_collectible_tier(owned ? global.resource_pack_sprite_big_collectible : global.resource_pack_sprite_big_collectible_outline,
				0, icon.px, icon.py, icon.scale, icon.scale, 0, row.tier, false, alpha, !owned);
			if (pointer_device && focused_tier == row.tier && state.hover_slot == icon.slot)
			{
				draw_set_alpha(alpha);
				draw_rectangle_color(icon.left - 2, icon.top - 2, icon.right + 2, icon.bottom + 2, c_white, c_white, c_white, c_white, true);
			}
		}
	}
	if (layout.footer_height > 0)
	{
		scr_draw_input_glyph(ord("T"), gp_shoulderr, left + 12, layout.bottom + 11, 0.32, alpha);
		var next_tier = scr_big_collectible_selector_next_tier(model);
		if (next_tier >= 0) scr_draw_big_collectible_tier(global.resource_pack_sprite_big_collectible, 0,
			left + 37, layout.bottom + 11, 0.22, 0.22, 0, next_tier, false, alpha);
	}
	if (layout.max_scroll > 0)
	{
		draw_set_alpha(0.7 * alpha);
		draw_line_width_color(layout.right - 2, layout.top, layout.right - 2, layout.bottom, 2, c_gray, c_gray);
		var thumb_height = max(10, layout.height * layout.height / (layout.height + layout.max_scroll));
		var thumb_y = layout.top + (layout.height - thumb_height) * layout.scroll / layout.max_scroll;
		draw_line_width_color(layout.right - 2, thumb_y, layout.right - 2, thumb_y + thumb_height, 3, c_white, c_white);
	}
	var tooltip = "";
	if (focused_tier >= 0)
	{
		var shown_owned = model.owned_counts[focused_tier];
		if (model.is_runtime && focused_tier == model.active_tier)
		{
			shown_owned = 0;
			for (var slot = 1; slot <= model.counts[focused_tier]; slot++) if (model.run_owned[slot]) shown_owned++;
		}
		tooltip = (array_length(layout.rows) > 1 ? scr_big_collectible_tier_name(focused_tier) + " " : "") + string(shown_owned);
		if (!variable_struct_exists(model, "total_known") || model.total_known) tooltip += "/" + string(model.counts[focused_tier]);
		else tooltip += " collected";
		if (layout.can_choose_tier && focused_tier == model.active_tier) tooltip += "\nPlaying now";
		if (layout.can_choose_tier && focused_tier == model.selected_tier && focused_tier != model.active_tier) tooltip += model.is_runtime ? "\nNext run. Restart to switch" : "\nSelected for Play";
		else if (layout.can_choose_tier && focused_tier != model.active_tier) tooltip += model.is_runtime ? "\nSelect for next start" : "\nSelect this tier";
	}
	else if (layout.can_choose_tier && pointer_device && state.hover_cycle) tooltip = "Next: " + scr_big_collectible_tier_name(scr_big_collectible_selector_next_tier(model));
	if (tooltip != "")
	{
		var text_scale = global.default_text_size * 0.55;
		var tip_width = min(display_get_gui_width() - 16, min(300, string_width(tooltip) * text_scale + 16));
		var wrap_width = max(1, (tip_width - 16) / text_scale);
		var tip_height = string_height_ext(tooltip, -1, wrap_width) * text_scale + 16;
		var tip_x = max(layout.right, tooltip_right) + 8;
		if (tip_x + tip_width > display_get_gui_width() - 8) tip_x = left - tip_width - 8;
		tip_x = clamp(tip_x, 8, max(8, display_get_gui_width() - tip_width - 8));
		var tip_y = clamp(top, 8, max(8, display_get_gui_height() - tip_height - 8));
		var tip_visible = true;
		if (variable_struct_exists(state, "tooltip_exclusion") && is_struct(state.tooltip_exclusion))
		{
			var exclusion = state.tooltip_exclusion;
			if (tip_x < exclusion.right && tip_x + tip_width > exclusion.left
			&& tip_y < exclusion.bottom && tip_y + tip_height > exclusion.top)
			{
				tip_y = exclusion.bottom + 3;
				tip_visible = tip_y + tip_height <= display_get_gui_height() - 8;
			}
		}
		if (tip_visible)
		{
			draw_set_alpha(0.92 * alpha);
			draw_roundrect_color(tip_x, tip_y, tip_x + tip_width, tip_y + tip_height, c_black, c_black, false);
			draw_set_alpha(alpha);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			scr_draw_text_outlined(tip_x + 8, tip_y + 8, tooltip, text_scale, c_black, c_white, alpha, -1, wrap_width);
		}
	}
	/* The number belongs to the hovered item, including across wrapped rows. */
	if (pointer_device && state.hover_slot > 0 && state.hover_tier >= 0)
	{
		for (var row_index = 0; row_index < array_length(layout.rows); row_index++)
		{
			var row = layout.rows[row_index];
			if (row.tier != state.hover_tier) continue;
			for (var icon_index = 0; icon_index < array_length(row.icons); icon_index++)
			{
				var icon = row.icons[icon_index];
				if (icon.slot != state.hover_slot || icon.ordinal <= 0) continue;
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				var number_scale = min(global.default_text_size * 0.55,
					max(1, icon.right - icon.left - 4) / max(1, string_width(string(icon.ordinal))),
					max(1, icon.bottom - icon.top - 4) / max(1, string_height(string(icon.ordinal))));
				var number_x = (icon.left + icon.right) * 0.5;
				var number_y = (icon.top + icon.bottom) * 0.5;
				scr_draw_text_outlined(number_x, number_y, string(icon.ordinal), number_scale, c_black, c_white, alpha);
			}
		}
	}
	draw_set_alpha(previous_alpha);
	draw_set_halign(previous_halign);
	draw_set_valign(previous_valign);
}
