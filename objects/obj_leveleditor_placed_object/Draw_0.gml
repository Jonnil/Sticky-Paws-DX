if (global.actually_play_edited_level == false && x > camera_get_view_x(view_camera[view_current]) - 12 && x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 12 && y > camera_get_view_y(view_camera[view_current]) - 12 && y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 12)
{
	if (sprite_exists(sprite_index)) draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale, draw_yscale, draw_angle, image_blend, image_alpha);
	if (draw_rotate_arrow) draw_sprite_ext(spr_rotate_arrow, image_index, x, y, scr_wave(draw_xscale * 0.3, draw_xscale * 0.2, 0.5, 0), scr_wave(draw_yscale * 0.3, draw_yscale * 0.2, 0.5, 0), draw_angle, image_blend, image_alpha);
	
	switch (object) 
	{
		case level_object_id.id_spring:
		case level_object_id.id_door:
			draw_line_width_color(x, y, second_x, second_y, 4, c_black, c_black);
			draw_line_width_color(x, y, second_x, second_y, 2, image_blend, image_blend);
			draw_set_color(c_black);
			draw_arrow(x, y, second_x, second_y, 23);
			draw_set_color(image_blend);
			draw_arrow(x, y, second_x, second_y, 20);
			draw_set_color(c_white);
			if (object == level_object_id.id_spring) draw_angle = point_direction(x, y, second_x, second_y) - 90;
			break;
		case level_object_id.id_water_level_change_slow:
		case level_object_id.id_water_level_change_fast:
		case level_object_id.id_water_level_change_faster:
			draw_line_width_color(x, y, x, second_y, 4, c_black, c_black);
			draw_line_width_color(x, y, x, second_y, 2, image_blend, image_blend);
			draw_angle = point_direction(x, y, x, second_y) - 90;
			break;
		case level_object_id.id_arrow_sign:
		case level_object_id.id_arrow_sign_small:
			draw_angle = point_direction(x, y, second_x, second_y);
			break;
		case level_object_id.id_water:
			draw_set_alpha(0.5);
			draw_rectangle_color(x - 16, y - 16, 16 + second_x, 16 + second_y, c_blue, c_blue, c_blue, c_blue, false);
			draw_set_alpha(1);
			break;
		case level_object_id.id_breathable_water:
			draw_set_alpha(0.25);
			draw_rectangle_color(x - 16, y - 16, 16 + second_x, 16 + second_y, c_blue, c_blue, c_blue, c_blue, false);
			draw_set_alpha(1);
			break;
	}
	
	#region /* Initialize Object */
	if (global.world_editor == false)
	{
		switch (object) {
			case level_object_id.id_brick_block_10_basic_collectibles:
			case level_object_id.id_question_block_10_basic_collectibles:
			case level_object_id.id_melon_block_10_basic_collectibles:
				draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);
				break;
			case level_object_id.id_brick_block_heart_balloon:
			case level_object_id.id_question_block_heart_balloon:
				draw_sprite_ext(spr_heart, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);
				break;
			case level_object_id.id_brick_block_one_up:
			case level_object_id.id_question_block_one_up:
				draw_sprite_ext(spr_1up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(x, y, "1-up", global.default_text_size * 0.5, image_blend, c_black, image_alpha);
				break;
			case level_object_id.id_brick_block_two_up:
			case level_object_id.id_question_block_two_up:
				draw_sprite_ext(spr_2up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(x, y, "2-up", global.default_text_size * 0.5, image_blend, c_black, image_alpha);
				break;
			case level_object_id.id_brick_block_three_up:
			case level_object_id.id_question_block_three_up:
				draw_sprite_ext(spr_3up, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(x, y, "3-up", global.default_text_size * 0.5, image_blend, c_black, image_alpha);
				break;
			case level_object_id.id_brick_block_invincibility_powerup:
			case level_object_id.id_question_block_invincibility_powerup:
				draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);
				break;
			case level_object_id.id_brick_block_invincibility_powerup_coil_spring:
			case level_object_id.id_question_block_invincibility_powerup_coil_spring:
				draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, image_blend, image_alpha);
				draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);
				break;
		}
	}
	else
	{
		switch (object)
		{
			case 2:
				draw_sprite_ext(spr_level_ring, 0, x, y, 1, 1, 0, c_yellow, 1);
				draw_sprite_ext(spr_level, 0, x, y, 1, 1, 0, c_black, 1);
				sprite_index = spr_noone;
				break;
			case 4:
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 0, image_blend, 1);
				sprite_index = spr_noone;
				break;
			case 5:
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 90, image_blend, 1);
				sprite_index = spr_noone;
				break;
			case 6:
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 180, image_blend, 1);
				sprite_index = spr_noone;
				break;
			case 7:
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 270, image_blend, 1);
				sprite_index = spr_noone;
				break;
			default:
				break;
		}
	}
	#endregion /* Initialize Object END */
	
}