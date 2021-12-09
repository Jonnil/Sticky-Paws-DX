draw_self();

xx = lerp(xx, window_get_width() / 2, 0.1);
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (place_meeting(x, y, obj_player))
and (can_navigate = false)
and (instance_nearest(x, y, obj_player).key_a)
{
	show_comments = true;
	obj_player_map.can_move = false;
	can_navigate = true;
}

else
if (can_navigate = true)
{

if (global.resourcepack_sprite_artwork_collection > noone)
{
	sprite_index = global.resourcepack_sprite_artwork_collection;
}

image_alpha = 0;
image_speed = 0;
depth = -10000;

#region /*Draw Dark Background*/
draw_set_alpha(0.9);
draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
#endregion /*Draw Dark Background END*/

#region /*Draw Artwork*/
if image_index=0 and level1_big_collectible1=true
or image_index=1 and level1_big_collectible2=true
or image_index=2 and level1_big_collectible3=true
or image_index=3 and level1_big_collectible4=true
or image_index=4 and level1_big_collectible5=true

or image_index=5 and level2_big_collectible1=true
or image_index=6 and level2_big_collectible2=true
or image_index=7 and level2_big_collectible3=true
or image_index=8 and level2_big_collectible4=true
or image_index=9 and level2_big_collectible5=true

or image_index=10 and level3_big_collectible1=true
or image_index=11 and level3_big_collectible2=true
or image_index=12 and level3_big_collectible3=true
or image_index=13 and level3_big_collectible4=true
or image_index=14 and level3_big_collectible5=true

or image_index=15 and level4_big_collectible1=true
or image_index=16 and level4_big_collectible2=true
or image_index=17 and level4_big_collectible3=true
or image_index=18 and level4_big_collectible4=true
or image_index=19 and level4_big_collectible5=true

or image_index=20 and level5_big_collectible1=true
or image_index=21 and level5_big_collectible2=true
or image_index=22 and level5_big_collectible3=true
or image_index=23 and level5_big_collectible4=true
or image_index=24 and level5_big_collectible5=true

or image_index=25 and level6_big_collectible1=true
or image_index=26 and level6_big_collectible2=true
or image_index=27 and level6_big_collectible3=true
or image_index=28 and level6_big_collectible4=true
or image_index=29 and level6_big_collectible5=true

or image_index=30 and level7_big_collectible1=true
or image_index=31 and level7_big_collectible2=true
or image_index=32 and level7_big_collectible3=true
or image_index=33 and level7_big_collectible4=true
or image_index=34 and level7_big_collectible5=true

or image_index=35 and level8_big_collectible1=true
or image_index=36 and level8_big_collectible2=true
or image_index=37 and level8_big_collectible3=true
or image_index=38 and level8_big_collectible4=true
or image_index=39 and level8_big_collectible5=true

or image_index=40 and level9_big_collectible1=true
or image_index=41 and level9_big_collectible2=true
or image_index=42 and level9_big_collectible3=true
or image_index=43 and level9_big_collectible4=true
or image_index=44 and level9_big_collectible5=true

or (image_index >= max_artwork)
{
	if (global.resourcepack_sprite_artwork_collection > noone)
	{
		draw_sprite(global.resourcepack_sprite_artwork_collection, image_index, xx, window_get_height() / 2); /*Draw the actual artwork*/
	}
	
	#region /*Draw Comments*/
	if (show_comments = true)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(+32, window_get_height()-64, string(current_comment), global.default_text_size, c_black, c_white, 1);
	}
	#endregion /*Draw Comments END*/
	
}
else if image_index=0 and level1_big_collectible1=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 1 in Level 1", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=1 and level1_big_collectible2=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 2 in Level 1", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=2 and level1_big_collectible3=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 3 in Level 1", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=3 and level1_big_collectible4=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 4 in Level 1", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=4 and level1_big_collectible5=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 5 in Level 1", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=5 and level2_big_collectible1=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 1 in Level 2", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=6 and level2_big_collectible2=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 2 in Level 2", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=7 and level2_big_collectible3=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 3 in Level 2", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=8 and level2_big_collectible4=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 4 in Level 2", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=9 and level2_big_collectible5=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 5 in Level 2", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=10 and level3_big_collectible1=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 1 in Level 3", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=11 and level3_big_collectible2=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 2 in Level 3", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=12 and level3_big_collectible3=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 3 in Level 3", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=13 and level3_big_collectible4=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 4 in Level 3", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=14 and level3_big_collectible5=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 5 in Level 3", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=15 and level4_big_collectible1=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 1 in Level 4", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=16 and level4_big_collectible2=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 2 in Level 4", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=17 and level4_big_collectible3=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 3 in Level 4", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=18 and level4_big_collectible4=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 4 in Level 4", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=19 and level4_big_collectible5=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 5 in Level 4", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=20 and level5_big_collectible1=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 1 in Level 5", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=21 and level5_big_collectible2=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 2 in Level 5", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=22 and level5_big_collectible3=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 3 in Level 5", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=23 and level5_big_collectible4=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 4 in Level 5", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=24 and level5_big_collectible5=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 5 in Level 5", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=25 and level6_big_collectible1=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 1 in Level 6", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=26 and level6_big_collectible2=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 2 in Level 6", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=27 and level6_big_collectible3=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 3 in Level 6", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=28 and level6_big_collectible4=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 4 in Level 6", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=29 and level6_big_collectible5=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 5 in Level 6", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=30 and level7_big_collectible1=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 1 in Level 7", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=31 and level7_big_collectible2=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 2 in Level 7", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=32 and level7_big_collectible3=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 3 in Level 7", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=33 and level7_big_collectible4=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 4 in Level 7", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=34 and level7_big_collectible5=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 5 in Level 7", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=35 and level8_big_collectible1=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 1 in Level 8", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=36 and level8_big_collectible2=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 2 in Level 8", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=37 and level8_big_collectible3=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 3 in Level 8", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=38 and level8_big_collectible4=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 4 in Level 8", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=39 and level8_big_collectible5=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 5 in Level 8", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=40 and level9_big_collectible1=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 1 in Level 9", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=41 and level9_big_collectible2=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 2 in Level 9", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=42 and level9_big_collectible3=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 3 in Level 9", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=43 and level9_big_collectible4=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 4 in Level 9", global.default_text_size*2, c_black, c_white, 1);}
else if image_index=44 and level9_big_collectible5=false{draw_text_outlined(window_get_width()/2,window_get_height()/2,"To unlock this artwork:# Get Big Fish 5 in Level 9", global.default_text_size*2, c_black, c_white, 1);}

