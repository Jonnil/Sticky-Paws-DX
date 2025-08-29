scr_zoom_camera_draw_gui(10);

#region /* Show a pause button on screen when using the mouse */
if (global.controls_used_for_navigation == "mouse")
{
	menu_cursor_index += 0.3;
	draw_menu_button_sprite(spr_menu_button, display_get_gui_width() - 185, 0,,, 0.5, 1, 185, 42, l10n_text("Pause"), "pause", "pause");
}
#endregion /* Show a pause button on screen when using the mouse END */

scr_virtual_keys();
