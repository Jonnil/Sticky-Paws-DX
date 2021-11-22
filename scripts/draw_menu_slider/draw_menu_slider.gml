/// @function draw_menu_slider(x, y, string, menu_index, menu_takes_you_to)
/// @description draw_menu_button(x,y,string,menu_index)
/// @param x
/// @param y
/// @param string
/// @param menu_index
/// @param variable_to_change
/// @param bar_color

function draw_menu_slider()
{
	
	#region /*Initialize variables*/
	var x_position=argument0;/*The buttons x origin position*/
	var y_position=argument1;/*The buttons y origin position*/

	var string_text = argument2;
	var menu_index = argument3;
	var variable_to_change = argument4;
	var bar_color = argument5;
	var show_percent = 0;
	var background_brightness_indicator_x = 160;
	#endregion /*Initialize variables END*/
	
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x_position, y_position-16, x_position+320, y_position+16))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (menu_delay = 0)
	and (open_dropdown = false)
	{
		menu = menu_index;
		can_navigate_settings_sidebar = false;
	}
	
	#region /*Draw Bar*/
	if (menu = menu_index)
	{
		draw_rectangle_color(x_position-2,y_position-16-2,x_position+320+2,y_position+16+2,c_black,c_black,c_black,c_black,false);
		
		#region /*Click to change value*/
		if (global.controls_used_for_menu_navigation = "mouse")
		and (mouse_check_button(mb_left))
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position-32,y_position-32,x_position+8,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0;}else
				if (menu = "voices_volume"){global.voices_volume = 0;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = -1;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = -1;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+8,y_position-32,x_position+24,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.05;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.05;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.05;}else
				if (menu = "voices_volume"){global.voices_volume = 0.05;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = -0.9;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = -0.9;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+24,y_position-32,x_position+40,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.1;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.1;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.1;}else
				if (menu = "voices_volume"){global.voices_volume = 0.1;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = -0.8;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = -0.8;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+40,y_position-32,x_position+56,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.15;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.15;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.15;}else
				if (menu = "voices_volume"){global.voices_volume = 0.15;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = -0.7;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = -0.7;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+56,y_position-32,x_position+72,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.2;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.2;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.2;}else
				if (menu = "voices_volume"){global.voices_volume = 0.2;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = -0.6;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = -0.6;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+72,y_position-32,x_position+88,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.25;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.25;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.25;}else
				if (menu = "voices_volume"){global.voices_volume = 0.25;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = -0.5;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = -0.5;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+88,y_position-32,x_position+104,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.3;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.3;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.3;}else
				if (menu = "voices_volume"){global.voices_volume = 0.3;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = -0.4;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = -0.4;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+104,y_position-32,x_position+120,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.35;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.35;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.35;}else
				if (menu = "voices_volume"){global.voices_volume = 0.35;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = -0.3;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = -0.3;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+120,y_position-32,x_position+136,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.4;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.4;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.4;}else
				if (menu = "voices_volume"){global.voices_volume = 0.4;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = -0.2;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = -0.2;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+136,y_position-32,x_position+152,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.45;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.45;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.45;}else
				if (menu = "voices_volume"){global.voices_volume = 0.45;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = -0.1;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = -0.1;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+152,y_position-32,x_position+168,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.5;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.5;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.5;}else
				if (menu = "voices_volume"){global.voices_volume = 0.5;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = 0;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = 0;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+168,y_position-32,x_position+184,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.55;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.55;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.55;}else
				if (menu = "voices_volume"){global.voices_volume = 0.55;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = 0.1;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = 0.1;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+184,y_position-32,x_position+200,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.6;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.6;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.6;}else
				if (menu = "voices_volume"){global.voices_volume = 0.6;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = 0.2;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = 0.2;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+200,y_position-32,x_position+216,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.65;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.65;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.65;}else
				if (menu = "voices_volume"){global.voices_volume = 0.65;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = 0.3;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = 0.3;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+216,y_position-32,x_position+232,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.7;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.7;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.7;}else
				if (menu = "voices_volume"){global.voices_volume = 0.7;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = 0.4;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = 0.4;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+232,y_position-32,x_position+248,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.75;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.75;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.75;}else
				if (menu = "voices_volume"){global.voices_volume = 0.75;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = 0.5;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = 0.5;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+248,y_position-32,x_position+264,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.8;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.8;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.8;}else
				if (menu = "voices_volume"){global.voices_volume = 0.8;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = 0.6;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = 0.6;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+264,y_position-32,x_position+280,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.85;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.85;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.85;}else
				if (menu = "voices_volume"){global.voices_volume = 0.85;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = 0.7;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = 0.7;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+280,y_position-32,x_position+296,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.9;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.9;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.9;}else
				if (menu = "voices_volume"){global.voices_volume = 0.9;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = 0.8;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = 0.8;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+296,y_position-32,x_position+312,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 0.95;}else
				if (menu = "sfx_volume"){global.sfx_volume = 0.95;}else
				if (menu = "ambient_volume"){global.ambient_volume = 0.95;}else
				if (menu = "voices_volume"){global.voices_volume = 0.95;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = 0.9;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = 0.9;}
			}
			else
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+312,y_position-32,x_position+320+32,y_position+32))
			{
				if (menu = "music_volume"){global.music_volume = 1;}else
				if (menu = "sfx_volume"){global.sfx_volume = 1;}else
				if (menu = "ambient_volume"){global.ambient_volume = 1;}else
				if (menu = "voices_volume"){global.voices_volume = 1;}else
				if (menu = "background_brightness_gameplay"){global.background_brightness_gameplay = 1;}else
				if (menu = "background_brightness_menu"){global.background_brightness_menu = 1;}
			}
		}
		#endregion /*Click to change value*/
		
	}
	if (menu_index = "background_brightness_gameplay")
	or (menu_index = "background_brightness_menu")
	{
		if (variable_to_change=+1){background_brightness_indicator_x = 320; show_percent = 100;}
		if (variable_to_change=+0.9){background_brightness_indicator_x = 304; show_percent = 90;}
		if (variable_to_change=+0.8){background_brightness_indicator_x = 288; show_percent = 80;}
		if (variable_to_change=+0.7){background_brightness_indicator_x = 272; show_percent = 70;}
		if (variable_to_change=+0.6){background_brightness_indicator_x = 256; show_percent = 60;}
		if (variable_to_change=+0.5){background_brightness_indicator_x = 240; show_percent = 50;}
		if (variable_to_change=+0.4){background_brightness_indicator_x = 224; show_percent = 40;}
		if (variable_to_change=+0.3){background_brightness_indicator_x = 208; show_percent = 30;}
		if (variable_to_change=+0.2){background_brightness_indicator_x = 192; show_percent = 20;}
		if (variable_to_change=+0.1){background_brightness_indicator_x = 176; show_percent = 10;}
		if (variable_to_change= 0){background_brightness_indicator_x = 160; show_percent = 0;}
		if (variable_to_change=-0.1){background_brightness_indicator_x = 144; show_percent = -10;}
		if (variable_to_change=-0.2){background_brightness_indicator_x = 128; show_percent = -20;}
		if (variable_to_change=-0.3){background_brightness_indicator_x = 112; show_percent = -30;}
		if (variable_to_change=-0.4){background_brightness_indicator_x = 96; show_percent = -40;}
		if (variable_to_change=-0.5){background_brightness_indicator_x = 80; show_percent = -50;}
		if (variable_to_change=-0.6){background_brightness_indicator_x = 64; show_percent = -60;}
		if (variable_to_change=-0.7){background_brightness_indicator_x = 48; show_percent = -70;}
		if (variable_to_change=-0.8){background_brightness_indicator_x = 32; show_percent = -80;}
		if (variable_to_change=-0.9){background_brightness_indicator_x = 16; show_percent = -90;}
		if (variable_to_change=-1){background_brightness_indicator_x = 0; show_percent = -100;}
		
		draw_rectangle_color(x_position,y_position-16,x_position+320,y_position+16,c_black,c_white,c_white,c_black,false);
		if (menu_index = "background_brightness_gameplay")
		{
			if (variable_to_change < 0)
			{
				draw_rectangle_color(x_position+background_brightness_indicator_x-2,y_position-16,x_position+background_brightness_indicator_x+2,y_position+16,c_white,c_white,c_white,c_white,false);
			}
			else
			{
				draw_rectangle_color(x_position+background_brightness_indicator_x-2,y_position-16,x_position+background_brightness_indicator_x+2,y_position+16,c_black,c_black,c_black,c_black,false);
			}
		}
		else
		if (menu_index = "background_brightness_menu")
		{
			draw_rectangle_color(x_position+background_brightness_indicator_x-2,y_position-16,x_position+background_brightness_indicator_x+2,y_position+16,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);
		}
	}
	else
	{
		draw_rectangle_color(x_position,y_position-16,x_position+320,y_position+16,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
		if (variable_to_change = 1){draw_rectangle_color(x_position,y_position-16,x_position+320,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 100;}
		if (variable_to_change = 0.95){draw_rectangle_color(x_position,y_position-16,x_position+304,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 95;}
		if (variable_to_change = 0.9){draw_rectangle_color(x_position,y_position-16,x_position+288,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 90;}
		if (variable_to_change = 0.85){draw_rectangle_color(x_position,y_position-16,x_position+272,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 85;}
		if (variable_to_change = 0.8){draw_rectangle_color(x_position,y_position-16,x_position+256,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 80;}
		if (variable_to_change = 0.75){draw_rectangle_color(x_position,y_position-16,x_position+240,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 75;}
		if (variable_to_change = 0.7){draw_rectangle_color(x_position,y_position-16,x_position+224,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 70;}
		if (variable_to_change = 0.65){draw_rectangle_color(x_position,y_position-16,x_position+208,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 65;}
		if (variable_to_change = 0.6){draw_rectangle_color(x_position,y_position-16,x_position+192,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 60;}
		if (variable_to_change = 0.55){draw_rectangle_color(x_position,y_position-16,x_position+176,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 55;}
		if (variable_to_change = 0.5){draw_rectangle_color(x_position,y_position-16,x_position+160,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 50;}
		if (variable_to_change = 0.45){draw_rectangle_color(x_position,y_position-16,x_position+144,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 45;}
		if (variable_to_change = 0.4){draw_rectangle_color(x_position,y_position-16,x_position+128,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 40;}
		if (variable_to_change = 0.35){draw_rectangle_color(x_position,y_position-16,x_position+112,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 35;}
		if (variable_to_change = 0.3){draw_rectangle_color(x_position,y_position-16,x_position+96,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 30;}
		if (variable_to_change = 0.25){draw_rectangle_color(x_position,y_position-16,x_position+80,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 25;}
		if (variable_to_change = 0.2){draw_rectangle_color(x_position,y_position-16,x_position+64,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 20;}
		if (variable_to_change = 0.15){draw_rectangle_color(x_position,y_position-16,x_position+48,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 15;}
		if (variable_to_change = 0.1){draw_rectangle_color(x_position,y_position-16,x_position+32,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 10;}
		if (variable_to_change = 0.05){draw_rectangle_color(x_position,y_position-16,x_position+16,y_position+16,bar_color,bar_color,bar_color,bar_color,false);show_percent = 5;}
		if (variable_to_change = 0){show_percent = 0;}
	}
	#endregion /*Draw Bar END*/
	
	#region /*Show a menu cursor when the option is highlighted*/
	if (menu = menu_index)
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position-16, y_position, 1, 1, 0, c_white, 1);
	}
	#endregion /*Show a menu cursor when the option is highlighted END*/
	
	#region /*Clicking the menu button*/
	if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+32,y_position+2,x_position+320,y_position+41))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (mouse_check_button_pressed(mb_left))
	and (menu != "assist_enable")
	and (menu_delay = 0)
	or (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+32,y_position+2,x_position+320,y_position+41))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (mouse_check_button_pressed(mb_left))
	and (global.assist_enable = true)
	and (menu = "assist_enable")
	and (menu_delay = 0)
	{
		menu = menu_index;
		can_navigate_settings_sidebar = false;
		open_dropdown = false;
		menu_delay = 3;
	}
	#endregion /*Clicking the menu button END*/
	
	#region /*Text above the menu button*/
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_text_outlined(x_position,y_position-32,string(string_text)+": "+string(show_percent)+"%",global.default_text_size*0.75,c_menu_outline,c_menu_fill,1);
	#endregion /*Text above the menu button END*/
	
}