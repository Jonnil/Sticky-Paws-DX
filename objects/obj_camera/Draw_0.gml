scr_set_screen_size();
scr_set_controls_used_to_navigate();

if (room = room_leveleditor)
{
	layer_background_sprite(layer_background_get_id(layer_get_id("Background")), global.custom_background1);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), global.custom_background2);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), global.custom_background3);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), global.custom_background4);
}

#region /* Make background visible */
if (room = room_leveleditor)
{
	if (global.custom_background1 > noone)
	and (global.enable_background_layer1 = true)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background")), false)
	}

	if (global.custom_background2 > noone)
	and (global.enable_background_layer2 = true)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), false)
	}

	if (global.custom_background3 > noone)
	and (global.enable_background_layer3 = true)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), false)
	}

	if (global.custom_background4 > noone)
	and (global.enable_background_layer4 = true)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), false)
	}
}
#endregion /* Make background visible END */

#region /* Timer Countup */
if (asset_get_type("obj_goal") == asset_object)
and (instance_exists(obj_goal))
and (obj_goal.goal = false)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (obj_player.allow_timeattack = true)
and (global.pause == false)
{
	if (instance_exists(obj_player))
	{
		global.timeattack_millisecond += 1;
	}

	global.timeattack_realmillisecond += 1;
	if (global.timeattack_millisecond > 60)
	{
		global.timeattack_millisecond = 0;
		global.timeattack_second += 1;
	}
	if (global.timeattack_second > 59)
	{
		global.timeattack_millisecond = 0;
		global.timeattack_second = 0;
		global.timeattack_minute += 1;
	}
}
else
if (asset_get_type("obj_goal") == asset_object)
and (global.pause == false)
{
	if (instance_exists(obj_goal))
	and (obj_goal.goal = false)
	or (!instance_exists(obj_goal))
	{
		if (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (obj_player.allow_timeattack = true)
		{
			if (instance_exists(obj_player))
			{
				global.timeattack_millisecond += 1;
			}
			global.timeattack_realmillisecond += 1;
			if (global.timeattack_millisecond > 60)
			{
				global.timeattack_millisecond = 0;
				global.timeattack_second += 1;
			}
			if (global.timeattack_second > 59)
			{
				global.timeattack_millisecond = 0;
				global.timeattack_second = 0;
				global.timeattack_minute += 1;
			}
		}
	}
}
#endregion /* Timer Countup */

#region /* Time Countdown */
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (global.pause == false)
{
	if (asset_get_type("obj_goal") == asset_object)
	{
		if (instance_exists(obj_goal))
		and (obj_goal.goal = false)
		or (!instance_exists(obj_goal))
		{
			time_second += 1;
			if (time_second > room_speed)
			{
				time_second = 0;
				global.time_countdown_bonus -= 1;
				if (obj_player.allow_timeup = true)
				and (global.enable_time_countdown == true)
				{
					global.time_countdown -= 1;
				}
			}
		}
	}
}
#endregion /* Time Countdown END */

room_speed = global.max_fps; /* Room Speed is max fps */
global.spikes_emerge_time += 1;
if (global.spikes_emerge_time >= room_speed * 4)
{
	global.spikes_emerge_time = 0;
}

/* Stop the screen from scrolling left if scrolling left isn't allowed */
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (obj_player.stop_screen_from_scrolling_left = true)
{
	if (x > scrolling_left)
	{
		scrolling_left = x;
	}
	if (x < scrolling_left)
	{
		x = scrolling_left;
	}
}

scr_toggle_fullscreen();

#region /* Black screen when starting level */
if (save_level_as_png = false)
and (allow_iris = true)
and (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
and (delay <= 1)
and (global.actually_play_edited_level == true)
{
	/* Makes the screen black when starting a level so you don't see the level loading in. Also make sure this black rectangle is bigger than the level, in case the level is smaller than the view size */
	draw_rectangle_color(0, 0, room_width * 3, room_height* 3, c_black, c_black, c_black, c_black, false);
}
#endregion /* Black screen when starting level END */

#region /* Draw Iris Transitions */
if (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
{
	if (global.enable_transitions == true)
	and (global.play_edited_level == false)
	and (global.actually_play_edited_level == false)
	or (global.enable_transitions = true)
	and (global.play_edited_level == true)
	and (global.actually_play_edited_level == true)
	{
		if (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (asset_get_type("obj_title") == asset_object)
		and (!instance_exists(obj_title))
		and (iris_xscale < 31)
		{
			if (asset_get_type("spr_iris") == asset_sprite)
			{
				draw_sprite_ext(spr_iris, 0, instance_nearest(room_width, y, obj_player).x, instance_nearest(room_width, y, obj_player).y, iris_xscale, iris_yscale, 0, c_black, 1);
			}
			draw_rectangle_color(0, 0, room_width, instance_nearest(room_width, y, obj_player).y - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, 0, instance_nearest(room_width, y, obj_player).x - iris_xscale * 128, room_height, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(instance_nearest(room_width, y, obj_player).x + iris_xscale * 128 - 1, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, instance_nearest(room_width, y, obj_player).y + iris_yscale * 128, room_width, room_height, c_black, c_black, c_black, c_black, false);
		}
		else
		if (iris_xscale < 15)
		{
			if (asset_get_type("spr_iris") == asset_sprite)
			{
				draw_sprite_ext(spr_iris, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2, iris_xscale, iris_yscale, 0, c_black, 1);
			}
			draw_rectangle_color(0, 0, room_width, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 - iris_xscale * 128, room_height, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + iris_xscale * 128 - 1, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + iris_yscale * 128, room_width, room_height, c_black, c_black, c_black, c_black, false);
		}
	}
}
#endregion /* Draw Iris Transitions END */

#region /* Rain Effect */
if (global.rain = true)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
{
	if (floor(random(10 - 1)) = 0)
	{
		effect_create_above(ef_rain, x, y, 2, c_white);
	}
}
#endregion /* Rain Effect END */

///Multiplayer - Has pressed keys

#region /* Player 1 Show Controls HUD timer */
if (player1 >= 1)
and (can_spawn_player1 == true)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (instance_exists(player1))
and (iris_xscale >= 10)
{
	if (global.player1_show_controls = 0)
	or(obj_player.can_move = false)
	{
		player1_show_controls_alpha = lerp(player1_show_controls_alpha, 0, 0.2);
	}
	else
	if (global.player1_show_controls >= 1)
	and (global.player1_show_controls <= 9)
	{
		if (player1_show_controls_timer >= 1)
		{
			player1_show_controls_alpha = lerp(player1_show_controls_alpha, 0, 0.2);
			player1_show_controls_timer -= 1;
		}
		if (player1_show_controls_timer <= 0)
		and (player1.speed = 0)
		{
			player1_show_controls_alpha = lerp(player1_show_controls_alpha, 1, 0.1);
		}
	}
	else
	if (global.player1_show_controls = 10)
	{
		player1_show_controls_alpha = lerp(player1_show_controls_alpha, 1, 0.1);
	}

	if (keyboard_check(global.player1_key_up))
	or (keyboard_check(global.player1_key2_up))
	or (gamepad_button_check(0, gp_padu))
	or (gamepad_axis_value(0, gp_axislv) < 0)
	or (keyboard_check(global.player1_key_left))
	or (keyboard_check(global.player1_key2_left))
	or (gamepad_button_check(0, gp_padl))
	or (gamepad_axis_value(0, gp_axislh) < 0)
	or (keyboard_check(global.player1_key_right))
	or (keyboard_check(global.player1_key2_right))
	or (gamepad_button_check(0, gp_padr))
	or (gamepad_axis_value(0, gp_axislh) > 0)
	or (keyboard_check(global.player1_key_down))
	or (keyboard_check(global.player1_key2_down))
	or (gamepad_button_check(0, gp_padd))
	or (gamepad_axis_value(0, gp_axislv) > 0)
	or (gamepad_button_check(0, gp_face1))
	or (gamepad_button_check(0, gp_face2))
	or (keyboard_check(global.player1_key_jump))
	or (keyboard_check(global.player1_key2_jump))
	or (gamepad_button_check(0, gp_face3))
	or (gamepad_button_check(0, gp_face4))
	or (keyboard_check(global.player1_key_sprint))
	or (keyboard_check(global.player1_key2_sprint))
	
	or (keyboard_check(global.player1_key_sprint_toggle))
	or (keyboard_check(global.player1_key2_sprint_toggle))
	or (keyboard_check(global.player1_key_crouch))
	or (keyboard_check(global.player1_key2_crouch))
	or (keyboard_check(global.player1_key_crouch_toggle))
	or (keyboard_check(global.player1_key2_crouch_toggle))
	or (keyboard_check(global.player1_key_dive))
	or (keyboard_check(global.player1_key2_dive))
	or (keyboard_check(global.player1_key_tongue))
	or (keyboard_check(global.player1_key2_tongue))
	{
		player1_show_controls_timer = room_speed * global.player1_show_controls;
	}
}
else
{
	player1_show_controls_alpha = lerp(player1_show_controls_alpha, 0, 0.2);
	player1_show_controls_timer = room_speed * global.player1_show_controls;
}
#endregion /* Player 1 Show Controls HUD timer */

#region /* Player 2 Show Controls HUD timer */
if (player2 >= 1)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (instance_exists(player2))
and (iris_xscale >= 10)
{
	if (global.player2_show_controls = 0)
	or(obj_player.can_move = false)
	{
		player2_show_controls_alpha = lerp(player2_show_controls_alpha, 0, 0.2);
	}
	else
	if (global.player2_show_controls >= 1)
	and (global.player2_show_controls <= 9)
	{
		if (player2_show_controls_timer >= 1)
		{
			player2_show_controls_alpha = lerp(player2_show_controls_alpha, 0, 0.2);
			player2_show_controls_timer -= 1;
		}
		if (player2_show_controls_timer <= 0)
		and (player2.speed = 0)
		{
			player2_show_controls_alpha = lerp(player2_show_controls_alpha, 1, 0.1);
		}
	}
	else
	if (global.player2_show_controls = 10)
	{
		player2_show_controls_alpha = lerp(player2_show_controls_alpha, 1, 0.1);
	}

	if (keyboard_check(global.player2_key_up))
	or (keyboard_check(global.player2_key2_up))
	or (gamepad_button_check(1, gp_padu))
	or (gamepad_axis_value(1, gp_axislv) < 0)
	or (keyboard_check(global.player2_key_left))
	or (keyboard_check(global.player2_key2_left))
	or (gamepad_button_check(1, gp_padl))
	or (gamepad_axis_value(1, gp_axislh) < 0)
	or (keyboard_check(global.player2_key_right))
	or (keyboard_check(global.player2_key2_right))
	or (gamepad_button_check(1, gp_padr))
	or (gamepad_axis_value(1, gp_axislh) > 0)
	or (keyboard_check(global.player2_key_down))
	or (keyboard_check(global.player2_key2_down))
	or (gamepad_button_check(1, gp_padd))
	or (gamepad_axis_value(1, gp_axislv) > 0)
	or (gamepad_button_check(1, gp_face1))
	or (gamepad_button_check(1, gp_face2))
	or (keyboard_check(global.player2_key_jump))
	or (keyboard_check(global.player2_key2_jump))
	or (gamepad_button_check(1, gp_face3))
	or (gamepad_button_check(1, gp_face4))
	or (keyboard_check(global.player2_key_sprint))
	or (keyboard_check(global.player2_key2_sprint))
	
	or (keyboard_check(global.player2_key_sprint_toggle))
	or (keyboard_check(global.player2_key2_sprint_toggle))
	or (keyboard_check(global.player2_key_crouch))
	or (keyboard_check(global.player2_key2_crouch))
	or (keyboard_check(global.player2_key_crouch_toggle))
	or (keyboard_check(global.player2_key2_crouch_toggle))
	or (keyboard_check(global.player2_key_dive))
	or (keyboard_check(global.player2_key2_dive))
	or (keyboard_check(global.player2_key_tongue))
	or (keyboard_check(global.player2_key2_tongue))
	{
		player2_show_controls_timer = room_speed * global.player2_show_controls;
	}
}
else
{
	player2_show_controls_alpha = lerp(player2_show_controls_alpha, 0, 0.2);
	player2_show_controls_timer = room_speed * global.player2_show_controls;
}
#endregion /* Player 2 Show Controls HUD timer */

#region /* Player 3 Show Controls HUD timer */
if (player3 >= 1)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (instance_exists(player3))
and (iris_xscale >= 10)
{
	if (global.player3_show_controls = 0)
	or(obj_player.can_move = false)
	{
		player3_show_controls_alpha = lerp(player3_show_controls_alpha, 0, 0.2);
	}
	else
	if (global.player3_show_controls >= 1)
	and (global.player3_show_controls <= 9)
	{
		if (player3_show_controls_timer >= 1)
		{
			player3_show_controls_alpha = lerp(player3_show_controls_alpha, 0, 0.2);
			player3_show_controls_timer -= 1;
		}
		if (player3_show_controls_timer <= 0)
		and (player3.speed = 0)
		{
			player3_show_controls_alpha = lerp(player3_show_controls_alpha, 1, 0.1);
		}
	}
	else
	if (global.player3_show_controls = 10)
	{
		player3_show_controls_alpha = lerp(player3_show_controls_alpha, 1, 0.2);
	}

	if (keyboard_check(global.player3_key_up))
	or (keyboard_check(global.player3_key2_up))
	or (gamepad_button_check(2, gp_padu))
	or (gamepad_axis_value(2, gp_axislv) < 0)
	or (keyboard_check(global.player3_key_left))
	or (keyboard_check(global.player3_key2_left))
	or (gamepad_button_check(2, gp_padl))
	or (gamepad_axis_value(2, gp_axislh) < 0)
	or (keyboard_check(global.player3_key_right))
	or (keyboard_check(global.player3_key2_right))
	or (gamepad_button_check(2, gp_padr))
	or (gamepad_axis_value(2, gp_axislh) > 0)
	or (keyboard_check(global.player3_key_down))
	or (keyboard_check(global.player3_key2_down))
	or (gamepad_button_check(2, gp_padd))
	or (gamepad_axis_value(2, gp_axislv) > 0)
	or (gamepad_button_check(2, gp_face1))
	or (gamepad_button_check(2, gp_face2))
	or (keyboard_check(global.player3_key_jump))
	or (keyboard_check(global.player3_key2_jump))
	or (gamepad_button_check(2, gp_face3))
	or (gamepad_button_check(2, gp_face4))
	or (keyboard_check(global.player3_key_sprint))
	or (keyboard_check(global.player3_key2_sprint))
	
	or (keyboard_check(global.player3_key_sprint_toggle))
	or (keyboard_check(global.player3_key2_sprint_toggle))
	or (keyboard_check(global.player3_key_crouch))
	or (keyboard_check(global.player3_key2_crouch))
	or (keyboard_check(global.player3_key_crouch_toggle))
	or (keyboard_check(global.player3_key2_crouch_toggle))
	or (keyboard_check(global.player3_key_dive))
	or (keyboard_check(global.player3_key2_dive))
	or (keyboard_check(global.player3_key_tongue))
	or (keyboard_check(global.player3_key2_tongue))
	{
		player3_show_controls_timer = room_speed * global.player3_show_controls;
	}
}
else
{
	player3_show_controls_alpha = lerp(player3_show_controls_alpha, 0, 0.2);
	player3_show_controls_timer = room_speed * global.player3_show_controls;
}
#endregion /* Player 3 Show Controls HUD timer */

#region /* Player 4 Show Controls HUD timer */
if (player4 >= 1)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (instance_exists(player4))
and (iris_xscale >= 10)
{
	if (global.player4_show_controls = 0)
	or(obj_player.can_move = false)
	{
		player4_show_controls_alpha = lerp(player4_show_controls_alpha, 0, 0.2);
	}
	else
	if (global.player4_show_controls >= 1)
	and (global.player4_show_controls <= 9)
	{
		if (player4_show_controls_timer >= 1)
		{
			player4_show_controls_alpha = lerp(player4_show_controls_alpha, 0, 0.2);
			player4_show_controls_timer -= 1;
		}
		if (player4_show_controls_timer <= 0)
		and (player4.speed = 0)
		{
			player4_show_controls_alpha = lerp(player4_show_controls_alpha, 1, 0.1);
		}
	}
	else
	if (global.player4_show_controls = 10)
	{
		player4_show_controls_alpha = lerp(player4_show_controls_alpha, 1, 0.1);
	}

	if (keyboard_check(global.player4_key_up))
	or (keyboard_check(global.player4_key2_up))
	or (gamepad_button_check(3, gp_padu))
	or (gamepad_axis_value(3, gp_axislv) < 0)
	or (keyboard_check(global.player4_key_left))
	or (keyboard_check(global.player4_key2_left))
	or (gamepad_button_check(3, gp_padl))
	or (gamepad_axis_value(3, gp_axislh) < 0)
	or (keyboard_check(global.player4_key_right))
	or (keyboard_check(global.player4_key2_right))
	or (gamepad_button_check(3, gp_padr))
	or (gamepad_axis_value(3, gp_axislh) > 0)
	or (keyboard_check(global.player4_key_down))
	or (keyboard_check(global.player4_key2_down))
	or (gamepad_button_check(3, gp_padd))
	or (gamepad_axis_value(3, gp_axislv) > 0)
	or (gamepad_button_check(3, gp_face1))
	or (gamepad_button_check(3, gp_face2))
	or (keyboard_check(global.player4_key_jump))
	or (keyboard_check(global.player4_key2_jump))
	or (gamepad_button_check(3, gp_face3))
	or (gamepad_button_check(3, gp_face4))
	or (keyboard_check(global.player4_key_sprint))
	or (keyboard_check(global.player4_key2_sprint))
	
	or (keyboard_check(global.player4_key_sprint_toggle))
	or (keyboard_check(global.player4_key2_sprint_toggle))
	or (keyboard_check(global.player4_key_crouch))
	or (keyboard_check(global.player4_key2_crouch))
	or (keyboard_check(global.player4_key_crouch_toggle))
	or (keyboard_check(global.player4_key2_crouch_toggle))
	or (keyboard_check(global.player4_key_dive))
	or (keyboard_check(global.player4_key2_dive))
	or (keyboard_check(global.player4_key_tongue))
	or (keyboard_check(global.player4_key2_tongue))
	{
		player4_show_controls_timer = room_speed * global.player4_show_controls;
	}
}
else
{
	player4_show_controls_alpha = lerp(player4_show_controls_alpha, 0, 0.2);
	player4_show_controls_timer = room_speed * global.player4_show_controls;
}
#endregion /* Player 4 Show Controls HUD timer */

#region /* Sprint Toggling */
key_player1_sprint_toggle_pressed = scr_key_initialize(key_player1_sprint_toggle_pressed, 1, 1, global.player1_key_sprint_toggle, global.player1_key2_sprint_toggle, global.player1_gamepad_button_sprint_toggle, global.player1_gamepad_button2_sprint_toggle);
key_player2_sprint_toggle_pressed = scr_key_initialize(key_player2_sprint_toggle_pressed, 1, 2, global.player2_key_sprint_toggle, global.player2_key2_sprint_toggle, global.player2_gamepad_button_sprint_toggle, global.player2_gamepad_button2_sprint_toggle);
key_player3_sprint_toggle_pressed = scr_key_initialize(key_player3_sprint_toggle_pressed, 1, 3, global.player3_key_sprint_toggle, global.player3_key2_sprint_toggle, global.player3_gamepad_button_sprint_toggle, global.player3_gamepad_button2_sprint_toggle);
key_player4_sprint_toggle_pressed = scr_key_initialize(key_player4_sprint_toggle_pressed, 1, 4, global.player4_key_sprint_toggle, global.player4_key2_sprint_toggle, global.player4_gamepad_button_sprint_toggle, global.player4_gamepad_button2_sprint_toggle);

if (key_player1_sprint_toggle_pressed)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 100;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player1_sprint_toggle = false)
	{
		global.player1_sprint_toggle = true;
	}
	else
	{
		global.player1_sprint_toggle = false;
	}
}
if (key_player2_sprint_toggle_pressed)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 100;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player2_sprint_toggle = false)
	{
		global.player2_sprint_toggle = true;
	}
	else
	{
		global.player2_sprint_toggle = false;
	}
}
if (key_player3_sprint_toggle_pressed)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 100;
	show_sprint_toggle_for_player4 = 0;
	if (global.player3_sprint_toggle = false)
	{
		global.player3_sprint_toggle = true;
	}
	else
	{
		global.player3_sprint_toggle = false;
	}
}
if (key_player4_sprint_toggle_pressed)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 100;
	if (global.player4_sprint_toggle = false)
	{
		global.player4_sprint_toggle = true;
	}
	else
	{
		global.player4_sprint_toggle = false;
	}
}
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
if (show_sprint_toggle_for_player1 > 0)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 -= 1;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player1_can_play == true)
	and (global.player2_can_play = false)
	and (global.player3_can_play = false)
	and (global.player4_can_play = false)
	{
		if (global.player1_sprint_toggle = true)
		{
			scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 232, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Always run"), global.default_text_size, c_white, c_black, 1);
			draw_sprite_ext(spr_checkbox, true, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 232, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Always run"), global.default_text_size, c_white, c_black, 1);
			draw_sprite_ext(spr_checkbox, false, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
		}
	}
	else
	{
		if (global.player1_sprint_toggle = true)
		{
			scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 232, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 1 always run"), global.default_text_size, c_white, c_black, 1);
			draw_sprite_ext(spr_checkbox, true, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 232, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 1 always run"), global.default_text_size, c_white, c_black, 1);
			draw_sprite_ext(spr_checkbox, false, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
		}
	}
}
if (show_sprint_toggle_for_player2 > 0)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 -= 1;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player2_sprint_toggle = true)
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 2 always run"), global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, true, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 2 always run"), global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, false, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
	}
}
if (show_sprint_toggle_for_player3 > 0)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 -= 1;
	show_sprint_toggle_for_player4 = 0;
	if (global.player3_sprint_toggle = true)
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 3 always run"), global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, true, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 3 always run"), global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, false, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
	}
}
if (show_sprint_toggle_for_player4 > 0)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 -= 1;
	if (global.player4_sprint_toggle = true)
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 4 always run"), global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, true, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 4 always run"), global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, false, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
	}
}
#endregion /* Sprint Toggling END */

