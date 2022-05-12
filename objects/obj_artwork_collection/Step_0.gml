#region /*Menu cursor image speed*/
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /*Menu cursor image speed END*/

if (global.controls_used_for_menu_navigation = "keyboard")
or (global.controls_used_for_menu_navigation = "controller")
{
	menu = "";
}
