var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

#region /* Keyboard Controls */
var key_left = (keyboard_check_pressed(vk_left))
|| (keyboard_check_pressed(ord("A")))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_padl))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_padl))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_padl))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_padl))
|| (gamepad_axis_value(global.player_slot[1], gp_axislh) < -0.3)
|| (gamepad_axis_value(global.player_slot[2], gp_axislh) < -0.3)
|| (gamepad_axis_value(global.player_slot[3], gp_axislh) < -0.3)
|| (gamepad_axis_value(global.player_slot[4], gp_axislh) < -0.3);

var key_right = (keyboard_check_pressed(vk_right))
|| (keyboard_check_pressed(ord("D")))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_padr))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_padr))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_padr))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_padr))
|| (gamepad_axis_value(global.player_slot[1], gp_axislh) > +0.3)
|| (gamepad_axis_value(global.player_slot[2], gp_axislh) > +0.3)
|| (gamepad_axis_value(global.player_slot[3], gp_axislh) > +0.3)
|| (gamepad_axis_value(global.player_slot[4], gp_axislh) > +0.3);
#endregion /* Keyboard Controls END */

xx = lerp(xx, get_window_width * 0.5, 0.1);
yy = lerp(yy, scr_wave(y - 8, y + 8, 4.5, 0), 0.1);
if (instance_exists(obj_player))
&& (point_distance(x, y, obj_player.x, obj_player.y) < 64)
&& (!can_navigate)
&& (instance_nearest(x, y, obj_player).key_up_pressed)
&& (instance_nearest(x, y, obj_player).vspeed == 0)
{
	instance_nearest(x, y, obj_player).hspeed = 0;
	instance_nearest(x, y, obj_player).vspeed = 0;
	instance_nearest(x, y, obj_player).can_move = false;
	can_navigate = true;
}

