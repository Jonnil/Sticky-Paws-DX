#region /* All code before initializing the object */

if (sprite_index > 0)
{
	draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale, draw_yscale, draw_angle, image_blend, image_alpha);
}

#region /* Draw Rotate Arrow on top of objects that you rotate by clicking on the object /*
if (object == level_object_id.id_basic_collectible)
or (object == level_object_id.id_basic_collectible_2)
or (object == level_object_id.id_basic_collectible_3)
or (object == level_object_id.id_basic_collectible_4)
or (object == level_object_id.id_basic_collectible_5)
or (object == level_object_id.id_basic_collectible_6)
or (object == level_object_id.id_basic_collectible_7)
or (object == level_object_id.id_basic_collectible_8)
or (object == level_object_id.id_oneway)
or (object == level_object_id.id_oneway2)
or (object == level_object_id.id_oneway3)
or (object == level_object_id.id_oneway4)
{
	draw_sprite_ext(spr_rotate_arrow, image_index, x, y, scr_wave(draw_xscale * 0.3, draw_xscale * 0.2, 0.5, 0), scr_wave(draw_yscale * 0.3, draw_yscale * 0.2, 0.5, 0), draw_angle, image_blend, image_alpha);
}
#endregion /* Draw Rotate Arrow on top of objects that you rotate by clicking on the object END /*

#region /* Change certain objects angle */

/* Spring */
if (object == level_object_id.id_spring)
{
	draw_line_width_color(x, y, second_x, second_y, 4, c_black, c_black);
	draw_line_width_color(x, y, second_x, second_y, 2, image_blend, image_blend);
	draw_set_color(c_black);
	draw_arrow(x, y, second_x, second_y, 23);
	draw_set_color(image_blend);
	draw_arrow(x, y, second_x, second_y, 20);
	draw_set_color(c_white);
	draw_angle = point_direction(x, y, second_x, second_y) -90;
}
else
if (object == level_object_id.id_door)
{
	draw_line_width_color(x, y, second_x, second_y, 4, c_black, c_black);
	draw_line_width_color(x, y, second_x, second_y, 2, image_blend, image_blend);
	draw_set_color(c_black);
	draw_arrow(x, y, second_x, second_y, 23);
	draw_set_color(image_blend);
	draw_arrow(x, y, second_x, second_y, 20);
	draw_set_color(c_white);
}
else
/* Water Level Change */
if (object == level_object_id.id_water_level_change_slow)
or (object == level_object_id.id_water_level_change_fast)
or (object == level_object_id.id_water_level_change_faster)
{
	draw_line_width_color(x, y, x, second_y, 4, c_black, c_black);
	draw_line_width_color(x, y, x, second_y, 2, image_blend, image_blend);
	draw_angle = point_direction(x, y, x, second_y) -90;
}

else

/* Arrows */
if (object == level_object_id.id_arrow_sign)
or (object == level_object_id.id_arrow_sign_small)
{
	draw_angle = point_direction(x, y, second_x, second_y);
}

else

/* Water Block */
if (object == level_object_id.id_water)
{
	sprite_index = spr_water;
	draw_set_alpha(0.5);
	draw_rectangle_color(x - 16, y - 16, 16 + second_x, 16 + second_y, c_blue, c_blue, c_blue, c_blue, false);
	draw_set_alpha(1);
}
else
if (object == level_object_id.id_breathable_water)
{
	sprite_index = spr_water;
	draw_set_alpha(0.25);
	draw_rectangle_color(x - 16, y - 16, 16 + second_x, 16 + second_y, c_blue, c_blue, c_blue, c_blue, false);
	draw_set_alpha(1);
}

#endregion /* Change certain objects angle END */

#endregion /* All code before initializing the object END */

