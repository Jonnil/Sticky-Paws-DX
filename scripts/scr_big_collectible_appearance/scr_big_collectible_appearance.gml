function scr_big_collectible_tier_name(_tier)
{
	switch (_tier)
	{
		case 1: return "Purple";
		case 2: return "Black";
	}
	return "Original";
}

function scr_big_collectible_tier_color(_tier)
{
	switch (_tier)
	{
		case 1: return make_color_rgb(96, 96, 255);
		case 2: return make_color_rgb(44, 72, 92);
	}
	return c_white;
}

/* Draw the loaded resource-pack sprite without generating textures. */
function scr_draw_big_collectible_tier(_sprite, _frame, _px, _py, _sx, _sy, _angle, _tier, _collected = false, _alpha = 1, _emphasize_outline = false)
{
	var _color = scr_big_collectible_tier_color(_tier);
	if (_collected)
	{
		_color = (_tier == 0) ? c_gray : merge_color(_color, c_gray, 0.4);
	}
	if (_tier == 2)
	{
		var outline = global.resource_pack_sprite_big_collectible_outline;
		var edge_available = shader_is_compiled(shd_big_collectible_edge);
		var previous_shader = shader_current();
		/* White multiplication retains source colors. Use only its alpha for a neutral edge. */
		var edge_color = edge_available ? make_color_rgb(112, 112, 112) : c_black;
		if (edge_available) shader_set(shd_big_collectible_edge);
		draw_sprite_ext(outline, 0, _px - 1, _py, _sx, _sy, _angle, edge_color, _alpha);
		draw_sprite_ext(outline, 0, _px + 1, _py, _sx, _sy, _angle, edge_color, _alpha);
		draw_sprite_ext(outline, 0, _px, _py - 1, _sx, _sy, _angle, edge_color, _alpha);
		draw_sprite_ext(outline, 0, _px, _py + 1, _sx, _sy, _angle, edge_color, _alpha);
		draw_sprite_ext(outline, 0, _px, _py, _sx, _sy, _angle, edge_color, _alpha);
		if (edge_available)
		{
			if (previous_shader == -1) shader_reset();
			else shader_set(previous_shader);
		}
	}
	else
	/* Empty menu icons keep their existing source edge outside the tinted fill. */
	if (_emphasize_outline)
	{
		var outline = global.resource_pack_sprite_big_collectible_outline;
		draw_sprite_ext(outline, 0, _px - 1, _py, _sx, _sy, _angle, c_white, _alpha);
		draw_sprite_ext(outline, 0, _px + 1, _py, _sx, _sy, _angle, c_white, _alpha);
		draw_sprite_ext(outline, 0, _px, _py - 1, _sx, _sy, _angle, c_white, _alpha);
		draw_sprite_ext(outline, 0, _px, _py + 1, _sx, _sy, _angle, c_white, _alpha);
	}
	draw_sprite_ext(_sprite, _frame, _px, _py, _sx, _sy, _angle, _color, _alpha);
}