else
if (can_navigate)
{

image_alpha = 0;
image_speed = 0;
depth = -10000;

#region /* Draw Dark Background */
draw_set_alpha(0.75);
draw_rectangle_colour(0, 0, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
#endregion /* Draw Dark Background END */

#region /* Draw Artwork */
if (image_index == 0) && (level1_big_collectible1)
|| (image_index == 1) && (level1_big_collectible2)
|| (image_index = 2) && (level1_big_collectible3)
|| (image_index = 3) && (level1_big_collectible4)
|| (image_index = 4) && (level1_big_collectible5)

|| (image_index == 5) && (level2_big_collectible1)
|| (image_index == 6) && (level2_big_collectible2)
|| (image_index == 7) && (level2_big_collectible3)
|| (image_index == 8) && (level2_big_collectible4)
|| (image_index = 9) && (level2_big_collectible5)

|| (image_index = 10) && (level3_big_collectible1)
|| (image_index = 11) && (level3_big_collectible2)
|| (image_index = 12) && (level3_big_collectible3)
|| (image_index = 13) && (level3_big_collectible4)
|| (image_index = 14) && (level3_big_collectible5)

|| (image_index = 15) && (level4_big_collectible1)
|| (image_index = 16) && (level4_big_collectible2)
|| (image_index = 17) && (level4_big_collectible3)
|| (image_index = 18) && (level4_big_collectible4)
|| (image_index = 19) && (level4_big_collectible5)

|| (image_index = 20) && (level5_big_collectible1)
|| (image_index = 21) && (level5_big_collectible2)
|| (image_index = 22) && (level5_big_collectible3)
|| (image_index = 23) && (level5_big_collectible4)
|| (image_index = 24) && (level5_big_collectible5)

|| (image_index = 25) && (level6_big_collectible1)
|| (image_index = 26) && (level6_big_collectible2)
|| (image_index = 27) && (level6_big_collectible3)
|| (image_index = 28) && (level6_big_collectible4)
|| (image_index = 29) && (level6_big_collectible5)

|| (image_index = 30) && (level7_big_collectible1)
|| (image_index = 31) && (level7_big_collectible2)
|| (image_index = 32) && (level7_big_collectible3)
|| (image_index = 33) && (level7_big_collectible4)
|| (image_index = 34) && (level7_big_collectible5)

|| (image_index = 35) && (level8_big_collectible1)
|| (image_index = 36) && (level8_big_collectible2)
|| (image_index = 37) && (level8_big_collectible3)
|| (image_index = 38) && (level8_big_collectible4)
|| (image_index = 39) && (level8_big_collectible5)

|| (image_index = 40) && (level9_big_collectible1)
|| (image_index = 41) && (level9_big_collectible2)
|| (image_index = 42) && (level9_big_collectible3)
|| (image_index = 43) && (level9_big_collectible4)
|| (image_index = 44) && (level9_big_collectible5)

|| (image_index = 45) && (levela_big_collectible1)
|| (image_index = 46) && (levela_big_collectible2)
|| (image_index = 47) && (levela_big_collectible3)
|| (image_index = 48) && (levela_big_collectible4)
|| (image_index = 49) && (levela_big_collectible5)

|| (image_index >= max_artwork)
{
	draw_sprite_ext(sprite_index, image_index, xx, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Draw the actual artwork */

	#region /* Draw Comments */
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(+ 32, get_window_height -94, string(current_comment), global.default_text_size, c_black, c_white, 1);
	#endregion /* Draw Comments END */

}
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (image_index == 0) && (level1_big_collectible1 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 1 " + l10n_text("in level") + " 1", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 1) && (level1_big_collectible2 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 2 " + l10n_text("in level") + " 1", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 2) && (level1_big_collectible3 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 3 " + l10n_text("in level") + " 1", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 3) && (level1_big_collectible4 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 4 " + l10n_text("in level") + " 1", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 4) && (level1_big_collectible5 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 5 " + l10n_text("in level") + " 1", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 5) && (level2_big_collectible1 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 1 " + l10n_text("in level") + " 2", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 6) && (level2_big_collectible2 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 2 " + l10n_text("in level") + " 2", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 7) && (level2_big_collectible3 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 3 " + l10n_text("in level") + " 2", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 8) && (level2_big_collectible4 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 4 " + l10n_text("in level") + " 2", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 9) && (level2_big_collectible5 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 5 " + l10n_text("in level") + " 2", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 10) && (level3_big_collectible1 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 1 " + l10n_text("in level") + " 3", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 11) && (level3_big_collectible2 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 2 " + l10n_text("in level") + " 3", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 12) && (level3_big_collectible3 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 3 " + l10n_text("in level") + " 3", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 13) && (level3_big_collectible4 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 4 " + l10n_text("in level") + " 3", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 14) && (level3_big_collectible5 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 5 " + l10n_text("in level") + " 3", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 15) && (level4_big_collectible1 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 1 " + l10n_text("in level") + " 4", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 16) && (level4_big_collectible2 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 2 " + l10n_text("in level") + " 4", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 17) && (level4_big_collectible3 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 3 " + l10n_text("in level") + " 4", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 18) && (level4_big_collectible4 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 4 " + l10n_text("in level") + " 4", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 19) && (level4_big_collectible5 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 5 " + l10n_text("in level") + " 4", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 20) && (level5_big_collectible1 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 1 " + l10n_text("in level") + " 5", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 21) && (level5_big_collectible2 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 2 " + l10n_text("in level") + " 5", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 22) && (level5_big_collectible3 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 3 " + l10n_text("in level") + " 5", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 23) && (level5_big_collectible4 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 4 " + l10n_text("in level") + " 5", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 24) && (level5_big_collectible5 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 5 " + l10n_text("in level") + " 5", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 25) && (level6_big_collectible1 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 1 " + l10n_text("in level") + " 6", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 26) && (level6_big_collectible2 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 2 " + l10n_text("in level") + " 6", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 27) && (level6_big_collectible3 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 3 " + l10n_text("in level") + " 6", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 28) && (level6_big_collectible4 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 4 " + l10n_text("in level") + " 6", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 29) && (level6_big_collectible5 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 5 " + l10n_text("in level") + " 6", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 30) && (level7_big_collectible1 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 1 " + l10n_text("in level") + " 7", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 31) && (level7_big_collectible2 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 2 " + l10n_text("in level") + " 7", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 32) && (level7_big_collectible3 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 3 " + l10n_text("in level") + " 7", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 33) && (level7_big_collectible4 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 4 " + l10n_text("in level") + " 7", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 34) && (level7_big_collectible5 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 5 " + l10n_text("in level") + " 7", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 35) && (level8_big_collectible1 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 1 " + l10n_text("in level") + " 8", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 36) && (level8_big_collectible2 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 2 " + l10n_text("in level") + " 8", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 37) && (level8_big_collectible3 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 3 " + l10n_text("in level") + " 8", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 38) && (level8_big_collectible4 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 4 " + l10n_text("in level") + " 8", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 39) && (level8_big_collectible5 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 5 " + l10n_text("in level") + " 8", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 40) && (level9_big_collectible1 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 1 " + l10n_text("in level") + " 9", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 41) && (level9_big_collectible2 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 2 " + l10n_text("in level") + " 9", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 42) && (level9_big_collectible3 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 3 " + l10n_text("in level") + " 9", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 43) && (level9_big_collectible4 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 4 " + l10n_text("in level") + " 9", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 44) && (level9_big_collectible5 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 5 " + l10n_text("in level") + " 9", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 45) && (levela_big_collectible1 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 1 " + l10n_text("in level") + " A", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 46) && (levela_big_collectible2 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 2 " + l10n_text("in level") + " A", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 47) && (levela_big_collectible3 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 3 " + l10n_text("in level") + " A", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 48) && (levela_big_collectible4 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 4 " + l10n_text("in level") + " A", global.default_text_size * 2, c_black, c_white, 1);}
if (image_index == 49) && (levela_big_collectible5 < true){scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("To unlock this artwork") + ":\n " + l10n_text("Get big fish") + " 5 " + l10n_text("in level") + " A", global.default_text_size * 2, c_black, c_white, 1);}

#endregion /* Draw Artwork END */

#region /* Draw what artwork is selected */
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
scr_draw_text_outlined(+ 32, get_window_height - 32, "< " + l10n_text("Artwork") + " " + string(image_index + 1) + "/" + string(image_number) + " >", global.default_text_size * 2, c_black, c_white, 1);
#endregion /* Draw what artwork is selected END */

if (gamepad_is_connected(global.player_slot[1]))
&& (global.controls_used_for_navigation == "gamepad")
|| (global.always_show_gamepad_buttons)
{
	scr_draw_gamepad_buttons(gp_padl, 128, get_window_height * 0.5, 1, c_white, 1, 1, 1, what_player_navigate);
	scr_draw_gamepad_buttons(gp_padr, get_window_width - 128, get_window_height * 0.5, 1, c_white, 1, 1, 1, what_player_navigate);
}
else
{
	draw_sprite_ext(spr_keyboard_keys, vk_left, 128, get_window_height * 0.5, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_keyboard_keys, vk_right, get_window_width - 128, get_window_height * 0.5, 1, 1, 0, c_white, 1);
}
if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, get_window_width * 0.5 - 100, get_window_height - 42))
&& (global.controls_used_for_navigation == "mouse")
{
	draw_set_alpha(0.5);
	draw_rectangle_color(128 - 32, get_window_height * 0.5 - 32, 128 + 32, get_window_height * 0.5 + 32, c_white, c_white, c_white, c_white, false);
	draw_set_alpha(1);
}
else
if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + 100, 0, get_window_width, get_window_height - 42))
&& (global.controls_used_for_navigation == "mouse")
{
	draw_set_alpha(0.5);
	draw_rectangle_color(get_window_width - 128 - 32, get_window_height * 0.5 - 32, get_window_width - 128 + 32, get_window_height * 0.5 + 32, c_white, c_white, c_white, c_white, false);
	draw_set_alpha(1);
}

