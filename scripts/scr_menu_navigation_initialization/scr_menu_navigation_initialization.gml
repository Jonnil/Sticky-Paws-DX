function scr_menu_navigation_initialization(key_direction_hold_press_release = 0, only_player_one_can_navigate = false)
{

	#region /* Menu Navigation Controls */

	key_up = noone;
	key_left = noone;
	key_right = noone;
	key_down = noone;
	key_a_pressed = noone;
	key_a_hold = noone;
	key_a_released = noone;
	key_b_pressed = noone;

	var what_player = -1;
	var player_slot = -1;
	for(var i = 1; i <= global.max_players; i += 1)
	{
		if (global.pause_player == i - 1 || global.player_can_play[i] || i == 1 && only_player_one_can_navigate)
		{
			what_player = i;
			player_slot = global.player_slot[i];
			break; /* exit the loop if conditions are met */
		}
	}

	key_up = scr_key_initialize(key_up, key_direction_hold_press_release, what_player, action.up);
	key_left = scr_key_initialize(key_left, key_direction_hold_press_release, what_player, action.left);
	key_right = scr_key_initialize(key_right, key_direction_hold_press_release, what_player, action.right);
	key_down = scr_key_initialize(key_down, key_direction_hold_press_release, what_player, action.down);
	/* Key Accept Pressed */ key_a_pressed = scr_key_initialize(key_a_pressed, 1, what_player, action.accept) || (keyboard_check_pressed(vk_space));
	/* Key Accept Hold */ key_a_hold = scr_key_initialize(key_a_hold, 0, what_player, action.accept) || (keyboard_check(vk_space));
	/* Key Accept Released */ key_a_released = scr_key_initialize(key_a_released, 2, what_player, action.accept) || (keyboard_check_released(vk_space));
	/* Key Back Pressed */ key_b_pressed = scr_key_initialize(key_b_pressed, 1, what_player, action.back) || (keyboard_check_pressed(vk_escape));
	#endregion /* Menu Navigation Controls END */

}
