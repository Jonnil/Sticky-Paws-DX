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
		draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 1);
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
			draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_lime, 0.1);
		}
		else
		if (easy = true)
		and (normal = true)
		and (hard = false)
		and (sprite_index > 0)
		{
			draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 0.1);
		}
		else
		if (easy = false)
		and (normal = true)
		and (hard = false)
		and (sprite_index > 0)
		{
			draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_yellow, 0.1);
		}
		else
		if (easy = false)
		and (normal = true)
		and (hard = true)
		and (sprite_index > 0)
		{
			draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 0.1);
		}
		else
		if (easy = false)
		and (normal = false)
		and (hard = true)
		and (sprite_index > 0)
		{
			draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_red, 0.1);
		}
		else
		if (easy = true)
		and (normal = false)
		and (hard = true)
		and (sprite_index > 0)
		{
			draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 0.1);
		}
		#endregion /*Transparent Object END*/
	
		else
		if (easy = true)
		and (normal = true)
		and (hard = true)
		and (sprite_index > 0)
		{
			draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 1);
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
			draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_lime, 1);
		}
		else
		{
			#region /*Transparent Object*/
			if (easy = true)
			and (normal = false)
			and (hard = false)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_lime, 0.1);
			}
			else
			if (easy = true)
			and (normal = true)
			and (hard = false)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 0.1);
			}
			else
			if (easy = false)
			and (normal = true)
			and (hard = false)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_yellow, 0.1);
			}
			else
			if (easy = false)
			and (normal = true)
			and (hard = true)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 0.1);
			}
			else
			if (easy = false)
			and (normal = false)
			and (hard = true)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_red, 0.1);
			}
			else
			if (easy = true)
			and (normal = false)
			and (hard = true)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 0.1);
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
			draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_yellow, 1);
		}
		else
		{
			#region /*Transparent Object*/
			if (easy = true)
			and (normal = false)
			and (hard = false)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_lime, 0.1);
			}
			else
			if (easy = true)
			and (normal = true)
			and (hard = false)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 0.1);
			}
			else
			if (easy = false)
			and (normal = true)
			and (hard = false)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_yellow, 0.1);
			}
			else
			if (easy = false)
			and (normal = true)
			and (hard = true)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 0.1);
			}
			else
			if (easy = false)
			and (normal = false)
			and (hard = true)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_red, 0.1);
			}
			else
			if (easy = true)
			and (normal = false)
			and (hard = true)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 0.1);
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
			draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_red, 1);
		}
		else
		{
			#region /*Transparent Object*/
			if (easy = true)
			and (normal = false)
			and (hard = false)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_lime, 0.1);
			}
			else
			if (easy = true)
			and (normal = true)
			and (hard = false)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 0.1);
			}
			else
			if (easy = false)
			and (normal = true)
			and (hard = false)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_yellow, 0.1);
			}
			else
			if (easy = false)
			and (normal = true)
			and (hard = true)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 0.1);
			}
			else
			if (easy = false)
			and (normal = false)
			and (hard = true)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_red, 0.1);
			}
			else
			if (easy = true)
			and (normal = false)
			and (hard = true)
			and (sprite_index > 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 0.1);
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
	draw_sprite_ext(sprite_index, image_index, x, y, 1, draw_yscale, draw_angle, c_white, 1);
}
#endregion /*Make sprite transparent if you're setting difficulty levels END*/

#region /*Change certain objects angle*/

/*Spring*/
if (object = 62)
{
	draw_line_width_color(x, y,second_x,second_y, 4, c_black, c_black);
	draw_line_width_color(x, y,second_x,second_y, 2, c_white, c_white);
	draw_angle = point_direction(x, y, second_x, second_y) -90;
}

else

/*Water Level Change*/
if (object = 732)
or(object = 733)
or(object = 734)
{
	draw_line_width_color(x, y, x,second_y, 4, c_black, c_black);
	draw_line_width_color(x, y, x,second_y, 2, c_white, c_white);
	draw_angle = point_direction(x, y, x, second_y) -90;
}

else

/*Arrows*/
if (object = 64)
or(object = 65)
{
	draw_angle = point_direction(x, y, second_x, second_y);
}

else