#region /* Left and Right Navigation */
if (key_left)
|| (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, get_window_width * 0.5 - 100, get_window_height - 42))
&& (mouse_check_button_released(mb_left))
{
	if (gamepad_stick)
	{
		if (image_index > 0)
		{
			image_index--;
		}
		else
		{
			image_index = image_number - 1;
		}
		xx = get_window_width * 0.5 - 32;
		gamepad_stick = false;
	}
}
else
if (key_right)
|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + 100, 0, get_window_width, get_window_height - 42))
&& (mouse_check_button_released(mb_left))
{
	if (gamepad_stick)
	{
		if (image_index < image_number - 1)
		{
			image_index++;
		}
		else
		{
			image_index = 0;
		}
		xx = get_window_width * 0.5 + 32;
		gamepad_stick = false;
	}
}
#endregion /* Left and Right Navigation END */

#region /* Back */
draw_menu_button(get_window_width - 370, get_window_height - 42, l10n_text("Back"), "back", "back");
draw_sprite_ext(spr_icon_back, 0, get_window_width - 370 + 20, get_window_height - 42 + 21, 1, 1, 0, c_white, 1);

#region /* Draw Back Key */
if (gamepad_is_connected(global.player_slot[what_player_navigate]))
&& (global.controls_used_for_navigation == "gamepad")
|| (global.always_show_gamepad_buttons)
{
	scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.back], get_window_width - 32, get_window_height -21, 0.5, c_white, 1, 1, 1, what_player_navigate);
}
else
{
	draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.back], get_window_width - 32, get_window_height -21, 0.5, 0.5, 0, c_white, 1);
}
#endregion /* Draw Back key END */