#region /* Show Drowning */

#region /* Show Drowning for Player 1 */
if (player1 > 0)
and (instance_exists(player1))
{
	if (player1.allow_drowning == true)
	&& (player1.drawn_frames_until_drowning <= player1.seconds_until_drowning* 60)
	{
		scr_draw_circular_bar(player1.x + 2, player1.bbox_top - 54, player1.drawn_frames_until_drowning, player1.seconds_until_drowning* 60, c_black, 20, 0.8, 6);
		scr_draw_circular_bar(player1.x, player1.bbox_top - 56, player1.drawn_frames_until_drowning, player1.seconds_until_drowning* 60, scr_make_color_hsv_transition(player1.drawn_frames_until_drowning, player1.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
	}
}
#endregion /* Show Drowning for Player 1 END */

#region /* Show Drowning for Player 2 */
if (player2 > 0)
and (instance_exists(player2))
{
	if (player2.allow_drowning == true)
	&& (player2.drawn_frames_until_drowning <= player2.seconds_until_drowning* 60)
	{
		scr_draw_circular_bar(player2.x + 2, player2.bbox_top - 54, player2.drawn_frames_until_drowning, player2.seconds_until_drowning* 60, c_black, 20, 0.8, 6);
		scr_draw_circular_bar(player2.x, player2.bbox_top - 56, player2.drawn_frames_until_drowning, player2.seconds_until_drowning* 60, scr_make_color_hsv_transition(player2.drawn_frames_until_drowning, player2.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
	}
}
#endregion /* Show Drowning for Player 2 END */

#region /* Show Drowning for Player 3 */
if (player3 > 0)
and (instance_exists(player3))
{
	if (player3.allow_drowning == true)
	&& (player3.drawn_frames_until_drowning <= player3.seconds_until_drowning* 60)
	{
		scr_draw_circular_bar(player3.x + 2, player3.bbox_top - 54, player3.drawn_frames_until_drowning, player3.seconds_until_drowning* 60, c_black, 20, 0.8, 6);
		scr_draw_circular_bar(player3.x, player3.bbox_top - 56, player3.drawn_frames_until_drowning, player3.seconds_until_drowning* 60, scr_make_color_hsv_transition(player3.drawn_frames_until_drowning, player3.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
	}
}
#endregion /* Show Drowning for Player 3 END */

#region /* Show Drowning for Player 4 */
if (player4 > 0)
and (instance_exists(player4))
{
	if (player4.allow_drowning == true)
	&& (player4.drawn_frames_until_drowning <= player4.seconds_until_drowning* 60)
	{
		scr_draw_circular_bar(player4.x + 2, player4.bbox_top - 54, player4.drawn_frames_until_drowning, player4.seconds_until_drowning* 60, c_black, 20, 0.8, 6);
		scr_draw_circular_bar(player4.x, player4.bbox_top - 56, player4.drawn_frames_until_drowning, player4.seconds_until_drowning* 60, scr_make_color_hsv_transition(player4.drawn_frames_until_drowning, player4.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
	}
}
#endregion /* Show Drowning for Player 4 END */

#endregion /* Show Drowning END */