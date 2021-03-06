///scr_options_menu()
function scr_options_menu(){

	if (in_settings=true){
	scr_saveconfig();/*Save Config*/

	if (global.narrator>=1){narrator_name="Kai";}

	#region /*Set a default font*/
	if (asset_get_type("font_other_languages")==asset_font)and(global.language_localization=localization.ar_sa){draw_set_font(font_other_languages);}else
	if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}#endregion /*Set a default font END*/

	#region /*Scroll menu on right side*/
	menu_y_offset=lerp(menu_y_offset,menu_y_offset_real,0.1);
	if (menu_y_offset_real>=0)
	{
		menu_y_offset_real=0;
	}
	/*Scrolling menu down*/
	if (mouse_wheel_down())
	and(can_navigate_settings_sidebar=false)
	{
		menu_y_offset_real-=10;
		menu_y_offset-=10;
	}
	/*Scrolling menu up*/
	if (mouse_wheel_up())
	and(can_navigate_settings_sidebar=false)
	and(menu_y_offset<=-10)
	{
		menu_y_offset_real+=10;
		menu_y_offset+=10;
	}
	if (abs(menu_y_offset_real)+camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-60<menu_cursor_y_position)
	and(menu_cursor_y_position>camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
	{
		menu_y_offset_real-=10;
	}
	if (abs(menu_y_offset_real)+60>menu_cursor_y_position)
	{
		menu_y_offset_real+=10;
	}
	if (abs(menu_y_offset_real)+camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])+60<menu_cursor_y_position)
	and(menu_cursor_y_position>camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
	{
		menu_y_offset_real-=100;
	}
	if (abs(menu_y_offset_real)-60>menu_cursor_y_position)
	{
		menu_y_offset_real+=100;
	}
	#endregion /*Scroll menu on right side END*/

	#region /*Settings Sidebar*/
	
	if (key_a)and(menu_delay=0)and(global.settings_sidebar_menu="settings_back")and(can_navigate_settings_sidebar=true)or(key_b_pressed)and(menu_delay=0)and(can_navigate_settings_sidebar=true){in_settings=false;menu="options";menu_delay=10;}/*Go back out of setting menu*/
	if (key_b_pressed)and(can_navigate_settings_sidebar=false)and(menu_delay=0){can_navigate_settings_sidebar=true;menu_delay=10;menu=noone;}else
	if (key_right)and(global.settings_sidebar_menu!="settings_back")and(can_navigate_settings_sidebar=true)and(menu_delay=0)or(key_a)and(global.settings_sidebar_menu!="settings_back")and(can_navigate_settings_sidebar=true)and(menu_delay=0){menu_delay=10;can_navigate_settings_sidebar=false;
	if (global.settings_sidebar_menu="accessibility_settings"){menu="assist_item_appear";}
	if (global.settings_sidebar_menu="game_settings"){menu="difficulty_settings";}
	if (global.settings_sidebar_menu="keyboard_and_mouse_settings"){menu="remap_select_player";}
	if (global.settings_sidebar_menu="video_settings"){menu="fullscreen_mode";}
	if (global.settings_sidebar_menu="audio_settings"){menu="music_volume";}
	if (global.settings_sidebar_menu="language_settings"){menu="language_id_id";}
	}/*When you navigate the sidebar or not*/
	
	/*Main Settings on left sidebar*/
	
	/*Black Background behind sidebar*/
	draw_set_alpha(1);draw_rectangle_color(camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current]),camera_get_view_x(view_camera[view_current])+370,room_height,c_black,c_black,c_black,c_black,false);
	
	if (global.language_localization=localization.ar_sa){var text_x_offset=290;var icon_x_offset=330;draw_set_halign(fa_right);draw_set_valign(fa_center);}else{var text_x_offset=0;var icon_x_offset=0;draw_set_halign(fa_left);draw_set_valign(fa_center);}/*Set font*/

	/*Menu navigation with mouse*/
	/*Click Back*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,0-room_height,camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+40-1))and(global.settings_sidebar_menu="settings_back")and(mouse_check_button_released(mb_left)){in_settings=false;menu="options";menu_delay=10;}else
	/*Back*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,0-room_height,camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+40-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="settings_back";can_navigate_settings_sidebar=true;}else
	
	/*Click Accessibility*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+40,camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*2)-1))and(global.settings_sidebar_menu="accessibility_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="accessibility_settings";}else
	/*Accessibility*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+40,camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*2)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="accessibility_settings";can_navigate_settings_sidebar=true;}else
	
	/*Click Game*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*3),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*4)-1))and(global.settings_sidebar_menu="game_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="game_settings";}
	/*Game*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*3),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*4)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="game_settings";can_navigate_settings_sidebar=true;}
	
	/*Click Multiplayer*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*4),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*5)-1))and(global.settings_sidebar_menu="multiplayer_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="multiplayer_settings";}
	/*Multiplayer*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*4),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*5)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="multiplayer_settings";can_navigate_settings_sidebar=true;}
	
	/*Click Keyboard and Mouse*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*6),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*7)-1))and(global.settings_sidebar_menu="keyboard_and_mouse_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="keyboard_and_mouse_settings";}
	/*Keyboard and Mouse*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*6),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*7)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="keyboard_and_mouse_settings";can_navigate_settings_sidebar=true;}

	/*Click Controller*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*7),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*8)-1))and(global.settings_sidebar_menu="controller_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="controller_settings";}
	/*Controller*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*7),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*8)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="controller_settings";can_navigate_settings_sidebar=true;}
	
	/*Click Touch*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*8),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*9)-1))and(global.settings_sidebar_menu="touch_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="touch_settings";}
	/*Touch*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*8),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*9)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="touch_settings";can_navigate_settings_sidebar=true;}

	/*Click Profile*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*10),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*11)-1))and(global.settings_sidebar_menu="profile_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="profile_settings";}
	/*Profile*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*10),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*11)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="profile_settings";can_navigate_settings_sidebar=true;}
	
	/*Click Video*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*11),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*12)-1))and(global.settings_sidebar_menu="video_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="video_settings";}
	/*Video*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*11),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*12)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="video_settings";can_navigate_settings_sidebar=true;}

	/*Click Audio*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*12),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*13)-1))and(global.settings_sidebar_menu="audio_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="audio_settings";}
	/*Audio*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*12),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*13)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="audio_settings";can_navigate_settings_sidebar=true;}

	/*Click Global Resources*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*13),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*14)-1))and(global.settings_sidebar_menu="global_resources_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="global_resources_settings";}
	/*Global Resources*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*13),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*14)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="global_resources_settings";can_navigate_settings_sidebar=true;}

	/*Click Storage*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*14),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*15)-1))and(global.settings_sidebar_menu="storage_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="storage_settings";}
	/*Storage*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*14),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*15)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="storage_settings";can_navigate_settings_sidebar=true;}

	/*Click Language*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*15),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*16)-1))and(global.settings_sidebar_menu="language_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="language_settings";}
	/*Language*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*15),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*16)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="language_settings";can_navigate_settings_sidebar=true;}

	/*Click Broadcast*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*16),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*17)-1))and(global.settings_sidebar_menu="broadcast_settings")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="broadcast_settings";}
	/*Broadcast*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*16),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*17)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="broadcast_settings";can_navigate_settings_sidebar=true;}

	/*Click How to Play*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*17),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*18)-1))and(global.settings_sidebar_menu="how_to_play")and(mouse_check_button_released(mb_left)){global.settings_sidebar_menu="how_to_play";}
	/*How to Play*/if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*17),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*18)-1))and(mouse_check_button(mb_left)){global.settings_sidebar_menu="how_to_play";can_navigate_settings_sidebar=true;}

	#region /*Accessibility Settings*/
	if (global.settings_sidebar_menu="accessibility_settings")
	{
		if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+40,camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*2)-1))
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*1),1,1,0,c_green,1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*1),1,1,0,c_gray,1);
		}
		/*Button Hightlighted*/
		
		draw_sprite_ext(spr_settings_icons,1,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*1),1,1,0,c_white,1); /*Settings Icon*/
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*1),Text("Accessibility"),global.default_text_size*1.1,c_black,c_white,1);
		if (key_up)
		and(can_navigate_settings_sidebar=true)
		and(menu_delay=0)
		{
			global.settings_sidebar_menu="settings_back";
			menu_delay=10;
		}
		else
		if (key_down)
		and(can_navigate_settings_sidebar=true)
		and(menu_delay=0)
		{
			global.settings_sidebar_menu="game_settings";
			menu_delay=10;
		}
		/*Sidebar Navigation*/
		
	}
	else
	{
		if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+40,camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*2)-1))
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*1),1,1,0,c_lime,1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*1),1,1,0,c_white,1);
		}
		/*Button Not Selected*/
		
		draw_sprite_ext(spr_settings_icons,1,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*1),0.9,0.9,0,c_white,1); /*Settings Icon*/
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*1),Text("Accessibility"),global.default_text_size,c_white,c_black,1);
	}
	#endregion /*Accessibility Settings END*/
	
	#region /*My Game Settings*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+20+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*2),Text("Game"),global.default_text_size*0.5,c_black,c_white,1);

	if (global.settings_sidebar_menu="game_settings")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*3),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*4)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*3),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*3),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,2,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*3),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*3),Text("Game"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="accessibility_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="multiplayer_settings";menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*3),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*4)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*3),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*3),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,2,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*3),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*3),Text("Game"),global.default_text_size,c_white,c_black,1);}

	if (global.settings_sidebar_menu="multiplayer_settings")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*4),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*5)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*4),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*4),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,3,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*4),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*4),Text("Multiplayer"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="game_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="keyboard_and_mouse_settings";menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*4),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*5)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*4),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*4),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,3,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*4),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*4),Text("Multiplayer"),global.default_text_size,c_white,c_black,1);}
	#endregion /*My Game Settings END*/
	
	#region /*Controls Settings*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+20+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*5),Text("Controls"),global.default_text_size*0.5,c_black,c_white,1);
	
	if (global.settings_sidebar_menu="keyboard_and_mouse_settings")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*6),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*7)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*6),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*6),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,4,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*6),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*6),Text("Keyboard & Mouse"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="multiplayer_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="controller_settings";menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*6),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*7)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*6),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*6),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,4,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*6),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*6),Text("Keyboard & Mouse"),global.default_text_size,c_white,c_black,1);}
	
	if (global.settings_sidebar_menu="controller_settings")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*7),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*8)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*7),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*7),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,5,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*7),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*7),Text("Controller"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="keyboard_and_mouse_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="touch_settings";menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*7),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*8)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*7),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*7),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,5,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*7),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*7),Text("Controller"),global.default_text_size,c_white,c_black,1);}
	
	if (global.settings_sidebar_menu="touch_settings")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*8),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*9)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*8),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*8),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,6,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*8),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*8),Text("Touch"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="controller_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="profile_settings";menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*8),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*9)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*8),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*8),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,6,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*8),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*8),Text("Touch"),global.default_text_size,c_white,c_black,1);}
	#endregion /*Controls Settings END*/

	#region /*General Settings*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+20+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*9),Text("General"),global.default_text_size*0.5,c_black,c_white,1);

	if (global.settings_sidebar_menu="profile_settings")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*10),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*11)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*10),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*10),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,7,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*10),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*10),Text("Profile"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="touch_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="video_settings";menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*10),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*11)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*10),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*10),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,7,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*10),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*10),Text("Profile"),global.default_text_size,c_white,c_black,1);}

	if (global.settings_sidebar_menu="video_settings")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*11),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*12)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*11),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*11),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,8,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*11),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*11),Text("Video"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="profile_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="audio_settings";menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*11),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*12)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*11),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*11),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,8,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*11),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*11),Text("Video"),global.default_text_size,c_white,c_black,1);}
	
	if (global.settings_sidebar_menu="audio_settings")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*12),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*13)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*12),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*12),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,9,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*12),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*12),Text("Audio"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="video_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="global_resources_settings";menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*12),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*13)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*12),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*12),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,9,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*12),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*12),Text("Audio"),global.default_text_size,c_white,c_black,1);}

	if (global.settings_sidebar_menu="global_resources_settings")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*13),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*14)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*13),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*13),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,10,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*13),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*13),Text("Custom Resources"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="audio_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="storage_settings";menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*13),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*14)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*13),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*13),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,10,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*13),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*13),Text("Custom Resources"),global.default_text_size,c_white,c_black,1);}

	if (global.settings_sidebar_menu="storage_settings")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*14),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*15)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*14),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*14),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,11,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*14),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*14),Text("Storage"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="global_resources_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="language_settings";menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*14),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*15)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*14),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*14),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,11,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*14),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*14),Text("Storage"),global.default_text_size,c_white,c_black,1);}

	if (global.settings_sidebar_menu="language_settings")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*15),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*16)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*15),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*15),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,12,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*15),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*15),Text("Language"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="storage_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="broadcast_settings";menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*15),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*16)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*15),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*15),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,12,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*15),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*15),Text("Language"),global.default_text_size,c_white,c_black,1);}

	if (global.settings_sidebar_menu="broadcast_settings")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*16),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*17)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*16),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*16),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,13,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*16),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*16),Text("Broadcast"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="language_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="how_to_play";menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*16),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*17)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*16),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*16),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,13,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*16),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*16),Text("Broadcast"),global.default_text_size,c_white,c_black,1);}

	if (global.settings_sidebar_menu="how_to_play")
	{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*17),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*18)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*17),1,1,0,c_green,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*17),1,1,0,c_gray,1);}/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,14,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*17),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*17),Text("How to Play"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="broadcast_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){if (enable_add_ons=true){global.settings_sidebar_menu="resource_packs_settings";}else{global.settings_sidebar_menu="settings_back";}menu_delay=10;}/*Sidebar Navigation*/
	}else{if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,camera_get_view_y(view_camera[view_current])+(40*17),camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+(40*18)-1)){draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*17),1,1,0,c_lime,1);}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*17),1,1,0,c_white,1);}/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,14,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*17),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*17),Text("How to Play"),global.default_text_size,c_white,c_black,1);}
	#endregion /*General Settings END*/

	#region /*Add-Ons Settings*/
	if (enable_add_ons=true){
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+20+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*18),Text("Add-Ons"),global.default_text_size*0.5,c_black,c_white,1);

	if (global.settings_sidebar_menu="resource_packs_settings")
	{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*19),1,1,0,c_gray,1)/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,15,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*19),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*19),Text("Resource Packs"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="how_to_play";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="behavior_packs_settings";menu_delay=10;}/*Sidebar Navigation*/
	}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*19),1,1,0,c_white,1)/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,15,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*19),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*19),Text("Resource Packs"),global.default_text_size,c_white,c_black,1);}

	if (global.settings_sidebar_menu="behavior_packs_settings")
	{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*20),1,1,0,c_gray,1)/*Button Hightlighted*/
	draw_sprite_ext(spr_settings_icons,16,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*20),1,1,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*20),Text("Behavior Packs"),global.default_text_size*1.1,c_black,c_white,1);
	if (key_up)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="resource_packs_settings";menu_delay=10;}else if (key_down)and(can_navigate_settings_sidebar=true)and(menu_delay=0){global.settings_sidebar_menu="settings_back";menu_delay=10;}/*Sidebar Navigation*/
	}else{draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*20),1,1,0,c_white,1)/*Button Not Selected*/
	draw_sprite_ext(spr_settings_icons,16,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*20),0.9,0.9,0,c_white,1)/*Settings Icon*/
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20+(40*20),Text("Resource Packs"),global.default_text_size,c_white,c_black,1);}}
	#endregion /*Add-Ons Settings END*/

	#region /*The "Back" button should always appear at the top of the screen*/
	if (global.settings_sidebar_menu="settings_back")
	{
		if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,0-room_height,camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+39))
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20,1,1,0,c_green,1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20,1,1,0,c_gray,1);
		}
		/*Button Hightlighted*/
		
		draw_sprite_ext(spr_settings_icons,0,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20,1,1,0,c_white,1); /*Settings Icon*/
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20,Text("Back"),global.default_text_size*1.1,c_black,c_white,1);
		if (key_up)
		and(can_navigate_settings_sidebar=true)
		and(menu_delay=0)
		{
			if (enable_add_ons=true)
			{
				global.settings_sidebar_menu="behavior_packs_settings";
			}
			else
			{
				global.settings_sidebar_menu="how_to_play";
			}
			menu_delay=10;
		}
		else
		if (key_down)
		and(can_navigate_settings_sidebar=true)
		and(menu_delay=0)
		{
			global.settings_sidebar_menu="accessibility_settings";menu_delay=10;
		}
		/*Sidebar Navigation*/
		
	}
	else
	{
		if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])-room_width,0-room_height,camera_get_view_x(view_camera[view_current])+370,camera_get_view_y(view_camera[view_current])+39))
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20,1,1,0,c_lime,1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20,1,1,0,c_white,1);
		}
		/*Button Not Selected*/
		
		draw_sprite_ext(spr_settings_icons,0,camera_get_view_x(view_camera[view_current])+20+icon_x_offset,camera_get_view_y(view_camera[view_current])+20,0.9,0.9,0,c_white,1); /*Settings Icon*/
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+40+text_x_offset,camera_get_view_y(view_camera[view_current])+20,Text("Back"),global.default_text_size,c_white,c_black,1);
	}
	#endregion /*The "Back" button should always appear at the top of the screen END*/
	
	#endregion /*Settings Sidebar END*/
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);

	#region /*Assist Settings*/
	if (global.settings_sidebar_menu="accessibility_settings"){

	if (menu="assist_item_appear"){

	if (global.assist_item_appear=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Assist Item: Always Appear",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);/*Show right arrow*/if (gamepad_is_connected(0)){draw_sprite_ext(spr_xbox_buttons,6,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,0.5,0.5,0,c_white,1);}else{if (asset_get_type("spr_keyboard_keys")==asset_sprite){draw_sprite_ext(spr_keyboard_keys,vk_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,0.5,0.5,0,c_white,1);}}/*Show right arrow END*/}else
	if (global.assist_item_appear=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Assist Item: Appear after 1 death on a level",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.assist_item_appear>=2)and(global.assist_item_appear<=9){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Assist Item: Appear after "+string(global.assist_item_appear)+" deaths on a level",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.assist_item_appear>=10){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Assist Item: Never Appear",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);/*Show left arrow*/if (gamepad_is_connected(0)){draw_sprite_ext(spr_xbox_buttons,4,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,0.5,0.5,0,c_white,1);}else{if (asset_get_type("spr_keyboard_keys")==asset_sprite){draw_sprite_ext(spr_keyboard_keys,vk_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,0.5,0.5,0,c_white,1);}}/*Show left arrow END*/}}else{
	if (global.assist_item_appear=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Assist Item: Always Appear",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.assist_item_appear=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Assist Item: Appear after 1 death on a level",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.assist_item_appear>=2)and(global.assist_item_appear<=9){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Assist Item: Appear after "+string(global.assist_item_appear)+" deaths on a level",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.assist_item_appear>=10){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Assist Item: Never Appear",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	if (menu="assist_default_hp")
	{if (global.assist_default_hp>=2)and(global.assist_default_hp<=9){/*Show left arrow*/if (gamepad_is_connected(0)){draw_sprite_ext(spr_xbox_buttons,4,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,0.5,0.5,0,c_white,1);}else{if (asset_get_type("spr_keyboard_keys")==asset_sprite){draw_sprite_ext(spr_keyboard_keys,vk_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,0.5,0.5,0,c_white,1);}}/*Show left arrow END*/}
	if (global.assist_default_hp>=10){/*Show left arrow*/if (gamepad_is_connected(0)){draw_sprite_ext(spr_xbox_buttons,4,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-250,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,0.5,0.5,0,c_white,1);}else{if (asset_get_type("spr_keyboard_keys")==asset_sprite){draw_sprite_ext(spr_keyboard_keys,vk_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-250,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,0.5,0.5,0,c_white,1);}}/*Show left arrow END*/}
	if (global.assist_default_hp<=9){/*Show right arrow*/if (gamepad_is_connected(0)){draw_sprite_ext(spr_xbox_buttons,6,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,0.5,0.5,0,c_white,1);}else{if (asset_get_type("spr_keyboard_keys")==asset_sprite){draw_sprite_ext(spr_keyboard_keys,vk_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,0.5,0.5,0,c_white,1);}}/*Show right arrow END*/}
	if (global.assist_default_hp<=9){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"Default Health Points: "+string(global.assist_default_hp),global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.assist_default_hp>=10){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"Default Health Points: Invincible",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else
	{if (global.assist_default_hp<=9){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"Default Health Points: "+string(global.assist_default_hp),global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.assist_default_hp>=10){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"Default Health Points: Invincible",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	if (menu="assist_guiding_arrows")
	{if (global.assist_guiding_arrows>=1){/*Show left arrow*/if (gamepad_is_connected(0)){draw_sprite_ext(spr_xbox_buttons,4,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-300,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,0.5,0.5,0,c_white,1);}else{if (asset_get_type("spr_keyboard_keys")==asset_sprite){draw_sprite_ext(spr_keyboard_keys,vk_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-300,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,0.5,0.5,0,c_white,1);}}/*Show left arrow END*/}
	if (global.assist_guiding_arrows<=2){/*Show right arrow*/if (gamepad_is_connected(0)){draw_sprite_ext(spr_xbox_buttons,6,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+300,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,0.5,0.5,0,c_white,1);}else{if (asset_get_type("spr_keyboard_keys")==asset_sprite){draw_sprite_ext(spr_keyboard_keys,vk_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+300,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,0.5,0.5,0,c_white,1);}}/*Show right arrow END*/}
	if (global.assist_guiding_arrows=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Guiding Arrows: Big and Small Arrows",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	if (global.assist_guiding_arrows=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Guiding Arrows: Only Big Arrows",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	if (global.assist_guiding_arrows=2){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Guiding Arrows: Only Small Arrows",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	if (global.assist_guiding_arrows=3){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Guiding Arrows: No Arrows",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else
	{if (global.assist_guiding_arrows=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Guiding Arrows: Big and Small Arrows",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	if (global.assist_guiding_arrows=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Guiding Arrows: Only Big Arrows",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	if (global.assist_guiding_arrows=2){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Guiding Arrows: Only Small Arrows",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	if (global.assist_guiding_arrows=3){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Guiding Arrows: No Arrows",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	}#endregion /*Assist Settings END*/
	
	#region /*My Game Settings*/
	
	#region /*Game Settings*/
	if (global.settings_sidebar_menu="game_settings"){

	if (menu="difficulty_settings"){
	/*Show left arrow*/if (gamepad_is_connected(0)){draw_sprite_ext(spr_xbox_buttons,4,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-226,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,0.5,0.5,0,c_white,1);}else{if (asset_get_type("spr_keyboard_keys")==asset_sprite){draw_sprite_ext(spr_keyboard_keys,vk_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-226,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,0.5,0.5,0,c_white,1);}}/*Show left arrow END*/
	/*Show right arrow*/if (gamepad_is_connected(0)){draw_sprite_ext(spr_xbox_buttons,6,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+226,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,0.5,0.5,0,c_white,1);}else{if (asset_get_type("spr_keyboard_keys")==asset_sprite){draw_sprite_ext(spr_keyboard_keys,vk_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+226,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,0.5,0.5,0,c_white,1);}}/*Show right arrow END*/
	if (global.difficulty<=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Difficulty: Peaceful",global.default_text_size*1.1,c_black,c_aqua,1);}
	if (global.difficulty=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Difficulty: Easy",global.default_text_size*1.1,c_black,c_lime,1);}
	if (global.difficulty=2){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Difficulty: Normal",global.default_text_size*1.1,c_black,c_yellow,1);}
	if (global.difficulty>=3){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Difficulty: Hard",global.default_text_size*1.1,c_black,c_red,1);}
	}
	else{
	if (global.difficulty<=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Difficulty: Peaceful",global.default_text_size,c_black,c_aqua,1);}
	if (global.difficulty=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Difficulty: Easy",global.default_text_size,c_black,c_lime,1);}
	if (global.difficulty=2){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Difficulty: Normal",global.default_text_size,c_black,c_yellow,1);}
	if (global.difficulty>=3){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Difficulty: Hard",global.default_text_size,c_black,c_red,1);}
	}}#endregion /*Game Settings END*/
	
	#region /*Multiplayer Settings*/
	if (global.settings_sidebar_menu="multiplayer_settings"){
	draw_set_halign(fa_left);draw_set_valign(fa_center);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*3),"Change how multiplayer works here",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	#endregion /*Multiplayer Settings END*/
	
	#endregion /*My Game Settings*/
	
	#region /*Controls Settings*/
	if (global.settings_sidebar_menu="keyboard_and_mouse_settings"){
	draw_set_halign(fa_left);draw_set_valign(fa_center);

	#region /*Remap Select Player - Which player do you want to remap the controls for?*/
	if (menu="remap_select_player")
	{
		draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,1,1,0,c_white,1);
		menu_cursor_y_position=60;
		if (remapping_player=1)
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,1,1,0,c_white,1);
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+420,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,"Remap Player 1",global.default_text_size*1.1,c_black,global.player1_color,1);
		}
		else
		if (remapping_player=2)
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,1,1,0,c_white,1);
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+420,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,"Remap Player 2",global.default_text_size*1.1,c_black,global.player2_color,1);
		}
		else
		if (remapping_player=3)
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,1,1,0,c_white,1);
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+420,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,"Remap Player 3",global.default_text_size*1.1,c_black,global.player3_color,1);
		}
		else
		if (remapping_player=4)
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,1,1,0,c_white,1);
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+420,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,"Remap Player 4",global.default_text_size*1.1,c_black,global.player4_color,1);
		}
	}
	else
	{
		if (remapping_player=1)
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,1,1,0,c_white,1);
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+420,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,"Remap Player 1",global.default_text_size,c_black,global.player1_color,1);
		}
		else
		if (remapping_player=2)
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,1,1,0,c_white,1);
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+420,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,"Remap Player 2",global.default_text_size,c_black,global.player2_color,1);
		}
		else
		if (remapping_player=3)
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,1,1,0,c_white,1);
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+420,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,"Remap Player 3",global.default_text_size,c_black,global.player3_color,1);
		}
		else
		if (remapping_player=4)
		{
			draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,1,1,0,c_white,1);
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+420,camera_get_view_y(view_camera[view_current])+60+menu_y_offset,"Remap Player 4",global.default_text_size,c_black,global.player4_color,1);
		}
	}
	#endregion /*Remap Select Player - Which player do you want to remap the controls for? END*/

	#region /*Remap Keyboard and Mouse*/

	#region /*Show what key is used*/
	if (asset_get_type("spr_keyboard_keys")==asset_sprite){

	if (remapping_player=1){
	if (menu="remap_key_jump")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player1_key_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player1_key_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch_toggle")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player1_key_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player1_key_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint_toggle")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player1_key_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_left")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player1_key_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_right")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player1_key_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_down")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player1_key_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_up")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player1_key_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_attack")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player1_key_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	
	draw_set_halign(fa_center);draw_set_valign(fa_center);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	
	if (menu="remap_key_jump")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player1_key2_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key2_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player1_key2_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key2_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch_toggle")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player1_key2_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key2_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player1_key2_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key2_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint_toggle")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player1_key2_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key2_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_left")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player1_key2_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key2_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_right")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player1_key2_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key2_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_down")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player1_key2_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key2_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_up")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player1_key2_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key2_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_attack")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player1_key2_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player1_key2_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	
	}else if (remapping_player=2){
	if (menu="remap_key_jump")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player2_key_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player2_key_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch_toggle")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player2_key_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player2_key_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint_toggle")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player2_key_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_left")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player2_key_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_right")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player2_key_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_down")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player2_key_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_up")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player2_key_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_attack")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player2_key_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,0.9,0.9,0,c_gray,0.9);}

	draw_set_halign(fa_center);draw_set_valign(fa_center);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);

	if (menu="remap_key_jump")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player2_key2_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key2_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player2_key2_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key2_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch_toggle")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player2_key2_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key2_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player2_key2_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key2_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint_toggle")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player2_key2_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key2_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_left")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player2_key2_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key2_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_right")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player2_key2_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key2_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_down")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player2_key2_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key2_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_up")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player2_key2_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key2_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_attack")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player2_key2_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player2_key2_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,0.9,0.9,0,c_gray,0.9);}

	}else if (remapping_player=3){
	if (menu="remap_key_jump")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player3_key_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player3_key_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch_toggle")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player3_key_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player3_key_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint_toggle")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player3_key_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_left")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player3_key_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_right")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player3_key_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_down")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player3_key_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_up")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player3_key_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_attack")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player3_key_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	
	draw_set_halign(fa_center);draw_set_valign(fa_center);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	
	if (menu="remap_key_jump")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player3_key2_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key2_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player3_key2_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key2_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+64,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch_toggle")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player3_key2_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key2_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+128,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player3_key2_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key2_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+192,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint_toggle")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player3_key2_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key2_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+256,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_left")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player3_key2_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key2_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+320,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_right")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player3_key2_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key2_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+384,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_down")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player3_key2_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key2_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+448,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_up")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player3_key2_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key2_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+512,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_attack")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player3_key2_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player3_key2_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+576,0.9,0.9,0,c_gray,0.9);}
	
	}else if (remapping_player=4){
	if (menu="remap_key_jump")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player4_key_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player4_key_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch_toggle")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player4_key_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player4_key_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint_toggle")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player4_key_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_left")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player4_key_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_right")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player4_key_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_down")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player4_key_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_up")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player4_key_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_attack")and(menu_remap_key_number=0){draw_sprite_ext(spr_keyboard_keys,global.player4_key_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+224,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	
	draw_set_halign(fa_center);draw_set_valign(fa_center);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+288,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,"OR",global.default_text_size,c_menu_outline,c_menu_fill,1);
	
	if (menu="remap_key_jump")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player4_key2_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key2_jump,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player4_key2_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key2_crouch,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_crouch_toggle")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player4_key2_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key2_crouch_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player4_key2_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key2_sprint,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_sprint_toggle")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player4_key2_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key2_sprint_toggle,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_left")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player4_key2_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key2_left,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_right")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player4_key2_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key2_right,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_down")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player4_key2_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key2_down,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_up")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player4_key2_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key2_up,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	if (menu="remap_key_attack")and(menu_remap_key_number=2){draw_sprite_ext(spr_keyboard_keys,global.player4_key2_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,1,1,0,c_white,1);}else{draw_sprite_ext(spr_keyboard_keys,global.player4_key2_attack,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+352,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,0.9,0.9,0,c_gray,0.9);}
	
	}}#endregion /*Show what key is used End*/

	#region /*All the keys you can remap*/
	draw_set_halign(fa_left);draw_set_valign(fa_center);
	
	#region /*Remap Key Jump*/
	if (menu="remap_key_jump"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=128;
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,"Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	if (input_key=true)and(can_remap_key=false){menu_delay=10;scr_keyboardremapping();}else if (key_a)and(menu_delay=0){menu_delay=10;input_key=true;}}else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+menu_y_offset,"Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}#endregion /*Remap Key Jump End*/

	#region /*Remap Key Crouch*/
	if (menu="remap_key_crouch"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=128+64;
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,"Crouch",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	if (input_key=true)and(can_remap_key=false){menu_delay=10;scr_keyboardremapping();}else if (key_a)and(menu_delay=0){menu_delay=10;input_key=true;}}else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+64+menu_y_offset,"Crouch",global.default_text_size,c_menu_outline,c_menu_fill,1);}#endregion /*Remap Key Crouch End*/

	#region /*Remap Key Crouch Toggle*/
	if (menu="remap_key_crouch_toggle"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=128+128;
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,"Crouch Toggle",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	if (input_key=true)and(can_remap_key=false){menu_delay=10;scr_keyboardremapping();}else if (key_a)and(menu_delay=0){menu_delay=10;input_key=true;}}else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+128+menu_y_offset,"Crouch Toggle",global.default_text_size,c_menu_outline,c_menu_fill,1);}#endregion /*Remap Key Crouch Toggle End*/

	#region /*Remap Key Sprint*/
	if (menu="remap_key_sprint"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=128+192;
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,"Sprint",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	if (input_key=true)and(can_remap_key=false){menu_delay=10;scr_keyboardremapping();}else if (key_a)and(menu_delay=0){menu_delay=10;input_key=true;}}else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+192+menu_y_offset,"Sprint",global.default_text_size,c_menu_outline,c_menu_fill,1);}#endregion /*Remap Key Sprint End*/

	#region /*Remap Key Sprint Toggle*/
	if (menu="remap_key_sprint_toggle"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=128+256;
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,"Sprint Toggle",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	if (input_key=true)and(can_remap_key=false){menu_delay=10;scr_keyboardremapping();}else if (key_a)and(menu_delay=0){menu_delay=10;input_key=true;}}else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+256+menu_y_offset,"Sprint Toggle",global.default_text_size,c_menu_outline,c_menu_fill,1);}#endregion /*Remap Key Sprint Toggle End*/

	#region /*Remap Key Left*/
	if (menu="remap_key_left"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=128+320;
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,"Left",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	if (input_key=true)and(can_remap_key=false){menu_delay=10;scr_keyboardremapping();}else if (key_a)and(menu_delay=0){menu_delay=10;input_key=true;}}else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+320+menu_y_offset,"Left",global.default_text_size,c_menu_outline,c_menu_fill,1);}#endregion /*Remap Key Left End*/

	#region /*Remap Key Right*/
	if (menu="remap_key_right"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=128+384;
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,"Right",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	if (input_key=true)and(can_remap_key=false){menu_delay=10;scr_keyboardremapping();}else if (key_a)and(menu_delay=0){menu_delay=10;input_key=true;}}else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+384+menu_y_offset,"Right",global.default_text_size,c_menu_outline,c_menu_fill,1);}#endregion /*Remap Key Right End*/

	#region /*Remap Key Down*/
	if (menu="remap_key_down"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=128+448;
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,"Down",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	if (input_key=true)and(can_remap_key=false){menu_delay=10;scr_keyboardremapping();}else if (key_a)and(menu_delay=0){menu_delay=10;input_key=true;}}else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+448+menu_y_offset,"Down",global.default_text_size,c_menu_outline,c_menu_fill,1);}#endregion /*Remap Key Down End*/

	#region /*Remap Key Up*/
	if (menu="remap_key_up"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=128+512;
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,"Up",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	if (input_key=true)and(can_remap_key=false){menu_delay=10;scr_keyboardremapping();}else if (key_a)and(menu_delay=0){menu_delay=10;input_key=true;}}else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+512+menu_y_offset,"Up",global.default_text_size,c_menu_outline,c_menu_fill,1);}#endregion /*Remap Key Up End*/

	#region /*Remap Key Attack*/
	if (menu="remap_key_attack"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=128+576;
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,"Tongue",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	if (input_key=true)and(can_remap_key=false){menu_delay=10;scr_keyboardremapping();}else if (key_a)and(menu_delay=0){menu_delay=10;input_key=true;}}else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+128+576+menu_y_offset,"Tongue",global.default_text_size,c_menu_outline,c_menu_fill,1);}#endregion /*Remap Key Up End*/

	#endregion /*All the keys you can remap END*/

	#region /*Reset to Default Settings*/
	if (menu="remap_reset"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+128+640+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=128+640;
	draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+768+menu_y_offset,1,1,0,c_white,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+420,camera_get_view_y(view_camera[view_current])+768+menu_y_offset,"Default Settings",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	if (key_a)and(menu_delay=0){
	
	#region /*Reset Player 1 Keyboard Remapping*/
	if (remapping_player=1)
	{
		image_speed=0;
		
		#region /*Key 1 defaults*/
		global.player1_key_jump=vk_space;
		global.player1_key_crouch=vk_shift;
		global.player1_key_crouch_toggle=noone;
		global.player1_key_sprint=vk_lcontrol;
		global.player1_key_sprint_toggle=noone;
		global.player1_key_left=ord("A");
		global.player1_key_right=ord("D");
		global.player1_key_down=ord("S");
		global.player1_key_up=ord("W");
		global.player1_key_attack=noone;
		#endregion /*Key 1 defaults END*/
		
		#region /*Key 2 defaults*/
		global.player1_key2_jump=noone;
		global.player1_key2_crouch=noone;
		global.player1_key2_crouch_toggle=noone;
		global.player1_key2_sprint=noone;
		global.player1_key2_sprint_toggle=noone;
		global.player1_key2_left=noone;
		global.player1_key2_right=noone;
		global.player1_key2_down=noone;
		global.player1_key2_up=noone;
		global.player1_key2_attack=noone;
		#endregion /*Key 2 defaults END*/
		
	}
	else
	#endregion /*Reset Player 1 Keyboard Remapping END*/
	
	#region /*Reset Player 2 Keyboard Remapping*/
	if (remapping_player=2)
	{
		image_speed=0;
		
		#region /*Key 1 defaults*/
		global.player2_key_jump=noone;
		global.player2_key_crouch=noone;
		global.player2_key_crouch_toggle=noone;
		global.player2_key_sprint=noone;
		global.player2_key_sprint_toggle=noone;
		global.player2_key_left=noone;
		global.player2_key_right=noone;
		global.player2_key_down=noone;
		global.player2_key_up=noone;
		global.player2_key_attack=noone;
		#endregion /*Key 1 defaults END*/
		
		#region /*Key 2 defaults*/
		global.player2_key2_jump=noone;
		global.player2_key2_crouch=noone;
		global.player2_key2_crouch_toggle=noone;
		global.player2_key2_sprint=noone;
		global.player2_key2_sprint_toggle=noone;
		global.player2_key2_left=noone;
		global.player2_key2_right=noone;
		global.player2_key2_down=noone;
		global.player2_key2_up=noone;
		global.player2_key2_attack=noone;
		#endregion /*Key 2 defaults END*/
		
	}
	else #endregion /*Reset Player 2 Keyboard Remapping END*/
	
	#region /*Reset Player 3 Keyboard Remapping*/
	if (remapping_player=3)
	{
		image_speed=0;
		global.player3_key_jump=noone;global.player3_key_crouch=noone;global.player3_key_crouch_toggle=noone;global.player3_key_sprint=noone;global.player3_key_sprint_toggle=noone;global.player3_key_left=noone;global.player3_key_right=noone;global.player3_key_down=noone;global.player3_key_up=noone;global.player3_key_attack=noone;
		global.player3_key2_jump=noone;global.player3_key2_crouch=noone;global.player3_key2_crouch_toggle=noone;global.player3_key2_sprint=noone;global.player3_key2_sprint_toggle=noone;global.player3_key2_left=noone;global.player3_key2_right=noone;global.player3_key2_down=noone;global.player3_key2_up=noone;global.player3_key2_attack=noone;
	}
	else #endregion /*Reset Player 3 Keyboard Remapping END*/
	
	#region /*Reset Player 4 Keyboard Remapping*/
	if (remapping_player=4)
	{
		image_speed=0;
		global.player4_key_jump=noone;global.player4_key_crouch=noone;global.player4_key_crouch_toggle=noone;global.player4_key_sprint=noone;global.player4_key_sprint_toggle=noone;global.player4_key_left=noone;global.player4_key_right=noone;global.player4_key_down=noone;global.player4_key_up=noone;global.player4_key_attack=noone;
		global.player4_key2_jump=noone;global.player4_key2_crouch=noone;global.player4_key2_crouch_toggle=noone;global.player4_key2_sprint=noone;global.player4_key2_sprint_toggle=noone;global.player4_key2_left=noone;global.player4_key2_right=noone;global.player4_key2_down=noone;global.player4_key2_up=noone;global.player4_key2_attack=noone;
	}#endregion /*Reset Player 4 Keyboard Remapping END*/
	
	menu_delay=10;}
	}
	else
	{
		draw_sprite_ext(spr_menu_button,0,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+768+menu_y_offset,1,1,0,c_white,1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+420,camera_get_view_y(view_camera[view_current])+768+menu_y_offset,"Default Settings",global.default_text_size,c_menu_outline,c_menu_fill,1);
	}
	#endregion /*Reset to Default Settings End*/

	#region /*Show the player when they can input a key to remap controls*/
	if (input_key=true)
	{
		
		#region /*Text saying input key now for player 1*/
		if (remapping_player=1)
		{
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+32,"INPUT KEY NOW FOR PLAYER 1",global.default_text_size,c_menu_outline,c_menu_fill,1);
		}
		#endregion /*Text saying input key now for player 1 END*/
		
		#region /*Text saying input key now for player 2*/
		if (remapping_player=2)
		{
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+32,"INPUT KEY NOW FOR PLAYER 2",global.default_text_size,c_menu_outline,c_menu_fill,1);
		}
		#endregion /*Text saying input key now for player 2 END*/
		
		#region /*Text saying input key now for player 3*/
		if (remapping_player=3)
		{
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+32,"INPUT KEY NOW FOR PLAYER 3",global.default_text_size,c_menu_outline,c_menu_fill,1);
		}
		#endregion /*Text saying input key now for player 3 END*/
		
		#region /*Text saying input key now for player 4*/
		if (remapping_player=4)
		{
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+32,"INPUT KEY NOW FOR PLAYER 4",global.default_text_size,c_menu_outline,c_menu_fill,1);
		}
		#endregion /*Text saying input key now for player 4 END*/
		
	}
	#endregion /*Show the player when they can input a key to remap controls END*/

	#region /*Keyboards Controls Remapping Navigation*/
	
	#region /*Remap key jump*/
	if (menu="remap_key_jump")
	{
		if (key_up)
		and(menu_delay=0)
		{
			menu="remap_select_player";
			menu_delay=10;
		}
		else
		if (key_down)
		and(menu_delay=0)
		{
			menu="remap_key_crouch";
			menu_delay=10;
		}
	}
	else
	#endregion /*Remap key jump END*/
	
	#region /*Remap key crouch*/
	if (menu="remap_key_crouch")
	{
		if (key_up)
		and(menu_delay=0)
		{
			menu="remap_key_jump";
			menu_delay=10;
		}
		else
		if (key_down)
		and(menu_delay=0)
		{
			menu="remap_key_crouch_toggle";
			menu_delay=10;
		}
	}
	else
	#endregion /*Remap key crouch END*/
	
	#region /*Remap key crouch toggle*/
	if (menu="remap_key_crouch_toggle")
	{
		if (key_up)
		and(menu_delay=0)
		{
			menu="remap_key_crouch";
			menu_delay=10;
		}
		else
		if (key_down)
		and(menu_delay=0)
		{
			menu="remap_key_dive";
			menu_delay=10;
		}
	}
	else
	#endregion /*Remap key crouch toggle END*/
	
	#region /*Remap key dive*/
	if (menu="remap_key_dive")
	{
		if (key_up)
		and(menu_delay=0)
		{
			menu="remap_key_crouch_toggle";
			menu_delay=10;
		}
		else
		if (key_down)
		and(menu_delay=0)
		{
			menu="remap_key_sprint";
			menu_delay=10;
		}
	}
	else
	#endregion /*Remap key dive END*/
	
	#region /*Remap key sprint*/
	if (menu="remap_key_sprint")
	{
		if (key_up)
		and(menu_delay=0)
		{
			menu="remap_key_dive";
			menu_delay=10;
		}
		else
		if (key_down)
		and(menu_delay=0)
		{
			menu="remap_key_sprint_toggle";
			menu_delay=10;
		}
	}
	else
	#endregion /*Remap key sprint END*/
	
	#region /*Remap key sprint toggle*/
	if (menu="remap_key_sprint_toggle")
	{
		if (key_up)
		and(menu_delay=0)
		{
			menu="remap_key_sprint";
			menu_delay=10;
		}
		else
		if (key_down)
		and(menu_delay=0)
		{
			menu="remap_key_left";
			menu_delay=10;
		}
	}
	else
	#endregion /*Remap key sprint toggle END*/
	
	#region /*Remap key left*/
	if (menu="remap_key_left")
	{
		if (key_up)
		and(menu_delay=0)
		{
			menu="remap_key_sprint_toggle";
			menu_delay=10;
		}
		else
		if (key_down)
		and(menu_delay=0)
		{
			menu="remap_key_right";
			menu_delay=10;
		}
	}
	else
	#endregion /*Remap key left END*/
	
	#region /*Remap key right*/
	if (menu="remap_key_right")
	{
		if (key_up)
		and(menu_delay=0)
		{
			menu="remap_key_left";
			menu_delay=10;
		}
		else
		if (key_down)
		and(menu_delay=0)
		{
			menu="remap_key_down";
			menu_delay=10;
		}
	}
	else
	#endregion /*Remap key right END*/
	
	#region /*Remap key down*/
	if (menu="remap_key_down")
	{
		if (key_up)
		and(menu_delay=0)
		{
			menu="remap_key_right";
			menu_delay=10;
		}
		else
		if (key_down)
		and(menu_delay=0)
		{
			menu="remap_key_up";
			menu_delay=10;
		}
	}
	else
	#endregion /*Remap key down END*/
	
	#region /*Remap key up*/
	if (menu="remap_key_up")
	{
		if (key_up)
		and(menu_delay=0)
		{
			menu="remap_key_down";
			menu_delay=10;
		}
		else
		if (key_down)
		and(menu_delay=0)
		{
			menu="remap_key_attack";
			menu_delay=10;
		}
	}
	else
	#endregion /*Remap key up END*/
	
	#region /*Remap key attack*/
	if (menu="remap_key_attack")
	{
		if (key_up)
		and(menu_delay=0)
		{
			menu="remap_key_up";
			menu_delay=10;
		}
		else
		if (key_down)
		and(menu_delay=0)
		{
			menu="remap_reset";
			menu_delay=10;
		}
	}
	else
	#endregion /*Remap key attack END*/
	
	#region /*Remap reset*/
	if (menu="remap_reset")
	{
		if (key_up)
		and(menu_delay=0)
		{
			menu="remap_key_attack";
			menu_delay=10;
		}
		else
		if (key_down)
		and(menu_delay=0)
		{
			menu="up_key_is_jump_key";
			menu_delay=10;
		}
	}
	#endregion /*Remap reset END*/
	
	#region /*Menu remap key number*/
	if (menu="remap_key_jump")
	or(menu="remap_key_crouch")
	or(menu="remap_key_crouch_toggle")
	or(menu="remap_key_sprint")
	or(menu="remap_key_sprint_toggle")
	or(menu="remap_key_left")
	or(menu="remap_key_right")
	or(menu="remap_key_down")
	or(menu="remap_key_up")
	or(menu="remap_key_attack")
	{
		if (key_left)
		or(key_right)
		{
			if (menu_remap_key_number=0)
			and(menu_delay=0)
			{
				menu_remap_key_number=2;
				menu_delay=10;
			}
			else
			if (menu_remap_key_number=2)
			and(menu_delay=0)
			{
				menu_remap_key_number=0;
				menu_delay=10;
			}
		}
	}
	#endregion /*Menu remap key number*/
	
	#endregion /*Keyboards Controls Remapping Navigation END*/

	#endregion /*Remap Keyboard and Mouse End*/

	#region /*Up Key Is Jump Key*/
	if (remapping_player=1){if (menu="up_key_is_jump_key"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=810;
	if (global.player1_up_key_is_jump_key=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}
	else if (global.player1_up_key_is_jump_key=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	else if (remapping_player=2){if (menu="up_key_is_jump_key"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=810;
	if (global.player2_up_key_is_jump_key=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}
	else if (global.player2_up_key_is_jump_key=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	else if (remapping_player=3){if (menu="up_key_is_jump_key"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=810;
	if (global.player3_up_key_is_jump_key=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}
	else if (global.player3_up_key_is_jump_key=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	else if (remapping_player=4){if (menu="up_key_is_jump_key"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=810;
	if (global.player4_up_key_is_jump_key=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}
	else if (global.player4_up_key_is_jump_key=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+810+menu_y_offset,"Up key is jump key",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	#endregion /*Up Key Is Jump Key END*/

	#region /*Double tap direction to run*/
	if (remapping_player=1){if (menu="double_tap_to_run"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=850;
	if (global.player1_double_tap_to_run=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}
	else if (global.player1_double_tap_to_run=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	else if (remapping_player=2){if (menu="double_tap_to_run"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=850;
	if (global.player2_double_tap_to_run=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}
	else if (global.player2_double_tap_to_run=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	else if (remapping_player=3){if (menu="double_tap_to_run"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=850;
	if (global.player3_double_tap_to_run=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}
	else if (global.player3_double_tap_to_run=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	else if (remapping_player=4){if (menu="double_tap_to_run"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=850;
	if (global.player4_double_tap_to_run=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}
	else if (global.player4_double_tap_to_run=true){draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+430,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,0.5,0.5,0,c_white,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+460,camera_get_view_y(view_camera[view_current])+850+menu_y_offset,"Double tap direction to run",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	#endregion /*Double tap direction to run END*/

	#region /*Wall Jump Setting*/
	if (remapping_player=1){if (menu="wall_jump_setting"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=890;

	if (global.player1_wall_jump_setting=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: Off",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else if (global.player1_wall_jump_setting=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When touching wall",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When holding towards wall",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}

	else if (global.player1_wall_jump_setting=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: Off",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else if (global.player1_wall_jump_setting=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When touching wall",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When holding towards wall",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	else if (remapping_player=2){if (menu="wall_jump_setting"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=890;

	if (global.player2_wall_jump_setting=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: Off",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else if (global.player2_wall_jump_setting=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When touching wall",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When holding towards wall",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}

	else if (global.player2_wall_jump_setting=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: Off",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else if (global.player2_wall_jump_setting=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When touching wall",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When holding towards wall",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	else if (remapping_player=3){if (menu="wall_jump_setting"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=890;

	if (global.player3_wall_jump_setting=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: Off",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else if (global.player3_wall_jump_setting=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When touching wall",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When holding towards wall",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}

	else if (global.player3_wall_jump_setting=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: Off",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else if (global.player3_wall_jump_setting=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When touching wall",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When holding towards wall",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	else if (remapping_player=4){if (menu="wall_jump_setting"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=890;

	if (global.player4_wall_jump_setting=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: Off",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else if (global.player4_wall_jump_setting=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When touching wall",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When holding towards wall",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}

	else if (global.player4_wall_jump_setting=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: Off",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else if (global.player4_wall_jump_setting=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When touching wall",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+890+menu_y_offset,"Walljump: When holding towards wall",global.default_text_size,c_menu_outline,c_menu_fill,1);}}

	#endregion /*Wall Jump Settings END*/

	#region /*Drop down from Rope*/
	if (remapping_player=1){if (menu="drop_from_rope"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=930;
	if (key_left){if (global.player1_drop_from_rope>0){global.player1_drop_from_rope-=1;}else{global.player1_drop_from_rope=4;}}if (key_right)or(key_a){if (global.player1_drop_from_rope<4){global.player1_drop_from_rope+=1;}else{global.player1_drop_from_rope=0;}}

	if (global.player1_drop_from_rope=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Release Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_drop_from_rope=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down or Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_drop_from_rope=2){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Down",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_drop_from_rope=3){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_drop_from_rope=4){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down + Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	}else
	{
	if (global.player1_drop_from_rope=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Release Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_drop_from_rope=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down or Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_drop_from_rope=2){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Down",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_drop_from_rope=3){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_drop_from_rope=4){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down + Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	}
	}else

	if (remapping_player=2){if (menu="drop_from_rope"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=930;
	if (key_left){if (global.player2_drop_from_rope>0){global.player2_drop_from_rope-=1;}else{global.player2_drop_from_rope=4;}}if (key_right)or(key_a){if (global.player2_drop_from_rope<4){global.player2_drop_from_rope+=1;}else{global.player2_drop_from_rope=0;}}
	
	if (global.player2_drop_from_rope=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Release Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_drop_from_rope=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down or Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_drop_from_rope=2){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Down",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_drop_from_rope=3){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_drop_from_rope=4){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down + Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	}else
	{
	if (global.player2_drop_from_rope=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Release Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_drop_from_rope=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down or Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_drop_from_rope=2){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Down",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_drop_from_rope=3){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_drop_from_rope=4){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down + Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	}
	}else

	if (remapping_player=3){if (menu="drop_from_rope"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=930;
	if (key_left){if (global.player3_drop_from_rope>0){global.player3_drop_from_rope-=1;}else{global.player3_drop_from_rope=4;}}if (key_right)or(key_a){if (global.player3_drop_from_rope<4){global.player3_drop_from_rope+=1;}else{global.player3_drop_from_rope=0;}}

	if (global.player3_drop_from_rope=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Release Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_drop_from_rope=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down or Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_drop_from_rope=2){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Down",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_drop_from_rope=3){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_drop_from_rope=4){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down + Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	}else
	{
	if (global.player3_drop_from_rope=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Release Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_drop_from_rope=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down or Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_drop_from_rope=2){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Down",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_drop_from_rope=3){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_drop_from_rope=4){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down + Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	}
	}else

	if (remapping_player=4){if (menu="drop_from_rope"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=930;
	if (key_left){if (global.player4_drop_from_rope>0){global.player4_drop_from_rope-=1;}else{global.player4_drop_from_rope=4;}}if (key_right)or(key_a){if (global.player4_drop_from_rope<4){global.player4_drop_from_rope+=1;}else{global.player4_drop_from_rope=0;}}

	if (global.player4_drop_from_rope=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Release Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_drop_from_rope=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down or Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_drop_from_rope=2){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Down",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_drop_from_rope=3){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_drop_from_rope=4){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down + Jump",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	}else
	{
	if (global.player4_drop_from_rope=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Release Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_drop_from_rope=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down or Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_drop_from_rope=2){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Down",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_drop_from_rope=3){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Only Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_drop_from_rope=4){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+930+menu_y_offset,"Drop down from rope: Down + Jump",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	}
	}

	#endregion /*Drop down from Rope END*/

	#region /*Show Controls*/
	if (os_type!=os_ios)and(os_type!=os_android){
	if (remapping_player=1){if (menu="show_controls"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=970;
	if (global.player1_show_controls<=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Never Show",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_show_controls=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player1_show_controls)+" Second",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_show_controls>=2)and(global.player1_show_controls<=9){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player1_show_controls)+" Seconds",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_show_controls>=10){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Always Show",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else

	if (global.player1_show_controls<=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Never Show",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_show_controls=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player1_show_controls)+" Second",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_show_controls>=2)and(global.player1_show_controls<=9){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player1_show_controls)+" Seconds",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player1_show_controls>=10){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Always Show",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	}else

	if (remapping_player=2){if (menu="show_controls"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=970;
	if (global.player2_show_controls<=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Never Show",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_show_controls=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player2_show_controls)+" Second",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_show_controls>=2)and(global.player2_show_controls<=9){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player2_show_controls)+" Seconds",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_show_controls>=10){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Always Show",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else

	if (global.player2_show_controls<=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Never Show",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_show_controls=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player2_show_controls)+" Second",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_show_controls>=2)and(global.player2_show_controls<=9){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player2_show_controls)+" Seconds",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player2_show_controls>=10){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Always Show",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	}else

	if (remapping_player=3){if (menu="show_controls"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=970;
	if (global.player3_show_controls<=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Never Show",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_show_controls=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player3_show_controls)+" Second",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_show_controls>=2)and(global.player3_show_controls<=9){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player3_show_controls)+" Seconds",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_show_controls>=10){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Always Show",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else

	if (global.player3_show_controls<=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Never Show",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_show_controls=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player3_show_controls)+" Second",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_show_controls>=2)and(global.player3_show_controls<=9){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player3_show_controls)+" Seconds",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player3_show_controls>=10){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Always Show",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	}else

	if (remapping_player=4){if (menu="show_controls"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,1,1,0,c_white,1);menu_cursor_y_position=970;
	if (global.player4_show_controls<=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,">Show Controls: Never Show",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_show_controls=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player4_show_controls)+" Second",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_show_controls>=2)and(global.player4_show_controls<=9){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player4_show_controls)+" Seconds",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_show_controls>=10){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Always Show",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else
	
	if (global.player4_show_controls<=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Never Show",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_show_controls=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player4_show_controls)+" Second",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_show_controls>=2)and(global.player4_show_controls<=9){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls After: "+string(global.player4_show_controls)+" Seconds",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	if (global.player4_show_controls>=10){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+970+menu_y_offset,"Show Controls: Always Show",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	}

	}#endregion /*Show Controls END*/

	}#endregion /*Controls Settings END*/
	
	#region /*General Settings*/
	
	#region /*Gameplay Settings*/
	if (menu="show_tutorial_signs")or(menu="hud_hide_time")or(menu="players_can_collide")or(menu="assist_settings")or(menu="convention_mode"){

	if (menu="show_tutorial_signs"){
	if (global.show_tutorial_signs=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"> Show Tutorial Signs: True",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"> Show Tutorial Signs: False",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else
	if (global.show_tutorial_signs=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Show Tutorial Signs: True",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Show Tutorial Signs: False",global.default_text_size,c_menu_outline,c_menu_fill,1);}

	if (menu="hud_hide_time"){

	/*HUD hide timer: 1 Second*/if (global.hud_show_timer>0)and(global.hud_show_timer<=60){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"HUD hide timer: "+string(global.hud_show_timer/60)+" Second",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}/*HUD hide timer END*/
	/*HUD hide timer: 2 or more Seconds*/else if (global.hud_show_timer>60)and(global.hud_show_timer<600){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"HUD hide timer: "+string(global.hud_show_timer/60)+" Seconds",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}/*HUD hide timer END*/
	/*HUD hide timer: Never show*/else if (global.hud_show_timer<=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"HUD: Never show",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}/*HUD hide timer: Never show END*/
	/*HUD hide timer: Always show*/else if (global.hud_show_timer>=600){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"HUD: Always show",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}/*HUD hide timer: Always show END*/
	}else
	{
	/*HUD hide timer: 1 Second*/if (global.hud_show_timer>0)and(global.hud_show_timer<=60){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"HUD hide timer: "+string(global.hud_show_timer/60)+" Second",global.default_text_size,c_menu_outline,c_menu_fill,1);}/*HUD hide timer END*/
	/*HUD hide timer: 2 or more Seconds*/else if (global.hud_show_timer>60)and(global.hud_show_timer<600){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"HUD hide timer: "+string(global.hud_show_timer/60)+" Seconds",global.default_text_size,c_menu_outline,c_menu_fill,1);}/*HUD hide timer END*/
	/*HUD hide timer: Never show*/else if (global.hud_show_timer<=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"HUD: Never show",global.default_text_size,c_menu_outline,c_menu_fill,1);}/*HUD hide timer: Never show END*/
	/*HUD hide timer: Always show*/else if (global.hud_show_timer>=600){draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"HUD: Always show",global.default_text_size,c_menu_outline,c_menu_fill,1);}/*HUD hide timer: Always show END*/
	}

	if (menu="players_can_collide"){
	if (global.players_can_collide=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"> Players can collide with each other: True",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"> Players can collide with each other: False",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}
	else if (global.players_can_collide=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Players can collide with each other: True",global.default_text_size,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Players can collide with each other: False",global.default_text_size,c_menu_outline,c_menu_fill,1);}

	if (menu="assist_settings")
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+140,"> Assist Settings <",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+140,"Assist Settings",global.default_text_size,c_menu_outline,c_menu_fill,1);}

	if (menu="convention_mode"){
	if (global.convention_mode=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170,"> Convention Mode: True",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+190,"Puts the game in a special convention mode for event showcasing",global.default_text_size*0.5,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170,"> Convention Mode: False",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+190,"Puts the game in a special convention mode for event showcasing",global.default_text_size*0.5,c_menu_outline,c_menu_fill,1);}}else
	if (global.convention_mode=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170,"Convention Mode: True",global.default_text_size,c_menu_outline,c_menu_fill,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+190,"Puts the game in a special convention mode for event showcasing",global.default_text_size*0.5,c_menu_outline,c_menu_fill,1);}
	else{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170,"Convention Mode: False",global.default_text_size,c_menu_outline,c_menu_fill,1);draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+190,"Puts the game in a special convention mode for event showcasing",global.default_text_size*0.5,c_menu_outline,c_menu_fill,1);}
	}#endregion /*Gameplay Settings END*/
	
	#region /*Profile Settings*/
	if (global.settings_sidebar_menu="profile_settings"){
	draw_set_halign(fa_left);draw_set_valign(fa_center);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*3),"Setup your profile here. \n Enter name here.",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	#endregion /*Profile Settings END*/
	
	#region /*Graphics Settings*/
	if (global.settings_sidebar_menu="video_settings"){

	#region /*Fullscreen toggle*/
	if (window_get_fullscreen())
	{
		draw_menu_checkmark(386,48,"Fullscreen","fullscreen_mode",true);
	}
	else
	{
		draw_menu_checkmark(386,48,"Fullscreen","fullscreen_mode",false);
	}
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	#endregion /*Fullscreen toggle END*/

	draw_set_halign(fa_left);draw_set_valign(fa_center);
	if (menu="interpolate"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-230,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,1,1,0,c_white,1);
	if (global.interpolate=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"Interpolation:",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,0.5,0.5,0,c_white,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"Interpolation:",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,0.5,0.5,0,c_white,1);}}else
	if (global.interpolate=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"Interpolation:",global.default_text_size,c_menu_outline,c_menu_fill,1);draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,0.4,0.4,0,c_dkgray,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"Interpolation:",global.default_text_size,c_menu_outline,c_menu_fill,1);draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,0.4,0.4,0,c_dkgray,1);}

	if (menu="show_fps"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-230,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,1,1,0,c_white,1);
	if (global.show_fps=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Show FPS:",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,0.5,0.5,0,c_white,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Show FPS:",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,0.5,0.5,0,c_white,1);}}else
	if (global.show_fps=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Show FPS:",global.default_text_size,c_menu_outline,c_menu_fill,1);draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,0.4,0.4,0,c_dkgray,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Show FPS:",global.default_text_size,c_menu_outline,c_menu_fill,1);draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,0.4,0.4,0,c_dkgray,1);}

	#region /*Background Brightness Bar*/
	if (menu="background_brightness"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-230,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170,1,1,0,c_white,1);
	draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-160-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10-2,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+160+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10+2,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill);}
	/*Draw a little arrow indicating what the default volume is*/draw_set_color(c_menu_fill);draw_arrow(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-20,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,25);
	draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-160,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+160,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_black,c_white,c_white,c_black,false);
	if (global.background_brightness=+1){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+160-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+160+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=+0.9){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+144-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+144+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=+0.8){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+128-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+128+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=+0.7){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+112-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+112+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=+0.6){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+96-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+96+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=+0.5){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+80-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+80+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=+0.4){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+64-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+64+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=+0.3){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+48-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+48+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=+0.2){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+32-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+32+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=+0.1){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+16-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+16+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=0){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=-0.1){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-16-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-16+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=-0.2){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-32-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-32+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=-0.3){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-48-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-48+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=-0.4){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-64-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-64+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=-0.5){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-80-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-80+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=-0.6){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-96-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-96+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=-0.7){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-112-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-112+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=-0.8){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-128-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-128+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=-0.9){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-144-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-144+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}
	if (global.background_brightness=-1){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-160-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170-10,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-160+2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+170+10,c_menu_fill,c_menu_fill,c_menu_fill,c_menu_fill,false);}#endregion /*Background Brightness Bar END*/

	draw_set_halign(fa_center);draw_set_valign(fa_center);
	if (menu="background_brightness"){
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+140,"Background Brightness:",global.default_text_size*0.6,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+140,"Background Brightness:",global.default_text_size*0.5,c_menu_outline,c_menu_fill,1);}
	if (global.background_brightness>-0.1)and(global.background_brightness<+0.1){global.background_brightness=0;}

	draw_set_halign(fa_center);draw_set_valign(fa_center);
	if (menu="background_layers"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-230,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+200,1,1,0,c_white,1);
	draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+200,"Background Layers",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+200,"Background Layers",global.default_text_size,c_menu_outline,c_menu_fill,1);}

	draw_set_halign(fa_left);draw_set_valign(fa_center);
	if (menu="enable_transitions"){draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-230,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+230,1,1,0,c_white,1);
	if (global.enable_transitions=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+230,"Enable Transitions:",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+230,0.5,0.5,0,c_white,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+230,"Enable Transitions:",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+230,0.5,0.5,0,c_white,1);}}else
	if (global.enable_transitions=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+230,"Enable Transitions:",global.default_text_size,c_menu_outline,c_menu_fill,1);draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+230,0.4,0.4,0,c_dkgray,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+230,"Enable Transitions:",global.default_text_size,c_menu_outline,c_menu_fill,1);draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+200,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+230,0.4,0.4,0,c_dkgray,1);}

	}

	#region /*Enable and Disable Background Layers*/
	if (menu="enable_background_layer1")or(menu="enable_background_layer2")or(menu="enable_background_layer3")or(menu="enable_background_layer4")or(menu="enable_foreground_layer1")or(menu="enable_foreground_layer2"){

	if (menu="enable_background_layer1"){
	if (global.enable_background_layer1=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"> Enable Background Layer 1: True",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"> Enable Background Layer 1: False",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else
	if (global.enable_background_layer1=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Enable Background Layer 1: True",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+50,"Enable Background Layer 1: False",global.default_text_size,c_menu_outline,c_menu_fill,1);}

	if (menu="enable_background_layer2"){
	if (global.enable_background_layer2=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"> Enable Background Layer 2: True",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"> Enable Background Layer 2: False",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else
	if (global.enable_background_layer2=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"Enable Background Layer 2: True",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+80,"Enable Background Layer 2: False",global.default_text_size,c_menu_outline,c_menu_fill,1);}

	if (menu="enable_background_layer3"){
	if (global.enable_background_layer3=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"> Enable Background Layer 3: True",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"> Enable Background Layer 3: False",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else
	if (global.enable_background_layer3=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Enable Background Layer 3: True",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+110,"Enable Background Layer 3: False",global.default_text_size,c_menu_outline,c_menu_fill,1);}

	if (menu="enable_background_layer4"){
	if (global.enable_background_layer4=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+140,"> Enable Background Layer 4: True",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+140,"> Enable Background Layer 4: False",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else
	if (global.enable_background_layer4=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+140,"Enable Background Layer 4: True",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+140,"Enable Background Layer 4: False",global.default_text_size,c_menu_outline,c_menu_fill,1);}

	if (menu="enable_foreground_layer1"){
	if (global.enable_foreground_layer1=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+180,"> Enable Foreground Layer 1: True",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+180,"> Enable Foreground Layer 1: False",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else
	if (global.enable_foreground_layer1=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+180,"Enable Foreground Layer 1: True",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+180,"Enable Foreground Layer 1: False",global.default_text_size,c_menu_outline,c_menu_fill,1);}

	if (menu="enable_foreground_layer2"){
	if (global.enable_foreground_layer2=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+210,"> Enable Foreground Layer 2: True",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+210,"> Enable Foreground Layer 2: False",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}}else
	if (global.enable_foreground_layer2=true)
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+210,"Enable Foreground Layer 2: True",global.default_text_size,c_menu_outline,c_menu_fill,1);}else
	{draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+210,"Enable Foreground Layer 2: False",global.default_text_size,c_menu_outline,c_menu_fill,1);}

	}

	#endregion /*Enable and Disable Background Layers END*/
	
	#endregion /*Graphics Settings END*/
	
	#region /*Audio Settings*/
	if (global.settings_sidebar_menu="audio_settings")
	{

	#region /*Make volumes stay between 0 and 1*/
	if (global.music_volume<0){global.music_volume=0;}else
	if (global.music_volume>1){global.music_volume=1;}
	if (global.sfx_volume<0){global.sfx_volume=0;}else
	if (global.sfx_volume>1){global.sfx_volume=1;}
	if (global.voices_volume<0){global.voices_volume=0;}else
	if (global.voices_volume>1){global.voices_volume=1;}
	if (global.verbosity_slider<0){global.verbosity_slider=0;}else
	if (global.verbosity_slider>1){global.verbosity_slider=1;}
	#endregion /*Make volumes stay between 0 and 1 END*/
	
	#region /*Draw bars that represent how much volume each channel have*/
	
	#region /*Music Bar*/
	if (menu="music_volume"){
	draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410-2,camera_get_view_y(view_camera[view_current])+20+(40*2)-5-2,camera_get_view_x(view_camera[view_current])+410+320+2,camera_get_view_y(view_camera[view_current])+20+(40*2)+5+2,c_black,c_black,c_black,c_black,false);}
	//*Draw a little arrow indicating what the default volume is*/draw_set_color(c_red);draw_arrow(camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+20+(40*2)+35,camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+20+(40*2)+45,25);
	draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
	if (global.music_volume=1){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.95){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+304,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.9){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+288,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.85){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+272,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.8){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+256,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.75){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+240,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.7){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+224,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.65){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+208,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.6){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+192,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.55){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+176,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.5){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+160,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.45){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+144,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.4){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+128,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.35){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+112,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.3){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+96,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.25){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+80,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.2){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+64,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.15){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+48,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.1){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+32,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}
	if (global.music_volume=0.05){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*2)-5,camera_get_view_x(view_camera[view_current])+410+16,camera_get_view_y(view_camera[view_current])+20+(40*2)+5,c_red,c_red,c_red,c_red,false);}#endregion /*Music Bar END*/
	
	#region /*Sound Effects Bar*/
	if (menu="sfx_volume"){
	draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410-2,camera_get_view_y(view_camera[view_current])+20+(40*4)-5-2,camera_get_view_x(view_camera[view_current])+410+320+2,camera_get_view_y(view_camera[view_current])+20+(40*4)+5+2,c_black,c_black,c_black,c_black,false);}
	//*Draw a little arrow indicating what the default volume is*/draw_set_color(c_lime);draw_arrow(camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+65,camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+75,25);
	draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
	if (global.sfx_volume=1){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.95){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+304,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.9){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+288,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.85){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+272,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.8){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+256,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.75){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+240,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.7){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+224,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.65){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+208,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.6){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+192,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.55){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+176,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.5){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+160,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.45){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+144,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.4){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+128,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.35){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+112,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.3){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+96,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.25){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+80,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.2){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+64,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.15){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+48,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.1){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+32,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	if (global.sfx_volume=0.05){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*4)-5,camera_get_view_x(view_camera[view_current])+410+16,camera_get_view_y(view_camera[view_current])+20+(40*4)+5,c_lime,c_lime,c_lime,c_lime,false);}
	#endregion /*Sound Effects Bar END*/
	
	#region /*Voices Bar*/
	if (menu="voices_volume"){
	draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410-2,camera_get_view_y(view_camera[view_current])+20+(40*6)-5-2,camera_get_view_x(view_camera[view_current])+410+320+2,camera_get_view_y(view_camera[view_current])+20+(40*6)+5+2,c_black,c_black,c_black,c_black,false);}
	//*Draw a little arrow indicating what the default volume is*/draw_set_color(c_aqua);draw_arrow(camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+95,camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+105,25);
	draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
	if (global.voices_volume=1){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.95){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+304,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.9){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+288,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.85){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+272,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.8){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+256,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.75){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+240,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.7){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+224,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.65){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+208,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.6){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+192,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.55){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+176,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.5){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+160,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.45){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+144,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.4){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+128,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.35){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+112,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.3){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+96,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.25){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+80,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.2){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+64,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.15){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+48,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.1){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+32,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.voices_volume=0.05){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*6)-5,camera_get_view_x(view_camera[view_current])+410+16,camera_get_view_y(view_camera[view_current])+20+(40*6)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	#endregion /*Voices Bar END*/
	
	#region /*Voices Bar*/
	if (menu="verbosity_slider"){
	draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410-2,camera_get_view_y(view_camera[view_current])+20+(40*8)-5-2,camera_get_view_x(view_camera[view_current])+410+320+2,camera_get_view_y(view_camera[view_current])+20+(40*8)+5+2,c_black,c_black,c_black,c_black,false);}
	//*Draw a little arrow indicating what the default volume is*/draw_set_color(c_aqua);draw_arrow(camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+95,camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+menu_y_offset+105,25);
	draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
	if (global.verbosity_slider=1){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+320,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.95){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+304,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.9){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+288,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.85){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+272,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.8){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+256,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.75){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+240,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.7){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+224,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.65){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+208,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.6){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+192,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.55){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+176,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.5){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+160,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.45){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+144,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.4){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+128,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.35){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+112,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.3){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+96,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.25){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+80,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.2){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+64,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.15){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+48,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.1){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+32,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	if (global.verbosity_slider=0.05){draw_rectangle_colour(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*8)-5,camera_get_view_x(view_camera[view_current])+410+16,camera_get_view_y(view_camera[view_current])+20+(40*8)+5,c_aqua,c_aqua,c_aqua,c_aqua,false);}
	#endregion /*Voices Bar END*/
	
	#endregion /*Draw bars that represent how much volume each channel have END*/
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	
	#region /*Music Volume*/
	if (menu="music_volume")
	{
		draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+20+(40*1),1,1,0,c_white,1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*1),"Music Volume: "+string(round(global.music_volume*100))+"%",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	}
	else
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*1),"Music Volume: "+string(round(global.music_volume*100))+"%",global.default_text_size,c_menu_outline,c_menu_fill,1);
	}
	#endregion /*Music Volume END*/
	
	#region /*Sound Volume*/
	if (menu="sfx_volume")
	{
		draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+20+(40*3),1,1,0,c_white,1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*3),"Sound Volume: "+string(round(global.sfx_volume*100))+"%",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	}
	else
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*3),"Sound Volume: "+string(round(global.sfx_volume*100))+"%",global.default_text_size,c_menu_outline,c_menu_fill,1);
	}
	#endregion /*Sound Volume END*/
	
	#region /*Voices Volume*/
	if (menu="voices_volume")
	{
		draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+20+(40*5),1,1,0,c_white,1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*5),"Voices Volume: "+string(round(global.voices_volume*100))+"%",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	}
	else
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*5),"Voices Volume: "+string(round(global.voices_volume*100))+"%",global.default_text_size,c_menu_outline,c_menu_fill,1);
	}
	#endregion /*Voices Volume END*/
	
	#region /*Verbosity Slider*/
	if (menu="verbosity_slider")
	{
		draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+20+(40*7),1,1,0,c_white,1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*7),"Verbosity: "+string(round(global.verbosity_slider*100))+"%",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);
	}
	else
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*7),"Verbosity: "+string(round(global.verbosity_slider*100))+"%",global.default_text_size,c_menu_outline,c_menu_fill,1);
	}
	#endregion /*Verbosity Slider END*/
	
	#region /*Select Narrator*/
	if (menu="select_narrator")
	{
		draw_sprite_ext(spr_menu_cursor,menu_cursor_index,camera_get_view_x(view_camera[view_current])+390,camera_get_view_y(view_camera[view_current])+20+(40*9),1,1,0,c_white,1);
		if (global.narrator=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*9),"Narrator: Nobody",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
		if (global.narrator>=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*9),"Narrator: "+string(narrator_name),global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	}
	else
	{
		if (global.narrator=0){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*9),"Narrator: Nobody",global.default_text_size,c_menu_outline,c_menu_fill,1);}
		if (global.narrator>=1){draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*9),"Narrator: "+string(narrator_name),global.default_text_size,c_menu_outline,c_menu_fill,1);}
	}
	#endregion /*Select Narrator END*/
	
	}
	#endregion /*Audio Settings END*/
	
	#region /*Language Options*/
	if (global.settings_sidebar_menu="language_settings"){draw_set_halign(fa_left);draw_set_valign(fa_center);

	/*Language y positions*/
	var pos_ar_sa=1;
	var pos_id_id=2;
	var pos_da_dk=3;
	var pos_de_de=4;
	var pos_en_gb=5;
	var pos_en_us=6;
	var pos_es_es=7;
	var pos_es_mx=8;
	var pos_fr_ca=9;
	var pos_fr_fr=10;
	var pos_it_it=11;
	var pos_hu_hu=12;
	var pos_nl_nl=13;
	var pos_nb_no=14;
	var pos_pl_pl=15;
	var pos_pt_br=16;
	var pos_pt_pt=17;
	var pos_sk_sk=18;
	var pos_fi_fi=19;
	var pos_sv_se=20;
	var pos_th_th=21;
	var pos_tr_tr=22;
	var pos_cs_cz=23;
	var pos_el_gr=24;
	var pos_bg_bg=25;
	var pos_ru_ru=26;
	var pos_uk_ua=27;
	var pos_ja_jp=28;
	var pos_zh_cn=29;
	var pos_zh_tw=30;
	var pos_ko_kr=31;
	
	var i;
	for(i=0;i<array_length_1d(languages);i+=1;)
	{
		draw_menu_button(500,42*i+42,languages[i],noone,noone);
	}
	
	#region /*Arabic*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_ar_sa)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_ar_sa)+19)){
	//menu="language_ar_sa";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.ar_sa;menu_delay=10;}}
	//if (global.language_localization=localization.ar_sa){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_ar_sa)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_ar_sa)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_ar_sa"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_ar_sa)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_ar_sa)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.ar_sa){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_ar_sa),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_ar_sa),0.5,0.5,0,c_white,1);}
	//if (menu="language_ar_sa"){if (key_down)and(menu_delay=0){menu="language_id_id";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.ar_sa;}
	///*Text*/if (asset_get_type("font_other_languages")==asset_font){draw_set_font(font_other_languages);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_ar_sa),"اللغة العربية",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_other_languages")==asset_font){draw_set_font(font_other_languages);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_ar_sa),"اللغة العربية",global.default_text_size*1,c_black,c_white,1);}
	#endregion /*Arabic END*/

	#region /*Indonesian*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_id_id)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_id_id)+19)){
	//menu="language_id_id";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.id_id;menu_delay=10;}}
	//if (global.language_localization=localization.id_id){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_id_id)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_id_id)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_id_id"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_id_id)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_id_id)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.id_id){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_id_id),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_id_id),0.5,0.5,0,c_white,1);}
	//if (menu="language_id_id"){if (key_up)and(menu_delay=0){menu="language_ar_sa";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_da_dk";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.id_id;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_id_id),"Bahasa Indonesia (Indonesia)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_id_id),"Bahasa Indonesia (Indonesia)",global.default_text_size,c_black,c_white,1);}
	#endregion /*Indonesian END*/
	
	#region /*Danish*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_da_dk)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_da_dk)+19)){
	//menu="language_da_dk";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.da_dk;menu_delay=10;}}
	//if (global.language_localization=localization.da_dk){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_da_dk)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_da_dk)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_da_dk"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_da_dk)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_da_dk)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.da_dk){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_da_dk),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_da_dk),0.5,0.5,0,c_white,1);}
	//if (menu="language_da_dk"){if (key_up)and(menu_delay=0){menu="language_id_id";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_de_de";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.da_dk;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_da_dk),"Dansk (DA)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_da_dk),"Dansk (DA)",global.default_text_size,c_black,c_white,1);}
	#endregion /*Danish END*/
	
	#region /*German*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_de_de)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_de_de)+19)){
	//menu="language_de_de";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.de_de;menu_delay=10;}}
	//if (global.language_localization=localization.de_de){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_de_de)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_de_de)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_de_de"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_de_de)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_de_de)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.de_de){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_de_de),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_de_de),0.5,0.5,0,c_white,1);}
	//if (menu="language_de_de"){if (key_up)and(menu_delay=0){menu="language_da_dk";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_en_gb";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.de_de;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_de_de),"Deutsch (Deutschland)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_de_de),"Deutsch (Deutschland)",global.default_text_size,c_black,c_white,1);}
	#endregion /*German END*/
	
	#region /*British English*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_gb)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_en_gb)+19)){
	//menu="language_en_gb";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.en_gb;menu_delay=10;}}
	//if (global.language_localization=localization.en_gb){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_gb)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_en_gb)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_en_gb"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_gb)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_en_gb)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.en_gb){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_gb),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_gb),0.5,0.5,0,c_white,1);}
	//if (menu="language_en_gb"){if (key_up)and(menu_delay=0){menu="language_de_de";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_en_us";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.en_gb;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_gb),"English (UK)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_gb),"English (UK)",global.default_text_size,c_black,c_white,1);}
	#endregion /*British English END*/
	
	#region /*American English*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_us)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_en_us)+19)){
	//menu="language_en_us";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.en_us;menu_delay=10;}}
	//if (global.language_localization=localization.en_us){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_us)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_en_us)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_en_us"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_us)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_en_us)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.en_us){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_us),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_us),0.5,0.5,0,c_white,1);}
	//if (menu="language_en_us"){if (key_up)and(menu_delay=0){menu="language_en_gb";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_es_es";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.en_us;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_us),"English (US)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_en_us),"English (US)",global.default_text_size,c_black,c_white,1);}
	#endregion /*American English END*/

	#region /*Spanish*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_es)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_es_es)+19)){
	//menu="language_es_es";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.es_es;menu_delay=10;}}
	//if (global.language_localization=localization.es_es){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_es)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_es_es)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_es_es"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_es)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_es_es)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.es_es){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_es),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_es),0.5,0.5,0,c_white,1);}
	//if (menu="language_es_es"){if (key_up)and(menu_delay=0){menu="language_en_us";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_es_mx";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.es_es;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_es),"Español (España)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_es),"Español (España)",global.default_text_size,c_black,c_white,1);}
	#endregion /*Spanish END*/
	
	#region /*Mexican Spanish*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_mx)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_es_mx)+19)){
	//menu="language_es_mx";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.es_mx;menu_delay=10;}}
	//if (global.language_localization=localization.es_mx){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_mx)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_es_mx)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_es_mx"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_mx)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_es_mx)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.es_mx){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_mx),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_mx),0.5,0.5,0,c_white,1);}
	//if (menu="language_es_mx"){if (key_up)and(menu_delay=0){menu="language_es_es";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_fr_ca";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.es_mx;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_mx),"Español (México)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_es_mx),"Español (México)",global.default_text_size,c_black,c_white,1);}
	#endregion /*Mexican Spanish END*/
	
	#region /*Canadian French*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_ca)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_ca)+19)){
	//menu="language_fr_ca";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.fr_ca;menu_delay=10;}}
	//if (global.language_localization=localization.fr_ca){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_ca)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_ca)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_fr_ca"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_ca)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_ca)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.fr_ca){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_ca),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_ca),0.5,0.5,0,c_white,1);}
	//if (menu="language_fr_ca"){if (key_up)and(menu_delay=0){menu="language_es_mx";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_fr_fr";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.fr_ca;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_ca),"Français (Canada)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_ca),"Français (Canada)",global.default_text_size,c_black,c_white,1);}
	#endregion /*Canadian French END*/

	#region /*French*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_fr)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_fr)+19)){
	//menu="language_fr_fr";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.fr_fr;menu_delay=10;}}
	//if (global.language_localization=localization.fr_fr){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_fr)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_fr)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_fr_fr"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_fr)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_fr)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.fr_fr){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_fr),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_fr),0.5,0.5,0,c_white,1);}
	//if (menu="language_fr_fr"){if (key_up)and(menu_delay=0){menu="language_fr_ca";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_it_it";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.fr_fr;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_fr),"Français (France)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_fr_fr),"Français (France)",global.default_text_size,c_black,c_white,1);}
	#endregion /*French END*/
	
	#region /*Italian*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_it_it)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_it_it)+19)){
	//menu="language_it_it";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.it_it;menu_delay=10;}}
	//if (global.language_localization=localization.it_it){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_it_it)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_it_it)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_it_it"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_it_it)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_it_it)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.it_it){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_it_it),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_it_it),0.5,0.5,0,c_white,1);}
	//if (menu="language_it_it"){if (key_up)and(menu_delay=0){menu="language_fr_fr";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_hu_hu";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.it_it;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_it_it),"Italiano (Italia)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_it_it),"Italiano (Italia)",global.default_text_size,c_black,c_white,1);}
	#endregion /*Italian END*/
	
	#region /*Hungarian*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_hu_hu)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_hu_hu)+19)){
	//menu="language_hu_hu";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.hu_hu;menu_delay=10;}}
	//if (global.language_localization=localization.hu_hu){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_hu_hu)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_hu_hu)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_hu_hu"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_hu_hu)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_hu_hu)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.hu_hu){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_hu_hu),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_hu_hu),0.5,0.5,0,c_white,1);}
	//if (menu="language_hu_hu"){if (key_up)and(menu_delay=0){menu="language_it_it";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_nl_nl";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.hu_hu;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_hu_hu),"Magyar (HU)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_hu_hu),"Magyar (HU)",global.default_text_size,c_black,c_white,1);}
	#endregion /*Hungarian END*/
	
	#region /*Dutch*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_nl_nl)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_nl_nl)+19)){
	//menu="language_nl_nl";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.nl_nl;menu_delay=10;}}
	//if (global.language_localization=localization.nl_nl){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_nl_nl)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_nl_nl)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_nl_nl"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_nl_nl)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_nl_nl)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.nl_nl){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_nl_nl),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_nl_nl),0.5,0.5,0,c_white,1);}
	//if (menu="language_nl_nl"){if (key_up)and(menu_delay=0){menu="language_hu_hu";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_nb_no";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.nl_nl;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_nl_nl),"Nederlands (Nederland)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_nl_nl),"Nederlands (Nederland)",global.default_text_size,c_black,c_white,1);}
	#endregion /*Dutch END*/
	
	#region /*Norwegian Bokmål*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_nb_no)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_nb_no)+19)){
	//menu="language_nb_no";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.nb_no;menu_delay=10;}}
	//if (global.language_localization=localization.nb_no){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_nb_no)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_nb_no)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_nb_no"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_nb_no)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_nb_no)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.nb_no){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_nb_no),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_nb_no),0.5,0.5,0,c_white,1);}
	//if (menu="language_nb_no"){if (key_up)and(menu_delay=0){menu="language_nl_nl";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_pl_pl";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.nb_no;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_nb_no),"Norsk bokmål (Norge)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_nb_no),"Norsk bokmål (Norge)",global.default_text_size,c_black,c_white,1);}
	#endregion /*Norwegian Bokmål END*/

	#region /*Polish*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_pl_pl)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_pl_pl)+19)){
	//menu="language_pl_pl";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.pl_pl;menu_delay=10;}}
	//if (global.language_localization=localization.pl_pl){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_pl_pl)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_pl_pl)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_pl_pl"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_pl_pl)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_pl_pl)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.pl_pl){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_pl_pl),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_pl_pl),0.5,0.5,0,c_white,1);}
	//if (menu="language_pl_pl"){if (key_up)and(menu_delay=0){menu="language_nb_no";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_pt_br";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.pl_pl;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_pl_pl),"Polski",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_pl_pl),"Polski",global.default_text_size,c_black,c_white,1);}
	#endregion /*Polish END*/
	
	#region /*Brazilian Portuguese*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_br)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_br)+19)){
	//menu="language_pt_br";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.pt_br;menu_delay=10;}}
	//if (global.language_localization=localization.pt_br){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_br)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_br)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_pt_br"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_br)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_br)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.pt_br){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_br),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_br),0.5,0.5,0,c_white,1);}
	//if (menu="language_pt_br"){if (key_up)and(menu_delay=0){menu="language_pl_pl";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_pt_pt";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.pt_br;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_br),"Português (Brasil)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_br),"Português (Brasil)",global.default_text_size,c_black,c_white,1);}
	#endregion /*Brazilian Portuguese END*/
	
	#region /*Portuguese*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_pt)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_pt)+19)){
	//menu="language_pt_pt";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.pt_pt;menu_delay=10;}}
	//if (global.language_localization=localization.pt_pt){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_pt)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_pt)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_pt_pt"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_pt)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_pt)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.pt_pt){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_pt),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_pt),0.5,0.5,0,c_white,1);}
	//if (menu="language_pt_pt"){if (key_up)and(menu_delay=0){menu="language_pt_br";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_sk_sk";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.pt_pt;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_pt),"Português (Portugal)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_pt_pt),"Português (Portugal)",global.default_text_size,c_black,c_white,1);}
	#endregion /*Portuguese END*/
	
	#region /*Slovak*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_sk_sk)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_sk_sk)+19)){
	//menu="language_sk_sk";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.sk_sk;menu_delay=10;}}
	//if (global.language_localization=localization.sk_sk){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_sk_sk)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_sk_sk)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_sk_sk"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_sk_sk)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_sk_sk)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.sk_sk){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_sk_sk),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_sk_sk),0.5,0.5,0,c_white,1);}
	//if (menu="language_sk_sk"){if (key_up)and(menu_delay=0){menu="language_pt_pt";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_fi_fi";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.sk_sk;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_sk_sk),"Slovenčina",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_sk_sk),"Slovenčina",global.default_text_size,c_black,c_white,1);}
	#endregion /*Slovak END*/
	
	#region /*Finnish*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_fi_fi)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_fi_fi)+19)){
	//menu="language_fi_fi";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.fi_fi;menu_delay=10;}}
	//if (global.language_localization=localization.fi_fi){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_fi_fi)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_fi_fi)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_fi_fi"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_fi_fi)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_fi_fi)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.fi_fi){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_fi_fi),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_fi_fi),0.5,0.5,0,c_white,1);}
	//if (menu="language_fi_fi"){if (key_up)and(menu_delay=0){menu="language_sk_sk";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_sv_se";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.fi_fi;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_fi_fi),"Suomi",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_fi_fi),"Suomi",global.default_text_size,c_black,c_white,1);}
	#endregion /*Finnish END*/
	
	#region /*Swedish*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_sv_se)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_sv_se)+19)){
	//menu="language_sv_se";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.sv_se;menu_delay=10;}}
	//if (global.language_localization=localization.sv_se){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_sv_se)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_sv_se)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_sv_se"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_sv_se)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_sv_se)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.sv_se){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_sv_se),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_sv_se),0.5,0.5,0,c_white,1);}
	//if (menu="language_sv_se"){if (key_up)and(menu_delay=0){menu="language_fi_fi";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_th_th";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.sv_se;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_sv_se),"Svenska (Sverige)",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_sv_se),"Svenska (Sverige)",global.default_text_size,c_black,c_white,1);}
	#endregion /*Swedish END*/
	
	#region /*Thai*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_th_th)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_th_th)+19)){
	//menu="language_th_th";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.th_th;menu_delay=10;}}
	//if (global.language_localization=localization.th_th){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_th_th)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_th_th)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_th_th"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_th_th)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_th_th)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.th_th){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_th_th),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_th_th),0.5,0.5,0,c_white,1);}
	//if (menu="language_th_th"){if (key_up)and(menu_delay=0){menu="language_sv_se";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_tr_tr";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.th_th;}
	///*Text*/if (asset_get_type("font_other_languages")==asset_font){draw_set_font(font_other_languages);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_th_th),"ภาษาไทย",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_other_languages")==asset_font){draw_set_font(font_other_languages);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_th_th),"ภาษาไทย",global.default_text_size,c_black,c_white,1);}
	#endregion /*Thai END*/
	
	#region /*Turkish*/
	//if (point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_tr_tr)-19,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_tr_tr)+19)){
	//menu="language_tr_tr";can_navigate_settings_sidebar=false;if (mouse_check_button_released(mb_left))and(menu_delay=0){global.language_localization=localization.tr_tr;menu_delay=10;}}
	//if (global.language_localization=localization.tr_tr){/*Rectangle Selected*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_tr_tr)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_tr_tr)+15,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);}
	//if (menu="language_tr_tr"){/*Rectangle Hover*/draw_rectangle_color(camera_get_view_x(view_camera[view_current])+400,camera_get_view_y(view_camera[view_current])+20+(40*pos_tr_tr)-15,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+20+(40*pos_tr_tr)+15,c_green,c_green,c_green,c_green,false);}
	//if (global.language_localization=localization.tr_tr){/*Checkbox true*/draw_sprite_ext(spr_checkbox,true,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_tr_tr),0.5,0.5,0,c_white,1);}
	//else{/*Checkbox false*/draw_sprite_ext(spr_checkbox,false,camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*pos_tr_tr),0.5,0.5,0,c_white,1);}
	//if (menu="language_tr_tr"){if (key_up)and(menu_delay=0){menu="language_th_th";menu_delay=10;}if (key_down)and(menu_delay=0){menu="language_tr_tr";menu_delay=10;}
	///*Select Language*/if (key_a)and(menu_delay=0){global.language_localization=localization.tr_tr;}
	///*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_tr_tr),"Türkçe",global.default_text_size*1.1,c_black,c_white,1);
	//}else{/*Text*/if (asset_get_type("font_default")==asset_font){draw_set_font(font_default);}draw_text_outlined(camera_get_view_x(view_camera[view_current])+450,camera_get_view_y(view_camera[view_current])+20+(40*pos_tr_tr),"Türkçe",global.default_text_size,c_black,c_white,1);}
	#endregion /*Turkish END*/

	}#endregion /*Language Options END*/
	
	#region /*Global Resources Settings*/
	if (global.settings_sidebar_menu="global_resources_settings")
	{draw_set_halign(fa_left);draw_set_valign(fa_center);draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*3),"Manage custom resource packs here!! :D",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	#endregion /*Global Resources Settings END*/
	
	#region /*Broadcast Settings*/
	if (global.settings_sidebar_menu="broadcast_settings")
	{draw_set_halign(fa_left);draw_set_valign(fa_center);draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*3),"Connect your Twitch account \n and earn in-game rewards \n as you stream the game :)",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	#endregion /*Broadcast Settings END*/
	
	#region /*How to Play*/
	if (global.settings_sidebar_menu="how_to_play")
	{draw_set_halign(fa_left);draw_set_valign(fa_center);draw_text_outlined(camera_get_view_x(view_camera[view_current])+410,camera_get_view_y(view_camera[view_current])+20+(40*3),"Control frog. \n Frog jump. \n Frog tongue. \n Frog happy.",global.default_text_size*1.1,c_menu_outline,c_menu_fill,1);}
	#endregion /*How to Play END*/
	
	#endregion /*General Settings END*/

	#region /*Menu Navigation*/
	if (menu_joystick_delay<=0)and(input_key=false)and(can_navigate=true){

	#region /*Options Menu*/
	if (menu="difficulty_settings"){
	if (key_left)and(menu_delay=0){if (global.difficulty>0){global.difficulty-=1;menu_delay=10;}else{global.difficulty=3;menu_delay=10;}}else if (key_right)and(menu_delay=0){if (global.difficulty<+3){global.difficulty+=1;menu_delay=10;}else{global.difficulty=0;menu_delay=10;}}}

	else if (menu="show_tutorial_signs"){if (key_up){menu="convention_mode"}else if (key_down){menu="hud_hide_time";}}
	else if (menu="hud_hide_time"){if (key_left){if (global.hud_show_timer>0){global.hud_show_timer-=60;}}if (key_right){if (global.hud_show_timer<600){global.hud_show_timer+=60;}}if (key_up){menu="show_tutorial_signs";}if (key_down){menu="players_can_collide";}}
	else if (menu="players_can_collide"){if (key_up){menu="hud_hide_time"}else if (key_down){menu="assist_settings";}}
	else if (menu="assist_settings"){if (key_up){menu="players_can_collide"}else if (key_down){menu="convention_mode";}}
	else if (menu="convention_mode"){if (key_up){menu="assist_settings";}else if (key_down){menu="show_tutorial_signs";}}

	else if (menu="assist_item_appear"){if (key_up){menu="assist_guiding_arrows";}else if (key_down){menu="assist_default_hp";}else if (key_left)and(global.assist_item_appear>0){global.assist_item_appear-=1;}else if (key_right)and(global.assist_item_appear<10){global.assist_item_appear+=1;}}
	else if (menu="assist_default_hp"){if (key_up){menu="assist_item_appear";}else if (key_down){menu="assist_guiding_arrows";}else if (key_left)and(global.assist_default_hp>1){global.assist_default_hp-=1;}else if (key_right)and(global.assist_default_hp<10){global.assist_default_hp+=1;}}
	else if (menu="assist_guiding_arrows"){if (key_up){menu="assist_default_hp";}else if (key_down){menu="assist_item_appear";}else if (key_left)and(global.assist_guiding_arrows>0){global.assist_guiding_arrows-=1;}else if (key_right)and(global.assist_guiding_arrows<3){global.assist_guiding_arrows+=1;}}

	else if (menu="fullscreen_mode"){if (key_down){menu="interpolate";}else if (key_up){menu="enable_transitions";}}
	else if (menu="interpolate"){if (key_up){if (os_type!=os_ios)and(os_type!=os_android){menu="fullscreen_mode";}else{menu="enable_transitions";}}else if (key_down){menu="show_fps";}}
	else if (menu="show_fps"){if (key_up){menu="interpolate";}else if (key_down){menu="background_brightness";}}
	else if (menu="background_brightness"){if (key_left){if (global.background_brightness>-1){global.background_brightness-=0.1;}}else if (key_right){if (global.background_brightness<+1){global.background_brightness+=0.1;}}else if (key_up){menu="show_fps";}else if (key_down){menu="background_layers";}}
	else if (menu="background_layers"){if (key_up){menu="background_brightness";}else if (key_down){menu="enable_transitions";}}
	else if (menu="enable_transitions"){if (key_up){menu="background_layers";}else if (key_down){if (os_type!=os_ios)and(os_type!=os_android){menu="fullscreen_mode";}else{menu="interpolate";}}}

	else if (menu="enable_background_layer1"){if (key_up){menu="enable_foreground_layer2";}else if (key_down){menu="enable_background_layer2";}}
	else if (menu="enable_background_layer2"){if (key_up){menu="enable_background_layer1";}else if (key_down){menu="enable_background_layer3";}}
	else if (menu="enable_background_layer3"){if (key_up){menu="enable_background_layer2";}else if (key_down){menu="enable_background_layer4";}}
	else if (menu="enable_background_layer4"){if (key_up){menu="enable_background_layer3";}else if (key_down){menu="enable_foreground_layer1";}}
	else if (menu="enable_foreground_layer1"){if (key_up){menu="enable_background_layer4";}else if (key_down){menu="enable_foreground_layer2";}}
	else if (menu="enable_foreground_layer2"){if (key_up){menu="enable_foreground_layer1";}else if (key_down){menu="enable_background_layer1";}}

	else if (menu="music_volume"){if (key_left){if (global.music_volume>0){global.music_volume-=0.05;}}else if (key_right){if (global.music_volume<+1){global.music_volume+=0.05;}}else if (key_up){menu="select_narrator";}else if (key_down){menu="sfx_volume";}}
	else if (menu="sfx_volume"){if (key_left){if (global.sfx_volume>0){global.sfx_volume-=0.05;}}else if (key_right){if (global.sfx_volume<+1){global.sfx_volume+=0.05;}}else if (key_up){menu="music_volume"}else if (key_down){menu="voices_volume"}}
	else if (menu="voices_volume"){if (key_left){if (global.voices_volume>0){global.voices_volume-=0.05;}}else if (key_right){if (global.voices_volume<+1){global.voices_volume+=0.05;}}else if (key_up){menu="sfx_volume"}else if (key_down){menu="verbosity_slider";}}
	else if (menu="verbosity_slider"){if (key_left){if (global.verbosity_slider>0){global.verbosity_slider-=0.05;}}else if (key_right){if (global.verbosity_slider<+1){global.verbosity_slider+=0.05;}}else if (key_up){menu="voices_volume"}else if (key_down){menu="select_narrator";}}
	else if (menu="select_narrator"){if (key_left){if (global.narrator>0){global.narrator-=1;}}else if (key_right){if (global.narrator<+global.narrator_max_characters){global.narrator+=1;}}else if (key_up){menu="verbosity_slider"}else if (key_down){menu="music_volume";}}
	
	else if (menu="remap_select_player"){
	if (key_left){
	if (remapping_player=1)and(menu_delay=0){remapping_player=4;menu_delay=10;}else
	if (remapping_player=2)and(menu_delay=0){remapping_player=1;menu_delay=10;}else
	if (remapping_player=3)and(menu_delay=0){remapping_player=2;menu_delay=10;}else
	if (remapping_player=4)and(menu_delay=0){remapping_player=3;menu_delay=10;}
	}else
	if (key_right)or(key_a){
	if (remapping_player=1)and(menu_delay=0){remapping_player=2;menu_delay=10;}else
	if (remapping_player=2)and(menu_delay=0){remapping_player=3;menu_delay=10;}else
	if (remapping_player=3)and(menu_delay=0){remapping_player=4;menu_delay=10;}else
	if (remapping_player=4)and(menu_delay=0){remapping_player=1;menu_delay=10;}
	}

	else if (key_up)and(menu_delay=0){menu="show_controls";menu_delay=10;}else if (key_down)and(menu_delay=0){menu="remap_key_jump";menu_delay=10;}}
	else if (menu="up_key_is_jump_key"){if (key_up)and(menu_delay=0){menu="remap_reset";menu_delay=10;}else if (key_down)and(menu_delay=0){menu="double_tap_to_run";menu_delay=10;}}
	else if (menu="double_tap_to_run"){if (key_up)and(menu_delay=0){menu="up_key_is_jump_key";menu_delay=10;}else if (key_down)and(menu_delay=0){menu="wall_jump_setting";menu_delay=10;}}
	else if (menu="wall_jump_setting"){
	if (remapping_player=1){if (key_left){if (global.player1_wall_jump_setting>0){global.player1_wall_jump_setting-=1;}else{global.player1_wall_jump_setting=2;}}else if (key_right)or(key_a){if (global.player1_wall_jump_setting<+2){global.player1_wall_jump_setting+=1;}else{global.player1_wall_jump_setting=0;}}}
	if (remapping_player=2){if (key_left){if (global.player2_wall_jump_setting>0){global.player2_wall_jump_setting-=1;}else{global.player2_wall_jump_setting=2;}}else if (key_right)or(key_a){if (global.player2_wall_jump_setting<+2){global.player2_wall_jump_setting+=1;}else{global.player2_wall_jump_setting=0;}}}
	if (remapping_player=3){if (key_left){if (global.player3_wall_jump_setting>0){global.player3_wall_jump_setting-=1;}else{global.player3_wall_jump_setting=2;}}else if (key_right)or(key_a){if (global.player3_wall_jump_setting<+2){global.player3_wall_jump_setting+=1;}else{global.player3_wall_jump_setting=0;}}}
	if (remapping_player=4){if (key_left){if (global.player4_wall_jump_setting>0){global.player4_wall_jump_setting-=1;}else{global.player4_wall_jump_setting=2;}}else if (key_right)or(key_a){if (global.player4_wall_jump_setting<+2){global.player4_wall_jump_setting+=1;}else{global.player4_wall_jump_setting=0;}}}
	if (key_up)and(menu_delay=0){menu="double_tap_to_run";menu_delay=10;}else if (key_down)and(menu_delay=0){menu="drop_from_rope";menu_delay=10;}}
	else if (menu="drop_from_rope"){

	if (key_up)and(menu_delay=0){menu="wall_jump_setting";menu_delay=10;}else if (key_down)and(menu_delay=0){menu="show_controls";menu_delay=10;}}
	else if (menu="show_controls"){
	if (remapping_player=1){if (key_left){if (global.player1_show_controls>0){global.player1_show_controls-=1;}else{global.player1_show_controls=10;}}else if (key_right)or(key_a){if (global.player1_show_controls<10){global.player1_show_controls+=1;}else{global.player1_show_controls=0;}}}
	if (remapping_player=2){if (key_left){if (global.player2_show_controls>0){global.player2_show_controls-=1;}else{global.player2_show_controls=10;}}else if (key_right)or(key_a){if (global.player2_show_controls<10){global.player2_show_controls+=1;}else{global.player2_show_controls=0;}}}
	if (remapping_player=3){if (key_left){if (global.player3_show_controls>0){global.player3_show_controls-=1;}else{global.player3_show_controls=10;}}else if (key_right)or(key_a){if (global.player3_show_controls<10){global.player3_show_controls+=1;}else{global.player3_show_controls=0;}}}
	if (remapping_player=4){if (key_left){if (global.player4_show_controls>0){global.player4_show_controls-=1;}else{global.player4_show_controls=10;}}else if (key_right)or(key_a){if (global.player4_show_controls<10){global.player4_show_controls+=1;}else{global.player4_show_controls=0;}}}
	if (key_up)and(menu_delay=0){menu="drop_from_rope";menu_delay=10;}else if (key_down)and(menu_delay=0){menu="remap_select_player";menu_delay=10;}}

	#endregion /*Options Menu END*/
	
	}
	#endregion /*Menu Navigation END*/

	#region /*Accept*/
	if (key_a)
	{
	if (menu="difficulty_settings")and(menu_delay=0){if (global.difficulty=0){global.difficulty=1;menu_delay=10;}else if (global.difficulty=1){global.difficulty=2;menu_delay=10;}else if (global.difficulty=2){global.difficulty=3;menu_delay=10;}else if (global.difficulty=3){global.difficulty=0;menu_delay=10;}}

	if (menu="show_tutorial_signs")and(menu_delay=0){if (global.show_tutorial_signs=true){global.show_tutorial_signs=false;}else{global.show_tutorial_signs=true;}menu_delay=10;}
	if (menu="players_can_collide")and(menu_delay=0){if (global.players_can_collide=true){global.players_can_collide=false;}else{global.players_can_collide=true;}menu_delay=10;}
	if (menu="assist_settings")and(menu_delay=0){menu="assist_item_appear";menu_delay=10;}
	if (menu="convention_mode")and(menu_delay=0){if (global.convention_mode=true){global.convention_mode=false;}else{global.convention_mode=true;}menu_delay=10;}

	if (menu="fullscreen_mode")and(menu_delay=0){if (window_get_fullscreen()){window_set_fullscreen(false);}else{window_set_fullscreen(true);}menu_delay=10;}
	if (menu="interpolate")and(menu_delay=0){if (global.interpolate=true){global.interpolate=false;gpu_set_texfilter(false);}else{global.interpolate=true;gpu_set_texfilter(true);}menu_delay=10;}
	if (menu="show_fps")and(menu_delay=0){if (global.show_fps=true){global.show_fps=false;}else{global.show_fps=true;}menu_delay=10;}
	if (menu="background_layers")and(menu_delay=0){menu="enable_background_layer1";menu_delay=10;}
	if (menu="enable_transitions")and(menu_delay=0){if (global.enable_transitions=true){global.enable_transitions=false;}else{global.enable_transitions=true;}menu_delay=10;}

	if (menu="enable_background_layer1")and(menu_delay=0){if (global.enable_background_layer1=true){global.enable_background_layer1=false;}else{global.enable_background_layer1=true;}menu_delay=10;}
	if (menu="enable_background_layer2")and(menu_delay=0){if (global.enable_background_layer2=true){global.enable_background_layer2=false;}else{global.enable_background_layer2=true;}menu_delay=10;}
	if (menu="enable_background_layer3")and(menu_delay=0){if (global.enable_background_layer3=true){global.enable_background_layer3=false;}else{global.enable_background_layer3=true;}menu_delay=10;}
	if (menu="enable_background_layer4")and(menu_delay=0){if (global.enable_background_layer4=true){global.enable_background_layer4=false;}else{global.enable_background_layer4=true;}menu_delay=10;}
	if (menu="enable_foreground_layer1")and(menu_delay=0){if (global.enable_foreground_layer1=true){global.enable_foreground_layer1=false;}else{global.enable_foreground_layer1=true;}menu_delay=10;}
	if (menu="enable_foreground_layer2")and(menu_delay=0){if (global.enable_foreground_layer2=true){global.enable_foreground_layer2=false;}else{global.enable_foreground_layer2=true;}menu_delay=10;}

	if (menu="keyboard_controls_remapping")and(menu_delay=0){image_alpha=0;menu="remap_save";menu_delay=10;}
	if (menu="up_key_is_jump_key")and(menu_delay=0){
	if (remapping_player=1){if (global.player1_up_key_is_jump_key=true){global.player1_up_key_is_jump_key=false;}else{global.player1_up_key_is_jump_key=true;}menu_delay=10;}
	else if (remapping_player=2){if (global.player2_up_key_is_jump_key=true){global.player2_up_key_is_jump_key=false;}else{global.player2_up_key_is_jump_key=true;}menu_delay=10;}
	else if (remapping_player=3){if (global.player3_up_key_is_jump_key=true){global.player3_up_key_is_jump_key=false;}else{global.player3_up_key_is_jump_key=true;}menu_delay=10;}
	else if (remapping_player=4){if (global.player4_up_key_is_jump_key=true){global.player4_up_key_is_jump_key=false;}else{global.player4_up_key_is_jump_key=true;}menu_delay=10;}}

	if (menu="double_tap_to_run")and(menu_delay=0){
	if (remapping_player=1){if (global.player1_double_tap_to_run=true){global.player1_double_tap_to_run=false;}else{global.player1_double_tap_to_run=true;}menu_delay=10;}else
	if (remapping_player=2){if (global.player2_double_tap_to_run=true){global.player2_double_tap_to_run=false;}else{global.player2_double_tap_to_run=true;}menu_delay=10;}else
	if (remapping_player=3){if (global.player3_double_tap_to_run=true){global.player3_double_tap_to_run=false;}else{global.player3_double_tap_to_run=true;}menu_delay=10;}else
	if (remapping_player=4){if (global.player4_double_tap_to_run=true){global.player4_double_tap_to_run=false;}else{global.player4_double_tap_to_run=true;}menu_delay=10;}}

	if (menu="wall_jump_setting")and(menu_delay=0){
	if (remapping_player=1){if (global.player1_wall_jump_setting=0){global.player1_wall_jump_setting=1;}else if (global.player1_wall_jump_setting=1){global.player1_wall_jump_setting=2;}else{global.player1_wall_jump_setting=0;}menu_delay=10;}else
	if (remapping_player=2){if (global.player2_wall_jump_setting=0){global.player2_wall_jump_setting=1;}else if (global.player2_wall_jump_setting=1){global.player2_wall_jump_setting=2;}else{global.player2_wall_jump_setting=0;}menu_delay=10;}else
	if (remapping_player=3){if (global.player3_wall_jump_setting=0){global.player3_wall_jump_setting=1;}else if (global.player3_wall_jump_setting=1){global.player3_wall_jump_setting=2;}else{global.player3_wall_jump_setting=0;}menu_delay=10;}else
	if (remapping_player=4){if (global.player4_wall_jump_setting=0){global.player4_wall_jump_setting=1;}else if (global.player4_wall_jump_setting=1){global.player4_wall_jump_setting=2;}else{global.player4_wall_jump_setting=0;}menu_delay=10;}}
	}
	#endregion /*Accept END*/

	if (menu_delay>0)
	{
		menu_delay-=1;
	}
	if (menu_delay<0)
	{
		menu_delay=0;
	}

	#region /*Menu navigation with joystick*/
	if (gamepad_axis_value(0,gp_axislv)<0)or(gamepad_axis_value(0,gp_axislv)>0)or(gamepad_axis_value(0,gp_axislh)<0)or(gamepad_axis_value(0,gp_axislh)>0)
	or(gamepad_axis_value(1,gp_axislv)<0)or(gamepad_axis_value(1,gp_axislv)>0)or(gamepad_axis_value(1,gp_axislh)<0)or(gamepad_axis_value(1,gp_axislh)>0)
	or(gamepad_axis_value(2,gp_axislv)<0)or(gamepad_axis_value(2,gp_axislv)>0)or(gamepad_axis_value(2,gp_axislh)<0)or(gamepad_axis_value(2,gp_axislh)>0)
	or(gamepad_axis_value(3,gp_axislv)<0)or(gamepad_axis_value(3,gp_axislv)>0)or(gamepad_axis_value(3,gp_axislh)<0)or(gamepad_axis_value(3,gp_axislh)>0){if (menu_joystick_delay=0){menu_joystick_delay=15;}}
	if (gamepad_axis_value(0,gp_axislv)=0)and(gamepad_axis_value(0,gp_axislh)=0)
	and(gamepad_axis_value(1,gp_axislv)=0)and(gamepad_axis_value(1,gp_axislh)=0)
	and(gamepad_axis_value(2,gp_axislv)=0)and(gamepad_axis_value(2,gp_axislh)=0)
	and(gamepad_axis_value(3,gp_axislv)=0)and(gamepad_axis_value(3,gp_axislh)=0){menu_joystick_delay=0;}
	if (menu_joystick_delay>0){menu_joystick_delay-=1;}#endregion /*Menu navigation with joystick END*/

	/*Draw mouse cursor for menu navigation*/draw_sprite_ext(spr_cursor,0,mouse_x,mouse_y,1,1,0,c_white,1);
	
}}