#endregion /* Back END */

}
else
{
	depth = +10;
	if (instance_exists(obj_player))
	&& (instance_nearest(x, y, obj_player).can_move)
	&& (instance_nearest(x, y, obj_player).intro_animation == "")
	{
		image_alpha = lerp(image_alpha, 1, 0.1); /* Only show art collection enterance whenever the character can actually move, so it doesn't show up during cutscenes */
	}
	else
	{
		image_alpha = lerp(image_alpha, 0, 0.1);
	}
	image_speed = 0;
}

if (!gamepad_stick)
{
	if (!key_left)
	&& (!key_right)
	{
		gamepad_stick = true;
	}
}

if (can_navigate)
&& (instance_exists(obj_player))
{
	instance_nearest(x, y, obj_player).can_move = false;
}
if (!can_navigate)
{
	gamepad_stick = false;
}

#region /* Comments */
if (image_index == 0){current_comment = l10n_text("Artist") + ": Jonnil - Sticky the Cat";}
if (image_index == 1){current_comment = l10n_text("Artist") + ": Jonnil - Sticky the Cat doing a heroic pose";}
if (image_index == 2){current_comment = l10n_text("Artist") + ": Jonnil - Sticky the Cat doing the OK sign";}
if (image_index == 3){current_comment = l10n_text("Artist") + ": Jonnil - Sticky the Cat crossing his arms";}
if (image_index == 4){current_comment = l10n_text("Artist") + ": Jonnil - Sticky the Cat looking for something far away";}
if (image_index == 5){current_comment = l10n_text("Artist") + ": Jonnil - Sticky the Cat scared";}
if (image_index == 6){current_comment = l10n_text("Artist") + ": Benjamin Tröjer - Sticky Paws Cover";}
if (image_index == 7){current_comment = l10n_text("Artist") + ": Benjamin Tröjer - Sticky the Cat Sketch";}
if (image_index == 8){current_comment = l10n_text("Artist") + ": Dusky @DuskyUmbreonDA - Sticky the Cat";}
if (image_index == 9){current_comment = l10n_text("Artist") + ": Dusky @DuskyUmbreonDA - Sticky the Cat Sketch";}
if (image_index == 10){current_comment = l10n_text("Artist") + ": kyun @kyarokyun - Sticky the Cat";}
if (image_index == 11){current_comment = l10n_text("Artist") + ": kyun @kyarokyun - Sticky the Cat Sketch";}
if (image_index == 12){current_comment = l10n_text("Artist") + ": Jonnil - Sticky the Cat paint edition";}
if (image_index == 13){current_comment = l10n_text("Artist") + ": Benjamin Tröjer - Sticky the Cat anime";}
if (image_index == 14){current_comment = l10n_text("Artist") + ": Chrythm - Sticky the Cat manly";}
if (image_index == 15){current_comment = l10n_text("Artist") + ": Trickylady - Trickylady Approves";}
if (image_index == 16){current_comment = l10n_text("Artist") + ": Omemega - Dark Lord Sticky";}
if (image_index == 17){current_comment = l10n_text("Artist") + ": Omemega - Ded Sticky";}
if (image_index == 18){current_comment = l10n_text("Artist") + ": Omemega - Skull Sticky";}
if (image_index == 19){current_comment = l10n_text("Artist") + ": Benjamin Tröjer - Sticky Adventure";}
if (image_index == 20){current_comment = l10n_text("Artist") + ": Omemega - Derp Fat Sticky";}
if (image_index == 21){current_comment = l10n_text("Artist") + ": Foxer 262 - Sticky UwU";}
if (image_index == 22){current_comment = l10n_text("Artist") + ": NonsensicalThings - Jonnil programming Sticky Paws";}
if (image_index == 23){current_comment = l10n_text("Artist") + ": DynoStorm - Realistic Sticky";}
if (image_index == 24){current_comment = l10n_text("Artist") + ": Jonnil - Mousette";}
if (image_index == 25){current_comment = l10n_text("Artist") + ": Cortex Vortex Studios - Sticky Pixel Art Origins";}
if (image_index == 26){current_comment = l10n_text("Artist") + ": Plushfoxy255 - Sticky Sunglasses";}
if (image_index == 27){current_comment = l10n_text("Artist") + ": No stop - Sticky yo!";}
if (image_index == 28){current_comment = l10n_text("Artist") + ": William Karlsson - Sticky I am Cool";}
if (image_index == 29){current_comment = l10n_text("Artist") + ": TheOneTrueEgg08 - Just a cat...";}
if (image_index == 30){current_comment = l10n_text("Artist") + ": FarexBoi - Sticky Peace";}
if (image_index == 31){current_comment = l10n_text("Artist") + ": Sayo - Sticky Vibe Check";}
if (image_index == 32){current_comment = l10n_text("Artist") + ": Lil Wild Card Banny - Sticky upside-down OK sign";}
if (image_index == 33){current_comment = l10n_text("Artist") + ": Sayo - More Normal Sticky";}
if (image_index == 34){current_comment = l10n_text("Artist") + ": Sayo - Crazy Sticky";}
if (image_index == 35){current_comment = l10n_text("Artist") + ": SSgt Myers - Sticky Ball";}
if (image_index == 36){current_comment = l10n_text("Artist") + ": Snowy - Another Paint Sticky";}
if (image_index == 37){current_comment = l10n_text("Artist") + ": No Stop - Eating Fish";}
if (image_index == 38){current_comment = l10n_text("Artist") + ": Sayo - ANOTHER Paint Sticky";}
if (image_index == 39){current_comment = l10n_text("Artist") + ": Chrythm - Sticky Collecting Fish";}
if (image_index == 40){current_comment = l10n_text("Artist") + ": Ps2Man - Could it be?";}
if (image_index == 41){current_comment = l10n_text("Artist") + ": chillmanmax - Sticky pounces in";}
if (image_index == 42){current_comment = l10n_text("Artist") + ": Vargskelethor - StickyFren and JoelFren";}
if (image_index == 43){current_comment = l10n_text("Artist") + ": barbilou - Sticky and Vargshroom";}
if (image_index == 44){current_comment = l10n_text("Artist") + ": shiibeh - Sticky taking a stroll";}
if (image_index == 45){current_comment = l10n_text("Artist") + ": artochungo - Sticky cool pose";}
if (image_index == 46){current_comment = l10n_text("Artist") + ": tb_and_rachel - Sticky looking down a well";}
if (image_index == 47){current_comment = l10n_text("Artist") + ": FarexBoi - Sticky Christmas";}
if (image_index == 48){current_comment = l10n_text("Artist") + ": ByrdWork - Thiccy Sticky";}
if (image_index == 49){current_comment = l10n_text("Artist") + ": Meidres Yoksank [MK] @MeidresYIK - Sticky on a rope";}
if (image_index == 50){current_comment = l10n_text("Artist") + ": huntertron - This art isn't bad it's epic";}
if (image_index == 51){current_comment = l10n_text("Artist") + ": shiibeh - Catlyn tiny sketch";}
if (image_index == 52){current_comment = l10n_text("Artist") + ": shiibeh - Catlyn is very cute";}
if (image_index == 53){current_comment = l10n_text("Artist") + ": shiibeh - Winter Sticky";}
if (image_index == 54){current_comment = l10n_text("Artist") + ": ThePast - Half t -posing Sticky";}
if (image_index == 55){current_comment = l10n_text("Artist") + ": Meidres Yoksank [MK] @MeidresYIK - Catlyn angry (sketch)";}
if (image_index == 56){current_comment = l10n_text("Artist") + ": Meidres Yoksank [MK] @MeidresYIK - Catlyn angry";}
if (image_index == 57){current_comment = l10n_text("Artist") + ": Meidres Yoksank [MK] @MeidresYIK - Catlyn angry (easter egg hidden in picture)";}
if (image_index == 58){current_comment = l10n_text("Artist") + ": FarexBoi - Christmas Catlyn";}
if (image_index == 59){current_comment = l10n_text("Artist") + ": DoruDoLasu - Sticky enjoys";}
if (image_index == 60){current_comment = l10n_text("Artist") + ": DoruDoLasu - Sticky enjoys (looong edition)";}
if (image_index == 61){current_comment = l10n_text("Artist") + ": DoruDoLasu - Sticky Stickyman";}
if (image_index == 62){current_comment = l10n_text("Artist") + ": Best Buds - Sticky suprised";}
if (image_index == 63){current_comment = l10n_text("Artist") + ": Denspaghetti - Sticky and Catlyn";}
if (image_index == 64){current_comment = l10n_text("Artist") + ": Bella Cat - Sticky running";}
if (image_index == 65){current_comment = l10n_text("Artist") + ": huntertron - Sticky balloon";}
if (image_index == 66){current_comment = l10n_text("Artist") + ": Bella Cat - Sticky, Catlyn and their pet mouse";}
if (image_index == 67){current_comment = l10n_text("Artist") + ": Voxxed_decimals - Sticky Ok";}
if (image_index == 68){current_comment = l10n_text("Artist") + ": Voxxed_decimals - Virtual Catlyn";}
if (image_index == 69){current_comment = l10n_text("Artist") + ": shadomaske - Happy Catlyn";}
if (image_index == 70){current_comment = l10n_text("Artist") + ": red_luigi - Oh no Sticky HE'S MELTING!";}
if (image_index == 71){current_comment = l10n_text("Artist") + ": DoruDoLasu - Catlyn wow";}
if (image_index == 72){current_comment = l10n_text("Artist") + ": red_luigi - Sticky Pixel Art";}
if (image_index == 73){current_comment = l10n_text("Artist") + ": Andrea Colunga - Catlyn and her prey";}
if (image_index == 74){current_comment = l10n_text("Artist") + ": Furret76 - Sticcy pau and cetlun";}
#endregion /* Comments END */
