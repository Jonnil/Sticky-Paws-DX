///Draw Event

#region /*Background Brightness in Gameplay Options*/
if (asset_get_type("obj_title") == asset_object)
and(!instance_exists(obj_title))
{
	if (asset_get_type("obj_background_brightness_gameplay") == asset_object)
	{
		with (obj_background_brightness_gameplay)
		{
			instance_destroy();
		}
	}
	background_brightness_lerp=lerp(background_brightness_lerp,global.background_brightness_gameplay,0.1);
	if (background_brightness_lerp< 0)
	{
		draw_set_alpha(abs(background_brightness_lerp));
		draw_rectangle_color(-32,-32,room_width*2,room_height*2,c_black,c_black,c_black,c_black,false);
		draw_set_alpha(1);
	}
	else
	if (background_brightness_lerp > 0)
	{
		draw_set_alpha(abs(background_brightness_lerp));
		draw_rectangle_color(-32,-32,room_width*2,room_height*2,c_white,c_white,c_white,c_white,false);
		draw_set_alpha(1);
	}
}
#endregion /*Background Brightness in Gameplay Options END*/

#region /*Fullscreen Toggle if camera doesn't exist. Default: F11*/
if (keyboard_check_pressed(global.fullscreen_key))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
	ini_open("Config.ini");
	ini_write_real("Config","fullscreen_mode",window_get_fullscreen());
	ini_close();
}
#endregion /*Fullscreen Toggle if camera doesn't exist. Default: F11 END*/

#region /*Backgrounds*/
layer_background_sprite(layer_background_get_id(layer_get_id("Background")),global.custom_background1);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")),global.custom_background2);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")),global.custom_background3);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")),global.custom_background4);
#endregion /*Backgrounds END*/

#region /*Make background visible*/
if (room = room_leveleditor)
{
	if (global.custom_background1>noone)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background")),true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background")),false)
	}

	if (global.custom_background2>noone)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_2")),true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_2")),false)
	}

	if (global.custom_background3>noone)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_3")),true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_3")),false)
	}

	if (global.custom_background4>noone)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_4")),true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_4")),false)
	}
}
#endregion /*Make background visible END*/

#region /*Spawn transparent foreground*/
if (asset_get_type("obj_foreground2") == asset_object)
and(!instance_exists(obj_foreground2))
{
	instance_create_depth(0,0,0,obj_foreground2);
}
#endregion /*Spawn transparent foreground END*/

#region /*Parallax Scrolling Background*/
layer_x(layer_get_id("Background"),camera_get_view_x(view_camera[view_current])/3);
layer_y(layer_get_id("Background"),camera_get_view_y(view_camera[view_current])/3);
layer_x(layer_get_id("Background_2"),camera_get_view_x(view_camera[view_current])/4);
layer_y(layer_get_id("Background_2"),camera_get_view_y(view_camera[view_current])/4);
layer_x(layer_get_id("Background_3"),camera_get_view_x(view_camera[view_current])/7);
layer_y(layer_get_id("Background_3"),camera_get_view_y(view_camera[view_current])/7);
layer_x(layer_get_id("Background_4"),camera_get_view_x(view_camera[view_current])/9);
layer_y(layer_get_id("Background_4"),camera_get_view_y(view_camera[view_current])/9);
#endregion /*Parallax Scrolling Background END*/

#region /*Deactivate instances outside view*/
if (startup_loading_timer<11)
{
	startup_loading_timer+=1;
}

if (quit_level_editor=0)
and(global.play_edited_level=false)
and(startup_loading_timer>10)
{
	instance_activate_all();
	if (global.deactivate_objects_outsiede_view=true)
	{
		instance_deactivate_region(camera_get_view_x(view_camera[view_current])-128,camera_get_view_y(view_camera[view_current])-128,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])+256,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])+256,false,true);
	}
}
else
{
	instance_activate_all();
}

#region /*Activate objects that always should be active*/
if (asset_get_type("obj_player")==asset_object)
{
	instance_activate_object(obj_player);
}
if (asset_get_type("obj_player_die")==asset_object)
{
	instance_activate_object(obj_player_die);
}
if (asset_get_type("obj_foreground1")==asset_object)
{
	instance_activate_object(obj_foreground1);
}
if (asset_get_type("obj_foreground2")==asset_object)
{
	instance_activate_object(obj_foreground2);
}
if (asset_get_type("obj_level_start")==asset_object)
{
	instance_activate_object(obj_level_start);
}
if (asset_get_type("obj_level_end")==asset_object)
{
	instance_activate_object(obj_level_end);
}
if (asset_get_type("obj_level_height")==asset_object)
{
	instance_activate_object(obj_level_height);
}
#endregion /*Activate objects that always should be active END*/

#endregion /*Deactivate instances outside view END*/

#region /*Controls for level editor*/
gamepad_set_axis_deadzone(0,0.5);
key_up=(keyboard_check_pressed(global.player1_key_up))and(!keyboard_check_pressed(global.player1_key_down))or(keyboard_check_pressed(vk_up))and(!keyboard_check_pressed(vk_down))or(keyboard_check_pressed(ord("W")))and(!keyboard_check_pressed(ord("S")))or(gamepad_button_check_pressed(0,gp_padu))and(!gamepad_button_check_pressed(0,gp_padd))or(gamepad_axis_value(0,gp_axislv)<0);
key_left=(keyboard_check_pressed(global.player1_key_left))and(!keyboard_check_pressed(global.player1_key_right))or(keyboard_check_pressed(vk_left))and(!keyboard_check_pressed(vk_right))or(keyboard_check_pressed(ord("A")))and(!keyboard_check_pressed(ord("D")))or(gamepad_button_check_pressed(0,gp_padl))and(!gamepad_button_check_pressed(0,gp_padr))or(gamepad_axis_value(0,gp_axislh)<0);
key_right=(keyboard_check_pressed(global.player1_key_right))and(!keyboard_check_pressed(global.player1_key_left))or(keyboard_check_pressed(vk_right))and(!keyboard_check_pressed(vk_left))or(keyboard_check_pressed(ord("D")))and(!keyboard_check_pressed(ord("A")))or(gamepad_button_check_pressed(0,gp_padr))and(!gamepad_button_check_pressed(0,gp_padl))or(gamepad_axis_value(0,gp_axislh)>0);
key_down=(keyboard_check_pressed(global.player1_key_down))and(!keyboard_check_pressed(global.player1_key_up))or(keyboard_check_pressed(vk_down))and(!keyboard_check_pressed(vk_up))or(keyboard_check_pressed(ord("S")))and(!keyboard_check_pressed(ord("W")))or(gamepad_button_check_pressed(0,gp_padd))and(!gamepad_button_check_pressed(0,gp_padu))or(gamepad_axis_value(0,gp_axislv)>0);
key_a_pressed=(gamepad_button_check_pressed(0,gp_face1))or(keyboard_check_pressed(global.player1_key_jump))or(keyboard_check_pressed(ord("Z")))or(keyboard_check_pressed(vk_space))or(keyboard_check_pressed(vk_enter));
key_a_released=(gamepad_button_check_released(0,gp_face1))or(keyboard_check_released(global.player1_key_jump))or(keyboard_check_released(ord("Z")))or(keyboard_check_released(vk_space))or(keyboard_check_released(vk_enter));
key_a_hold=(gamepad_button_check(0,gp_face1))or(keyboard_check(global.player1_key_jump))or(keyboard_check(ord("Z")))or(keyboard_check(vk_space))or(keyboard_check(vk_enter));
key_b=(gamepad_button_check(0,gp_face2))or(keyboard_check(global.player1_key_sprint))or(keyboard_check(ord("X")))or(keyboard_check(vk_backspace));
key_b_pressed=(gamepad_button_check_pressed(0,gp_face2))or(keyboard_check_pressed(global.player1_key_sprint))or(keyboard_check_pressed(ord("X")))or(keyboard_check_pressed(vk_backspace));
key_b_released=(gamepad_button_check_released(0,gp_face2))or(keyboard_check_released(global.player1_key_sprint))or(keyboard_check_released(ord("X")))or(keyboard_check_released(vk_backspace));#endregion /*Controls for level editor END*/

