draw_line_width_color(scr_x_to_gui(global.tongue_point_dir_x1), scr_y_to_gui(global.tongue_point_dir_y1), global.tongue_point_dir_x2, global.tongue_point_dir_y2, 2, c_green, c_yellow);
scr_draw_text_outlined(global.tongue_point_dir_x2, global.tongue_point_dir_y2, "draw gui", global.default_text_size, c_white, c_red, 1);

//var a = application_get_position();
//var xx = a[0];
//var yy = a[1];
//var ww = a[2];
//var hh = a[3];
//var tww = a[2] - a[0];
//var thh = a[3] - a[1];

//scr_draw_text_outlined(32, 32 , "xx: " + string(xx), global.default_text_size, c_white, c_black, 1);
//scr_draw_text_outlined(32, 64 , "yy: " + string(yy), global.default_text_size, c_white, c_black, 1);
//scr_draw_text_outlined(32, 96 , "ww: " + string(ww), global.default_text_size, c_white, c_black, 1);
//scr_draw_text_outlined(32, 128, "hh: " + string(hh), global.default_text_size, c_white, c_black, 1);
//scr_draw_text_outlined(32, 160, "tww: " + string(tww), global.default_text_size, c_white, c_black, 1);
//scr_draw_text_outlined(32, 192, "thh: " + string(thh), global.default_text_size, c_white, c_black, 1);

//if (asset_get_type("obj_title") == asset_object)
//and (instance_exists(obj_camera))
//{
//	var bruh_x = (global.tongue_point_dir_x1 - camera_get_view_x(obj_camera.camera)) / camera_get_view_width(obj_camera.camera) * (a[2] - a[0])
//	scr_draw_text_outlined(bruh_x, 32, string(bruh_x), global.default_text_size, c_white, c_red, 1);
//}