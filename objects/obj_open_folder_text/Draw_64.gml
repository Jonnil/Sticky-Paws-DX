draw_set_alpha(image_alpha * 0.99);
draw_rectangle_color(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_outlined(window_get_width() / 2, window_get_height() / 2,
string_replace_all(string(open_folder_string), "\\", "/"),
global.default_text_size, c_black, c_white, image_alpha);

#region /*Close the open folder text by pressing any button*/
if (keyboard_check_pressed(vk_anykey))
or (mouse_check_button_pressed(mb_any))

or (gamepad_button_check(0, gp_face1))
or(gamepad_button_check(0, gp_face2))
or(gamepad_button_check(0, gp_face3))
or(gamepad_button_check(0, gp_face4))
or(gamepad_button_check(0, gp_padd))
or(gamepad_button_check(0, gp_padl))
or(gamepad_button_check(0, gp_padr))
or(gamepad_button_check(0, gp_padu))
or(gamepad_button_check(0, gp_select))
or(gamepad_button_check(0, gp_shoulderl))
or(gamepad_button_check(0, gp_shoulderlb))
or(gamepad_button_check(0, gp_shoulderr))
or(gamepad_button_check(0, gp_shoulderrb))
or(gamepad_button_check(0, gp_start))
or(gamepad_button_check(0, gp_stickl))
or(gamepad_button_check(0, gp_stickr))
or(gamepad_axis_value(0, gp_axislh) <> 0)
or(gamepad_axis_value(0, gp_axislv) <> 0)
or(gamepad_axis_value(0, gp_axisrh) <> 0)
or(gamepad_axis_value(0, gp_axisrv) <> 0)

or (gamepad_button_check(1, gp_face1))
or(gamepad_button_check(1, gp_face2))
or(gamepad_button_check(1, gp_face3))
or(gamepad_button_check(1, gp_face4))
or(gamepad_button_check(1, gp_padd))
or(gamepad_button_check(1, gp_padl))
or(gamepad_button_check(1, gp_padr))
or(gamepad_button_check(1, gp_padu))
or(gamepad_button_check(1, gp_select))
or(gamepad_button_check(1, gp_shoulderl))
or(gamepad_button_check(1, gp_shoulderlb))
or(gamepad_button_check(1, gp_shoulderr))
or(gamepad_button_check(1, gp_shoulderrb))
or(gamepad_button_check(1, gp_start))
or(gamepad_button_check(1, gp_stickl))
or(gamepad_button_check(1, gp_stickr))
or(gamepad_axis_value(1, gp_axislh) <> 0)
or(gamepad_axis_value(1, gp_axislv) <> 0)
or(gamepad_axis_value(1, gp_axisrh) <> 0)
or(gamepad_axis_value(1, gp_axisrv) <> 0)

or (gamepad_button_check(2, gp_face1))
or(gamepad_button_check(2, gp_face2))
or(gamepad_button_check(2, gp_face3))
or(gamepad_button_check(2, gp_face4))
or(gamepad_button_check(2, gp_padd))
or(gamepad_button_check(2, gp_padl))
or(gamepad_button_check(2, gp_padr))
or(gamepad_button_check(2, gp_padu))
or(gamepad_button_check(2, gp_select))
or(gamepad_button_check(2, gp_shoulderl))
or(gamepad_button_check(2, gp_shoulderlb))
or(gamepad_button_check(2, gp_shoulderr))
or(gamepad_button_check(2, gp_shoulderrb))
or(gamepad_button_check(2, gp_start))
or(gamepad_button_check(2, gp_stickl))
or(gamepad_button_check(2, gp_stickr))
or(gamepad_axis_value(2, gp_axislh) <> 0)
or(gamepad_axis_value(2, gp_axislv) <> 0)
or(gamepad_axis_value(2, gp_axisrh) <> 0)
or(gamepad_axis_value(2, gp_axisrv) <> 0)

or (gamepad_button_check(3, gp_face1))
or(gamepad_button_check(3, gp_face2))
or(gamepad_button_check(3, gp_face3))
or(gamepad_button_check(3, gp_face4))
or(gamepad_button_check(3, gp_padd))
or(gamepad_button_check(3, gp_padl))
or(gamepad_button_check(3, gp_padr))
or(gamepad_button_check(3, gp_padu))
or(gamepad_button_check(3, gp_select))
or(gamepad_button_check(3, gp_shoulderl))
or(gamepad_button_check(3, gp_shoulderlb))
or(gamepad_button_check(3, gp_shoulderr))
or(gamepad_button_check(3, gp_shoulderrb))
or(gamepad_button_check(3, gp_start))
or(gamepad_button_check(3, gp_stickl))
or(gamepad_button_check(3, gp_stickr))
or(gamepad_axis_value(3, gp_axislh) <> 0)
or(gamepad_axis_value(3, gp_axislv) <> 0)
or(gamepad_axis_value(3, gp_axisrh) <> 0)
or(gamepad_axis_value(3, gp_axisrv) <> 0)
{
	close = true;
}
#endregion /*Close the open folder text by pressing any button END*/

if (close = true)
{
	image_alpha = lerp(image_alpha, 0, 0.3);
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}
else
{
	image_alpha = lerp(image_alpha, 1, 0.3);
}

#region /*Make it so you can't click on any other button while open folder text exists*/
if (instance_exists(obj_title))
{
	obj_title.menu_delay = 10;
}
if (instance_exists(obj_pause))
{
	obj_pause.menu_delay = 10;
}
if (instance_exists(obj_leveleditor))
{
	obj_leveleditor.menu_delay = 10;
}
#endregion /*Make it so you can't click on any other button while open folder text exists END*/

#region /*Draw mouse cursor for menu navigation*/
if (global.controls_used_for_menu_navigation = "mouse")
and (global.full_level_map_screenshot = false)
and (global.pause = false)
and (os_type!= os_android)
and (os_type!= os_ios)
{
	draw_sprite_ext(spr_cursor, 0, window_mouse_get_x(), window_mouse_get_y(), 1, 1, 0, c_white, 1);
}
#endregion /*Draw mouse cursor for menu navigation END*/
