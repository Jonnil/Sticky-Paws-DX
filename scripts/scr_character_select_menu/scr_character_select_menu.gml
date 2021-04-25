///scr_character_select_menu()
function scr_character_select_menu()
{
	var voice=noone;

	if (menu="select_character")
	or(menu="back_from_character_select")
	{
		image_alpha=0;

	xx1=lerp(xx1,player1_display_x,0.1);
	xx2=lerp(xx2,player2_display_x,0.1);
	xx3=lerp(xx3,player3_display_x,0.1);
	xx4=lerp(xx4,player4_display_x,0.1);

	#region /*Player colors*/
	
	#region /*Player 1 colors*/
	if global.color_for_player_1=0{global.hex_color_for_player_1=c_white;}
	if global.color_for_player_1=1{global.hex_color_for_player_1=c_ltgray;}
	if global.color_for_player_1=2{global.hex_color_for_player_1=c_dkgray;}
	if global.color_for_player_1=3{global.hex_color_for_player_1=c_black;}
	if global.color_for_player_1=4{global.hex_color_for_player_1=make_colour_rgb(40,26,13);}
	if global.color_for_player_1=5{global.hex_color_for_player_1=c_red;}
	if global.color_for_player_1=6{global.hex_color_for_player_1=c_orange;}
	if global.color_for_player_1=7{global.hex_color_for_player_1=c_yellow;}
	if global.color_for_player_1=8{global.hex_color_for_player_1=c_lime;}
	if global.color_for_player_1=9{global.hex_color_for_player_1=c_green;}
	if global.color_for_player_1=10{global.hex_color_for_player_1=make_colour_rgb(0,255,255);}
	if global.color_for_player_1=11{global.hex_color_for_player_1=make_colour_rgb(173,216,230);}
	if global.color_for_player_1=12{global.hex_color_for_player_1=c_blue;}
	if global.color_for_player_1=13{global.hex_color_for_player_1=c_purple;}
	if global.color_for_player_1=14{global.hex_color_for_player_1=make_colour_rgb(255,0,255);}
	if global.color_for_player_1=15{global.hex_color_for_player_1=make_colour_rgb(255,192,203);}
	#endregion /*Player 1 colors END*/

	#region /*Player 2 colors*/
	if global.color_for_player_2=0{global.hex_color_for_player_2=c_white;}
	if global.color_for_player_2=1{global.hex_color_for_player_2=c_ltgray;}
	if global.color_for_player_2=2{global.hex_color_for_player_2=c_dkgray;}
	if global.color_for_player_2=3{global.hex_color_for_player_2=c_black;}
	if global.color_for_player_2=4{global.hex_color_for_player_2=make_colour_rgb(40,26,13);}
	if global.color_for_player_2=5{global.hex_color_for_player_2=c_red;}
	if global.color_for_player_2=6{global.hex_color_for_player_2=c_orange;}
	if global.color_for_player_2=7{global.hex_color_for_player_2=c_yellow;}
	if global.color_for_player_2=8{global.hex_color_for_player_2=c_lime;}
	if global.color_for_player_2=9{global.hex_color_for_player_2=c_green;}
	if global.color_for_player_2=10{global.hex_color_for_player_2=make_colour_rgb(0,255,255);}
	if global.color_for_player_2=11{global.hex_color_for_player_2=make_colour_rgb(173,216,230);}
	if global.color_for_player_2=12{global.hex_color_for_player_2=c_blue;}
	if global.color_for_player_2=13{global.hex_color_for_player_2=c_purple;}
	if global.color_for_player_2=14{global.hex_color_for_player_2=make_colour_rgb(255,0,255);}
	if global.color_for_player_2=15{global.hex_color_for_player_2=make_colour_rgb(255,192,203);}
	#endregion /*Player 2 colors END*/

	#region /*Player 3 colors*/
	if global.color_for_player_3=0{global.hex_color_for_player_3=c_white;}
	if global.color_for_player_3=1{global.hex_color_for_player_3=c_ltgray;}
	if global.color_for_player_3=2{global.hex_color_for_player_3=c_dkgray;}
	if global.color_for_player_3=3{global.hex_color_for_player_3=c_black;}
	if global.color_for_player_3=4{global.hex_color_for_player_3=make_colour_rgb(40,26,13);}
	if global.color_for_player_3=5{global.hex_color_for_player_3=c_red;}
	if global.color_for_player_3=6{global.hex_color_for_player_3=c_orange;}
	if global.color_for_player_3=7{global.hex_color_for_player_3=c_yellow;}
	if global.color_for_player_3=8{global.hex_color_for_player_3=c_lime;}
	if global.color_for_player_3=9{global.hex_color_for_player_3=c_green;}
	if global.color_for_player_3=10{global.hex_color_for_player_3=make_colour_rgb(0,255,255);}
	if global.color_for_player_3=11{global.hex_color_for_player_3=make_colour_rgb(173,216,230);}
	if global.color_for_player_3=12{global.hex_color_for_player_3=c_blue;}
	if global.color_for_player_3=13{global.hex_color_for_player_3=c_purple;}
	if global.color_for_player_3=14{global.hex_color_for_player_3=make_colour_rgb(255,0,255);}
	if global.color_for_player_3=15{global.hex_color_for_player_3=make_colour_rgb(255,192,203);}
	#endregion /*Player 3 colors END*/

	#region /*Player 4 colors*/
	if global.color_for_player_4=0{global.hex_color_for_player_4=c_white;}
	if global.color_for_player_4=1{global.hex_color_for_player_4=c_ltgray;}
	if global.color_for_player_4=2{global.hex_color_for_player_4=c_dkgray;}
	if global.color_for_player_4=3{global.hex_color_for_player_4=c_black;}
	if global.color_for_player_4=4{global.hex_color_for_player_4=make_colour_rgb(40,26,13);}
	if global.color_for_player_4=5{global.hex_color_for_player_4=c_red;}
	if global.color_for_player_4=6{global.hex_color_for_player_4=c_orange;}
	if global.color_for_player_4=7{global.hex_color_for_player_4=c_yellow;}
	if global.color_for_player_4=8{global.hex_color_for_player_4=c_lime;}
	if global.color_for_player_4=9{global.hex_color_for_player_4=c_green;}
	if global.color_for_player_4=10{global.hex_color_for_player_4=make_colour_rgb(0,255,255);}
	if global.color_for_player_4=11{global.hex_color_for_player_4=make_colour_rgb(173,216,230);}
	if global.color_for_player_4=12{global.hex_color_for_player_4=c_blue;}
	if global.color_for_player_4=13{global.hex_color_for_player_4=c_purple;}
	if global.color_for_player_4=14{global.hex_color_for_player_4=make_colour_rgb(255,0,255);}
	if global.color_for_player_4=15{global.hex_color_for_player_4=make_colour_rgb(255,192,203);}
	#endregion /*Player 4 colors END*/
	
	#endregion /*Player colors END*/
	
	#region /*Select your character text*/
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_outlined(window_get_width()/2,70,"Select your character!",global.default_text_size*2,c_black,c_white,1);
	#endregion /*Select your character text END*/

	#region /*Show Back key when you can go back to main menu*/
	if (global.character_select_in_this_menu="game")
	{
		draw_menu_button(0,0,"Back","back_from_character_select","main_game");
	}
	else
	{
		draw_menu_button(0,0,"Back","back_from_character_select","leveleditor");
	}
	if (player_1_menu="back_from_character_select")
	{
		if (global.controls_used_for_menu_navigation="keyboard")
		or(global.controls_used_for_menu_navigation="controller")
		{
			draw_sprite_ext(spr_menu_cursor,menu_cursor_index,400,20,1,1,180,c_white,1);
		}
		
		if (keyboard_check_pressed(global.player1_key_down))
		and(!keyboard_check_pressed(global.player1_key_up))
		or(gamepad_button_check_pressed(0,gp_padd))
		and(!gamepad_button_check_pressed(0,gp_padu))
		or(gamepad_axis_value(0,gp_axislv)>0)
		and(menu_joystick1_delay<=0)
		or(global.controls_used_for_menu_navigation="mouse")
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				player_1_menu="select_character";
				menu="select_character";
			}
		}
		
		if (keyboard_check_pressed(global.player1_key_jump))
		or(keyboard_check_pressed(vk_enter))
		or(keyboard_check_pressed(vk_space))
		or(gamepad_button_check_pressed(0,gp_face1))
		or(gamepad_button_check_pressed(0,gp_start))
		{
			player1_accept_selection=false;
			player2_accept_selection=false;
			player3_accept_selection=false;
			player4_accept_selection=false;
			if (global.character_select_in_this_menu="game")
			{
				menu_delay=10;
				menu="main_game";
			}
			else
			{
				menu_delay=10;
				menu="leveleditor";
			}
		}
	}
	#endregion /*Show Back key when you can go back to main menu END*/
	
	#region /*Add and subtract number of players*/
	
	#region /*Add number of players*/	
	draw_menu_button_sprite(spr_menu_button_player_add,
	window_get_width()-32,
	window_get_height()-128,
	32,64,noone,noone,noone);
	
	if (global.playergame>=3)
	{
		draw_set_alpha(0.75);
		draw_rectangle_color(
		window_get_width()-32,
		window_get_height()-128,
		window_get_width(),
		window_get_height()-64,
		c_black,c_black,c_black,c_black,false);
		draw_set_alpha(1);
	}
	
	if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
	window_get_width()-32,
	window_get_height()-128,
	window_get_width(),
	window_get_height()-64))
	and(mouse_check_button_pressed(mb_left))
	or(player_1_menu="player_add")
	and(keyboard_check_pressed(vk_enter))
	or(player_1_menu="player_add")
	and(keyboard_check_pressed(vk_space))
	or(player_1_menu="player_add")
	and(keyboard_check_pressed(global.player1_key_jump))
	or(player_1_menu="player_add")
	and(keyboard_check_pressed(global.player1_key2_jump))
	{
		if (global.playergame<3)
		and(menu_delay = 0)
		{
			global.playergame+=1;
			menu_delay = 10;
		}
	}
	
	if (player_1_menu="player_add")
	{
		if (global.controls_used_for_menu_navigation="keyboard")
		or(global.controls_used_for_menu_navigation="controller")
		{
			draw_sprite_ext(spr_menu_cursor,menu_cursor_index,
			window_get_width()-32-32,
			window_get_height()-128+32,
			1,1,0,c_white,1);
		}
		
		if (keyboard_check_pressed(global.player1_key_up))
		and(!keyboard_check_pressed(global.player1_key_down))
		or(gamepad_button_check_pressed(0,gp_padu))
		and(!gamepad_button_check_pressed(0,gp_padd))
		or(gamepad_axis_value(0,gp_axislv)<0)
		and(menu_joystick1_delay<=0)
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				player_1_menu="select_name";
			}
		}
		if (keyboard_check_pressed(global.player1_key_down))
		and(!keyboard_check_pressed(global.player1_key_up))
		or(gamepad_button_check_pressed(0,gp_padd))
		and(!gamepad_button_check_pressed(0,gp_padu))
		or(gamepad_axis_value(0,gp_axislv)>0)
		and(menu_joystick1_delay<=0)
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				player_1_menu="player_subtract";
			}
		}
	}
	#endregion /*Add number of players END*/
	
	#region /*Subtract number of players*/
	draw_menu_button_sprite(spr_menu_button_player_subtract,
	window_get_width()-32,
	window_get_height()-64,
	32,64,noone,noone,noone);
	
	if (global.playergame<=0)
	{
		draw_set_alpha(0.75);
		draw_rectangle_color(
		window_get_width()-32,
		window_get_height()-64,
		window_get_width(),
		window_get_height(),
		c_black,c_black,c_black,c_black,false);
		draw_set_alpha(1);
	}
	
	if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
	window_get_width()-32,
	window_get_height()-64,
	window_get_width(),
	window_get_height()))
	and(mouse_check_button_pressed(mb_left))
	or(player_1_menu="player_subtract")
	and(keyboard_check_pressed(vk_enter))
	or(player_1_menu="player_subtract")
	and(keyboard_check_pressed(vk_space))
	or(player_1_menu="player_subtract")
	and(keyboard_check_pressed(global.player1_key_jump))
	or(player_1_menu="player_subtract")
	and(keyboard_check_pressed(global.player1_key2_jump))
	{
		if (global.playergame>0)
		and(menu_delay = 0)
		{
			global.playergame-=1;
			menu_delay = 10;
		}
	}
	
	if (player_1_menu="player_subtract")
	{
		if (global.controls_used_for_menu_navigation="keyboard")
		or(global.controls_used_for_menu_navigation="controller")
		{
			draw_sprite_ext(spr_menu_cursor,menu_cursor_index,
			window_get_width()-32-32,
			window_get_height()-64+32,
			1,1,0,c_white,1);
		}
		
		if (keyboard_check_pressed(global.player1_key_up))
		and(!keyboard_check_pressed(global.player1_key_down))
		or(gamepad_button_check_pressed(0,gp_padu))
		and(!gamepad_button_check_pressed(0,gp_padd))
		or(gamepad_axis_value(0,gp_axislv)<0)
		and(menu_joystick1_delay<=0)
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				player_1_menu="player_add";
			}
		}
	}
	#endregion /*Subtract number of players END*/
	
	#endregion /*Add and subtract number of players END*/
	
	#region /*Positions and Scale for each character display*/
	
	#region /*Player 1 positions and scale for each character display*/
	if (global.playergame<=0)
	{
		player1_display_x=0;
		player2_display_x=room_width*2;
		player3_display_x=room_width*2;
		player4_display_x=room_width*2;
		player1_scale=1;
		player2_scale=0;
		player3_scale=0;
		player4_scale=0;
		player2_accept_selection=false;
		player3_accept_selection=false;
		player4_accept_selection=false;
		can_input_player2_name=false;
		can_input_player3_name=false;
		can_input_player4_name=false;
	}
	#endregion /*Player 1 positions and scale for each character display END*/
	
	else
	
	#region /*Player 2 positions and scale for each character display*/
	if (global.playergame=1)
	{
		player1_display_x=-200;
		player2_display_x=+200;
		player3_display_x=room_width*2;
		player4_display_x=room_width*2;
		player1_scale=0.95;
		player2_scale=0.95;
		player3_scale=0;
		player4_scale=0;
		player3_accept_selection=false;
		player4_accept_selection=false;
		can_input_player3_name=false;
		can_input_player4_name=false;
	}
	#endregion /*Player 2 positions and scale for each character display END*/
	
	else
	
	#region /*Player 3 positions and scale for each character display*/
	if (global.playergame=2)
	{
		player1_display_x=-310;
		player2_display_x=0;
		player3_display_x=+310;
		player4_display_x=room_width*2;
		player1_scale=0.9;
		player2_scale=0.9;
		player3_scale=0.9;
		player4_scale=0;
		player4_accept_selection=false;
		can_input_player4_name=false;
	}
	#endregion /*Player 3 positions and scale for each character display END*/
	
	else
	
	#region /*Player 4 positions and scale for each character display*/
	if (global.playergame>=3)
	{
		player1_display_x=-465;
		player2_display_x=-155;
		player3_display_x=+155;
		player4_display_x=+465;
		player1_scale=0.85;
		player2_scale=0.85;
		player3_scale=0.85;
		player4_scale=0.85;
	}
	#endregion /*Player 4 positions and scale for each character display END*/
	
	#endregion /*Positions and Scale for each character display*/

	max_number_of_characters=1;/*Update this whenever you add more playable characters!*/
	max_number_of_colors=15;/*Update this whenever you add more colors!*/
	
	#region /*Give feedback that you have selected a character*/
	if (asset_get_type("spr_select_character_background")==asset_sprite)
	{
		if (player1_accept_selection=true)
		{
			draw_sprite_ext(spr_select_character_background,image_index,window_get_width()/2+player1_display_x,window_get_height()/2,player1_scale,player1_scale,0,global.player1_color,1);
		}
		if (player2_accept_selection=true)
		{
			draw_sprite_ext(spr_select_character_background,image_index,window_get_width()/2+player2_display_x,window_get_height()/2,player2_scale,player2_scale,0,global.player2_color,1);
		}
		if (player3_accept_selection=true)
		{
			draw_sprite_ext(spr_select_character_background,image_index,window_get_width()/2+player3_display_x,window_get_height()/2,player3_scale,player3_scale,0,global.player3_color,1);
		}
		if (player4_accept_selection=true)
		{
			draw_sprite_ext(spr_select_character_background,image_index,window_get_width()/2+player4_display_x,window_get_height()/2,player4_scale,player4_scale,0,global.player4_color,1);
		}
	}
	#endregion /*Give feedback that you have selected a character END*/

	#region /*Display Selected Characters*/

	#region /*Player 1*/
	if (global.playergame>=0)
	and(global.sprite_select_character_1>noone)
	{
		draw_sprite_ext(global.sprite_select_character_1,0,window_get_width()/2+xx1,window_get_height()/2,player1_scale,player1_scale,0,global.hex_color_for_player_1,1);
		if(can_input_player1_name=true)
		or(can_input_player2_name=true)
		or(can_input_player3_name=true)
		or(can_input_player4_name=true)
		{
			draw_sprite_ext(global.sprite_select_character_1,0,window_get_width()/2+xx1,window_get_height()/2,player1_scale,player1_scale,0,c_black,0.5);
		}
	}
	#endregion /*Player 1 END*/
	
	#region /*Player 2*/
	if (global.playergame>=1)
	and(global.sprite_select_character_2>noone)
	{
		draw_sprite_ext(global.sprite_select_character_2,0,window_get_width()/2+xx2,window_get_height()/2,player2_scale,player2_scale,0,global.hex_color_for_player_2,1);
		if(can_input_player1_name=true)
		or(can_input_player2_name=true)
		or(can_input_player3_name=true)
		or(can_input_player4_name=true)
		{
			draw_sprite_ext(global.sprite_select_character_2,0,window_get_width()/2+xx2,window_get_height()/2,player2_scale,player2_scale,0,c_black,0.5);
		}
	}
	#endregion /*Player 2 END*/
	
	#region /*Player 3*/
	if (global.playergame>=2)
	and(global.sprite_select_character_3>noone)
	{
		draw_sprite_ext(global.sprite_select_character_3,0,window_get_width()/2+xx3,window_get_height()/2,player3_scale,player3_scale,0,global.hex_color_for_player_3,1);
		if(can_input_player1_name=true)
		or(can_input_player2_name=true)
		or(can_input_player3_name=true)
		or(can_input_player4_name=true)
		{
			draw_sprite_ext(global.sprite_select_character_3,0,window_get_width()/2+xx3,window_get_height()/2,player3_scale,player3_scale,0,c_black,0.5);
		}
	}
	#endregion /*Player 3 END*/
	
	#region /*Player 4*/
	if (global.playergame>=3)
	and(global.sprite_select_character_4>noone)
	{
		draw_sprite_ext(global.sprite_select_character_4,0,window_get_width()/2+xx4,window_get_height()/2,player4_scale,player4_scale,0,global.hex_color_for_player_4,1);
		if(can_input_player1_name=true)
		or(can_input_player2_name=true)
		or(can_input_player3_name=true)
		or(can_input_player4_name=true)
		{
			draw_sprite_ext(global.sprite_select_character_4,0,window_get_width()/2+xx4,window_get_height()/2,player4_scale,player4_scale,0,c_black,0.5);
		}
	}
	#endregion /*Player 4 END*/
	
	#endregion /*Display Selected Characters END*/

	#region /*Show left and right arrows when selecting character*/
	if (can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
	
		#region /*Player 1*/
		if (global.playergame>=0)
		and (player_1_menu="select_character")
		{
			if (player1_accept_selection=false)
			{
			
				#region /*Key Left*/
				if (global.character_for_player_1>0)
				{
					if (gamepad_is_connected(0))
					and(asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,4,window_get_width()/2+player1_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player1_key_left,window_get_width()/2+player1_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
			
					if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
					window_get_width()/2+player1_display_x-75-16,
					window_get_height()/2-16,
					window_get_width()/2+player1_display_x-75+16,
					window_get_height()/2+16))
					{
						draw_set_alpha(0.5);
						draw_rectangle_color(
						window_get_width()/2+player1_display_x-75-16,
						window_get_height()/2-16,
						window_get_width()/2+player1_display_x-75+16,
						window_get_height()/2+16,
						c_white,c_white,c_white,c_white,false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Left END*/
			
				#region /*Key Right*/
				if (file_exists("Characters/Character "+string(global.character_for_player_1+1)+"/Data/character_config.ini"))
				or(file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1+1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
				{
					if (gamepad_is_connected(0))
					and(asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,6,window_get_width()/2+player1_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player1_key_right,window_get_width()/2+player1_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
				
					if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
					window_get_width()/2+player1_display_x+75-16,
					window_get_height()/2-16,
					window_get_width()/2+player1_display_x+75+16,
					window_get_height()/2+16))
					{
						draw_set_alpha(0.5);
						draw_rectangle_color(
						window_get_width()/2+player1_display_x+75-16,
						window_get_height()/2-16,
						window_get_width()/2+player1_display_x+75+16,
						window_get_height()/2+16,
						c_white,c_white,c_white,c_white,false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Right END*/
			
			}
		}
		#endregion /*Player 1 END*/

		#region /*Player 2*/
		if (global.playergame>=1)
		and(player_2_menu="select_character")
		{
			if (player2_accept_selection=false)
			{
			
				#region /*Key Left*/
				if (global.character_for_player_2>0)
				{
					if (gamepad_is_connected(1))
					and(asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,4,window_get_width()/2+player2_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player2_key_left,window_get_width()/2+player2_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
			
					if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
					window_get_width()/2+player2_display_x-75-16,
					window_get_height()/2-16,
					window_get_width()/2+player2_display_x-75+16,
					window_get_height()/2+16))
					{
						draw_set_alpha(0.5);
						draw_rectangle_color(
						window_get_width()/2+player2_display_x-75-16,
						window_get_height()/2-16,
						window_get_width()/2+player2_display_x-75+16,
						window_get_height()/2+16,
						c_white,c_white,c_white,c_white,false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Left END*/
			
				#region /*Key Right*/
				if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2+1)+"/Data/character_config.ini"))
				{
					if (gamepad_is_connected(1))
					and(asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,6,window_get_width()/2+player2_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player2_key_right,window_get_width()/2+player2_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
			
					if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
					window_get_width()/2+player2_display_x+75-16,
					window_get_height()/2-16,
					window_get_width()/2+player2_display_x+75+16,
					window_get_height()/2+16))
					{
						draw_set_alpha(0.5);
						draw_rectangle_color(
						window_get_width()/2+player2_display_x+75-16,
						window_get_height()/2-16,
						window_get_width()/2+player2_display_x+75+16,
						window_get_height()/2+16,
						c_white,c_white,c_white,c_white,false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Right END*/
			
			}
		}
		#endregion /*Player 2 END*/

		#region /*Player 3*/
		if (global.playergame>=2)
		and(player_3_menu="select_character")
		{
			if (player3_accept_selection=false)
			{
			
				#region /*Key Left*/
				if (global.character_for_player_3>0)
				{
					if (gamepad_is_connected(2))
					and(asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,4,window_get_width()/2+player3_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player3_key_left,window_get_width()/2+player3_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
			
					if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
					window_get_width()/2+player3_display_x-75-16,
					window_get_height()/2-16,
					window_get_width()/2+player3_display_x-75+16,
					window_get_height()/2+16))
					{
						draw_set_alpha(0.5);
						draw_rectangle_color(
						window_get_width()/2+player3_display_x-75-16,
						window_get_height()/2-16,
						window_get_width()/2+player3_display_x-75+16,
						window_get_height()/2+16,
						c_white,c_white,c_white,c_white,false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Left END*/
			
				#region /*Key Right*/
				if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3+1)+"/Data/character_config.ini"))
				{
					if (gamepad_is_connected(2))
					and(asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,6,window_get_width()/2+player3_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player3_key_right,window_get_width()/2+player3_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
			
					if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
					window_get_width()/2+player3_display_x+75-16,
					window_get_height()/2-16,
					window_get_width()/2+player3_display_x+75+16,
					window_get_height()/2+16))
					{
						draw_set_alpha(0.5);
						draw_rectangle_color(
						window_get_width()/2+player3_display_x+75-16,
						window_get_height()/2-16,
						window_get_width()/2+player3_display_x+75+16,
						window_get_height()/2+16,
						c_white,c_white,c_white,c_white,false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Right*/
			
			}
		}
		#endregion /*Player 3 END*/
	
		#region /*Player 4*/
		if (global.playergame>=3)
		and(player_4_menu="select_character")
		{
			if (player4_accept_selection=false)
			{
			
				#region /*Ket Left*/
				if (global.character_for_player_4>0)
				{
					if (gamepad_is_connected(3))
					and(asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,4,window_get_width()/2+player4_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player4_key_left,window_get_width()/2+player4_display_x-75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
			
					if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
					window_get_width()/2+player4_display_x-75-16,
					window_get_height()/2-16,
					window_get_width()/2+player4_display_x-75+16,
					window_get_height()/2+16))
					{
						draw_set_alpha(0.5);
						draw_rectangle_color(
						window_get_width()/2+player4_display_x-75-16,
						window_get_height()/2-16,
						window_get_width()/2+player4_display_x-75+16,
						window_get_height()/2+16,
						c_white,c_white,c_white,c_white,false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Key Left END*/
			
				#region /*Key Right*/
				if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4+1)+"/Data/character_config.ini"))
				{
					if (gamepad_is_connected(3))
					and(asset_get_type("spr_xbox_buttons") == asset_sprite)
					{
						draw_sprite_ext(spr_xbox_buttons,6,window_get_width()/2+player4_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
					else
					if (asset_get_type("spr_keyboard_keys")==asset_sprite)
					{
						draw_sprite_ext(spr_keyboard_keys,global.player4_key_right,window_get_width()/2+player4_display_x+75,window_get_height()/2,0.5,0.5,0,c_white,1);
					}
			
					if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
					window_get_width()/2+player4_display_x+75-16,
					window_get_height()/2-16,
					window_get_width()/2+player4_display_x+75+16,
					window_get_height()/2+16))
					{
						draw_set_alpha(0.5);
						draw_rectangle_color(
						window_get_width()/2+player4_display_x+75-16,
						window_get_height()/2-16,
						window_get_width()/2+player4_display_x+75+16,
						window_get_height()/2+16,
						c_white,c_white,c_white,c_white,false);
						draw_set_alpha(1);
					}
				}
				#endregion /*Ket Right END*/
			
			}
		}
		#endregion /*Player 4 END*/
	
	}
	#endregion /*Show left and right arrows when selecting character END*/

	#region /*Tell the players what buttons to push to select or cancel a selection*/

	#region /*Player 1: Tell the player what button to push to select or cancel a selection*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player_1_menu!="select_name")
	and(player_1_menu!="back_from_character_select")
	and(player_1_menu!="player_add")
	and(player_1_menu!="player_subtract")
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		if (player1_accept_selection=false)
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player1_display_x-100,
			window_get_height()/2+150-20,
			window_get_width()/2+player1_display_x+100,
			window_get_height()/2+150+20))
			and(global.controls_used_for_menu_navigation="mouse")
			{
				player_1_menu="select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(
				window_get_width()/2+player1_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player1_display_x+100,
				window_get_height()/2+150+20,
				c_white,c_white,c_white,c_white,false);
				draw_set_alpha(1);
			}
		
			#region /*Accept Text*/
			draw_text_outlined(
			window_get_width()/2+player1_display_x-30,
			window_get_height()/2+150,
			"Accept:",global.default_text_size,c_black,c_white,1);
			#endregion /*Accept Text END*/
	
			#region /*Key A*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons")==asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player1_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player1_key_jump,window_get_width()/2+player1_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
				}
			}
			#endregion /*Key A END*/
		
		}
		else
		if (player1_accept_selection=true)
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player1_display_x-100,
			window_get_height()/2+150-20,
			window_get_width()/2+player1_display_x+100,
			window_get_height()/2+150+20))
			and(global.controls_used_for_menu_navigation="mouse")
			{
				player_1_menu="select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(
				window_get_width()/2+player1_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player1_display_x+100,
				window_get_height()/2+150+20,
				c_white,c_white,c_white,c_white,false);
				draw_set_alpha(0.5);
				draw_rectangle_color(
				window_get_width()/2+player1_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player1_display_x+100,
				window_get_height()/2+150+20,
				c_red,c_red,c_red,c_red,false);
				draw_set_alpha(1);
			}
		
			#region /*Cancel Text*/
			draw_text_outlined(window_get_width()/2+player1_display_x-30,window_get_height()/2+150,"Cancel:",global.default_text_size,c_black,c_white,1);
			#endregion /*Cancel Text END*/
		
			#region /*Key B*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,1,window_get_width()/2+player1_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player1_key_sprint,
					window_get_width()/2+player1_display_x+40,
					window_get_height()/2+150,
					0.5,0.5,0,c_white,1);
				}
			}
			#endregion /*Key B END*/
		
		}
	}
	#endregion /*Player 1: Tell the player what button to push to select or cancel a selection END*/

	#region /*Player 2: Tell the player what button to push to select or cancel a selection*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player_2_menu!="select_name")
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		if (player2_accept_selection=false)
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player2_display_x-100,
			window_get_height()/2+150-20,
			window_get_width()/2+player2_display_x+100,
			window_get_height()/2+150+20))
			and(global.controls_used_for_menu_navigation="mouse")
			{
				player_2_menu="select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(
				window_get_width()/2+player2_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player2_display_x+100,
				window_get_height()/2+150+20,
				c_white,c_white,c_white,c_white,false);
				draw_set_alpha(1);
			}
		
			#region /*Accept Text*/
			draw_text_outlined(window_get_width()/2+player2_display_x-30,window_get_height()/2+150,"Accept:",global.default_text_size,c_black,c_white,1);
			#endregion /*Accept Text END*/
		
			#region /*Key A*/
			if (gamepad_is_connected(1))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player2_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player2_key_jump,window_get_width()/2+player2_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
				}
			}
			#endregion /*Key A END*/
		
		}
		else
		if (player2_accept_selection=true)
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player2_display_x-100,
			window_get_height()/2+150-20,
			window_get_width()/2+player2_display_x+100,
			window_get_height()/2+150+20))
			and(global.controls_used_for_menu_navigation="mouse")
			{
				player_2_menu="select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(
				window_get_width()/2+player2_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player2_display_x+100,
				window_get_height()/2+150+20,
				c_white,c_white,c_white,c_white,false);
				draw_set_alpha(0.5);
				draw_rectangle_color(
				window_get_width()/2+player2_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player2_display_x+100,
				window_get_height()/2+150+20,
				c_red,c_red,c_red,c_red,false);
				draw_set_alpha(1);
			}
		
			#region /*Cancel Text*/
			draw_text_outlined(window_get_width()/2+player2_display_x-30,window_get_height()/2+150,"Cancel:",global.default_text_size,c_black,c_white,1);
			#endregion /*Cancel Text END*/
		
			#region /*Key B*/
			if (gamepad_is_connected(1))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,1,window_get_width()/2+player2_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player2_key_sprint,window_get_width()/2+player2_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
				}
			}
			#endregion /*Key B END*/
		
		}
	}
	#endregion /*Player 2: Tell the player what button to push to select or cancel a selection END*/

	#region /*Player 3: Tell the player what button to push to select or cancel a selection*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player_3_menu!="select_name")
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		if (player3_accept_selection=false)
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player3_display_x-100,
			window_get_height()/2+150-20,
			window_get_width()/2+player3_display_x+100,
			window_get_height()/2+150+20))
			and(global.controls_used_for_menu_navigation="mouse")
			{
				player_3_menu="select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(
				window_get_width()/2+player3_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player3_display_x+100,
				window_get_height()/2+150+20,
				c_white,c_white,c_white,c_white,false);
				draw_set_alpha(1);
			}
		
			#region /*Accept Text*/
			draw_text_outlined(window_get_width()/2+player3_display_x-30,window_get_height()/2+150,"Accept:",global.default_text_size,c_black,c_white,1);
			#endregion /*Accept Text END*/
	
			#region /*Key A*/
			if (gamepad_is_connected(2))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player3_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player3_key_jump,window_get_width()/2+player3_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
				}
			}
			#endregion /*Key A END*/
		
		}
		else
		if (player3_accept_selection=true)
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player3_display_x-100,
			window_get_height()/2+150-20,
			window_get_width()/2+player3_display_x+100,
			window_get_height()/2+150+20))
			and(global.controls_used_for_menu_navigation="mouse")
			{
				player_3_menu="select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(
				window_get_width()/2+player3_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player3_display_x+100,
				window_get_height()/2+150+20,
				c_white,c_white,c_white,c_white,false);
				draw_set_alpha(0.5);
				draw_rectangle_color(
				window_get_width()/2+player3_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player3_display_x+100,
				window_get_height()/2+150+20,
				c_red,c_red,c_red,c_red,false);
				draw_set_alpha(1);
			}
		
			#region /*Cancel Text*/
			draw_text_outlined(window_get_width()/2+player3_display_x-30,window_get_height()/2+150,"Cancel:",global.default_text_size,c_black,c_white,1);
			#endregion /*Cancel Text END*/
	
			#region /*Key B*/
			if (gamepad_is_connected(2))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,1,window_get_width()/2+player3_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player3_key_sprint,window_get_width()/2+player3_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
				}
			}
			#endregion /*Key B END*/
		
		}
	}
	#endregion /*Player 3: Tell the player what button to push to select or cancel a selection END*/

	#region /*Player 4: Tell the player what button to push to select or cancel a selection*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player_4_menu!="select_name")
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		if (player4_accept_selection=false)
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player4_display_x-100,
			window_get_height()/2+150-20,
			window_get_width()/2+player4_display_x+100,
			window_get_height()/2+150+20))
			and(global.controls_used_for_menu_navigation="mouse")
			{
				player_4_menu="select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(
				window_get_width()/2+player4_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player4_display_x+100,
				window_get_height()/2+150+20,
				c_white,c_white,c_white,c_white,false);
				draw_set_alpha(1);
			}
		
			#region /*Accept Text*/
			draw_text_outlined(window_get_width()/2+player4_display_x-30,window_get_height()/2+150,"Accept:",global.default_text_size,c_black,c_white,1);
			#endregion /*Accept Text END*/
	
			#region /*Key A*/
			if (gamepad_is_connected(3))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player4_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player4_key_jump,window_get_width()/2+player4_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
				}
			}
			#endregion /*Key A END*/
	
		}
		else
		if (player4_accept_selection=true)
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player4_display_x-100,
			window_get_height()/2+150-20,
			window_get_width()/2+player4_display_x+100,
			window_get_height()/2+150+20))
			and(global.controls_used_for_menu_navigation="mouse")
			{
				player_4_menu="select_character";
			
				draw_set_alpha(0.75);
				draw_rectangle_color(
				window_get_width()/2+player4_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player4_display_x+100,
				window_get_height()/2+150+20,
				c_white,c_white,c_white,c_white,false);
				draw_set_alpha(0.5);
				draw_rectangle_color(
				window_get_width()/2+player4_display_x-100,
				window_get_height()/2+150-20,
				window_get_width()/2+player4_display_x+100,
				window_get_height()/2+150+20,
				c_red,c_red,c_red,c_red,false);
				draw_set_alpha(1);
			}
		
			#region /*Cancel Text*/
			draw_text_outlined(window_get_width()/2+player4_display_x-30,window_get_height()/2+150,"Cancel:",global.default_text_size,c_black,c_white,1);
			#endregion /*Cancel Text END*/
	
			#region /*Key B*/
			if (gamepad_is_connected(3))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,1,window_get_width()/2+player4_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player4_key_sprint,window_get_width()/2+player4_display_x+40,window_get_height()/2+150,0.5,0.5,0,c_white,1);
				}
			}
			#endregion /*Key B END*/
	
		}
	}
	#endregion /*Player 4: Tell the player what button to push to select or cancel a selection END*/

	#region /*Tell player 1 what button to push to enter a name*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player_1_menu="select_name")
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
	
		#region /*Accept Text*/
		draw_text_outlined(window_get_width()/2+player1_display_x-30,window_get_height()/2+280,"Enter Name:",global.default_text_size,c_black,c_white,1);
		#endregion /*Accept Text END*/
	
		#region /*Key A*/
		if (gamepad_is_connected(0))
		and(asset_get_type("spr_xbox_buttons") == asset_sprite)
		{
			draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player1_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
		}
		else
		{
			if (asset_get_type("spr_keyboard_keys")==asset_sprite)
			{
				draw_sprite_ext(spr_keyboard_keys,global.player1_key_jump,window_get_width()/2+player1_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
			}
		}
		#endregion /*Key A END*/
	
	}
	#endregion /*Tell player 1 what button to push to enter a name END*/

	#region /*Tell player 2 what button to push to enter a name*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player_2_menu="select_name")
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
	
		#region /*Accept Text*/
		draw_text_outlined(window_get_width()/2+player2_display_x-30,window_get_height()/2+280,"Enter Name:",global.default_text_size,c_black,c_white,1);
		#endregion /*Accept Text END*/
	
		#region /*Key A*/
		if (gamepad_is_connected(1))
		and(asset_get_type("spr_xbox_buttons") == asset_sprite)
		{
			draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player2_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
		}
		else
		{
			if (asset_get_type("spr_keyboard_keys")==asset_sprite)
			{
				draw_sprite_ext(spr_keyboard_keys,global.player2_key_jump,window_get_width()/2+player2_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
			}
		}
		#endregion /*Key A END*/
	
	}
	#endregion /*Tell player 2 what button to push to enter a name END*/

	#region /*Tell player 3 what button to push to enter a name*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player_3_menu="select_name")
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
	
		#region /*Accept Text*/
		draw_text_outlined(window_get_width()/2+player3_display_x-30,window_get_height()/2+280,"Enter Name:",global.default_text_size,c_black,c_white,1);
		#endregion /*Accept Text END*/
	
		#region /*Key A*/
		if (gamepad_is_connected(2))
		and(asset_get_type("spr_xbox_buttons") == asset_sprite)
		{
			draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player3_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
		}
		else
		{
			if (asset_get_type("spr_keyboard_keys")==asset_sprite)
			{
				draw_sprite_ext(spr_keyboard_keys,global.player3_key_jump,window_get_width()/2+player3_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
			}
		}
		#endregion /*Key A END*/
	
	}
	#endregion /*Tell player 3 what button to push to enter a name END*/

	#region /*Tell player 4 what button to push to enter a name*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	if (player_4_menu="select_name")
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
	
		#region /*Accept Text*/
		draw_text_outlined(window_get_width()/2+player4_display_x-30,window_get_height()/2+280,"Enter Name:",global.default_text_size,c_black,c_white,1);
		#endregion /*Accept Text END*/
	
		#region /*Key A*/
		if (gamepad_is_connected(3))
		and(asset_get_type("spr_xbox_buttons") == asset_sprite)
		{
			draw_sprite_ext(spr_xbox_buttons,0,window_get_width()/2+player4_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
		}
		else
		{
			if (asset_get_type("spr_keyboard_keys")==asset_sprite)
			{
				draw_sprite_ext(spr_keyboard_keys,global.player4_key_jump,window_get_width()/2+player4_display_x+70,window_get_height()/2+280,0.5,0.5,0,c_white,1);
			}
		}
		#endregion /*Key A END*/
	
	}
	#endregion /*Tell player 4 what button to push to enter a name END*/

	#endregion /*Tell the players what buttons to push to select or cancel a selection END*/

	#region /*Tell the player the inputed name*/
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);

	#region /*Player 1*/
	
	#region /*Opaque transparent black box*/
	if (can_input_player1_name=true)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		draw_set_alpha(0.5);
		draw_rectangle_colour(
		window_get_width()/2+player1_display_x-155,
		window_get_height()/2+200,
		window_get_width()/2+player1_display_x+155,
		window_get_height()/2+310,
		c_black,c_black,c_black,c_black,false);
		draw_set_alpha(1);
	}
	#endregion /*Opaque transparent black box END*/
	
	#region /*Box where name is written on*/
	draw_set_alpha(1);
	draw_rectangle_color(
	window_get_width()/2+player1_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player1_display_x+150,
	window_get_height()/2+250+16,
	global.player1_color,global.player1_color,global.player1_color,global.player1_color,false);
	
	if (player_1_menu="select_name")
	or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
	window_get_width()/2+player1_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player1_display_x+150,
	window_get_height()/2+250+16))
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		draw_set_alpha(0.9);
	}
	else
	{
		draw_set_alpha(0.5);
	}
	draw_rectangle_color(
	window_get_width()/2+player1_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player1_display_x+150,
	window_get_height()/2+250+16,
	c_white,c_white,c_white,c_white,false);
	
	draw_set_alpha(1);
	draw_rectangle_color(
	window_get_width()/2+player1_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player1_display_x+150,
	window_get_height()/2+250+16,
	c_black,c_black,c_black,c_black,true);
	#endregion /*Box where name is written on END*/
	
	#region /*Inputed Name Text*/
	if (can_input_player1_name=true)
	{
		if (name_enter_blink<1)
		{
			draw_text_outlined(
			window_get_width()/2+player1_display_x+4,
			window_get_height()/2+250,
			string(global.player1_name)+"|",global.default_text_size,c_black,c_white,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player1_display_x,
			window_get_height()/2+250,
			string(global.player1_name),global.default_text_size,c_black,c_white,1);
		}
	}
	else
	{
		if (global.player1_name="")
		{
			draw_text_outlined(
			window_get_width()/2+player1_display_x,
			window_get_height()/2+250,
			"Player 1",global.default_text_size,c_white,c_black,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player1_display_x,
			window_get_height()/2+250,
			string(global.player1_name),global.default_text_size,c_white,c_black,1);
		}
	}
	#endregion /*Inputed Name Text END*/
	
	#endregion /*Player 1 END*/

	#region /*Player 2*/
	
	#region /*Opaque transparent black box*/
	if (can_input_player1_name=false)
	and(can_input_player2_name=true)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		draw_set_alpha(0.5);
		draw_rectangle_colour(
		window_get_width()/2+player2_display_x-155,
		window_get_height()/2+200,
		window_get_width()/2+player2_display_x+155,
		window_get_height()/2+310,
		c_black,c_black,c_black,c_black,false);
		draw_set_alpha(1);
	}
	#endregion /*Opaque transparent black box END*/
	
	#region /*Box where name is written on*/
	draw_set_alpha(1);
	draw_rectangle_color(
	window_get_width()/2+player2_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player2_display_x+150,
	window_get_height()/2+250+16,
	global.player2_color,global.player2_color,global.player2_color,global.player2_color,false);
	
	if (player_2_menu="select_name")
	or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
	window_get_width()/2+player2_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player2_display_x+150,
	window_get_height()/2+250+16))
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		draw_set_alpha(0.9);
	}
	else
	{
		draw_set_alpha(0.5);
	}
	draw_rectangle_color(
	window_get_width()/2+player2_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player2_display_x+150,
	window_get_height()/2+250+16,
	c_white,c_white,c_white,c_white,false);
	
	draw_set_alpha(1);
	draw_rectangle_color(
	window_get_width()/2+player2_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player2_display_x+150,
	window_get_height()/2+250+16,
	c_black,c_black,c_black,c_black,true);
	#endregion /*Box where name is written on END*/
	
	#region /*Inputed Name Text*/
	if (can_input_player2_name=true)
	{
		if (name_enter_blink<1)
		{
			draw_text_outlined(
			window_get_width()/2+player2_display_x+4,
			window_get_height()/2+250,
			string(global.player2_name)+"|",global.default_text_size,c_black,c_white,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player2_display_x,
			window_get_height()/2+250,
			string(global.player2_name),global.default_text_size,c_black,c_white,1);
		}
	}
	else
	{
		if (global.player2_name="")
		{
			draw_text_outlined(
			window_get_width()/2+player2_display_x,
			window_get_height()/2+250,
			"Player 2",global.default_text_size,c_white,c_black,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player2_display_x,
			window_get_height()/2+250,
			string(global.player2_name),global.default_text_size,c_white,c_black,1);
		}
	}
	#endregion /*Inputed Name Text END*/
	
	#endregion /*Player 2 END*/

	#region /*Player 3*/
	
	#region /*Opaque transparent black box*/
	if (can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=true)
	and(can_input_player4_name=false)
	{
		draw_set_alpha(0.5);
		draw_rectangle_colour(
		window_get_width()/2+player3_display_x-155,
		window_get_height()/2+200,
		window_get_width()/2+player3_display_x+155,
		window_get_height()/2+310,
		c_black,c_black,c_black,c_black,false);
		draw_set_alpha(1);
	}
	#endregion /*Opaque transparent black box END*/
	
	#region /*Box where name is written on*/
	draw_set_alpha(1);
	draw_rectangle_color(
	window_get_width()/2+player3_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player3_display_x+150,
	window_get_height()/2+250+16,
	global.player3_color,global.player3_color,global.player3_color,global.player3_color,false);
	
	if (player_3_menu="select_name")
	or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
	window_get_width()/2+player3_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player3_display_x+150,
	window_get_height()/2+250+16))
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		draw_set_alpha(0.9);
	}
	else
	{
		draw_set_alpha(0.5);
	}
	draw_rectangle_color(
	window_get_width()/2+player3_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player3_display_x+150,
	window_get_height()/2+250+16,
	c_white,c_white,c_white,c_white,false);
	
	draw_set_alpha(1);
	draw_rectangle_color(
	window_get_width()/2+player3_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player3_display_x+150,
	window_get_height()/2+250+16,
	c_black,c_black,c_black,c_black,true);
	#endregion /*Box where name is written on END*/
	
	#region /*Inputed Name Text*/
	if (can_input_player3_name=true)
	{
		if (name_enter_blink<1)
		{
			draw_text_outlined(
			window_get_width()/2+player3_display_x+4,
			window_get_height()/2+250,
			string(global.player3_name)+"|",global.default_text_size,c_black,c_white,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player3_display_x,
			window_get_height()/2+250,
			string(global.player3_name),global.default_text_size,c_black,c_white,1);
		}
	}
	else
	{
		if (global.player3_name="")
		{
			draw_text_outlined(
			window_get_width()/2+player3_display_x,
			window_get_height()/2+250,
			"Player 3",global.default_text_size,c_white,c_black,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player3_display_x,
			window_get_height()/2+250,
			string(global.player3_name),global.default_text_size,c_white,c_black,1);
		}
	}
	#endregion /*Inputed Name Text END*/
	
	#endregion /*Player 3 END*/

	#region /*Player 4*/
	
	#region /*Opaque transparent black box*/
	if (can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=true)
	{
		draw_set_alpha(0.5);
		draw_rectangle_colour(
		window_get_width()/2+player4_display_x-155,
		window_get_height()/2+200,
		window_get_width()/2+player4_display_x+155,
		window_get_height()/2+310,
		c_black,c_black,c_black,c_black,false);
		draw_set_alpha(1);
	}
	#endregion /*Opaque transparent black box END*/
	
	#region /*Box where name is written on*/
	draw_set_alpha(1);
	draw_rectangle_color(
	window_get_width()/2+player4_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player4_display_x+150,
	window_get_height()/2+250+16,
	global.player4_color,global.player4_color,global.player4_color,global.player4_color,false);
	
	if (player_4_menu="select_name")
	or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
	window_get_width()/2+player4_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player4_display_x+150,
	window_get_height()/2+250+16))
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		draw_set_alpha(0.9);
	}
	else
	{
		draw_set_alpha(0.5);
	}
	draw_rectangle_color(
	window_get_width()/2+player4_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player4_display_x+150,
	window_get_height()/2+250+16,
	c_white,c_white,c_white,c_white,false);
	
	draw_set_alpha(1);
	draw_rectangle_color(
	window_get_width()/2+player4_display_x-150,
	window_get_height()/2+250-16,
	window_get_width()/2+player4_display_x+150,
	window_get_height()/2+250+16,
	c_black,c_black,c_black,c_black,true);
	#endregion /*Box where name is written on END*/
	
	#region /*Inputed Name Text*/
	if (can_input_player4_name=true)
	{
		if (name_enter_blink<1)
		{
			draw_text_outlined(
			window_get_width()/2+player4_display_x+4,
			window_get_height()/2+250,
			string(global.player4_name)+"|",global.default_text_size,c_black,c_white,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player4_display_x,
			window_get_height()/2+250,
			string(global.player4_name),global.default_text_size,c_black,c_white,1);
		}
	}
	else
	{
		if (global.player4_name="")
		{
			draw_text_outlined(
			window_get_width()/2+player4_display_x,
			window_get_height()/2+250,
			"Player 4",global.default_text_size,c_white,c_black,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player4_display_x,
			window_get_height()/2+250,
			string(global.player4_name),global.default_text_size,c_white,c_black,1);
		}
	}
	#endregion /*Inputed Name Text END*/
	
	#endregion /*Player 4 END*/

	#endregion /*Tell the player the inputed name END*/
	
	#region /*Name Enter Blinking*/
	name_enter_blink+=0.05;
	if (name_enter_blink>1.5)
	{
		name_enter_blink=0;
	}
	#endregion /*Name Enter Blinking END*/
	
	#region /*Name Input*/
	
	#region /*PLAYER 1 INPUT NAME NOW*/
	if (can_input_player1_name=true)
	{
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		global.player1_name=keyboard_string;
		
		#region /*Limit Name Input Length for Player 1*/
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		
		if (string_length(global.player1_name)>=20)
		{
			draw_text_outlined(
			window_get_width()/2+player1_display_x+100,
			window_get_height()/2+290,
			"20/20",global.default_text_size,c_black,c_white,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player1_display_x+100,
			window_get_height()/2+290,
			string(string_length(global.player1_name))+"/20",global.default_text_size,c_black,c_ltgray,1);
		}
		
		if (string_length(global.player1_name)>20)
		{
			global.player1_name=string_copy(global.player1_name,1,20);
		}
		#endregion /*Limit Name Input Length for Player 1 END*/
		
	}
	#endregion /*PLAYER 1 INPUT NAME NOW END*/

	#region /*PLAYER 2 INPUT NAME NOW*/
	if (can_input_player2_name=true)
	{
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		global.player2_name=keyboard_string;
		
		#region /*Limit Name Input Length for Player 2*/
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		
		if (string_length(global.player2_name)>=20)
		{
			draw_text_outlined(
			window_get_width()/2+player2_display_x+100,
			window_get_height()/2+290,
			"20/20",global.default_text_size,c_black,c_white,2);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player2_display_x+100,
			window_get_height()/2+290,
			string(string_length(global.player2_name))+"/20",global.default_text_size,c_black,c_ltgray,1);
		}
		
		if (string_length(global.player2_name)>20)
		{
			global.player2_name=string_copy(global.player2_name,1,20);
		}
		#endregion /*Limit Name Input Length for Player 2 END*/
		
	}
	#endregion /*PLAYER 2 INPUT NAME NOW END*/

	#region /*PLAYER 3 INPUT NAME NOW*/
	if (can_input_player3_name=true)
	{
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		global.player3_name=keyboard_string;
		
		#region /*Limit Name Input Length for Player 1*/
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		
		if (string_length(global.player3_name)>=20)
		{
			draw_text_outlined(
			window_get_width()/2+player3_display_x+100,
			window_get_height()/2+290,
			"20/20",global.default_text_size,c_black,c_white,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player3_display_x+100,
			window_get_height()/2+290,
			string(string_length(global.player3_name))+"/20",global.default_text_size,c_black,c_ltgray,1);
		}
		
		if (string_length(global.player3_name)>20)
		{
			global.player3_name=string_copy(global.player3_name,1,20);
		}
		#endregion /*Limit Name Input Length for Player 3 END*/
		
	}
	#endregion /*PLAYER 3 INPUT NAME NOW END*/

	#region /*PLAYER 4 INPUT NAME NOW*/
	if (can_input_player4_name=true)
	{
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		global.player4_name=keyboard_string;
		
		#region /*Limit Name Input Length for Player 4*/
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		
		if (string_length(global.player4_name)>=20)
		{
			draw_text_outlined(
			window_get_width()/2+player4_display_x+100,
			window_get_height()/2+290,
			"20/20",global.default_text_size,c_black,c_white,1);
		}
		else
		{
			draw_text_outlined(
			window_get_width()/2+player4_display_x+100,
			window_get_height()/2+290,
			string(string_length(global.player4_name))+"/20",global.default_text_size,c_black,c_ltgray,1);
		}
		
		if (string_length(global.player4_name)>20)
		{
			global.player4_name=string_copy(global.player4_name,1,20);
		}
		#endregion /*Limit Name Input Length for Player 4 END*/
		
	}
	#endregion /*PLAYER 4 INPUT NAME NOW END*/

	#region /*Press enter when done typing*/
	if (can_input_player1_name=true)
	or(can_input_player2_name=true)
	or(can_input_player3_name=true)
	or(can_input_player4_name=true)
	{
		if (keyboard_check_pressed(vk_escape))
		or(keyboard_check_pressed(vk_enter))
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				can_input_player1_name=false;
				can_input_player2_name=false;
				can_input_player3_name=false;
				can_input_player4_name=false;
			}
		}
	}
	#endregion /*Press enter when done typing END*/
	
	#region /*Limit Name Input Length for all players*/
	if (string_length(keyboard_string)>20)
	{
		keyboard_string=string_copy(keyboard_string,1,20);
	}
	#endregion /*Limit Name Input Length for all players END*/
	
	#endregion /*Name Input END*/

	#region /*Menu Navigation*/
	if (can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
	if (player_1_menu="select_character")
	{
	/*Navigate Character Selection*/
	
	#region /*Player 1*/
	if (global.playergame>=0)
	{
		if (menu_joystick1_delay<=0)
		and(input_key=false)
		and(can_navigate=true)
		and(player1_accept_selection=false)
		{
			
			#region /*Key Left (change portrait sprites)*/
			if (keyboard_check_pressed(global.player1_key_left))
			and(!keyboard_check_pressed(global.player1_key_right))
			or(gamepad_button_check_pressed(0,gp_padl))
			and(!gamepad_button_check_pressed(0,gp_padr))
			or(gamepad_axis_value(0,gp_axislh)<0)
			and(menu_joystick1_delay<=0)
			or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player1_display_x-75-16,
			window_get_height()/2-16,
			window_get_width()/2+player1_display_x-75+16,
			window_get_height()/2+16))
			and(mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				and(global.character_for_player_1>0)
				{
					menu_delay=10;
					menu_joystick1_delay=30;
					if (global.character_for_player_1>0)
					{
						global.character_for_player_1-=1;
						xx1=player1_display_x-32;
					}
					else
					{
						global.character_for_player_1=0;
					}
					
					sprite_delete(global.sprite_select_character_1);
					
					#region /*Character select portrait x and y origin points*/
					if(file_exists("Characters/Character "+string(global.character_for_player_1)+"/Data/character_config.ini"))
					or(file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
					{
						if(file_exists("Characters/Character "+string(global.character_for_player_1)+"/Data/character_config.ini"))
						{
							ini_open("Characters/Character "+string(global.character_for_player_1)+"/Data/character_config.ini");
						}
						else
						if(file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
						{
							ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Data/character_config.ini");
						}
						
						#region /*Character select portrait x and y origin points*/
						#region /*Character select portrait y origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
						{
							character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
						}
						else
						{
							ini_write_real("sprite origin points", "character_select_portrait_yorig", 0);
							character_select_portrait_yorig = 0;
						}
						#endregion /*Character select portrait y origin point END*/

						#region /*Character select portrait x origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
						{
							character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
						}
						else
						{
							ini_write_real("sprite origin points", "character_select_portrait_xorig", 0);
							character_select_portrait_xorig = 0;
						}
						#endregion /*Character select portrait x origin point END*/
						#endregion /*Character select portrait x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							ini_write_real("sprite origin points", "sprite_stand_yorig", 0);
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							ini_write_real("sprite origin points", "sprite_stand_xorig", 0);
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						ini_close();
					}
					else
					{
						character_select_portrait_xorig = 0;
						character_select_portrait_yorig = 0;
						sprite_stand_xorig = 0;
						sprite_stand_yorig = 0;
					}
					#endregion /*Character select portrait x and y origin points END*/
					
					#region /*Player 1 official character select portrait sprite*/
					if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_character_1 = sprite_add("Characters/Character "+string(global.character_for_player_1)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Sprites/stand.png"))
					{
						global.sprite_select_character_1 = sprite_add("Characters/Character "+string(global.character_for_player_1)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					#endregion /*Player 1 official character select portrait sprite END*/
					
					else
					
					#region /*Player 1 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_character_1 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/stand.png"))
					{
						global.sprite_select_character_1 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					else
					{
						global.sprite_select_character_1 = noone;
					}
					#endregion /*Player 1 character select portrait sprite END*/
					
				}
			}
			#endregion /*Key Left (change portrait sprites) END*/
	
			#region /*Key Right (change portrait sprites)*/
			if (keyboard_check_pressed(global.player1_key_right))
			and(!keyboard_check_pressed(global.player1_key_left))
			or(gamepad_button_check_pressed(0,gp_padr))
			and(!gamepad_button_check_pressed(0,gp_padl))
			or(gamepad_axis_value(0,gp_axislh)>0)
			and(menu_joystick1_delay<=0)
			or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player1_display_x+75-16,
			window_get_height()/2-16,
			window_get_width()/2+player1_display_x+75+16,
			window_get_height()/2+16))
			and(mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				{
					menu_delay=10;
					menu_joystick1_delay=30;
					if (file_exists("Characters/Character "+string(global.character_for_player_1+1)+"/Data/character_config.ini"))
					{
						global.character_for_player_1+=1;
						xx1=player1_display_x+32;
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1+1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
					{
						global.character_for_player_1+=1;
						xx1=player1_display_x+32;
					}
					
					sprite_delete(global.sprite_select_character_1);
					
					#region /*Character select portrait x and y origin points*/
					if(file_exists("Characters/Character "+string(global.character_for_player_1)+"/Data/character_config.ini"))
					or(file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
					{
						if(file_exists("Characters/Character "+string(global.character_for_player_1)+"/Data/character_config.ini"))
						{
							ini_open("Characters/Character "+string(global.character_for_player_1)+"/Data/character_config.ini");
						}
						else
						if(file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Data/character_config.ini"))
						{
							ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Data/character_config.ini");
						}
						
						#region /*Character select portrait x and y origin points*/
						#region /*Character select portrait y origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
						{
							character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
						}
						else
						{
							ini_write_real("sprite origin points", "character_select_portrait_yorig", 0);
							character_select_portrait_yorig = 0;
						}
						#endregion /*Character select portrait y origin point END*/

						#region /*Character select portrait x origin point*/
						if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
						{
							character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
						}
						else
						{
							ini_write_real("sprite origin points", "character_select_portrait_xorig", 0);
							character_select_portrait_xorig = 0;
						}
						#endregion /*Character select portrait x origin point END*/
						#endregion /*Character select portrait x and y origin points END*/
						
						#region /*Sprite stand x and y origin points*/
						#region /*Sprite stand y origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
						{
							sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
						}
						else
						{
							ini_write_real("sprite origin points", "sprite_stand_yorig", 0);
							sprite_stand_yorig = 0;
						}
						#endregion /*Sprite stand y origin point END*/

						#region /*Sprite stand x origin point*/
						if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
						{
							sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
						}
						else
						{
							ini_write_real("sprite origin points", "sprite_stand_xorig", 0);
							sprite_stand_xorig = 0;
						}
						#endregion /*Sprite stand x origin point END*/
						#endregion /*Sprite stand x and y origin points END*/
						
						ini_close();
					}
					else
					{
						character_select_portrait_xorig = 0;
						character_select_portrait_yorig = 0;
						sprite_stand_xorig = 0;
						sprite_stand_yorig = 0;
					}
					#endregion /*Character select portrait x and y origin points END*/
					
					#region /*Player 1 official character select portrait sprite*/
					if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_character_1 = sprite_add("Characters/Character "+string(global.character_for_player_1)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Sprites/stand.png"))
					{
						global.sprite_select_character_1 = sprite_add("Characters/Character "+string(global.character_for_player_1)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					#endregion /*Player 1 official character select portrait sprite END*/
					
					else
					
					#region /*Player 1 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_character_1 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/stand.png"))
					{
						global.sprite_select_character_1 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
					}
					else
					{
						global.sprite_select_character_1 = noone;
					}
					#endregion /*Player 1 character select portrait sprite END*/
					
				}
			}
			#endregion /*Key Right (change portrait sprites) END*/
			
		}
	}
	#endregion /*Player 1 END*/
	
	#region /*Player 1 key up*/
	if (keyboard_check_pressed(global.player1_key_up))
	and(!keyboard_check_pressed(global.player1_key_down))
	or(gamepad_button_check_pressed(0,gp_padu))
	and(!gamepad_button_check_pressed(0,gp_padd))
	or(gamepad_axis_value(0,gp_axislv)<0)
	and(menu_joystick1_delay<=0)
	{
		if (menu_delay=0)
		{
			menu_delay=10;
			menu_joystick1_delay=30;
			player_1_menu="back_from_character_select";
			menu="back_from_character_select";
		}
	}
	#endregion /*Player 1 key up END*/
	
	#region /*Player 1 key down*/
	if (keyboard_check_pressed(global.player1_key_down))
	and(!keyboard_check_pressed(global.player1_key_up))
	or(gamepad_button_check_pressed(0,gp_padd))
	and(!gamepad_button_check_pressed(0,gp_padu))
	or(gamepad_axis_value(0,gp_axislv)>0)
	and(menu_joystick1_delay<=0)
	{
		if (menu_delay=0)
		{
			menu_delay=10;
			menu_joystick1_delay=30;
			player_1_menu="select_name";
		}
	}
	#endregion /*Player 1 key down END*/
	
	}
	if (player_1_menu="select_name")
	{
	
	#region /*Player 1 key up*/
	if (keyboard_check_pressed(global.player1_key_up))
	and(!keyboard_check_pressed(global.player1_key_down))
	or(gamepad_button_check_pressed(0,gp_padu))
	and(!gamepad_button_check_pressed(0,gp_padd))
	or(gamepad_axis_value(0,gp_axislv)<0)
	and (menu_joystick1_delay<=0)
	{
		if (menu_delay=0)
		{
			menu_delay=10;
			menu_joystick1_delay=30;
			player_1_menu="select_character";
		}
	}
	#endregion /*Player 1 key up END*/
	
	#region /*Player 1 key down*/
	if (keyboard_check_pressed(global.player1_key_down))
	and(!keyboard_check_pressed(global.player1_key_up))
	or(gamepad_button_check_pressed(0,gp_padd))
	and(!gamepad_button_check_pressed(0,gp_padu))
	or(gamepad_axis_value(0,gp_axislv)>0)
	and(menu_joystick1_delay<=0)
	{
		if (menu_delay=0)
		{
			menu_delay=10;
			player_1_menu="player_add";
		}
	}
	#endregion /*Player 1 key down END*/
	
	if (can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		if (gamepad_button_check_pressed(0,gp_face1))
		or(keyboard_check_pressed(vk_enter))
		or(keyboard_check_pressed(global.player1_key_jump))
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				keyboard_string=global.player1_name;
				can_input_player1_name=true;
				can_input_player2_name=false;
				can_input_player3_name=false;
				can_input_player4_name=false;
			}
		}
	}
}

	if (player_2_menu="select_character")
	{
	
	/*Navigate Character Selection*/
	
	#region /*Player 2*/
	if (global.playergame>=1)
	{
		if (menu_joystick2_delay<=0)
		and(input_key=false)
		and(can_navigate=true)
		and(player2_accept_selection=false)
		{
		
		#region /*Key Left (change portrait sprites)*/
		if (keyboard_check_pressed(global.player2_key_left))
		and(!keyboard_check_pressed(global.player2_key_right))
		or(gamepad_button_check_pressed(1,gp_padl))
		and(!gamepad_button_check_pressed(1,gp_padr))
		or(gamepad_axis_value(1,gp_axislh)<0)
		and(menu_joystick2_delay<=0)
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
		window_get_width()/2+player2_display_x-75-16,
		window_get_height()/2-16,
		window_get_width()/2+player2_display_x-75+16,
		window_get_height()/2+16))
		and(mouse_check_button_pressed(mb_left))
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				menu_joystick2_delay=30;
				if (global.character_for_player_2>0)
				{
					global.character_for_player_2-=1;
					xx2=player2_display_x-32;
				}
				else
				{
					global.character_for_player_2=0;
				}
				
				sprite_delete(global.sprite_select_character_2);
				
				#region /*Player 2 character select portrait sprite*/
				if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2)+"/Sprites/character_select_portrait.png"))
				{
					global.sprite_select_character_2 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2)+"/Sprites/character_select_portrait.png", 0, false, false, 196, 287);
				}
				else
				if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2)+"/Sprites/stand.png"))
				{
					global.sprite_select_character_2 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2)+"/Sprites/stand.png", 0, false, false, 36, 44);
				}
				else
				{
					global.sprite_select_character_2 = noone;
				}
				#endregion /*Player 2 character select portrait sprite END*/
				
			}
		}
		#endregion /*Key Left (change portrait sprites) END*/
		
		#region /*Key Right (change portrait sprites)*/
		if (keyboard_check_pressed(global.player2_key_right))
		and(!keyboard_check_pressed(global.player2_key_left))
		or(gamepad_button_check_pressed(1,gp_padr))
		and(!gamepad_button_check_pressed(1,gp_padl))
		or(gamepad_axis_value(1,gp_axislh)>0)
		and(menu_joystick2_delay<=0)
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
		window_get_width()/2+player2_display_x+75-16,
		window_get_height()/2-16,
		window_get_width()/2+player2_display_x+75+16,
		window_get_height()/2+16))
		and(mouse_check_button_pressed(mb_left))
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				menu_joystick2_delay=30;
				
				if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2+1)+"/Data/character_config.ini"))
				{
					global.character_for_player_2+=1;
					xx2=player2_display_x+32;
				}
				
				sprite_delete(global.sprite_select_character_2);
				
				#region /*Player 2 character select portrait sprite*/
				if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2)+"/Sprites/character_select_portrait.png"))
				{
					global.sprite_select_character_2 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2)+"/Sprites/character_select_portrait.png", 0, false, false, 196, 287);
				}
				else
				if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2)+"/Sprites/stand.png"))
				{
					global.sprite_select_character_2 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2)+"/Sprites/stand.png", 0, false, false, 36, 44);
				}
				else
				{
					global.sprite_select_character_2 = noone;
				}
				#endregion /*Player 2 character select portrait sprite END*/
				
			}
		}
		#endregion /*Key Right (change portrait sprites) END*/
		
	}
}
#endregion /*Player 2 END*/

	#region /*Player 2 key down*/
	if (keyboard_check_pressed(global.player2_key_down))
	and(!keyboard_check_pressed(global.player2_key_up))
	or(gamepad_button_check_pressed(1,gp_padd))
	and(!gamepad_button_check_pressed(1,gp_padu))
	or(gamepad_axis_value(1,gp_axislv)>0)
	and(menu_joystick2_delay<=0)
	{
		if (menu_delay=0)
		{
			menu_delay=10;
			menu_joystick2_delay=30;
			player_2_menu="select_name";
		}
	}
	#endregion /*Player 2 key down END*/
	}
	if (player_2_menu="select_name")
	{
		
		#region /*Player 2 key up*/
		if (keyboard_check_pressed(global.player2_key_up))
		and(!keyboard_check_pressed(global.player2_key_down))
		or(gamepad_button_check_pressed(1,gp_padu))
		and(!gamepad_button_check_pressed(1,gp_padd))
		or(gamepad_axis_value(1,gp_axislv)<0)
		and (menu_joystick2_delay<=0)
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				menu_joystick2_delay=30;
				player_2_menu="select_character";
			}
		}
		#endregion /*Player 2 key up END*/
		
	if (can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		if (gamepad_button_check_pressed(1,gp_face1))
		or(keyboard_check_pressed(global.player2_key_jump))
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				keyboard_string=global.player2_name;
				can_input_player1_name=false;
				can_input_player2_name=true;
				can_input_player3_name=false;
				can_input_player4_name=false;
			}
		}
	}
}


	if (player_3_menu="select_character")
	{
		
	/*Navigate Character Selection*/
	
	#region /*Player 3*/
	if (global.playergame>=2)
	{
		if (menu_joystick3_delay<=0)
		and(input_key=false)
		and(can_navigate=true)
		and(player3_accept_selection=false)
		{
	
			#region /*Key Left (change portrait sprites)*/
			if (keyboard_check_pressed(global.player3_key_left))
			and(!keyboard_check_pressed(global.player3_key_right))
			or(gamepad_button_check_pressed(2,gp_padl))
			and(!gamepad_button_check_pressed(2,gp_padr))
			or(gamepad_axis_value(2,gp_axislh)<0)
			and(menu_joystick3_delay<=0)
			or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player3_display_x-75-16,
			window_get_height()/2-16,
			window_get_width()/2+player3_display_x-75+16,
			window_get_height()/2+16))
			and(mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				{
					menu_delay=10;
					menu_joystick3_delay=30;
					if (global.character_for_player_3>0)
					{
						global.character_for_player_3-=1;
						xx3=player3_display_x-32;
					}
					else
					{
						global.character_for_player_3=0;
					}
					
					sprite_delete(global.sprite_select_character_3);
					
					#region /*Player 3 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_character_3 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3)+"/Sprites/character_select_portrait.png", 0, false, false, 196, 287);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3)+"/Sprites/stand.png"))
					{
						global.sprite_select_character_3 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3)+"/Sprites/stand.png", 0, false, false, 36, 44);
					}
					else
					{
						global.sprite_select_character_3 = noone;
					}
					#endregion /*Player 3 character select portrait sprite END*/
					
				}
			}
			#endregion /*Key Left (change portrait sprites) END*/
	
			#region /*Key Right (change portrait sprites)*/
			if (keyboard_check_pressed(global.player3_key_right))
			and(!keyboard_check_pressed(global.player3_key_left))
			or(gamepad_button_check_pressed(2,gp_padr))
			and(!gamepad_button_check_pressed(2,gp_padl))
			or(gamepad_axis_value(2,gp_axislh)>0)
			and(menu_joystick3_delay<=0)
			or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player3_display_x+75-16,
			window_get_height()/2-16,
			window_get_width()/2+player3_display_x+75+16,
			window_get_height()/2+16))
			and(mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				{
					menu_delay=10;
					menu_joystick3_delay=30;
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3+1)+"/Data/character_config.ini"))
					{
						global.character_for_player_3+=1;
						xx3=player3_display_x+32;
					}
					
					sprite_delete(global.sprite_select_character_3);
					
					#region /*Player 3 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_character_3 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3)+"/Sprites/character_select_portrait.png", 0, false, false, 196, 287);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3)+"/Sprites/stand.png"))
					{
						global.sprite_select_character_3 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3)+"/Sprites/stand.png", 0, false, false, 36, 44);
					}
					else
					{
						global.sprite_select_character_3 = noone;
					}
					#endregion /*Player 3 character select portrait sprite END*/
					
				}
			}
			#endregion /*Key Right (change portrait sprites)*/
	
		}
	}
	#endregion /*Player 3 END*/

	#region /*Player 3 key down*/
	if (keyboard_check_pressed(global.player3_key_down))
	and(!keyboard_check_pressed(global.player3_key_up))
	or(gamepad_button_check_pressed(2,gp_padd))
	and(!gamepad_button_check_pressed(2,gp_padu))
	or(gamepad_axis_value(2,gp_axislv)>0)
	and (menu_joystick3_delay<=0)
	{
		if (menu_delay=0)
		{
			menu_delay=10;
			menu_joystick3_delay=30;
			player_3_menu="select_name";
		}
	}
	#endregion /*Player 3 key down END*/
	}
	if (player_3_menu="select_name")
	{
	
		#region /*Player 3 key up*/
		if (keyboard_check_pressed(global.player3_key_up))
		and(!keyboard_check_pressed(global.player3_key_down))
		or(gamepad_button_check_pressed(2,gp_padu))
		and(!gamepad_button_check_pressed(2,gp_padd))
		or(gamepad_axis_value(2,gp_axislv)<0)
		and (menu_joystick3_delay<=0)
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				menu_joystick3_delay=30;
				player_3_menu="select_character";
			}
		}
		#endregion /*Player 3 key up END*/
		
	if (can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		if (gamepad_button_check_pressed(2,gp_face1))
		or(keyboard_check_pressed(global.player3_key_jump))
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				keyboard_string=global.player3_name;
				can_input_player1_name=false;
				can_input_player3_name=false;
				can_input_player3_name=true;
				can_input_player4_name=false;
			}
		}
	}
}


	if (player_4_menu="select_character")
	{
	/*Navigate Character Selection*/
	
	#region /*Player 4*/
	if (global.playergame>=3)
	{
		if (menu_joystick4_delay<=0)
		and(input_key=false)
		and(can_navigate=true)
		and(player4_accept_selection=false)
		{
	
			#region /*Key Left (change portrait sprites)*/
			if (keyboard_check_pressed(global.player4_key_left))
			and(!keyboard_check_pressed(global.player4_key_right))
			or(gamepad_button_check_pressed(3,gp_padl))
			and(!gamepad_button_check_pressed(3,gp_padr))
			or(gamepad_axis_value(3,gp_axislh)<0)
			and(menu_joystick4_delay<=0)
			or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player4_display_x-75-16,
			window_get_height()/2-16,
			window_get_width()/2+player4_display_x-75+16,
			window_get_height()/2+16))
			and(mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				{
					menu_delay=10;
					menu_joystick4_delay=30;
					if (global.character_for_player_4>0)
					{
						global.character_for_player_4-=1;
						xx4=player4_display_x-32;
					}
					else
					{
						global.character_for_player_4=0;
					}
					
					sprite_delete(global.sprite_select_character_4);
					
					#region /*Player 4 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_character_4 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4)+"/Sprites/character_select_portrait.png", 0, false, false, 196, 287);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4)+"/Sprites/stand.png"))
					{
						global.sprite_select_character_4 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4)+"/Sprites/stand.png", 0, false, false, 36, 44);
					}
					else
					{
						global.sprite_select_character_4 = noone;
					}
					#endregion /*Player 4 character select portrait sprite END*/
					
				}
			}
			#endregion /*Key Left (change portrait sprites) END*/
	
			#region /*Key Right (change portrait sprites)*/
			if (keyboard_check_pressed(global.player4_key_right))
			and(!keyboard_check_pressed(global.player4_key_left))
			or(gamepad_button_check_pressed(3,gp_padr))
			and(!gamepad_button_check_pressed(3,gp_padl))
			or(gamepad_axis_value(3,gp_axislh)>0)
			and(menu_joystick4_delay<=0)
			or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2+player4_display_x+75-16,
			window_get_height()/2-16,
			window_get_width()/2+player4_display_x+75+16,
			window_get_height()/2+16))
			and(mouse_check_button_pressed(mb_left))
			{
				if (menu_delay=0)
				{
					menu_delay=10;
					menu_joystick4_delay=30;
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4+1)+"/Data/character_config.ini"))
					{
						global.character_for_player_4+=1;
						xx4=player4_display_x+32;
					}
					
					sprite_delete(global.sprite_select_character_4);
					
					#region /*Player 4 character select portrait sprite*/
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4)+"/Sprites/character_select_portrait.png"))
					{
						global.sprite_select_character_4 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4)+"/Sprites/character_select_portrait.png", 0, false, false, 196, 287);
					}
					else
					if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4)+"/Sprites/stand.png"))
					{
						global.sprite_select_character_4 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4)+"/Sprites/stand.png", 0, false, false, 36, 44);
					}
					else
					{
						global.sprite_select_character_4 = noone;
					}
					#endregion /*Player 4 character select portrait sprite END*/
					
				}
			}
			#endregion /*Key Right (change portrait sprites) END*/
	
		}
	}
	#endregion /*Player 4 END*/

	#region /*Player 4 key down*/
	if (keyboard_check_pressed(global.player4_key_down))
	and(!keyboard_check_pressed(global.player4_key_up))
	or(gamepad_button_check_pressed(3,gp_padd))
	and(!gamepad_button_check_pressed(3,gp_padu))
	or(gamepad_axis_value(3,gp_axislv)>0)
	and(menu_joystick4_delay<=0)
	{
		if (menu_delay=0)
		{
			menu_delay=10;
			menu_joystick4_delay=30;
			player_4_menu="select_name";
		}
	}
	#endregion /*Player 4 key down END*/
	}
	if (player_4_menu="select_name")
	{
		
		#region /*Player 4 key up*/
		if (keyboard_check_pressed(global.player4_key_up))
		and(!keyboard_check_pressed(global.player4_key_down))
		or(gamepad_button_check_pressed(3,gp_padu))
		and(!gamepad_button_check_pressed(3,gp_padd))
		or(gamepad_axis_value(3,gp_axislv)<0)
		and(menu_joystick4_delay<=0)
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				menu_joystick4_delay=30;
				player_4_menu="select_character";
			}
		}
		#endregion /*Player 4 key up END*/
		
	if (can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		if (gamepad_button_check_pressed(3,gp_face1))
		or(keyboard_check_pressed(global.player4_key_jump))
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				keyboard_string=global.player4_name;
				can_input_player1_name=false;
				can_input_player2_name=false;
				can_input_player3_name=false;
				can_input_player4_name=true;
			}
		}
	}
}

}
#endregion /*Menu Navigation END*/