/*Water Block*/
if (object = 73)
{
	draw_set_alpha(0.5);
	draw_rectangle_color(x - 16, y - 16, 16 + second_x, 16 + second_y, c_blue, c_blue, c_blue, c_blue, false);
	draw_set_alpha(1);
}

#endregion /*Change certain objects angle END*/

#endregion /*All code before initializing the object END*/

#region /*Initialize Object*/

#region /*Brick Block*/
if (object = 5) and (asset_get_type("spr_brick_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}
if (object = 6) and (asset_get_type("spr_brick_block") == asset_sprite){if (asset_get_type("spr_heart") == asset_sprite){draw_sprite_ext(spr_heart, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}}
if (object = 7) and (asset_get_type("spr_brick_block") == asset_sprite){if (asset_get_type("spr_1up") == asset_sprite){draw_sprite_ext(spr_1up, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);
draw_text_outlined(x, y, "1-up", global.default_text_size / 2, c_white, c_black, image_alpha);}
if (object = 8) and (asset_get_type("spr_brick_block") == asset_sprite){if (asset_get_type("spr_2up") == asset_sprite){draw_sprite_ext(spr_2up, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);
draw_text_outlined(x, y, "2-up", global.default_text_size / 2, c_white, c_black, image_alpha);}
if (object = 9) and (asset_get_type("spr_brick_block") == asset_sprite){if (asset_get_type("spr_3up") == asset_sprite){draw_sprite_ext(spr_3up, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);
draw_text_outlined(x, y, "3-up", global.default_text_size / 2, c_white, c_black, image_alpha);}
if (object = 10) and (asset_get_type("spr_brick_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}
if (object = 10001) and (asset_get_type("spr_brick_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, c_white, image_alpha);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}
#endregion /*Brick Block END*/

#region /*Question Block*/
if (object = 12) and (asset_get_type("spr_question_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}
if (object = 13) and (asset_get_type("spr_question_block") == asset_sprite){if (asset_get_type("spr_heart") == asset_sprite){draw_sprite_ext(spr_heart, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}}
if (object = 14) and (asset_get_type("spr_question_block") == asset_sprite){if (asset_get_type("spr_1up") == asset_sprite){draw_sprite_ext(spr_1up, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "1-up", global.default_text_size / 2, c_white, c_black, image_alpha);}
if (object = 15) and (asset_get_type("spr_question_block") == asset_sprite){if (asset_get_type("spr_2up") == asset_sprite){draw_sprite_ext(spr_2up, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "2-up", global.default_text_size / 2, c_white, c_black, image_alpha);}
if (object = 16) and (asset_get_type("spr_question_block") == asset_sprite){if (asset_get_type("spr_3up") == asset_sprite){draw_sprite_ext(spr_3up, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "3-up", global.default_text_size / 2, c_white, c_black, image_alpha);}
if (object = 17) and (asset_get_type("spr_question_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}
if (object = 17001) and (asset_get_type("spr_question_block") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, c_white, image_alpha);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}
#endregion /*Question Block END*/

#region /*Bump in ground*/
if (object = 29) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}
if (object = 30) and (asset_get_type("spr_bump_in_ground") == asset_sprite){if (asset_get_type("spr_heart") == asset_sprite){draw_sprite_ext(spr_heart, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}}
if (object = 31) and (asset_get_type("spr_bump_in_ground") == asset_sprite){if (asset_get_type("spr_1up") == asset_sprite){draw_sprite_ext(spr_1up, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);
draw_text_outlined(x, y, "1-up", global.default_text_size / 2, c_white, c_black, image_alpha);}
if (object = 32) and (asset_get_type("spr_bump_in_ground") == asset_sprite){if (asset_get_type("spr_2up") == asset_sprite){draw_sprite_ext(spr_2up, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);
draw_text_outlined(x, y, "2-up", global.default_text_size / 2, c_white, c_black, image_alpha);}
if (object = 33) and (asset_get_type("spr_bump_in_ground") == asset_sprite){if (asset_get_type("spr_3up") == asset_sprite){draw_sprite_ext(spr_3up, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);
draw_text_outlined(x, y, "3-up", global.default_text_size / 2, c_white, c_black, image_alpha);}
if (object = 34) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, c_white, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "1", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 35) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, c_white, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "2", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 36) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, c_white, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "3", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 37) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, c_white, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "4", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 38) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, c_white, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "5", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 39) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}
if (object = 39001) and (asset_get_type("spr_bump_in_ground") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, c_white, image_alpha);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}
#endregion /*Bump in ground END*/

#region /*Big Collectibles*/
if (object = 48){draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "1", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 49){draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "2", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 50){draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "3", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 51){draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "4", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 52){draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "5", global.default_text_size, c_white, c_black, image_alpha);}
#endregion /*Big Collectibles END*/

if (object = 55){draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 1, 1, 0, c_white, image_alpha);}
if (object = 55001){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 1, 1, 0, c_white, image_alpha);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 1, 1, 0, c_white, image_alpha);}
if (object = 56) and (sprite_lives_icon > noone){draw_sprite_ext(sprite_lives_icon, 0, x, y, 1, 1, 0, c_white, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);
draw_text_outlined(x, y, "1-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
if (object = 57) and (sprite_lives_icon > noone){draw_sprite_ext(sprite_lives_icon, 0, x, y, 1, 1, 0, c_lime, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);
draw_text_outlined(x, y, "2-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
if (object = 58) and (sprite_lives_icon > noone){draw_sprite_ext(sprite_lives_icon, 0, x, y, 1, 1, 0, c_blue, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);
draw_text_outlined(x, y, "3-up", global.default_text_size / 2, image_blend, c_black, image_alpha);}
if (object = 5901){if (global.resource_pack_sprite_coil_spring > noone){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 32, 1, 1, 0, c_white, image_alpha);}}
if (object = 5903){if (global.resource_pack_sprite_coil_spring > noone){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 32, 1, 1, 0, c_white, image_alpha);}}
if (object = 592){if (global.resource_pack_sprite_coil_spring > noone){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 32, 1, 1, 0, c_white, image_alpha);}}
if (object = 5912){if (global.resource_pack_sprite_coil_spring > noone){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 32, 1, 1, 0, c_white, image_alpha);}}

#region /*Arrow Signs*/
if (object = 64) and (asset_get_type("spr_arrow_sign") == asset_sprite){draw_sprite_ext(spr_arrow_sign, 0, x, y, 1, 1, draw_angle, image_blend, image_alpha);}
#endregion /*Arrow Signs END*/

#region /*Arrow Signs Small*/
if (object = 65) and (asset_get_type("spr_arrow_sign_small") == asset_sprite){draw_sprite_ext(spr_arrow_sign_small, 0, x, y, 0.5, 0.5, draw_angle, image_blend, image_alpha);}
#endregion /*Arrow Signs Small END*/

#region /*Bucket*/
if (object = 78) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}
if (object = 79) and (asset_get_type("spr_bucket") == asset_sprite){if (asset_get_type("spr_heart") == asset_sprite){draw_sprite_ext(spr_heart, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}}
if (object = 80) and (asset_get_type("spr_bucket") == asset_sprite){if (asset_get_type("spr_1up") == asset_sprite){draw_sprite_ext(spr_1up, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "1-up", global.default_text_size / 2, c_white, c_black, image_alpha);}
if (object = 81) and (asset_get_type("spr_bucket") == asset_sprite){if (asset_get_type("spr_2up") == asset_sprite){draw_sprite_ext(spr_2up, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "2-up", global.default_text_size / 2, c_white, c_black, image_alpha);}
if (object = 82) and (asset_get_type("spr_bucket") == asset_sprite){if (asset_get_type("spr_3up") == asset_sprite){draw_sprite_ext(spr_3up, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "3-up", global.default_text_size / 2, c_white, c_black, image_alpha);}
if (object = 83) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, c_white, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "1", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 84) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, c_white, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "2", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 85) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, c_white, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "3", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 86) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, c_white, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "4", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 87) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y, 0.4, 0.4, 0, c_white, image_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(x, y, "5", global.default_text_size, c_white, c_black, image_alpha);}
if (object = 88) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}
if (object = 88001) and (asset_get_type("spr_bucket") == asset_sprite){draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, c_white, image_alpha);draw_sprite_ext(global.resource_pack_sprite_invincibility_powerup, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha);}
#endregion /*Bucket END*/

if (object = 961) and (asset_get_type("spr_cake") == asset_sprite){draw_sprite_ext(spr_cake, 0, x, y - 16, 1, 1, 0, c_white, image_alpha);}
#endregion /*Initialize Object END*/