#region /* Initialize Object */
if (global.world_editor == false)
{
	
	#region /* Brick Block */
	if (object == level_object_id.id_brick_block_10_basic_collectibles) and (asset_get_type("spr_brick_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	if (object == level_object_id.id_brick_block_heart_balloon) and (asset_get_type("spr_brick_block") == asset_sprite){if (asset_get_type("spr_heart") == asset_sprite){draw_sprite_ext(spr_heart, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}}
	if (object == level_object_id.id_brick_block_one_up) and (asset_get_type("spr_brick_block") == asset_sprite){if (asset_get_type("spr_1up") == asset_sprite){draw_sprite_ext(spr_1up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "1-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	if (object == level_object_id.id_brick_block_two_up) and (asset_get_type("spr_brick_block") == asset_sprite){if (asset_get_type("spr_2up") == asset_sprite){draw_sprite_ext(spr_2up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "2-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	if (object == level_object_id.id_brick_block_three_up) and (asset_get_type("spr_brick_block") == asset_sprite){if (asset_get_type("spr_3up") == asset_sprite){draw_sprite_ext(spr_3up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "3-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	if (object == level_object_id.id_brick_block_invincibility_powerup) and (asset_get_type("spr_brick_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	if (object == level_object_id.id_brick_block_invincibility_powerup_coil_spring) and (asset_get_type("spr_brick_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, image_blend, image_alpha);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	#endregion /* Brick Block END */

	#region /* Question Block */
	if (object == level_object_id.id_question_block_10_basic_collectibles) and (asset_get_type("spr_question_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	if (object == level_object_id.id_question_block_heart_balloon) and (asset_get_type("spr_question_block") == asset_sprite){if (asset_get_type("spr_heart") == asset_sprite){draw_sprite_ext(spr_heart, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}}
	if (object == level_object_id.id_question_block_one_up) and (asset_get_type("spr_question_block") == asset_sprite){if (asset_get_type("spr_1up") == asset_sprite){draw_sprite_ext(spr_1up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "1-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	if (object == level_object_id.id_question_block_two_up) and (asset_get_type("spr_question_block") == asset_sprite){if (asset_get_type("spr_2up") == asset_sprite){draw_sprite_ext(spr_2up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "2-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	if (object == level_object_id.id_question_block_three_up) and (asset_get_type("spr_question_block") == asset_sprite){if (asset_get_type("spr_3up") == asset_sprite){draw_sprite_ext(spr_3up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "3-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	if (object == level_object_id.id_question_block_invincibility_powerup) and (asset_get_type("spr_question_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	if (object == level_object_id.id_question_block_invincibility_powerup_coil_spring) and (asset_get_type("spr_question_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, image_blend, image_alpha);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	#endregion /* Question Block END */
	
	#region /* Melon Block */
	if (object == level_object_id.id_melon_block_10_basic_collectibles) and (asset_get_type("spr_question_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	if (object == level_object_id.id_melon_block_heart_balloon) and (asset_get_type("spr_question_block") == asset_sprite){if (asset_get_type("spr_heart") == asset_sprite){draw_sprite_ext(spr_heart, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}}
	if (object == level_object_id.id_melon_block_one_up) and (asset_get_type("spr_question_block") == asset_sprite){if (asset_get_type("spr_1up") == asset_sprite){draw_sprite_ext(spr_1up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "1-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	if (object == level_object_id.id_melon_block_two_up) and (asset_get_type("spr_question_block") == asset_sprite){if (asset_get_type("spr_2up") == asset_sprite){draw_sprite_ext(spr_2up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "2-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	if (object == level_object_id.id_melon_block_three_up) and (asset_get_type("spr_question_block") == asset_sprite){if (asset_get_type("spr_3up") == asset_sprite){draw_sprite_ext(spr_3up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "3-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	if (object == level_object_id.id_melon_block_invincibility_powerup) and (asset_get_type("spr_question_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	if (object == level_object_id.id_melon_block_invincibility_powerup_coil_spring) and (asset_get_type("spr_question_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, image_blend, image_alpha);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	#endregion /* Melon Block END */
	
	#region /* Bump in ground */
	/* Bump Basic Collectible */ if (object == level_object_id.id_bump_in_ground_8_basic_collectibles) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	/* Bump Heart */ if (object == level_object_id.id_bump_in_ground_heart_balloon) and (asset_get_type("spr_bump_in_ground") == asset_sprite){if (asset_get_type("spr_heart") == asset_sprite){draw_sprite_ext(spr_heart, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}}
	/* Bump 1up */ if (object == level_object_id.id_bump_in_ground_one_up) and (asset_get_type("spr_bump_in_ground") == asset_sprite){if (asset_get_type("spr_1up") == asset_sprite){draw_sprite_ext(spr_1up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "1-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	/* Bump 2up */ if (object == level_object_id.id_bump_in_ground_two_up) and (asset_get_type("spr_bump_in_ground") == asset_sprite){if (asset_get_type("spr_2up") == asset_sprite){draw_sprite_ext(spr_2up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "2-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	/* Bump 3up */ if (object == level_object_id.id_bump_in_ground_three_up) and (asset_get_type("spr_bump_in_ground") == asset_sprite){if (asset_get_type("spr_3up") == asset_sprite){draw_sprite_ext(spr_3up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "3-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	/* Bump Big Collectible 1 */ if (object == level_object_id.id_bump_in_ground_big_collectible_1) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, image_blend, image_alpha);}
	/* Bump Invincibility */ if (object == level_object_id.id_bump_in_ground_invincibility_powerup) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	/* Bump Invincibility Spring */ if (object == level_object_id.id_bump_in_ground_invincibility_powerup_coil_spring) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, image_blend, image_alpha);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	#endregion /* Bump in ground END */
	
	#region /* Invisible Bump in ground */
	/* Invisible Bump Basic Collectible */ if (object == level_object_id.id_invisible_bump_in_ground_8_basic_collectibles) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(spr_bump_in_ground, 0, x, y, 1, 1, 0, image_blend, image_alpha * 0.5);draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha * 0.5);}
	/* Invisible Bump Heart */ if (object == level_object_id.id_invisible_bump_in_ground_heart_balloon) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(spr_bump_in_ground, 0, x, y, 1, 1, 0, image_blend, image_alpha * 0.5);if (asset_get_type("spr_heart") == asset_sprite){draw_sprite_ext(spr_heart, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha * 0.5);}}
	/* Invisible Bump 1up */ if (object == level_object_id.id_invisible_bump_in_ground_one_up) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(spr_bump_in_ground, 0, x, y, 1, 1, 0, image_blend, image_alpha * 0.5);if (asset_get_type("spr_1up") == asset_sprite){draw_sprite_ext(spr_1up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha * 0.5);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "1-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	/* Invisible Bump 2up */ if (object == level_object_id.id_invisible_bump_in_ground_two_up) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(spr_bump_in_ground, 0, x, y, 1, 1, 0, image_blend, image_alpha * 0.5);if (asset_get_type("spr_2up") == asset_sprite){draw_sprite_ext(spr_2up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha * 0.5);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "2-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	/* Invisible Bump 3up */ if (object == level_object_id.id_invisible_bump_in_ground_three_up) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(spr_bump_in_ground, 0, x, y, 1, 1, 0, image_blend, image_alpha * 0.5);if (asset_get_type("spr_3up") == asset_sprite){draw_sprite_ext(spr_3up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha * 0.5);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "3-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	/* Invisible Bump Big Collectible 1 */ if (object == level_object_id.id_invisible_bump_in_ground_big_collectible_1) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(spr_bump_in_ground, 0, x, y, 1, 1, 0, image_blend, image_alpha * 0.5);draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, image_blend, image_alpha * 0.5);}
	/* Invisible Bump Invincibility */ if (object == level_object_id.id_invisible_bump_in_ground_invincibility_powerup) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(spr_bump_in_ground, 0, x, y, 1, 1, 0, image_blend, image_alpha * 0.5);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha * 0.5);}
	/* Invisible Bump Invincibility Spring */ if (object == level_object_id.id_invisible_bump_in_ground_invincibility_powerup_coil_spring) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(spr_bump_in_ground, 0, x, y, 1, 1, 0, image_blend, image_alpha * 0.5);draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, image_blend, image_alpha * 0.5);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha * 0.5);}
	#endregion /* Invisible Bump in ground END */
	
	if (object == level_object_id.id_invincibility_powerup)
	{
		draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 1, 1, 0, image_blend, image_alpha);
	}
	if (object == level_object_id.id_invincibility_powerup_coil_spring)
	{
		draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 1, 1, 0, image_blend, image_alpha);
		draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 1, 1, 0, image_blend, image_alpha);
	}
	if (object == level_object_id.id_one_up)
	and (instance_exists(obj_leveleditor))
	and (obj_leveleditor.sprite_lives_icon > noone)
	{
		draw_sprite_ext(obj_leveleditor.sprite_lives_icon, 0, x, y, 1, 1, 0, c_white, image_alpha);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(x, y, "1-up", global.default_text_size / 2, image_blend, c_black, image_alpha);
	}
	if (object == level_object_id.id_two_up)
	and (instance_exists(obj_leveleditor))
	and (obj_leveleditor.sprite_lives_icon > noone)
	{
		draw_sprite_ext(obj_leveleditor.sprite_lives_icon, 0, x, y, 1, 1, 0, c_lime, image_alpha);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(x, y, "2-up", global.default_text_size / 2, image_blend, c_black, image_alpha);
	}
	if (object == level_object_id.id_three_up)
	and (instance_exists(obj_leveleditor))
	and (obj_leveleditor.sprite_lives_icon > noone)
	{
		draw_sprite_ext(obj_leveleditor.sprite_lives_icon, 0, x, y, 1, 1, 0, c_blue, image_alpha);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(x, y, "3-up", global.default_text_size / 2, image_blend, c_black, image_alpha);
	}
	if (object == level_object_id.id_basic_enemy_coil_spring)
	or (object == level_object_id.id_basic_enemy_blind_coil_spring)
	or (object == level_object_id.id_enemy_bowlingball_coil_spring)
	or (object == level_object_id.id_enemy_bowlingball_blind_coil_spring)
	{
		if (global.resource_pack_sprite_coil_spring > noone)
		{
			draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 32, 1, 1, 0, image_blend, image_alpha);
		}
	}
	if (object == level_object_id.id_big_stationary_enemy_coil_spring)
	{
		if (global.resource_pack_sprite_coil_spring > noone)
		{
			draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 64, 1, 1, 0, image_blend, image_alpha);
		}
	}
	
	#region /* Arrow Signs */
	if (object == level_object_id.id_arrow_sign)
	and (asset_get_type("spr_arrow_sign") == asset_sprite)
	{
		draw_sprite_ext(spr_arrow_sign, 0, x, y, 1, 1, draw_angle, image_blend, image_alpha);
	}
	#endregion /* Arrow Signs END */
	
	#region /* Arrow Signs Small */
	if (object == level_object_id.id_arrow_sign_small)
	and (asset_get_type("spr_arrow_sign_small") == asset_sprite)
	{
		draw_sprite_ext(spr_arrow_sign_small, 0, x, y, 0.5, 0.5, draw_angle, image_blend, image_alpha);
	}
	#endregion /* Arrow Signs Small END */
	
	#region /* Bucket */
	if (object == level_object_id.id_bucket_8_basic_collectibles) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(spr_bucket, 0, x, y, 1, 1, 0, image_blend, image_alpha);draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	if (object == level_object_id.id_bucket_heart_balloon) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(spr_bucket, 0, x, y, 1, 1, 0, image_blend, image_alpha);if (asset_get_type("spr_heart") == asset_sprite){draw_sprite_ext(spr_heart, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}}
	if (object == level_object_id.id_bucket_one_up) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(spr_bucket, 0, x, y, 1, 1, 0, image_blend, image_alpha);if (asset_get_type("spr_1up") == asset_sprite){draw_sprite_ext(spr_1up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "1-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	if (object == level_object_id.id_bucket_two_up) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(spr_bucket, 0, x, y, 1, 1, 0, image_blend, image_alpha);if (asset_get_type("spr_2up") == asset_sprite){draw_sprite_ext(spr_2up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "2-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	if (object == level_object_id.id_bucket_three_up) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(spr_bucket, 0, x, y, 1, 1, 0, image_blend, image_alpha);if (asset_get_type("spr_3up") == asset_sprite){draw_sprite_ext(spr_3up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(x, y, "3-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
	if (object == level_object_id.id_bucket_big_collectible_1) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(spr_bucket, 0, x, y, 1, 1, 0, image_blend, image_alpha);draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, image_blend, image_alpha);}
	if (object == level_object_id.id_bucket_invincibility_powerup) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(spr_bucket, 0, x, y, 1, 1, 0, image_blend, image_alpha);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	if (object == level_object_id.id_bucket_invincibility_powerup_coil_spring) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(spr_bucket, 0, x, y, 1, 1, 0, image_blend, image_alpha);draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, image_blend, image_alpha);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);}
	#endregion /* Bucket END */
	
	if (object == 961) and (global.resource_pack_sprite_cake > 0){draw_sprite_ext(global.resource_pack_sprite_cake, 0, x, y - 16, 1, 1, 0, image_blend, image_alpha);}
}
else
{
	if (object == 2)
	{
		if (asset_get_type("spr_level_ring") == asset_sprite)
		{
			draw_sprite_ext(spr_level_ring, 0, x, y, 1, 1, 0, c_yellow, 1);
		}
		if (asset_get_type("spr_level") == asset_sprite)
		{
			draw_sprite_ext(spr_level, 0, x, y, 1, 1, 0, c_black, 1);
		}
		sprite_index = spr_noone; 
		mask_index = spr_wall;
	}
	if (object == 4){if (asset_get_type("spr_map_turn_right_down") == asset_sprite){draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 0, image_blend, 1);}sprite_index = spr_noone; mask_index = spr_wall;}
	if (object == 5){if (asset_get_type("spr_map_turn_right_down") == asset_sprite){draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 90, image_blend, 1);}sprite_index = spr_noone; mask_index = spr_wall;}
	if (object == 6){if (asset_get_type("spr_map_turn_right_down") == asset_sprite){draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 180, image_blend, 1);}sprite_index = spr_noone; mask_index = spr_wall;}
	if (object == 7){if (asset_get_type("spr_map_turn_right_down") == asset_sprite){draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 270, image_blend, 1);}sprite_index = spr_noone; mask_index = spr_wall;}
}
#endregion /* Initialize Object END */