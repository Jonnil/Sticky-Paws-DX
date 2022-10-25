if (asset_get_type("obj_player") == asset_object)
and (instance_number(obj_player) > 0)
{
	draw_line_width_color(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 3, c_red, c_red);
	draw_self();
}