#endregion /*Draw Artwork END*/

#region /*Draw what artwork is selected*/
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_text_outlined(+32, window_get_height()-32, "< Artwork " + string(image_index + 1) + "/" + string(image_number) + " >", global.default_text_size * 2, c_black, c_white, 1);
#endregion /*Draw what artwork is selected END*/

#region /*Left and Right Navigation*/
if (instance_nearest(x, y, obj_player).key_left)
{
	if (gamepad_stick = true)
	{
		if (image_index > 0)
		{
			image_index -= 1;
		}
		else
		{
			image_index = image_number -1;
		}
		xx = window_get_width()/2-32;
		gamepad_stick = false;
	}
}
else
if (instance_nearest(x, y, obj_player).key_right)
{
	if (gamepad_stick = true)
	{
		if (image_index < image_number -1)
		{
			image_index += 1;
		}
		else
		{
			image_index = 0;
		}
		xx = window_get_width()/2+32;
		gamepad_stick = false;
	}
}
#endregion /*Left and Right Navigation END*/

#region /*Enable/Disable Comments*/
if (instance_nearest(x, y, obj_player).key_a)
{
	if (show_comments = true)
	{
		show_comments = false;
	}
	else
	{
		show_comments = true;
	}
}
#endregion /*Enable/Disable Comments END*/

#region /*Back*/
if (instance_nearest(x, y, obj_player).key_b_pressed)
{
	show_comments = true;
	obj_player_map.can_move = true;
	can_navigate = false;
}
#endregion /*Back END*/

