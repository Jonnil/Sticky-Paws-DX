#region /*If enemies are disabled, destroy this object*/
if (global.activate_cheats = true)
and (global.enable_enemies = false)
{
	instance_destroy();
}
#endregion /*If enemies are disabled, destroy this object END*/

if (die_volting=-1)
or(die_volting=+1)
{
	depth = -900;
	if (die_volting=-1)
	{
		image_angle-=20;
		hspeed=+4;
	}
	else
	{
		image_angle+=20;
		hspeed=-4;
	}
	#region /*Set the gravity*/
	gravity_direction=270;/*Direction of the gravity*/
	gravity=0.5;/*The gravity*/
	#endregion /*Set the gravity END*/
	
}
else
{
	
	#region /*Set the gravity*/
	gravity_direction=270;/*Direction of the gravity*/
	if (asset_get_type("obj_wall")==asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (x < camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]))
		and (x > camera_get_view_x(view_camera[view_current]))
		and (y < camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
		and (y > camera_get_view_y(view_camera[view_current]))
		{
			gravity = 0.5; /*The gravity*/
		}
	}
	else
	{
		gravity = 0;
	}
	#endregion /*Set the gravity END*/
	
	if (image_xscale<0)
	{
		hspeed=-1;
	}
	else
	{
		hspeed=+1;
	}
	if (flat=true)
	{
		speed=0;
		image_speed=0.5;
		sprite_used = "flattened";
		sprite_index = global.resourcepack_sprite_basic_enemy_flattened;
		if (image_index>image_number-1)
		{
		effect_create_above(ef_smoke,x,y,2,c_white);
		instance_destroy();
		}
	}
}
if (flat = false)
{
	if (distance_to_object(obj_player)<256)
	{
		sprite_used = "angry";
		sprite_index = global.resourcepack_sprite_basic_enemy_angry;
	}
	else
	{
		sprite_used = "stand";
		sprite_index = global.resourcepack_sprite_basic_enemy;
	}
}

#region /*Turn around*/
if (position_meeting(bbox_left-1,y,obj_wall))
{
	image_xscale=+1;
}
if (position_meeting(bbox_right+1,y,obj_wall))
{
	image_xscale=-1;
}
#endregion /*Turn around END*/

#region /*Kill enemy if it's inside the wall*/
if (position_meeting(x,y,obj_wall))
and(die = false)
and(draw_xscale>=0.8)
{
	flat = false;
	die = true;
	die_volting = true;
}
#endregion /*Kill enemy if it's inside the wall END*/