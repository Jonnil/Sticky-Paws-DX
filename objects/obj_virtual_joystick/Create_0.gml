var get_window_height = display_get_gui_height();

var_x_dir = 0;
var_y_dir = 0;
var_x_dir_gui = 0;
var_y_dir_gui = 0;
var_screen_size = 1;
var_joystick_active = false;
var_direction = 0;

base_size = 150 * (camera_get_view_width(view_camera[view_current]) / global.default_view_width);
stick_size = base_size * 0.5;

base_size_gui = 150

xx = (base_size_gui * 2);
yy = get_window_height - (base_size_gui * 2);

temp_joystick = -1;

depth = -99999;