#region /*Show Controls*/
if (os_type != os_ios)
and (os_type != os_android)
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	if (show_comments = true)
	{
		draw_text_outlined(window_get_width()-32, window_get_height()-32, "Hide Comments:          Back:     ", global.default_text_size, c_black, c_white, 1);
	}
	else
	{
		draw_text_outlined(window_get_width()-32, window_get_height()-32, "Show Comments:          Back:     ", global.default_text_size, c_black, c_white, 1);
	}
	
	#region /*Draw Show Comments Key*/
	if (gamepad_is_connected(0))
	{
		draw_sprite_ext(spr_xbox_buttons, 0, window_get_width()-150, window_get_height()-32, 0.5, 0.5, 0, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, window_get_width()-150, window_get_height()-32, 0.5, 0.5, 0, c_white, 1);
	}
	#endregion /*Draw Show Comments Key END*/
	
	#region /*Draw Back Key*/
	if (gamepad_is_connected(0))
	{
		draw_sprite_ext(spr_xbox_buttons, 1, window_get_width()-32, window_get_height()-32, 0.5, 0.5, 0, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint, window_get_width()-32, window_get_height()-32, 0.5, 0.5, 0, c_white, 1);
	}
	#endregion /*Draw Back key END*/
	
}
#endregion /*Show Controls END*/

#region /*Virtual Key, iOS and Android*/
if (os_type == os_ios)
or (os_type == os_android)
{
	display_set_gui_size(window_get_width(),window_get_height());
	virtual_key_add(global.mobile_joystick_x,global.mobile_joystick_y+150+25,300,400,global.player1_key_up);
	virtual_key_add(global.mobile_joystick_x,global.mobile_joystick_y+450+25,125,400,global.player1_key_left);
	virtual_key_add(global.mobile_joystick_x+200-25,global.mobile_joystick_y+450+25,400+25,400,global.player1_key_right);
	virtual_key_add(global.mobile_joystick_x,global.mobile_joystick_y+650+25,300,200,global.player1_key_down);
	virtual_key_add(1160,550,240,200,global.player1_key_jump);
	virtual_key_add(1000,550,240,200,global.player1_key_sprint);
	if (room != room_title)
	{
		virtual_key_add(1100-128, 0, 400, 128, vk_escape);
	}
	
	if (keyboard_check(global.player1_key_up))
	{
		draw_sprite_ext(spr_virtual_key_up,0,global.mobile_joystick_x+120+30,global.mobile_joystick_y+450+250-100,0.9,0.9,0,c_gray,0.5);}else{draw_sprite_ext(spr_virtual_key_up,0,global.mobile_joystick_x+120+30,global.mobile_joystick_y+450+250-100,1,1,0,c_white,0.5);
	}
	if (keyboard_check(global.player1_key_left))
	{
		draw_sprite_ext(spr_virtual_key_left,0,global.mobile_joystick_x+120+30,global.mobile_joystick_y+450+250-100,0.9,0.9,0,c_gray,0.5);}else{draw_sprite_ext(spr_virtual_key_left,0,global.mobile_joystick_x+120+30,global.mobile_joystick_y+450+250-100,1,1,0,c_white,0.5);
	}
	if (keyboard_check(global.player1_key_right))
	{
		draw_sprite_ext(spr_virtual_key_right,0,global.mobile_joystick_x+120+30,global.mobile_joystick_y+450+250-100,0.9,0.9,0,c_gray,0.5);}else{draw_sprite_ext(spr_virtual_key_right,0,global.mobile_joystick_x+120+30,global.mobile_joystick_y+450+250-100,1,1,0,c_white,0.5);
	}
	if (keyboard_check(global.player1_key_down))
	{
		draw_sprite_ext(spr_virtual_key_down,0,global.mobile_joystick_x+120+30,global.mobile_joystick_y+450+250-100,0.9,0.9,0,c_gray,0.5);}else{draw_sprite_ext(spr_virtual_key_down,0,global.mobile_joystick_x+120+30,global.mobile_joystick_y+450+250-100,1,1,0,c_white,0.5);
	}
	
	if (keyboard_check(global.player1_key_jump))
	{
		draw_sprite_ext(spr_virtual_key_a, 0, view_xview+1200+100, view_yview+450+250-50, 0.9, 0.9, 0, c_gray, 0.5);
	}
	else
	{
		draw_sprite_ext(spr_virtual_key_a, 0, view_xview+1200+100, view_yview+450+250-50, 1, 1, 0, c_white, 0.5);
	}
	if (keyboard_check(global.player1_key_sprint))
	{
		draw_sprite_ext(spr_virtual_key_b, 0, view_xview+1100, view_yview+450+250-50, 0.9, 0.9, 0, c_gray, 0.5);
	}
	else
	{
		draw_sprite_ext(spr_virtual_key_b, 0, view_xview+1100, view_yview+450+250-50, 1, 1, 0, c_white, 0.5);
	}
	if (room != room_title)
	{
		if (keyboard_check(vk_escape))
		{
			draw_sprite_ext(spr_virtual_key_pause, 0, view_xview+1100-64, view_yview+32, 0.9, 0.9, 0, c_gray, 0.5);
		}
		else
		{
			draw_sprite_ext(spr_virtual_key_pause, 0, view_xview+1100-64, view_yview+32, 1, 1, 0, c_white, 0.5);
		}
	}
}
#endregion /*Virtual Key, iOS and Android End*/

}
else
{
	depth = bbox_bottom;
	if (asset_get_type("spr_1up") == asset_sprite)
	{
		sprite_index = spr_1up;
		image_alpha = 1;
		image_speed = 0;
	}
}

