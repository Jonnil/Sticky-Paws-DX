if (clear_rate = "closed")
{
	image_alpha = 0.1;
	level_color = c_black;
}
else
if (clear_rate = "enter")
{
	image_alpha = 1;
	if (enter_blink > room_speed / 4)
	{
		level_color = c_red;
	}
	else
	{
		level_color = c_white;
	}
	enter_blink += 1;
	if (enter_blink > 60)
	{
		enter_blink = 0;
	}
}
else
if (clear_rate = "clear")
{
	image_alpha = 1;
	if (star_coin1 = true)
	and(star_coin2 = true)
	and(star_coin3 = true)
	and(star_coin4 = true)
	and(star_coin5 = true)
	{
		level_color = c_yellow;
		level_perfect = true;
	}
	else
	{
		level_color = c_blue;
	}
}
if (clear_rate != "closed")
and(clear_rate != "enter")
and(clear_rate != "clear")
{
	clear_rate = "closed";
}

#region /*Draw level sprite*/
if (asset_get_type("spr_level_ring") == asset_sprite)
{
	draw_sprite_ext(spr_level_ring, image_index, x, y, image_xscale, image_yscale, image_angle, ring_color, image_alpha);
}
if (asset_get_type("spr_level") == asset_sprite)
{
	draw_sprite_ext(spr_level, image_index, x, y, image_xscale, image_yscale, image_angle, level_color, image_alpha);
}
if (asset_get_type("spr_level_crown") == asset_sprite)
{
	draw_sprite_ext(spr_level_crown, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, level_perfect);
}
#endregion /*Draw level sprite END*/

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed_colour(x - 2, y, string(level), global.default_text_size * 2, global.default_text_size * 2, 0, c_black, c_black, c_black, c_black, image_alpha);
draw_text_transformed_colour(x + 2, y, string(level), global.default_text_size * 2, global.default_text_size * 2, 0, c_black, c_black, c_black, c_black, image_alpha);
draw_text_transformed_colour(x, y - 2, string(level), global.default_text_size * 2, global.default_text_size * 2, 0, c_black, c_black, c_black, c_black, image_alpha);
draw_text_transformed_colour(x, y + 2, string(level), global.default_text_size * 2, global.default_text_size * 2, 0, c_black, c_black, c_black, c_black, image_alpha);
draw_text_transformed_colour(x, y, string(level), global.default_text_size * 2, global.default_text_size * 2, 0, c_white, c_white, c_white, c_white, image_alpha);

if (global.demo = true)
{
	if (level > global.demo_max_levels)
	{
		instance_destroy();
	}
}

if (clear_rate = 0)
{
	clear_rate = "closed";
}

#region /*Level Save*/
if (asset_get_type("obj_player_map") == asset_object)
{
	if (instance_exists(obj_player_map))
	{
		if (obj_player_map.move_delay = 1)
		and(obj_player_map.transfer_data = true)
		{
			ini_open("File" + string(global.file) + ".ini");
			ini_write_string("Level" + string(level), "clear_rate", clear_rate);
			ini_write_real("Level" + string(level), "star_coin1", star_coin1);
			ini_write_real("Level" + string(level), "star_coin2", star_coin2);
			ini_write_real("Level" + string(level), "star_coin3", star_coin3);
			ini_write_real("Level" + string(level), "star_coin4", star_coin4);
			ini_write_real("Level" + string(level), "star_coin5", star_coin5);
			ini_write_real("Level" + string(level), "lives_until_assist", lives_until_assist);
			ini_write_real("Level" + string(level), "x_checkpoint", x_checkpoint);
			ini_write_real("Level" + string(level), "y_checkpoint", y_checkpoint);
			ini_write_real("Level" + string(level), "checkpoint_millisecond", checkpoint_millisecond);
			ini_write_real("Level" + string(level), "checkpoint_second", checkpoint_second);
			ini_write_real("Level" + string(level), "checkpoint_minute", checkpoint_minute);
			ini_write_real("Level" + string(level), "checkpoint_realmillisecond", checkpoint_realmillisecond);
			ini_write_real("Level" + string(level), "timeattack_millisecond", timeattack_millisecond);
			ini_write_real("Level" + string(level), "timeattack_second", timeattack_second);
			ini_write_real("Level" + string(level), "timeattack_minute", timeattack_minute);
			ini_write_real("Level" + string(level), "timeattack_realmillisecond", timeattack_realmillisecond);
			ini_write_real("Level" + string(level), "level_score", level_score);
			ini_close();
		}
	}
}
#endregion /*Level Save END*/