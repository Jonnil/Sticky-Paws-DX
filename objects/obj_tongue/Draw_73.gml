var tongue_color = make_color_rgb(255, 0, 140);
var outline_color = make_color_rgb(0, 0, 64);
var tongue_origin_y_offset = -16;

if (asset_get_type("obj_player") == asset_object)
and (instance_number(obj_player) > 0)
{
	depth = instance_nearest(x, y, obj_player). depth - 1;
	draw_line_width_color(x, y, instance_nearest(x, y, obj_player).xx, instance_nearest(x, y, obj_player).yy + tongue_origin_y_offset, 5, outline_color, outline_color);
	draw_line_width_color(x, y, instance_nearest(x, y, obj_player).xx, instance_nearest(x, y, obj_player).yy + tongue_origin_y_offset, 3, tongue_color, tongue_color);
	draw_self();
}

//scr_draw_text_outlined(xx, yy, "1");
//scr_draw_text_outlined(xx2, yy2, "2");