if (gamepad_stick = false)
{
	if (!instance_nearest(x, y, obj_player).key_left)
	and (!instance_nearest(x, y, obj_player).key_right)
	{
		gamepad_stick = true;
	}
}

if (can_navigate = true)
and (instance_exists(obj_player))
{
	instance_nearest(x, y, obj_player).can_move = false;
}
if (can_navigate = false)
{
	gamepad_stick = false;
}

#region /*Comments*/
if image_index=0{current_comment="Artist: Jonnil - Sticky the Cat";}
if image_index=1{current_comment="Artist: Jonnil - Sticky the Cat doing a heroic pose";}
if image_index=2{current_comment="Artist: Jonnil - Sticky the Cat doing the OK sign";}
if image_index=3{current_comment="Artist: Jonnil - Sticky the Cat crossing his arms";}
if image_index=4{current_comment="Artist: Jonnil - Sticky the Cat looking for something far away";}
if image_index=5{current_comment="Artist: Jonnil - Sticky the Cat scared";}
if image_index=6{current_comment="Artist: Pixpak - Sticky Paws Cover";}
if image_index=7{current_comment="Artist: Pixpak - Sticky the Cat Sketch";}
if image_index=8{current_comment="Artist: Dusky @DuskyUmbreonDA - Sticky the Cat";}
if image_index=9{current_comment="Artist: Dusky @DuskyUmbreonDA - Sticky the Cat Sketch";}
if image_index=10{current_comment="Artist: kyun @kyarokyun - Sticky the Cat";}
if image_index=11{current_comment="Artist: kyun @kyarokyun - Sticky the Cat Sketch";}
if image_index=12{current_comment="Artist: Jonnil - Sticky the Cat paint edition";}
if image_index=13{current_comment="Artist: Pixpak - Sticky the Cat anime";}
if image_index=14{current_comment="Artist: Chrythm - Sticky the Cat manly";}
if image_index=15{current_comment="Artist: Trickylady - Trickylady Approves";}
if image_index=16{current_comment="Artist: Omemega - Dark Lord Sticky";}
if image_index=17{current_comment="Artist: Omemega - Ded Sticky";}
if image_index=18{current_comment="Artist: Omemega - Skull Sticky";}
if image_index=19{current_comment="Artist: Pixpak - Sticky Adventure";}
if image_index=20{current_comment="Artist: Omemega - Derp Fat Sticky";}
if image_index=21{current_comment="Artist: Foxer 262 - Sticky UwU";}
if image_index=22{current_comment="Artist: NonsensicalThings - Jonnil programming Sticky Paws";}
if image_index=23{current_comment="Artist: DynoStorm - Realistic Sticky";}
if image_index=24{current_comment="Artist: Jonnil - Mousette";}
if image_index=25{current_comment="Artist: Cortex Vortex Studios - Sticky Pixel Art Origins";}
if image_index=26{current_comment="Artist: Plushfoxy255 - Sticky Sunglasses";}
if image_index=27{current_comment="Artist: No stop - Sticky yo!";}
if image_index=28{current_comment="Artist: William Karlsson - Sticky I am Cool";}
if image_index=29{current_comment="Artist: TheOneTrueEgg08 - Just a cat...";}
if image_index=30{current_comment="Artist: FarexBoi - Sticky Peace";}
if image_index=31{current_comment="Artist: Sayo - Sticky Vibe Check";}
if image_index=32{current_comment="Artist: Lil Wild Card Banny - Sticky upside-down OK sign";}
if image_index=33{current_comment="Artist: Sayo - More Normal Sticky";}
if image_index=34{current_comment="Artist: Sayo - Crazy Sticky";}
if image_index=35{current_comment="Artist: SSgt Myers - Sticky Ball";}
if image_index=36{current_comment="Artist: Snowy - Another Paint Sticky";}
if image_index=37{current_comment="Artist: No Stop - Eating Fish";}
if image_index=38{current_comment="Artist: Sayo - ANOTHER Paint Sticky";}
if image_index=39{current_comment="Artist: Chrythm - Sticky Collecting Fish";}
if image_index=40{current_comment="Artist: Ps2Man - Could it be?";}
if image_index=41{current_comment="Artist: chillmanmax - Sticky pounces in";}
if image_index=42{current_comment="Artist: Vargskelethor - StickyFren and JoelFren";}
if image_index=43{current_comment="Artist: barbilou - Sticky and Vargshroom";}
if image_index=44{current_comment="Artist: shiibeh - Sticky taking a stroll";}
if image_index=45{current_comment="Artist: artochungo - Sticky cool pose";}
if image_index=46{current_comment="Artist: tb_and_rachel - Sticky looking down a well";}
if image_index=47{current_comment="Artist: FarexBoi - Sticky Christmas";}
if image_index=48{current_comment="Artist: ByrdWork - Thiccy Sticky";}
if image_index=49{current_comment="Artist: Meidres Yoksank [MK] @MeidresYIK - Sticky on a rope";}
if image_index=50{current_comment="Artist: huntertron - This art isn't bad it's epic";}
if image_index=51{current_comment="Artist: shiibeh - Catlyn tiny sketch";}
if image_index=52{current_comment="Artist: shiibeh - Catlyn is very cute";}
if image_index=53{current_comment="Artist: shiibeh - Winter Sticky";}
if image_index=54{current_comment="Artist: ThePast - Half T-posing Sticky";}
if image_index=55{current_comment="Artist: Meidres Yoksank [MK] @MeidresYIK - Catlyn angry (sketch)";}
if image_index=56{current_comment="Artist: Meidres Yoksank [MK] @MeidresYIK - Catlyn angry";}
if image_index=57{current_comment="Artist: Meidres Yoksank [MK] @MeidresYIK - Catlyn angry (easter egg hidden in picture)";}
if image_index=58{current_comment="Artist: FarexBoi - Christmas Catlyn";}
if image_index=59{current_comment="Artist: DoruDoLasu - Sticky enjoys";}
if image_index=60{current_comment="Artist: DoruDoLasu - Sticky enjoys (looong edition)";}
if image_index=61{current_comment="Artist: DoruDoLasu - Sticky Stickyman";}
if image_index=62{current_comment="Artist: Best Buds - Sticky suprised";}
if image_index=63{current_comment="Artist: Denspaghetti - Sticky and Catlyn";}
if image_index=64{current_comment="Artist: Error Bella - Sticky running";}
if image_index=65{current_comment="Artist: huntertron - Sticky balloon";}
if image_index=66{current_comment="Artist: Error Bella - Sticky, Catlyn and their pet mouse";}
if image_index=67{current_comment="Artist: Voxxed_decimals - Sticky Ok";}
if image_index=68{current_comment="Artist: Voxxed_decimals - Virtual Catlyn";}
if image_index=69{current_comment="Artist: shadomaske - Happy Catlyn";}
if image_index=70{current_comment="Artist: red_luigi - Oh no Sticky HE'S MELTING!";}
if image_index=71{current_comment="Artist: DoruDoLasu - Catlyn wow";}
if image_index=72{current_comment="Artist: red_luigi - Sticky Pixel Art";}
if image_index=73{current_comment="Artist: Andrea Colunga - Catlyn and her prey";}
if image_index=73{current_comment="Artist: Furret76 - Sticcy pau and cetlun";}
#endregion /*Comments END*/