#region /*Click on name to input name*/
if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
window_get_width()/2+player1_display_x-150,
window_get_height()/2+250-16,
window_get_width()/2+player1_display_x+150,
window_get_height()/2+250+16))
and(mouse_check_button_pressed(mb_left))
and(menu_delay=0)
{
	menu_delay=10;
	keyboard_string=global.player1_name;
	can_input_player1_name=true;
	can_input_player2_name=false;
	can_input_player3_name=false;
	can_input_player4_name=false;
}
if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
window_get_width()/2+player2_display_x-150,
window_get_height()/2+250-16,
window_get_width()/2+player2_display_x+150,
window_get_height()/2+250+16))
and(mouse_check_button_pressed(mb_left))
and(menu_delay=0)
{
	menu_delay=10;
	keyboard_string=global.player2_name;
	can_input_player1_name=false;
	can_input_player2_name=true;
	can_input_player3_name=false;
	can_input_player4_name=false;
}
if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
window_get_width()/2+player3_display_x-150,
window_get_height()/2+250-16,
window_get_width()/2+player3_display_x+150,
window_get_height()/2+250+16))
and(mouse_check_button_pressed(mb_left))
and(menu_delay=0)
{
	menu_delay=10;
	keyboard_string=global.player3_name;
	can_input_player1_name=false;
	can_input_player2_name=false;
	can_input_player3_name=true;
	can_input_player4_name=false;
}
if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
window_get_width()/2+player4_display_x-150,
window_get_height()/2+250-16,
window_get_width()/2+player4_display_x+150,
window_get_height()/2+250+16))
and(mouse_check_button_pressed(mb_left))
and(menu_delay=0)
{
	menu_delay=10;
	keyboard_string=global.player4_name;
	can_input_player1_name=false;
	can_input_player2_name=false;
	can_input_player3_name=false;
	can_input_player4_name=true;
}
#endregion /*Click on name to input name END*/

	#region /*Accept and Back*/
	if (can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	{
		
		#region /*Accept*/
		if (gamepad_button_check_pressed(0,gp_face1))
		or(keyboard_check_pressed(vk_enter))
		or(keyboard_check_pressed(global.player1_key_jump))
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
		window_get_width()/2+player1_display_x-100,
		window_get_height()/2+150-20,
		window_get_width()/2+player1_display_x+100,
		window_get_height()/2+150+20))
		and(mouse_check_button_pressed(mb_left))
		{
			if (player1_accept_selection=false)
			and(player_1_menu="select_character")
			and(menu_delay=0)
			{
				menu_delay=10;
				player1_accept_selection=true;
				if (global.character_for_player_1=0)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character0,0,0);
					audio_sound_gain(menuvoice_select_character0,global.voices_volume,0);
				}
				else
				if (global.character_for_player_1=1)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character1,0,0);
					audio_sound_gain(menuvoice_select_character1,global.voices_volume,0);
				}
				audio_stop_sound(menuvoice_1player);
				audio_stop_sound(menuvoice_2player);
				audio_stop_sound(menuvoice_3player);
				audio_stop_sound(menuvoice_4player);
			}
		}
		if (gamepad_button_check_pressed(1,gp_face1))
		or(keyboard_check_pressed(global.player2_key_jump))
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
		window_get_width()/2+player2_display_x-100,
		window_get_height()/2+150-20,
		window_get_width()/2+player2_display_x+100,
		window_get_height()/2+150+20))
		and(mouse_check_button_pressed(mb_left))
		{
			if (player2_accept_selection=false)
			and(player_2_menu="select_character")
			and(menu_delay=0)
			{
				menu_delay=10;
				player2_accept_selection=true;
				if (global.character_for_player_2=0)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character0,0,0);
					audio_sound_gain(menuvoice_select_character0,global.voices_volume,0);
				}
				else
				if (global.character_for_player_2=1)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character1,0,0);
					audio_sound_gain(menuvoice_select_character1,global.voices_volume,0);
				}
				audio_stop_sound(menuvoice_1player);
				audio_stop_sound(menuvoice_2player);
				audio_stop_sound(menuvoice_3player);
				audio_stop_sound(menuvoice_4player);
			}
		}
		if (gamepad_button_check_pressed(2,gp_face1))
		or(keyboard_check_pressed(global.player3_key_jump))
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
		window_get_width()/2+player3_display_x-100,
		window_get_height()/2+150-20,
		window_get_width()/2+player3_display_x+100,
		window_get_height()/2+150+20))
		and(mouse_check_button_pressed(mb_left))
		{
			if (player3_accept_selection=false)
			and(player_3_menu="select_character")
			and(menu_delay=0)
			{
				menu_delay=10;
				player3_accept_selection=true;
				if (global.character_for_player_3=0)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character0,0,0);
					audio_sound_gain(menuvoice_select_character0,global.voices_volume,0);
				}
				else
				if (global.character_for_player_3=1)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character1,0,0);
					audio_sound_gain(menuvoice_select_character1,global.voices_volume,0);
				}
				audio_stop_sound(menuvoice_1player);
				audio_stop_sound(menuvoice_2player);
				audio_stop_sound(menuvoice_3player);
				audio_stop_sound(menuvoice_4player);
			}
		}
		if (gamepad_button_check_pressed(3,gp_face1))
		or(keyboard_check_pressed(global.player4_key_jump))
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
		window_get_width()/2+player4_display_x-100,
		window_get_height()/2+150-20,
		window_get_width()/2+player4_display_x+100,
		window_get_height()/2+150+20))
		and(mouse_check_button_pressed(mb_left))
		{
			if (player4_accept_selection=false)
			and(player_4_menu="select_character")
			and(menu_delay=0)
			{
				menu_delay=10;
				player4_accept_selection=true;
				if (global.character_for_player_4=0)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character0,0,0);
					audio_sound_gain(menuvoice_select_character0,global.voices_volume,0);
				}
				else
				if (global.character_for_player_4=1)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(menuvoice_select_character1,0,0);
					audio_sound_gain(menuvoice_select_character1,global.voices_volume,0);
				}
				audio_stop_sound(menuvoice_1player);
				audio_stop_sound(menuvoice_2player);
				audio_stop_sound(menuvoice_3player);
				audio_stop_sound(menuvoice_4player);
			}
		}
	
	#region /*Start Game*/
	
	#region /*If 1 Player Game is selected and player 1 has selected a character*/
	if (global.playergame<=0)
	{
		if (player1_accept_selection=true)
		{
			player1_start_game=true;
		}
		else
		{
			player1_start_game=false;
		}
	}
	#endregion /*If 1 Player Game is selected and player 1 has selected a character END*/
	
	#region /*If 2 Player Game is selected and player 1 and 2 has selected a character*/
	if (global.playergame=1)
	{
		if (player1_accept_selection=true)
		and(player2_accept_selection=true)
		{
			player1_start_game=true;
		}
		else
		{
			player1_start_game=false;
		}
	}
	#endregion /*If 2 Player Game is selected and player 1 and 2 has selected a character END*/
	
	#region /*If 3 Player Game is selected and player 1, 2 and 3 has selected a character*/
	if (global.playergame=2)
	{
		if (player1_accept_selection=true)
		and(player2_accept_selection=true)
		and(player3_accept_selection=true)
		{
			player1_start_game=true;
		}
		else
		{
			player1_start_game=false;
		}
	}
	#endregion /*If 3 Player Game is selected and player 1, 2 and 3 has selected a character END*/
	
	#region /*If 4 Player Game is selected and player 1, 2, 3 and 4 has selected a character*/
	if (global.playergame>=3)
	{
		if (player1_accept_selection=true)
		and(player2_accept_selection=true)
		and(player3_accept_selection=true)
		and(player4_accept_selection=true)
		{
			player1_start_game=true;
		}
		else
		{
			player1_start_game=false;
		}
	}
	#endregion /*If 4 Player Game is selected and player 1, 2, 3 and 4 has selected a character END*/
	
	#endregion /*Start Game END*/
	
	if (gamepad_button_check_pressed(0,gp_face1))
	or(keyboard_check_pressed(vk_enter))
	or(keyboard_check_pressed(global.player1_key_jump))
	or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
	0,
	window_get_height()/2-32,
	window_get_width(),
	window_get_height()/2+32,))
	and(mouse_check_button_pressed(mb_left))
	{
		if (player1_start_game=true)
		and(can_input_player1_name=false)
		and(can_input_player2_name=false)
		and(can_input_player3_name=false)
		and(can_input_player4_name=false)
		and(player_1_menu="select_character")
		and(menu_delay=0)
		{
			if (global.character_select_in_this_menu="game")
			{
				can_navigate=false;
				menu_delay=999;
			}
			else
			{
				menu="select_custom_level";
				can_navigate=true;
				menu_delay=10;
				player1_accept_selection=false;
				player2_accept_selection=false;
				player3_accept_selection=false;
				player4_accept_selection=false;
				can_input_player1_name=false;
				can_input_player2_name=false;
				can_input_player3_name=false;
				can_input_player4_name=false;
			}
		}
	}
	#endregion /*Accept END*/
	
	#region /*Back / Cancel Selection*/
	
	#region /*Player 1 Back / Cancel Selection*/
	if (gamepad_button_check_pressed(0,gp_face2))
	or(keyboard_check_pressed(global.player1_key_sprint))
	or(keyboard_check_pressed(vk_escape))
	or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
	window_get_width()/2+player1_display_x-100,
	window_get_height()/2+150-20,
	window_get_width()/2+player1_display_x+100,
	window_get_height()/2+150+20))
	and(mouse_check_button_pressed(mb_left))
	{
		if (player1_accept_selection=true)
		and(menu_delay=0)
		{
			menu_delay=10;
			player1_accept_selection=false;
			can_navigate=true;
		}
	}
	#endregion /*Player 1 Back / Cancel Selection END*/
	
	#region /*Player 2 Back / Cancel Selection*/
	if (gamepad_button_check_pressed(1,gp_face2))
	or(keyboard_check_pressed(global.player2_key_sprint))
	or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
	window_get_width()/2+player2_display_x-100,
	window_get_height()/2+150-20,
	window_get_width()/2+player2_display_x+100,
	window_get_height()/2+150+20))
	and(mouse_check_button_pressed(mb_left))
	{
		if (player2_accept_selection=true)
		and(menu_delay=0)
		{
			menu_delay=10;
			player2_accept_selection=false;
			can_navigate=true;
		}
	}
	#endregion /*Player 2 Back / Cancel Selection END*/
	
	#region /*Player 3 Back / Cancel Selection*/
	if (gamepad_button_check_pressed(2,gp_face2))
	or(keyboard_check_pressed(global.player3_key_sprint))
	or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
	window_get_width()/2+player3_display_x-100,
	window_get_height()/2+150-20,
	window_get_width()/2+player3_display_x+100,
	window_get_height()/2+150+20))
	and(mouse_check_button_pressed(mb_left))
	{
		if (player3_accept_selection=true)
		and(menu_delay=0)
		{
			menu_delay=10;
			player3_accept_selection=false;
			can_navigate=true;
		}
	}
	#endregion /*Player 3 Back / Cancel Selection END*/
	
	#region /*Player 4 Back / Cancel Selection*/
	if (gamepad_button_check_pressed(3,gp_face2))
	or(keyboard_check_pressed(global.player4_key_sprint))
	or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
	window_get_width()/2+player4_display_x-100,
	window_get_height()/2+150-20,
	window_get_width()/2+player4_display_x+100,
	window_get_height()/2+150+20))
	and(mouse_check_button_pressed(mb_left))
	{
		if (player4_accept_selection=true)
		and(menu_delay=0)
		{
			menu_delay=10;
			player4_accept_selection=false;
			can_navigate=true;
		}
	}
	#endregion /*Player 4 Back / Cancel Selection END*/
	
	#region /*If 1 Player Game is selected and player 1 has selected a character*/
	if (global.playergame<=0)
	{
		if (player1_accept_selection=true)
		{
			player1_start_game=true;
		}
		else
		{
			player1_start_game=false;
		}
	}
	#endregion /*If 1 Player Game is selected and player 1 has selected a character END*/
	
	#region /*If 2 Player Game is selected and player 1 and 2 has selected a character*/
	if (global.playergame=1)
	{
		if (player1_accept_selection=true)
		and(player2_accept_selection=true)
		{
			player1_start_game=true;
		}
		else
		{
			player1_start_game=false;
		}
	}
	#endregion /*If 2 Player Game is selected and player 1 and 2 has selected a character END*/
	
	#region /*If 3 Player Game is selected and player 1, 2 and 3 has selected a character*/
	if (global.playergame=2)
	{
		if (player1_accept_selection=true)
		and(player2_accept_selection=true)
		and(player3_accept_selection=true)
		{
			player1_start_game=true;
		}
		else
		{
			player1_start_game=false;
		}
	}
	#endregion /*If 3 Player Game is selected and player 1, 2 and 3 has selected a character END*/
	
	#region /*If 4 Player Game is selected and player 1, 2, 3 and 4 has selected a character*/
	if (global.playergame>=3)
	{
		if (player1_accept_selection=true)
		and(player2_accept_selection=true)
		and(player3_accept_selection=true)
		and(player4_accept_selection=true)
		{
			player1_start_game=true;
		}
		else
		{
			player1_start_game=false;
		}
	}
	#endregion /*If 4 Player Game is selected and player 1, 2, 3 and 4 has selected a character END*/
	
	if (keyboard_check_pressed(global.player1_key_sprint))
	or(keyboard_check_pressed(global.player1_key2_sprint))
	or(keyboard_check_pressed(ord("X")))
	or(keyboard_check_pressed(vk_backspace))
	or(keyboard_check_pressed(vk_escape))
	{
		if (menu_delay=0)
		and(player1_start_game=false)
		and(player1_accept_selection=false)
		and(can_input_player1_name=false)
		and(can_input_player2_name=false)
		and(can_input_player3_name=false)
		and(can_input_player4_name=false)
		{
			image_alpha=1;
			player2_accept_selection=false;
			player3_accept_selection=false;
			player4_accept_selection=false;
			player_1_menu="select_character";
			player_2_menu="select_character";
			player_3_menu="select_character";
			player_4_menu="select_character";
			xx1=player1_display_x;
			xx2=player2_display_x;
			xx3=player3_display_x;
			xx4=player4_display_x;
			if (global.playergame<=0)
			{
				if (global.select_number_of_players_before_selecting_characters=false)
				{
					if (global.character_select_in_this_menu="game")
					{
						menu="main_game";
					}
					else
					{
						menu="leveleditor";
					}
				}
				else
				{
					menu="1player";
				}
				can_navigate=true;
				menu_delay=10;
				global.level_editor_level=1;
		
				#region /*Update Thumbnail*/
				if (file_exists(working_directory+"\Custom Levels\Level"+string(global.level_editor_level)+"/Thumbnail.png"))
				{
					global.thumbnail_sprite=sprite_add(working_directory+"\Custom Levels\Level"+string(global.level_editor_level)+"/Thumbnail.png",0,false,true,window_get_width()/2,0);
				}
				#endregion /*Update Thumbnail END*/
		
			}
			if (global.playergame=1)
			{
				if (global.select_number_of_players_before_selecting_characters=false)
				{
					if (global.character_select_in_this_menu="game")
					{
						menu="main_game";
					}
					else
					{
						menu="leveleditor";
					}
				}
				else
				{
					menu="2player";
				}
				can_navigate=true;
				menu_delay=10;
				global.level_editor_level=1;
		
				#region /*Update Thumbnail*/
				if (file_exists(working_directory+"\Custom Levels\Level"+string(global.level_editor_level)+"/Thumbnail.png"))
				{
					global.thumbnail_sprite=sprite_add(working_directory+"\Custom Levels\Level"+string(global.level_editor_level)+"/Thumbnail.png",0,false,true,window_get_width()/2,0);
				}
				#endregion /*Update Thumbnail END*/
		
			}
			if (global.playergame=2)
			{
				if (global.select_number_of_players_before_selecting_characters=false)
				{
					if (global.character_select_in_this_menu="game")
					{
						menu="main_game";
					}
					else
					{
						menu="leveleditor";
					}
				}
				else
				{
					menu="3player";
				}
				can_navigate=true;
				menu_delay=10;
				global.level_editor_level=1;
		
				#region /*Update Thumbnail*/
				if (file_exists(working_directory+"\Custom Levels\Level"+string(global.level_editor_level)+"/Thumbnail.png"))
				{
					global.thumbnail_sprite=sprite_add(working_directory+"\Custom Levels\Level"+string(global.level_editor_level)+"/Thumbnail.png",0,false,true,window_get_width()/2,0);
				}
				#endregion /*Update Thumbnail END*/
		
			}
			if (global.playergame>=3)
			{
				if (global.select_number_of_players_before_selecting_characters=false)
				{
					if (global.character_select_in_this_menu="game")
					{
						menu="main_game";
					}
					else
					{
						menu="leveleditor";
					}
				}
				else
				{
					menu="4player";
				}
				can_navigate=true;
				menu_delay=10;
				global.level_editor_level=1;
		
				#region /*Update Thumbnail*/
				if (file_exists(working_directory+"\Custom Levels\Level"+string(global.level_editor_level)+"/Thumbnail.png"))
				{
					global.thumbnail_sprite=sprite_add(working_directory+"\Custom Levels\Level"+string(global.level_editor_level)+"/Thumbnail.png",0,false,true,window_get_width()/2,0);
				}
				#endregion /*Update Thumbnail END*/
		
			}
		}
	}
	#endregion /*Back / Cancel Selection END*/
	
	}
	#endregion /*Accept and Back END*/

	if (menu_delay>0)
	{
		menu_delay-=1;
	}
	if (menu_delay<0)
	{
		menu_delay=0;
	}


	#region /*Menu navigation with joystick*/
	if (gamepad_axis_value(0,gp_axislv)<0)
	or(gamepad_axis_value(0,gp_axislv)>0)
	or(gamepad_axis_value(0,gp_axislh)<0)
	or(gamepad_axis_value(0,gp_axislh)>0)
	{
		if (menu_joystick1_delay=0)
		{
			menu_joystick1_delay=30;
		}
	}
	if (gamepad_axis_value(1,gp_axislv)<0)
	or(gamepad_axis_value(1,gp_axislv)>0)
	or(gamepad_axis_value(1,gp_axislh)<0)
	or(gamepad_axis_value(1,gp_axislh)>0)
	{
		if (menu_joystick2_delay=0)
		{
			menu_joystick2_delay=30;
		}
	}
	if (gamepad_axis_value(2,gp_axislv)<0)
	or(gamepad_axis_value(2,gp_axislv)>0)
	or(gamepad_axis_value(2,gp_axislh)<0)
	or(gamepad_axis_value(2,gp_axislh)>0)
	{
		if (menu_joystick3_delay=0)
		{
			menu_joystick3_delay=30;
		}
	}
	if (gamepad_axis_value(3,gp_axislv)<0)
	or(gamepad_axis_value(3,gp_axislv)>0)
	or(gamepad_axis_value(3,gp_axislh)<0)
	or(gamepad_axis_value(3,gp_axislh)>0)
	{
		if (menu_joystick4_delay=0)
		{
			menu_joystick4_delay=30;
		}
	}
	if (gamepad_axis_value(0,gp_axislv)=0)
	and(gamepad_axis_value(0,gp_axislh)=0)
	{
		menu_joystick1_delay=0;
	}
	if (gamepad_axis_value(1,gp_axislv)=0)
	and(gamepad_axis_value(1,gp_axislh)=0)
	{
		menu_joystick2_delay=0;
	}
	if (gamepad_axis_value(2,gp_axislv)=0)
	and(gamepad_axis_value(2,gp_axislh)=0)
	{
		menu_joystick3_delay=0;
	}
	if (gamepad_axis_value(3,gp_axislv)=0)
	and(gamepad_axis_value(3,gp_axislh)=0)
	{
		menu_joystick4_delay=0;
	}
	if (menu_joystick1_delay>0)
	{
		menu_joystick1_delay-=1;
	}
	if (menu_joystick2_delay>0)
	{
		menu_joystick2_delay-=1;
	}
	if (menu_joystick3_delay>0)
	{
		menu_joystick3_delay-=1;
	}
	if (menu_joystick4_delay>0)
	{
		menu_joystick4_delay-=1;
	}
	#endregion /*Menu navigation with joystick END*/

	}
	
	#region /*Play the game text*/
	if (player1_start_game=true)
	and(can_input_player1_name=false)
	and(can_input_player2_name=false)
	and(can_input_player3_name=false)
	and(can_input_player4_name=false)
	and(asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	and(player_1_menu="select_character")
	{
		if (obj_camera.iris_xscale>=1)
		and(obj_camera.iris_yscale>=1)
		{
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			0,
			window_get_height()/2-32,
			window_get_width(),
			window_get_height()/2+32,))
			and(global.controls_used_for_menu_navigation="mouse")
			{
				draw_rectangle_color(
				0,
				window_get_height()/2-32-4,
				window_get_width(),
				window_get_height()/2+32+4,
				c_red,c_yellow,c_yellow,c_red,false);
			}
			draw_rectangle_color(
			0,
			window_get_height()/2-32,
			window_get_width(),
			window_get_height()/2+32,
			c_black,c_black,c_black,c_black,false);
			
			draw_text_outlined(
			window_get_width()/2-40,
			window_get_height()/2,
			"Play the game!",global.default_text_size*2,c_black,c_white,1);
			
			#region /*Show Key A on screen*/
			if (gamepad_is_connected(0))
			and(asset_get_type("spr_xbox_buttons") == asset_sprite)
			{
				draw_sprite_ext(spr_xbox_buttons,0,
				window_get_width()/2+170,
				window_get_height()/2,
				0.5,0.5,0,c_white,1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys")==asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys,global.player1_key_jump,
					window_get_width()/2+170,
					window_get_height()/2,
					0.5,0.5,0,c_white,1);
				}
			}
			#endregion /*Show Key A on screen END*/
			
			if (global.playergame>=1)
			{
				draw_set_alpha(0.9);
				draw_rectangle_color(
				window_get_width()/2-168,
				window_get_height()/2+32,
				window_get_width()/2+168,
				window_get_height()/2+64,
				c_black,c_black,c_black,c_black,false);
				
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_set_valign(fa_center);
				draw_text_outlined(
				window_get_width()/2,
				window_get_height()/2+45,
				"Player 1 starts the game",global.default_text_size,c_black,global.player1_color,1);
			}
		}
	}
	#endregion /*Play the game text END*/
	
}