#region /*List of Placable Objects*/
total_number_of_objects=36;/*This is the total number of objects you have in the list to let the level editor know (0 is counted as object number 1) */
if (selected_object=0){place_object=1;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_wall")==asset_sprite){sprite_index=spr_wall;}mask_index=spr_wall;}
if (selected_object=1){place_object=2;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_spikes")==asset_sprite){sprite_index=spr_spikes;}mask_index=spr_wall;}
if (selected_object=2){place_object=3;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_semisolid_platform")==asset_sprite){sprite_index=spr_semisolid_platform;}mask_index=spr_wall;}
if (selected_object=3){place_object=4;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_brick_block")==asset_sprite){sprite_index=spr_brick_block;}mask_index=spr_wall;}
if (selected_object=4){place_object=11;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_question_block")==asset_sprite){sprite_index=spr_question_block;}mask_index=spr_wall;}
if (selected_object=5){place_object=18;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_hard_block")==asset_sprite){sprite_index=spr_hard_block;}mask_index=spr_wall;}
if (selected_object=6){place_object=19;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_falling_block")==asset_sprite){sprite_index=spr_falling_block;}mask_index=spr_wall;}
if (selected_object=7){place_object=21;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_falling_block_long")==asset_sprite){sprite_index=spr_falling_block_long;}if (asset_get_type("spr_cardboard")==asset_sprite){mask_index=spr_cardboard;}}
if (selected_object=8){place_object=23;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_cloud_block")==asset_sprite){sprite_index=spr_cloud_block;}mask_index=spr_wall;}
if (selected_object=9){place_object=24;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_ice_block")==asset_sprite){sprite_index=spr_ice_block;}mask_index=spr_wall;}
if (selected_object=10){place_object=25;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_cardboard_block")==asset_sprite){sprite_index=spr_cardboard_block;}mask_index=spr_wall;}
if (selected_object=11){place_object=26;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_cardboard")==asset_sprite){sprite_index=spr_cardboard;}if (asset_get_type("spr_cardboard")==asset_sprite){mask_index=spr_cardboard;}}
if (selected_object=12){place_object=27;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_cardboard_long")==asset_sprite){sprite_index=spr_cardboard_long;}if (asset_get_type("spr_cardboard_long")==asset_sprite){mask_index=spr_cardboard_long;}}
if (selected_object=13){place_object=28;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_bump_in_ground")==asset_sprite){sprite_index=spr_bump_in_ground;}mask_index=spr_wall;}
if (selected_object=14){place_object=40;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_basic_collectible")==asset_sprite){sprite_index=spr_basic_collectible;}mask_index=spr_wall;}
if (selected_object=15){place_object=48;can_make_place_brush_size_bigger=false;if (asset_get_type("spr_big_collectible")==asset_sprite){sprite_index=spr_big_collectible;}mask_index=spr_wall;}
if (selected_object=16){place_object=53;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_heart")==asset_sprite){sprite_index=spr_heart;}mask_index=spr_wall;}
if (selected_object=17){place_object=54;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_hp_pickup")==asset_sprite){sprite_index=spr_hp_pickup;}mask_index=spr_wall;}
if (selected_object=18){place_object=55;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_invincibility_powerup")==asset_sprite){sprite_index=spr_invincibility_powerup;}mask_index=spr_wall;}
if (selected_object=19){place_object=56;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_1up")==asset_sprite){sprite_index=spr_1up;}mask_index=spr_wall;}
if (selected_object=20){place_object=59;can_make_place_brush_size_bigger=true;sprite_index=sprite_enemy1;mask_index=spr_wall;}
if (selected_object=21){place_object=60;can_make_place_brush_size_bigger=true;sprite_index=sprite_enemy2;mask_index=spr_wall;}
if (selected_object=22){place_object=61;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_blaster")==asset_sprite){sprite_index=spr_blaster;}mask_index=spr_wall;}
if (selected_object=23){place_object=62;can_make_place_brush_size_bigger=false;if (asset_get_type("spr_spring")==asset_sprite){sprite_index=spr_spring;}mask_index=spr_wall;}
if (selected_object=24){place_object=63;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_ladder")==asset_sprite){sprite_index=spr_ladder;}mask_index=spr_wall;}
if (selected_object=25){place_object=64;can_make_place_brush_size_bigger=false;if (asset_get_type("spr_arrow_sign")==asset_sprite){if (!place_meeting(x,y,obj_leveleditor_placed_object))and(erase_mode=false){draw_sprite_ext(spr_arrow_sign,0,x+16,y+16,1,1,0,c_white,0.2);}sprite_index=noone;}mask_index=spr_2x2_block;}
if (selected_object=26){place_object=65;can_make_place_brush_size_bigger=false;if (asset_get_type("spr_arrow_sign_small")==asset_sprite){if (!place_meeting(x,y,obj_leveleditor_placed_object))and(erase_mode=false){draw_sprite_ext(spr_arrow_sign_small,0,x+16,y+16,0.5,0.5,0,c_white,0.2);}sprite_index=noone;}mask_index=spr_2x2_block;}
if (selected_object=27){place_object=66;can_make_place_brush_size_bigger=false;if (asset_get_type("spr_checkpoint")==asset_sprite){if (!place_meeting(x,y,obj_leveleditor_placed_object))and(erase_mode=false){draw_sprite_ext(spr_checkpoint,0,x+16,y,1,1,0,c_white,0.2);}sprite_index=noone;}mask_index=spr_2x2_block;}
if (selected_object=28){place_object=67;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_spikes_emerge_block")==asset_sprite){sprite_index=spr_spikes_emerge_block;}mask_index=spr_wall;}
if (selected_object=29){place_object=68;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_oneway")==asset_sprite){sprite_index=spr_oneway;}if (asset_get_type("spr_oneway")==asset_sprite){mask_index=spr_oneway;}}
if (selected_object=30){place_object=72;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_horizontal_rope")==asset_sprite){sprite_index=spr_horizontal_rope;}mask_index=spr_wall;}
if (selected_object=31){place_object=73;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_water_surface")==asset_sprite){sprite_index=spr_water_surface;}mask_index=spr_wall;}
if (selected_object=32){place_object=74;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_clipped_shirt")==asset_sprite){sprite_index=spr_clipped_shirt;}mask_index=spr_wall;}
if (selected_object=33){place_object=77;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_bucket")==asset_sprite){sprite_index=spr_bucket;}mask_index=spr_wall;}
if (selected_object=34){place_object=89;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_bird")==asset_sprite){sprite_index=spr_bird;}mask_index=spr_wall;}
if (selected_object=35){place_object=90;can_make_place_brush_size_bigger=true;if (asset_get_type("spr_sign_crouch")==asset_sprite){sprite_index=spr_sign_crouch;}mask_index=spr_wall;}
if (selected_object=36){place_object=95;can_make_place_brush_size_bigger=false;if (asset_get_type("spr_boss_stand")==asset_sprite){sprite_index=spr_boss_stand;}mask_index=spr_wall;}
#endregion /*List of Placable Objects End*/

#region /*Change Brush Size. Key 187 = +. key 189 = -*/
if (key_a_pressed)or(mouse_check_button(mb_left)){if (mouse_wheel_up())and!(mouse_check_button(mb_middle))or(keyboard_check_pressed(vk_add))or(keyboard_check_pressed(187))and!(keyboard_check(vk_control)){if (place_brush_size<5){place_brush_size+=1;}}}
if (key_a_pressed)or(mouse_check_button(mb_left)){if (mouse_wheel_down())and!(mouse_check_button(mb_middle))or(keyboard_check_pressed(vk_subtract))or(keyboard_check_pressed(189))and!(keyboard_check(vk_control)){if (place_brush_size>0){place_brush_size-=1;}}}
if (erase_mode=false){if (keyboard_check_pressed(vk_add))or(keyboard_check_pressed(187))and!(keyboard_check(vk_control)){if (place_brush_size<5){place_brush_size+=1;}}
if (keyboard_check_pressed(vk_subtract))or(keyboard_check_pressed(189))and!(keyboard_check(vk_control)){if (place_brush_size>0){place_brush_size-=1;}}}
if (erase_mode=true){if (mouse_wheel_up())and!(mouse_check_button(mb_middle))or(keyboard_check_pressed(vk_add))or(keyboard_check_pressed(187))and!(keyboard_check(vk_control)){if (erase_brush_size<5){erase_brush_size+=1;}}
if (mouse_wheel_down())and!(mouse_check_button(mb_middle))or(keyboard_check_pressed(vk_subtract))or(keyboard_check_pressed(189))and!(keyboard_check(vk_control)){if (erase_brush_size>0){erase_brush_size-=1;}}}#endregion /*Change Brush Size. Key 187 = +. key 189 = - END*/

#region /*Keyboard Shortcuts*/

#region /*Press D key to change to drawing tool in level editor*/
if (keyboard_check_pressed(ord("D")))
{
	if (fill_mode=false)
	and(erase_mode=false)
	{
		if (place_brush_size=0)
		{
			place_brush_size=1;
		}
		else
		if (place_brush_size=1)
		{
			place_brush_size=2;
		}
		else
		if (place_brush_size=2)
		{
			place_brush_size=3;
		}
		else
		if (place_brush_size=3)
		{
			place_brush_size=4;
		}
		else
		if (place_brush_size=4)
		{
			place_brush_size=5;
		}
		else
		if (place_brush_size=5)
		{
			place_brush_size=0;
		}
	}
	else
	{
		fill_mode=false;
		erase_mode=false;
	}
}
else
#endregion /*Press D key to change to drawing tool in level editor END*/

#region /*Press E key to change to erase tool in level editor*/
if (keyboard_check_pressed(ord("E")))
{
	if (erase_mode=false)
	{
		erase_mode=true;
	}
	else
	if (erase_mode=true)
	{
		fill_mode=false;
		if (erase_brush_size=0)
		{
			erase_brush_size=1;
		}
		else
		if (erase_brush_size=1)
		{
			erase_brush_size=2;
		}
		else
		if (erase_brush_size=2)
		{
			erase_brush_size=3;
		}
		else
		if (erase_brush_size=3)
		{
			erase_brush_size=4;
		}
		else
		if (erase_brush_size=4)
		{
			erase_brush_size=5;
		}
		else
		if (erase_brush_size=5)
		{
			erase_brush_size=0;
		}
	}
}
else
#endregion /*Press E key to change to erase tool in level editor*/

#region /*Press F key to change to fill tool in level editor*/
if (keyboard_check_pressed(ord("F")))
{
	erase_mode=false;
	fill_mode=true;
}
#endregion /*Press F key to change to fill tool in level editor*/

#endregion /*Keyboard Shortcuts END*/

#region /*Grid hotkeys*/
if (keyboard_check(vk_alt))
and(keyboard_check_pressed(ord("A")))
and(pause = false)
{
	show_grid=true;
	if (global.grid_hsnap>1)
	or(global.grid_vsnap>1)
	{
		global.grid_hsnap-=1;
		global.grid_vsnap-=1;
	}
}
if (keyboard_check(vk_alt))
and(keyboard_check_pressed(ord("S")))
and(pause = false)
{
	show_grid=true;
	global.grid_hsnap+=1;
	global.grid_vsnap+=1;
}
#endregion

#region /*Draw Grid*/

#region /*Show or hide grid hotkey*/
if (keyboard_check_pressed(ord("G")))
and(pause = false)
{
	if (show_grid=false)
	{
		show_grid=true;
	}
	else
	{
		show_grid=false;
	}
}
#endregion /*Show or hide grid hotkey END*/

#region /*Fade grid in and out when toggeling*/
if (show_grid=true)
{
	grid_alpha=lerp(grid_alpha,0.25,0.1);
}
else
{
	grid_alpha=lerp(grid_alpha,0,0.1);
}
#endregion /*Fade grid in and out when toggeling END*/

var grid_width=1,
grid_offset=16; /*If the grid should have an offset from the top_left corner of the screen, normally this should be 0*/
draw_set_alpha(grid_alpha);

if (quit_level_editor<=0)
{
	
	#region /*Draw Vertical Line in the Grid*/
	for(var i=0;i<room_height;i+=global.grid_vsnap)
	{
		if (global.grid_vsnap>1)
		{
			draw_line_width_color(-16+grid_offset,i+grid_offset,room_width+16+grid_offset,i+grid_offset,grid_width,c_white,c_white);
		}
	}
	#endregion /*Draw Vertical Line in the Grid END*/

	#region /*Draw Horizontal Line in the Grid*/
	for(var i=0;i<room_width;i+=global.grid_hsnap)
	{
		if (global.grid_hsnap>1)
		{
			draw_line_width_color(i+grid_offset,-16+grid_offset,i+grid_offset,room_height+16+grid_offset,grid_width,c_white,c_white);
		}
	}
	#endregion /*Draw Horizontal Line in the Grid END*/
	
}

draw_set_alpha(1);
#endregion /*Draw Grid END*/

#region /*Zoom In and Out*/
if (pause=false)
{

	#region /*Zoom Out*/
	if (zoom_out=true)
	{
		if (camera_get_view_width(view_camera[view_current])<room_width)
		and(camera_get_view_height(view_camera[view_current])<room_height)
		{
			camera_set_view_size((view_camera[view_current]),camera_get_view_width(view_camera[view_current])+8,camera_get_view_height(view_camera[view_current])+4.5);
			camera_set_view_pos((view_camera[view_current]),camera_get_view_x(view_camera[view_current])-4,camera_get_view_y(view_camera[view_current])-2.5);
		}
		else
		{
			draw_rectangle_color(0,0,camera_get_view_x(view_camera[view_current])+8,room_height,c_red,c_red,c_red,c_red,false);
			draw_rectangle_color(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])-8,0,room_width,room_height,c_red,c_red,c_red,c_red,false);
			draw_rectangle_color(0,0,room_width,camera_get_view_y(view_camera[view_current])+8,c_red,c_red,c_red,c_red,false);
			draw_rectangle_color(0,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-8,room_width,room_height,c_red,c_red,c_red,c_red,false);
		}
	}
	else
	#endregion /*Zoom Out END*/

	#region /*Reset Zoom*/
	if (zoom_reset=true)
	{
		camera_set_view_size(view_camera[view_current],view_wview,view_hview);
	}
	else
	#endregion /*Reset Zoom END*/

	#region /*Zoom In*/
	if (zoom_in=true)
	{
		if (camera_get_view_width(view_camera[view_current])>1392/2)
		and(camera_get_view_height(view_camera[view_current])>736/2)
		{
			camera_set_view_size((view_camera[view_current]),camera_get_view_width(view_camera[view_current])-8,camera_get_view_height(view_camera[view_current])-4.5);
			camera_set_view_pos((view_camera[view_current]),camera_get_view_x(view_camera[view_current])+4,camera_get_view_y(view_camera[view_current])+2.5);
		}
		else
		{
			draw_rectangle_color(0,0,camera_get_view_x(view_camera[view_current])+8,room_height,c_red,c_red,c_red,c_red,false);
			draw_rectangle_color(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])-8,0,room_width,room_height,c_red,c_red,c_red,c_red,false);
			draw_rectangle_color(0,0,room_width,camera_get_view_y(view_camera[view_current])+8,c_red,c_red,c_red,c_red,false);
			draw_rectangle_color(0,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-8,room_width,room_height,c_red,c_red,c_red,c_red,false);
		}
	}
	#endregion /*Zoom In END*/

}
#endregion /*Zoom In and Out End*/

#region /*Always keep the brush size within these values*/
if (place_brush_size<0)
{
	place_brush_size=0;
}
if (place_brush_size>5)
{
	place_brush_size=5;
}
if (erase_brush_size<0)
{
	erase_brush_size=0;
}
if (erase_brush_size>5)
{
	erase_brush_size=5;
}
#endregion /*Always keep the brush size within these values END*/

#region /*Select Object Menu*/
if (mouse_check_button(mb_any))
or(keyboard_check(vk_anykey))
or(key_a_hold)
{
	selected_menu_alpha=lerp(selected_menu_alpha,0,0.1);
}
else
{
	selected_menu_alpha=lerp(selected_menu_alpha,0,0.01);
}
if (quit_level_editor=0)
{
	draw_set_alpha(selected_menu_alpha);
	draw_rectangle_colour(0,0,room_width,camera_get_view_y(view_camera[view_current])+128,c_black,c_black,c_black,c_black,false);
	if (asset_get_type("spr_wall")==asset_sprite){draw_sprite_ext(spr_wall,0,									camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_spikes")==asset_sprite){draw_sprite_ext(spr_spikes,0,								camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_semisolid_platform")==asset_sprite){draw_sprite_ext(spr_semisolid_platform,0,		camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*2,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_brick_block")==asset_sprite){draw_sprite_ext(spr_brick_block,0,						camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*3,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_question_block")==asset_sprite){draw_sprite_ext(spr_question_block,0,				camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*4,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_hard_block")==asset_sprite){draw_sprite_ext(spr_hard_block,0,						camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*5,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_falling_block")==asset_sprite){draw_sprite_ext(spr_falling_block,0,					camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*6,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_falling_block_long")==asset_sprite){draw_sprite_ext(spr_falling_block_long,0,		camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*7-16,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_cloud_block")==asset_sprite){draw_sprite_ext(spr_cloud_block,0,						camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*8,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_ice_block")==asset_sprite){draw_sprite_ext(spr_ice_block,0,							camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*9,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_cardboard_block")==asset_sprite){draw_sprite_ext(spr_cardboard_block,0,				camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*10,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_cardboard")==asset_sprite){draw_sprite_ext(spr_cardboard,0,							camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*11-8,camera_get_view_y(view_camera[view_current])+64,0.5,0.5,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_cardboard_long")==asset_sprite){draw_sprite_ext(spr_cardboard_long,0,				camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*12-16,camera_get_view_y(view_camera[view_current])+64,0.5,0.5,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_bump_in_ground")==asset_sprite){draw_sprite_ext(spr_bump_in_ground,0,				camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*13,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_basic_collectible")==asset_sprite){draw_sprite_ext(spr_basic_collectible,0,			camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*14,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_big_collectible")==asset_sprite){draw_sprite_ext(spr_big_collectible,0,				camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*15,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_heart")==asset_sprite){draw_sprite_ext(spr_heart,0,									camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*16,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_hp_pickup")==asset_sprite){draw_sprite_ext(spr_hp_pickup,0,							camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*17,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_invincibility_powerup")==asset_sprite){draw_sprite_ext(spr_invincibility_powerup,0,	camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*18,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_1up")==asset_sprite){draw_sprite_ext(spr_1up,0,										camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*19,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_red,selected_menu_alpha);draw_set_halign(fa_center);draw_set_valign(fa_center);draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*19,camera_get_view_y(view_camera[view_current])+64,"1-up",global.default_text_size/2,c_white,c_black,selected_menu_alpha);}
	draw_sprite_ext(sprite_enemy1,0,																			camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*20,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);
	draw_sprite_ext(sprite_enemy2,0,																			camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*21,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);
	if (asset_get_type("spr_blaster")==asset_sprite){draw_sprite_ext(spr_blaster,0,								camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*22,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_spring")==asset_sprite){draw_sprite_ext(spr_spring,0,								camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*23,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_ladder")==asset_sprite){draw_sprite_ext(spr_ladder,0,								camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*24,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_arrow_sign")==asset_sprite){draw_sprite_ext(spr_arrow_sign,0,						camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*25,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_arrow_sign_small")==asset_sprite){draw_sprite_ext(spr_arrow_sign_small,0,			camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*26,camera_get_view_y(view_camera[view_current])+64,0.5,0.5,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_checkpoint")==asset_sprite){draw_sprite_ext(spr_checkpoint,0,						camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*27,camera_get_view_y(view_camera[view_current])+64-16,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_spikes_emerge_block")==asset_sprite){draw_sprite_ext(spr_spikes_emerge_block,0,		camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*28,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_oneway")==asset_sprite){draw_sprite_ext(spr_oneway,0,								camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*29,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_horizontal_rope")==asset_sprite){draw_sprite_ext(spr_horizontal_rope,0,				camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*30,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_water_surface")==asset_sprite){draw_sprite_ext(spr_water_surface,0,					camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*31,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_clipped_shirt")==asset_sprite){draw_sprite_ext(spr_clipped_shirt,0,					camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*32,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_bucket")==asset_sprite){draw_sprite_ext(spr_bucket,0,								camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*33,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_bird")==asset_sprite){draw_sprite_ext(spr_bird,0,									camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*34,camera_get_view_y(view_camera[view_current])+64,1,1,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_sign_crouch")==asset_sprite){draw_sprite_ext(spr_sign_crouch,0,						camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*35,camera_get_view_y(view_camera[view_current])+64,0.4,0.4,0,c_white,selected_menu_alpha);}
	if (asset_get_type("spr_boss_stand")==asset_sprite){draw_sprite_ext(spr_boss_stand,0,						camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2+selected_object_menu_x+64*36,camera_get_view_y(view_camera[view_current])+64,0.4,0.4,0,c_white,selected_menu_alpha);}
	draw_set_color(c_black);
	draw_arrow(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+16-8,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+16+8,40);
	draw_set_color(c_white);
	draw_arrow(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+16-8,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+16+8,30);
	draw_set_color(c_black);
	draw_arrow(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+128-16+8,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+128-16-8,40);
	draw_set_color(c_white);
	draw_arrow(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+128-16+8,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+128-16-8,30);
	draw_set_alpha(1);
}
#endregion /*Select Object Menu End*/

#region /*Position the Cursor*/
if (quit_level_editor=0)
{

#region /*Controller Input Changes*/
if (use_controller=false)
{
	x=mouse_x;
	y=mouse_y;
	cursor_x=window_mouse_get_x();
	cursor_y=window_mouse_get_y();
	
	#region /*Change control type to gamepad if using a gamepad*/
	if (gamepad_axis_value(0,gp_axislh)<0)
	or(gamepad_axis_value(0,gp_axislh)>0)
	or(gamepad_axis_value(0,gp_axislv)<0)
	or(gamepad_axis_value(0,gp_axislv)>0)
	or(gamepad_axis_value(0,gp_axisrh)<0)
	or(gamepad_axis_value(0,gp_axisrh)>0)
	or(gamepad_axis_value(0,gp_axisrv)<0)
	or(gamepad_axis_value(0,gp_axisrv)>0)
	or(gamepad_button_check(0,gp_face1))
	or(gamepad_button_check(0,gp_face2))
	or(gamepad_button_check(0,gp_face3))
	or(gamepad_button_check(0,gp_face4))
	or(gamepad_button_check(0,gp_padd))
	or(gamepad_button_check(0,gp_padl))
	or(gamepad_button_check(0,gp_padr))
	or(gamepad_button_check(0,gp_padu))
	or(gamepad_button_check(0,gp_select))
	or(gamepad_button_check(0,gp_shoulderl))
	or(gamepad_button_check(0,gp_shoulderlb))
	or(gamepad_button_check(0,gp_shoulderr))
	or(gamepad_button_check(0,gp_shoulderrb))
	or(gamepad_button_check(0,gp_start))
	or(gamepad_button_check(0,gp_stickl))
	or(gamepad_button_check(0,gp_stickr))
	{
		controller_x=mouse_x;
		controller_y=mouse_y;
		use_controller=true;
	}
	#endregion /*Change control type to gamepad if using a gamepad END*/
	
}
else
if (use_controller=true)
{
	#region /*Change control type to keyboard and mouse if using a keyboard or mouse*/
	if (keyboard_check(vk_anykey))
	or(mouse_check_button(mb_any))
	or(mouse_wheel_down())
	or(mouse_wheel_up())
	{
		use_controller=false;
	}
	#endregion /*Change control type to keyboard and mouse if using a keyboard or mouse END*/
	
	if (key_up)
	and(controller_y>camera_get_view_y(view_camera[view_current]))
	{
		if (gamepad_button_check(0,gp_face3))
		or(gamepad_button_check(0,gp_face4))
		{
			controller_y-=8;
		}
		else
		{
			controller_y-=4;
		}
	}
	if (key_down)
	and(controller_y<camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
	{
		if (gamepad_button_check(0,gp_face3))
		or(gamepad_button_check(0,gp_face4))
		{
			controller_y+=8;
		}
		else
		{
			controller_y+=4;
		}
	}
	if (key_left)
	and(controller_x>camera_get_view_x(view_camera[view_current]))
	{
		if (gamepad_button_check(0,gp_face3))
		or(gamepad_button_check(0,gp_face4))
		{
			controller_x-=8;
		}
		else
		{
			controller_x-=4;
		}
	}
	if (key_right)
	and(controller_x<camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]))
	{
		if (gamepad_button_check(0,gp_face3))
		or(gamepad_button_check(0,gp_face4))
		{
			controller_x+=8;
		}
		else
		{
			controller_x+=4;
		}
	}
	
	#region /*Move view with gamepad*/
	if (gamepad_axis_value(0,gp_axisrv)<0)
	{
		if (gamepad_button_check(0,gp_face3))
		or(gamepad_button_check(0,gp_face4))
		{
			camera_set_view_pos(view_camera[view_current],0,-16);
			if (controller_y>camera_get_view_y(view_camera[view_current]))
			{
				controller_y-=16;
			}
		}
		else
		{
			camera_set_view_pos(view_camera[view_current],0,-8);
			if (controller_y>camera_get_view_y(view_camera[view_current]))
			{
				controller_y-=8;
			}
		}
	}
	if (gamepad_axis_value(0,gp_axisrv)>0)
	{
		if (gamepad_button_check(0,gp_face3))
		or(gamepad_button_check(0,gp_face4))
		{
			camera_set_view_pos(view_camera[view_current],0,+16);
			if (controller_y<camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
			{
				controller_y+=16;
			}
		}
		else
		{
			camera_set_view_pos(view_camera[view_current],0,+8);
			if (controller_y<camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
			{
				controller_y+=8;
			}
		}
	}
	if (gamepad_axis_value(0,gp_axisrh)<0)
	{
		if (gamepad_button_check(0,gp_face3))
		or(gamepad_button_check(0,gp_face4))
		{
			camera_set_view_pos(view_camera[view_current],-16,0);
			if (controller_x>camera_get_view_x(view_camera[view_current]))
			{
				controller_x-=16;
			}
		}
		else
		{
			camera_set_view_pos(view_camera[view_current],-8,0);
			if (controller_x>camera_get_view_x(view_camera[view_current]))
			{
				controller_x-=8;
			}
		}
	}
	if (gamepad_axis_value(0,gp_axisrh)>0)
	{
		if (gamepad_button_check(0,gp_face3))
		or(gamepad_button_check(0,gp_face4))
		{
			camera_set_view_pos(view_camera[view_current],+16,0);
			if (controller_x<camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]))
			{
				controller_x+=16;
			}
		}
		else
		{
			camera_set_view_pos(view_camera[view_current],+8,0);
			if (controller_x<camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]))
			{
				controller_x+=8;
			}
		}
	}
	#endregion /*Move view with gamepad END*/
	x=controller_x;
	y=controller_y;
	cursor_x=controller_x;
	cursor_y=controller_y;
}
#endregion /*Controller Input Changes END*/

move_snap(global.grid_hsnap,global.grid_vsnap); /*Make sure to always move snap*/

#region /*Scroll Cursor*/
if (keyboard_check(vk_space))
and(mouse_check_button(mb_left))
or(mouse_check_button(mb_middle))
{
	if (asset_get_type("spr_cursor_scroll")==asset_sprite)
	{
		mouse_sprite=spr_cursor_scroll;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_size_all);
	}
}
else
if (keyboard_check(vk_space))
{
	if (asset_get_type("spr_cursor_scroll")==asset_sprite)
	{
		mouse_sprite=spr_cursor_scroll;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_size_all);
	}
}
#endregion /*Scroll Cursor END*/

#region /*Fill Cursor*/
else
if (fill_mode=true)
and(erase_mode=false)
and(!place_meeting(x,y,obj_level_start))
and(!place_meeting(x,y,obj_level_end))
{
	if (!place_meeting(x,y,obj_leveleditor_placed_object))
	and(sprite_index>noone)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,0.2);
	}
	draw_set_alpha(0.5);
	draw_set_alpha(1);
	if (asset_get_type("spr_cursor_fill")==asset_sprite)
	{
		mouse_sprite=spr_cursor_fill;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_arrow);
	}
}
#endregion /*Fill Cursor END*/

else

#region /*Erase Cursor*/
if (erase_mode=true)
{
	draw_set_alpha(0.5);
	{
		if (erase_brush_size=5)
		{
			draw_rectangle_colour(x-80,y-80,x+112,y+112,c_red,c_red,c_red,c_red,false);
		}
		else
		if (erase_brush_size=4)
		{
			draw_rectangle_colour(x-80,y-80,x+80,y+80,c_red,c_red,c_red,c_red,false);
		}
		else
		if (erase_brush_size=3)
		{
			draw_rectangle_colour(x-48,y-48,x+80,y+80,c_red,c_red,c_red,c_red,false);
		}
		else
		if (erase_brush_size=2)
		{
			draw_rectangle_colour(x-48,y-48,x+48,y+48,c_red,c_red,c_red,c_red,false);
		}
		else
		if (erase_brush_size=1)
		{
			draw_rectangle_colour(x-16,y-16,x+48,y+48,c_red,c_red,c_red,c_red,false);
		}
		else
		{
			draw_rectangle_colour(x-16,y-16,x+16,y+16,c_red,c_red,c_red,c_red,false);
		}
	}
	draw_set_alpha(1);
	if (asset_get_type("spr_cursor_erase")==asset_sprite)
	{
		mouse_sprite=spr_cursor_erase;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_arrow);
	}
}
#endregion /*Erase Cursor END*/

/*Default Cursor*/
else
if (asset_get_type("obj_leveleditor_placed_object")==asset_object)
and(drag_object=false)
and(fill_mode=false)
and(pause=false)
{
	if (!place_meeting(x,y,obj_leveleditor_placed_object))
	and(sprite_index>noone)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,0.2);
	}

	if (can_make_place_brush_size_bigger=true)
	{
		if!place_meeting(x+32,y,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=1){draw_sprite_ext(sprite_index,image_index,x+32,y,1,1,0,c_white,0.2);}
		if!place_meeting(x+32,y+32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=1){draw_sprite_ext(sprite_index,image_index,x+32,y+32,1,1,0,c_white,0.2);}
		if!place_meeting(x,y+32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=1){draw_sprite_ext(sprite_index,image_index,x,y+32,1,1,0,c_white,0.2);}

		if!place_meeting(x+32,y-32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=2){draw_sprite_ext(sprite_index,image_index,x+32,y-32,1,1,0,c_white,0.2);}
		if!place_meeting(x,y-32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=2){draw_sprite_ext(sprite_index,image_index,x,y-32,1,1,0,c_white,0.2);}
		if!place_meeting(x-32,y-32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=2){draw_sprite_ext(sprite_index,image_index,x-32,y-32,1,1,0,c_white,0.2);}
		if!place_meeting(x-32,y,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=2){draw_sprite_ext(sprite_index,image_index,x-32,y,1,1,0,c_white,0.2);}
		if!place_meeting(x-32,y+32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=2){draw_sprite_ext(sprite_index,image_index,x-32,y+32,1,1,0,c_white,0.2);}

		if!place_meeting(x+64,y-32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3){draw_sprite_ext(sprite_index,image_index,x+64,y-32,1,1,0,c_white,0.2);}
		if!place_meeting(x+64,y,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3){draw_sprite_ext(sprite_index,image_index,x+64,y,1,1,0,c_white,0.2);}
		if!place_meeting(x+64,y+32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3){draw_sprite_ext(sprite_index,image_index,x+64,y+32,1,1,0,c_white,0.2);}
		if!place_meeting(x+64,y+64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3){draw_sprite_ext(sprite_index,image_index,x+64,y+64,1,1,0,c_white,0.2);}
		if!place_meeting(x+32,y+64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3){draw_sprite_ext(sprite_index,image_index,x+32,y+64,1,1,0,c_white,0.2);}
		if!place_meeting(x,y+64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3){draw_sprite_ext(sprite_index,image_index,x,y+64,1,1,0,c_white,0.2);}
		if!place_meeting(x-32,y+64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3){draw_sprite_ext(sprite_index,image_index,x-32,y+64,1,1,0,c_white,0.2);}

		if!place_meeting(x+64,y-64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4){draw_sprite_ext(sprite_index,image_index,x+64,y-64,1,1,0,c_white,0.2);}
		if!place_meeting(x+32,y-64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4){draw_sprite_ext(sprite_index,image_index,x+32,y-64,1,1,0,c_white,0.2);}
		if!place_meeting(x,y-64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4){draw_sprite_ext(sprite_index,image_index,x,y-64,1,1,0,c_white,0.2);}
		if!place_meeting(x-32,y-64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4){draw_sprite_ext(sprite_index,image_index,x-32,y-64,1,1,0,c_white,0.2);}
		if!place_meeting(x-64,y-64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4){draw_sprite_ext(sprite_index,image_index,x-64,y-64,1,1,0,c_white,0.2);}
		if!place_meeting(x-64,y-32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4){draw_sprite_ext(sprite_index,image_index,x-64,y-32,1,1,0,c_white,0.2);}
		if!place_meeting(x-64,y,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4){draw_sprite_ext(sprite_index,image_index,x-64,y,1,1,0,c_white,0.2);}
		if!place_meeting(x-64,y+32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4){draw_sprite_ext(sprite_index,image_index,x-64,y+32,1,1,0,c_white,0.2);}
		if!place_meeting(x-64,y+64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4){draw_sprite_ext(sprite_index,image_index,x-64,y+64,1,1,0,c_white,0.2);}

		if!place_meeting(x+96,y-64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5){draw_sprite_ext(sprite_index,image_index,x+96,y-64,1,1,0,c_white,0.2);}
		if!place_meeting(x+96,y-32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5){draw_sprite_ext(sprite_index,image_index,x+96,y-32,1,1,0,c_white,0.2);}
		if!place_meeting(x+96,y,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5){draw_sprite_ext(sprite_index,image_index,x+96,y,1,1,0,c_white,0.2);}
		if!place_meeting(x+96,y+32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5){draw_sprite_ext(sprite_index,image_index,x+96,y+32,1,1,0,c_white,0.2);}
		if!place_meeting(x+96,y+64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5){draw_sprite_ext(sprite_index,image_index,x+96,y+64,1,1,0,c_white,0.2);}
		if!place_meeting(x+96,y+96,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5){draw_sprite_ext(sprite_index,image_index,x+96,y+96,1,1,0,c_white,0.2);}
		if!place_meeting(x+64,y+96,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5){draw_sprite_ext(sprite_index,image_index,x+64,y+96,1,1,0,c_white,0.2);}
		if!place_meeting(x+32,y+96,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5){draw_sprite_ext(sprite_index,image_index,x+32,y+96,1,1,0,c_white,0.2);}
		if!place_meeting(x,y+96,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5){draw_sprite_ext(sprite_index,image_index,x,y+96,1,1,0,c_white,0.2);}
		if!place_meeting(x-32,y+96,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5){draw_sprite_ext(sprite_index,image_index,x-32,y+96,1,1,0,c_white,0.2);}
		if!place_meeting(x-64,y+96,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5){draw_sprite_ext(sprite_index,image_index,x-64,y+96,1,1,0,c_white,0.2);}
	}

	#region /*Draw a rectangle around the placable objects*/
	if (place_brush_size=5)
	and(can_make_place_brush_size_bigger=true)
	{
		draw_rectangle_colour(x-80,y-80,x+112,y+112,c_black,c_black,c_black,c_black,true);
	}
	else
	if (place_brush_size=4)
	and(can_make_place_brush_size_bigger=true)
	{
		draw_rectangle_colour(x-80,y-80,x+80,y+80,c_black,c_black,c_black,c_black,true);
	}
	else
	if (place_brush_size=3)
	and(can_make_place_brush_size_bigger=true)
	{
		draw_rectangle_colour(x-48,y-48,x+80,y+80,c_black,c_black,c_black,c_black,true);
	}
	else
	if (place_brush_size=2)
	and(can_make_place_brush_size_bigger=true)
	{
		draw_rectangle_colour(x-48,y-48,x+48,y+48,c_black,c_black,c_black,c_black,true);
	}
	else
	if (place_brush_size=1)
	and(can_make_place_brush_size_bigger=true)
	{
		draw_rectangle_colour(x-16,y-16,x+48,y+48,c_black,c_black,c_black,c_black,true);
	}
	else
	{
		if (mask_index=spr_2x2_block)
		{
			draw_rectangle_colour(x-16,y-16,x+48,y+48,c_black,c_black,c_black,c_black,true);
		}
		else
		{
			draw_rectangle_colour(x-16,y-16,x+16,y+16,c_black,c_black,c_black,c_black,true);
		}
	}
	#endregion /*Draw a rectangle around the placable objects END*/

	if (asset_get_type("spr_cursor_brush")==asset_sprite)
	{
		mouse_sprite=spr_cursor_brush;
		window_set_cursor(cr_none);
	}
	else
	{
		window_set_cursor(cr_arrow);
	}
}
else

#region /*Drag Cursor*/
if (asset_get_type("obj_leveleditor_placed_object")==asset_object)
and(place_meeting(x,y,obj_leveleditor_placed_object))
or(asset_get_type("obj_level_start")==asset_object)
and(place_meeting(x,y,obj_level_start))
or(asset_get_type("obj_level_end")==asset_object)
and(place_meeting(x,y,obj_level_end))
{
	if (drag_object=false)
	and(fill_mode=false)
	and(erase_mode=false)
	and(!mouse_check_button(mb_left))
	or(!key_a_hold)
	{
		if (asset_get_type("spr_cursor_grab")==asset_sprite)
		{
			mouse_sprite=spr_cursor_grab;
			window_set_cursor(cr_none);
		}
	}
	else
	if (drag_object=true)
	and(erase_mode=false)
	{
		if (asset_get_type("spr_cursor_grab")==asset_sprite)
		{
			mouse_sprite=spr_cursor_grab;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_drag);
		}
	}
}
#endregion /*Drag Cursor END*/

}
#endregion /*Position the Cursor End*/

#region /*Change modes*/
if (mouse_check_button_pressed(mb_right))
{
	if (pause=false)
	and(menu_delay=0)
	{
		erase_mode=true;
	}
}
if (mouse_check_button_released(mb_right))
{
	if (pause=false)
	and(menu_delay=0)
	{
		erase_mode=false;
	}
}
#endregion /*Change modes END*/

if (quit_level_editor=0)
{
	
	#region /*When pressing left click, increase current undo value*/
	if (mouse_check_button_pressed(mb_left))
	{
		current_undo_value+=1;
	}
	#endregion /*When pressing left click, increase current undo value END*/
	
	#region /*Minimum undo value*/
	if (current_undo_value<=0)
	{
		current_undo_value=0;
	}
	#endregion /*Minimum undo value END*/

	#region /*Place Object*/
	if (can_make_place_brush_size_bigger=false)
	and(mouse_check_button_pressed(mb_left))
	or (can_make_place_brush_size_bigger=true)
	and(mouse_check_button(mb_left))
	{
	if (!keyboard_check(vk_space))
	and(!mouse_check_button(mb_middle))
	and(!mouse_check_button(mb_right))
	and(drag_object=false)
	and(fill_mode=false)
	and(erase_mode=false)
	and(pause=false)
	and(menu_delay=0)
	and(asset_get_type("obj_leveleditor_placed_object")==asset_object)
	and(asset_get_type("obj_level_start")==asset_object)
	and(!place_meeting(x,y,obj_level_start))
	and(asset_get_type("obj_level_end")==asset_object)
	and(!place_meeting(x,y,obj_level_end))
	and(asset_get_type("obj_level_height")==asset_object)
	and(!position_meeting(x,y,obj_level_height))
	and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, -64, display_get_gui_width(), +64)) /*Can't place objects when clicking the top buttons*/
	{
		drag_object=false;
		
		#region /*Brush size 1*/
		if (!place_meeting(x,y,obj_leveleditor_placed_object))
		{
			obj=instance_create_depth(x,y,0,obj_leveleditor_placed_object);
			obj.object=obj_leveleditor.place_object;
			obj.place_object_angle = true;
			
			#region /*Undo and Redo handeling*/
			obj.undo_value=obj_leveleditor.current_undo_value;
			#endregion /*Undo and Redo handeling END*/
			
			#region /*When placing on difficulty layer*/
			if (obj_leveleditor.set_difficulty_mode=true)
			{
				if (obj_leveleditor.difficulty_layer=1)
				{
					obj.easy=true;
					obj.normal=false;
					obj.hard=false;
				}
				else
				if (obj_leveleditor.difficulty_layer=2)
				{
					obj.easy=false;
					obj.normal=true;
					obj.hard=false;
				}
				else
				if (obj_leveleditor.difficulty_layer>=3)
				{
					obj.easy=false;
					obj.normal=false;
					obj.hard=true;
				}
			}
			#endregion /*When placing on difficulty layer END*/
			
			if (asset_get_type("snd_leveleditor_place_object")==asset_sound)
			{
				audio_play_sound(snd_leveleditor_place_object,0,0);
				audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);
			}
		}
		#endregion /*Brush size 1 END*/
		
		#region /*Brush size 2*/
		if (!place_meeting(x+32,y,obj_leveleditor_placed_object))
		and(obj_leveleditor.place_brush_size>=1)
		and(can_make_place_brush_size_bigger=true)
		{
			obj=instance_create_depth(x+32,y,0,obj_leveleditor_placed_object);
			obj.object=obj_leveleditor.place_object;
			
			#region /*Undo and Redo handeling*/
			obj.undo_value=obj_leveleditor.current_undo_value;
			#endregion /*Undo and Redo handeling END*/
			
			#region /*When placing on difficulty layer*/
			if (obj_leveleditor.set_difficulty_mode=true)
			{
				if (obj_leveleditor.difficulty_layer=1)
				{
					obj.easy=true;
					obj.normal=false;
					obj.hard=false;
				}
				else
				if (obj_leveleditor.difficulty_layer=2)
				{
					obj.easy=false;
					obj.normal=true;
					obj.hard=false;
				}
				else
				if (obj_leveleditor.difficulty_layer>=3)
				{
					obj.easy=false;
					obj.normal=false;
					obj.hard=true;
				}
			}
			#endregion /*When placing on difficulty layer END*/
			
			if (asset_get_type("snd_leveleditor_place_object")==asset_sound)
			{
				audio_play_sound(snd_leveleditor_place_object,0,0);
				audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);
			}
		}
		if!place_meeting(x+32,y+32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=1)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+32,y+32,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x,y+32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=1)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x,y+32,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		#endregion /*Brush size 2 END*/
		
		#region /*Brush size 3*/
		if!place_meeting(x+32,y-32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=2)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+32,y-32,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x,y-32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=2)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x,y-32,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x-32,y-32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=2)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x-32,y-32,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x-32,y,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=2)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x-32,y,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x-32,y+32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=2)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x-32,y+32,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		#endregion /*Brush size 3 END*/
		
		#region /*Brush size 4*/
		if!place_meeting(x+64,y-32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+64,y-32,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x+64,y,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+64,y,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x+64,y+32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+64,y+32,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x+64,y+64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+64,y+64,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x+32,y+64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+32,y+64,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x,y+64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x,y+64,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x-32,y+64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=3)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x-32,y+64,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		#endregion /*Brush size 4 END*/
		
		#region /*Brush size 5*/
		if!place_meeting(x+64,y-64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+64,y-64,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x+32,y-64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+32,y-64,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x,y-64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x,y-64,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x-32,y-64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x-32,y-64,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x-64,y-64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x-64,y-64,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x-64,y-32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x-64,y-32,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x-64,y,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x-64,y,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x-64,y+32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x-64,y+32,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x-64,y+64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=4)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x-64,y+64,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		#endregion /*Brush size 5 END*/
		
		#region /*Brush size 6*/
		if!place_meeting(x+96,y-64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+96,y-64,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x+96,y-32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+96,y-32,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x+96,y,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+96,y,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x+96,y+32,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+96,y+32,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x+96,y+64,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+96,y+64,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x+96,y+96,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+96,y+96,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x+64,y+96,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+64,y+96,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x+32,y+96,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x+32,y+96,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x,y+96,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x,y+96,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x-32,y+96,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x-32,y+96,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		if!place_meeting(x-64,y+96,obj_leveleditor_placed_object)and(obj_leveleditor.place_brush_size>=5)and(can_make_place_brush_size_bigger=true){obj=instance_create_depth(x-64,y+96,0,obj_leveleditor_placed_object);obj.object=obj_leveleditor.place_object;/*Undo and Redo handeling*/obj.undo_value=obj_leveleditor.current_undo_value;/*When placing on difficulty layer*/if (obj_leveleditor.set_difficulty_mode=true){if (obj_leveleditor.difficulty_layer=1){obj.easy=true;obj.normal=false;obj.hard=false;}else if (obj_leveleditor.difficulty_layer=2){obj.easy=false;obj.normal=true;obj.hard=false;}else if (obj_leveleditor.difficulty_layer>=3){obj.easy=false;obj.normal=false;obj.hard=true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object")==asset_sound{audio_play_sound(snd_leveleditor_place_object,0,0);audio_sound_gain(snd_leveleditor_place_object,global.sfx_volume,0);}}
		#endregion /*Brush size 6 END*/
		
		#region /*Reset Level Editor Checkpoint*/
		if (asset_get_type("room_leveleditor")==asset_room)
		and(room=room_leveleditor)
		{
			
			#region /*Create directory for saving custom levels*/
			if (!directory_exists(working_directory+"/Custom Levels"))
			{
				directory_create(working_directory+"/Custom Levels");
			}
			#endregion /*Create directory for saving custom levels END*/
		
			ini_open(working_directory+"/Custom Levels/custom_level_save.ini");
			ini_key_delete("Level"+string(global.level_editor_level),"x_checkpoint");
			ini_key_delete("Level"+string(global.level_editor_level),"y_checkpoint");
			ini_key_delete("Level"+string(global.level_editor_level),"checkpoint_millisecond");
			ini_key_delete("Level"+string(global.level_editor_level),"checkpoint_second");
			ini_key_delete("Level"+string(global.level_editor_level),"checkpoint_minute");
			ini_key_delete("Level"+string(global.level_editor_level),"checkpoint_realmillisecond");
			ini_close();
		}
		#endregion /*Reset Level Editor Checkpoint END*/
	}
	}
	#endregion /*Place Object End*/

#region /*Fill with Objects*/
if (mouse_check_button(mb_left))
and(!keyboard_check(vk_space))
and(!mouse_check_button(mb_middle))
and(!mouse_check_button(mb_right))
and(!key_b)
and(drag_object=false)
and(fill_mode=true)
and(erase_mode=false)
and(pause=false)
and(menu_delay=0)
and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
{
	if (!place_meeting(x,y,obj_leveleditor_placed_object))
	and(!place_meeting(x,y,obj_leveleditor_fill))
	{
		instance_create_depth(x,y,0,obj_leveleditor_fill);
	}
}
#endregion /*Fill with Objects END*/

#region /*SELECT WHAT OBJECT TO PLACE*/

#region /*Scroll Objects Left*/
if (mouse_wheel_up())
and(!mouse_check_button(mb_middle))
and(!key_a_pressed)
and(!mouse_check_button(mb_left))
and(erase_mode=false)
and(pause=false)
or(gamepad_button_check_pressed(0,gp_shoulderl))
and(pause=false)
{
	if (asset_get_type("snd_leveleditor_cycle_item_left")==asset_sound)
	{
		audio_play_sound(snd_leveleditor_cycle_item_left,0,0);
		audio_sound_gain(snd_leveleditor_cycle_item_left,global.sfx_volume,0);
	}
	if (selected_object>0)
	{
		selected_object-=1;
		selected_object_menu_x+=64;
	}
	else
	{
		selected_object=total_number_of_objects;
		selected_object_menu_x=-64*total_number_of_objects;
	}
	selected_menu_alpha=2;
}
#endregion /*Scroll Objects Left End*/

#region /*Scroll Objects Right*/
if (mouse_wheel_down())
and(!mouse_check_button(mb_middle))
and(!key_a_pressed)
and(!mouse_check_button(mb_left))
and(erase_mode=false)
and(pause=false)
or(gamepad_button_check_pressed(0,gp_shoulderr))
and(pause=false)
{
	if (asset_get_type("snd_leveleditor_cycle_item_right")==asset_sound)
	{
		audio_play_sound(snd_leveleditor_cycle_item_right,0,0);
		audio_sound_gain(snd_leveleditor_cycle_item_right,global.sfx_volume,0);
	}
	if (selected_object<total_number_of_objects)
	{
		selected_object+=1;
		selected_object_menu_x-=64;
	}
	else
	{
		selected_object=0;
		selected_object_menu_x=0;
	}
	selected_menu_alpha=2;
}
#endregion /*Scroll Objects Right End*/

#endregion /*SELECT WHAT OBJECT TO PLACE END*/

#region /*Play Level*/
if (keyboard_check_pressed(vk_enter))
or(gamepad_button_check_pressed(0,gp_select))
{
	if (pause=false)
	and(asset_get_type("obj_level_start")==asset_object)
	{

		#region /*Save Level*/
	
		#region /*Create directory for saving custom levels*/
		if (!directory_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)))
		{
			directory_create(working_directory+"/Custom Levels/Level"+string(global.level_editor_level));
		}
		if (directory_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)))
		and(!directory_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data"))
		{
			directory_create(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data");
		}
		#endregion /*Create directory for saving custom levels END*/
	
		else
		if (asset_get_type("obj_leveleditor_placed_object")==asset_object)
		and(!place_meeting(x,y,obj_leveleditor_placed_object))
		{
			instance_activate_all();
			var file,str;
			
			file=file_text_open_write(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/Object_Placement.txt"); /*Open file for writing*/
			
			/*Reset string var*/str="";
			
			#region /*Write wall objects to file*/
			if (asset_get_type("obj_leveleditor_placed_object")==asset_object)
			{
				with(obj_leveleditor_placed_object)
				{
					str+=string(x)+"|"+string(y)+"|"+string(object)+"|"+string(easy)+"|"+string(normal)+"|"+string(hard)+"|";
				}
			}
			#endregion /*Write wall objects to file END*/
			
			file_text_write_string(file,str); /*Write string with wall information to file and start a new line*/
			
			file_text_close(file);
		}

		#region /*Save Level Information*/
		ini_open(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/level_information.ini");
		if (asset_get_type("obj_level_start")==asset_object)
		{
			if (instance_exists(obj_level_start))
			{
				ini_write_real("Info","level_start_x",obj_level_start.x);
			}
			if (instance_exists(obj_level_start))
			{
				ini_write_real("Info","level_start_y",obj_level_start.y);
			}
		}
		if (asset_get_type("obj_level_end")==asset_object)
		{
			if (instance_exists(obj_level_end))
			{
				ini_write_real("Info","level_end_x",obj_level_end.x);
			}
			if (instance_exists(obj_level_end))
			{
				ini_write_real("Info","level_end_y",obj_level_end.y);
			}
		}
		if (asset_get_type("obj_level_height")==asset_object)
		{
			if (instance_exists(obj_level_height))
			{
				ini_write_real("Info","level_height",obj_level_height.y);
			}
		}
		ini_write_real("Info","view_xview",camera_get_view_x(view_camera[view_current]));
		ini_write_real("Info","view_yview",camera_get_view_y(view_camera[view_current]));
		ini_close();
		#endregion /*Save Level Information END*/

		#endregion /*Save Level END*/

		if (asset_get_type("obj_camera")==asset_object)
		and(!instance_exists(obj_camera))
		and(asset_get_type("obj_leveleditor_placed_object")==asset_object)
		and(!place_meeting(x,y,obj_leveleditor_placed_object))
		{
			if (camera_get_view_width(view_camera[view_current])<1920)
			or (camera_get_view_height(view_camera[view_current])<1080)
			{
				camera_set_view_size(view_camera[view_current],1920,1080);
			}
			instance_activate_all();
			global.lives_until_assist=0;
			global.actually_play_edited_level=false;
			global.play_edited_level=true;
			global.character_select_in_this_menu="level_editor";
			instance_create_depth(x,y,0,obj_camera);
			instance_destroy();
		}
	}
}
#endregion /*Play Level End*/

#region /*Scroll View*/
if (mouse_check_button_pressed(mb_left))
and(keyboard_check(vk_space))
or(mouse_check_button_pressed(mb_middle))
{
	if (pause=false)
	and(!instance_exists(obj_leveleditor_fill))
	{
		drag_x=mouse_x;
		drag_y=mouse_y;
	}
}
if (mouse_check_button(mb_left))
and(keyboard_check(vk_space))
or(mouse_check_button(mb_middle))
{
	if (pause=false)
	and(!instance_exists(obj_leveleditor_fill))
	{
		camera_set_view_pos(view_camera[view_current],drag_x-(mouse_x-camera_get_view_x(view_camera[view_current])),drag_y-(mouse_y-camera_get_view_y(view_camera[view_current])));
	}
}
#endregion /*Scroll View End*/

}

#region /*Limit so cursor and view can't go outside room*/

#region /*Limit controller x and controller y inside room*/
if (controller_x<camera_get_view_x(view_camera[view_current]))
{
	controller_x=camera_get_view_x(view_camera[view_current]);
}
if (controller_x>camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]))
{
	controller_x=camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]);
}
if (controller_y<camera_get_view_y(view_camera[view_current]))
{
	controller_y=camera_get_view_y(view_camera[view_current]);
}
if (controller_y>camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
{
	controller_y=camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]);
}
#endregion /*Limit controller x and controller y inside room END*/

#region /*Limit x and y inside room*/
if (x<camera_get_view_x(view_camera[view_current]))
{
	x=camera_get_view_x(view_camera[view_current]);
}
if (x>camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]))
{
	x=camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]);
}
if (y<camera_get_view_y(view_camera[view_current]))
{
	y=camera_get_view_y(view_camera[view_current]);
}
if (y>camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
{
	y=camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]);
}
#endregion /*Limit x and y inside room END*/

#region /*Limit view inside room*/
camera_set_view_pos(
view_camera[view_current],
max(0,min(camera_get_view_x(view_camera[view_current]),room_width-camera_get_view_width(view_camera[view_current]))),
max(0,min(camera_get_view_y(view_camera[view_current]),room_height-camera_get_view_height(view_camera[view_current]))));
#endregion /*Limit view inside room END*/

#endregion /*Limit so view and cursor can't go outside room END*/

#region /*Menu Navigation Delay*/
if (menu_delay>0)
{
	menu_delay-=1;
}
if (menu_delay<0)
{
	menu_delay=0;
}
#endregion /*Menu Navigation Delay END*/

#region /*Menu navigation with joystick*/
if (gamepad_axis_value(0,gp_axislv)<0)
or(gamepad_axis_value(0,gp_axislv)>0)
or(gamepad_axis_value(0,gp_axislh)<0)
or(gamepad_axis_value(0,gp_axislh)>0)
or(gamepad_axis_value(1,gp_axislv)<0)
or(gamepad_axis_value(1,gp_axislv)>0)
or(gamepad_axis_value(1,gp_axislh)<0)
or(gamepad_axis_value(1,gp_axislh)>0)
or(gamepad_axis_value(2,gp_axislv)<0)
or(gamepad_axis_value(2,gp_axislv)>0)
or(gamepad_axis_value(2,gp_axislh)<0)
or(gamepad_axis_value(2,gp_axislh)>0)
or(gamepad_axis_value(3,gp_axislv)<0)
or(gamepad_axis_value(3,gp_axislv)>0)
or(gamepad_axis_value(3,gp_axislh)<0)
or(gamepad_axis_value(3,gp_axislh)>0)
{
	if (menu_joystick_delay=0)
	{
		menu_joystick_delay=15;
	}
}
if (gamepad_axis_value(0,gp_axislv)=0)
and(gamepad_axis_value(0,gp_axislh)=0)
and(gamepad_axis_value(1,gp_axislv)=0)
and(gamepad_axis_value(1,gp_axislh)=0)
and(gamepad_axis_value(2,gp_axislv)=0)
and(gamepad_axis_value(2,gp_axislh)=0)
and(gamepad_axis_value(3,gp_axislv)=0)
and(gamepad_axis_value(3,gp_axislh)=0)
{
	menu_joystick_delay=0;
}
if (menu_joystick_delay>0)
{
	menu_joystick_delay-=1;
}
#endregion /*Menu navigation with joystick END*/

if (os_type == os_ios)
or(os_type == os_android)
{
	virtual_key_add(1100 - 128, 0, 400, 128, vk_escape); /*Pause virtual key*/

	#region /*Pause virtual key*/
	if (keyboard_check(vk_escape))
	{
		draw_sprite_ext(spr_virtual_key_pause, 0, camera_get_view_x(view_camera[view_current]) + 1100 - 64, camera_get_view_y(view_camera[view_current]) + 32, 0.9, 0.9, 0, c_gray, 0.5);
	}
	else
	{
		draw_sprite_ext(spr_virtual_key_pause, 0, camera_get_view_x(view_camera[view_current]) + 1100 - 64, camera_get_view_y(view_camera[view_current]) + 32, 1, 1, 0, c_white, 0.5);
	}
	#endregion /*Pause virtual key END*/
	
}

//draw_text_transformed_color(weighted_x,weighted_y,"TEST",global.default_text_size,global.default_text_size,0,c_yellow,c_yellow,c_yellow,c_yellow,1);
//draw_text_transformed_color(x+64,y+64,string(weighted_x)+","+string(weighted_y)+","+string(total_objects),global.default_text_size,global.default_text_size,0,c_yellow,c_yellow,c_yellow,c_yellow,1);