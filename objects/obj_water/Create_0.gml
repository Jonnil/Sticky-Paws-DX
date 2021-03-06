draw_yscale=1;
yy=0;
water_physics=false;

image_alpha=0.5;
image_speed=0.1;
draw_sprite_ext(sprite_index,image_index,x,y+yy,image_xscale,draw_yscale,image_angle,image_blend,image_alpha);
if (asset_get_type("obj_wall")==asset_object)
{
	
	#region /*If there isn't water above, change the sprite to surface water*/
	if (!position_meeting(x,bbox_top-1,obj_wall))
	and(!position_meeting(x,bbox_top-1,obj_water))
	and(asset_get_type("spr_water_surface")==asset_sprite)
	{
		sprite_index=spr_water_surface;
	}
	else
	{
		if (asset_get_type("spr_water")==asset_sprite)
		{
			sprite_index=spr_water;
		}
	}
	#endregion /*If there isn't water above, change the sprite to surface water END*/

	#region /*If there is wall under and the sprite stretches too far, make the sprite smaller*/
	if (position_meeting(x,y+32,obj_wall))
	{
		draw_yscale=0.5;
		yy=-8;
	}
	else
	{
		draw_yscale=1;
		yy=0;
	}
	#endregion /*If there is wall under and the sprite stretches too far, make the sprite smaller END*/

	if (water_physics=true)
	{
		if (x>camera_get_view_x(view_camera[view_current]))
		and(x<camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]))
		and(y>camera_get_view_y(view_camera[view_current]))
		and(y<camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
		{
			#region /*If there isn't water under us, spawn water there*/
			if (!position_meeting(x,y+32,obj_wall))
			and(!position_meeting(x,y+64,obj_wall))
			and(!position_meeting(x,y+64,obj_water))
			{
				instance_create_depth(x,y+64,0,obj_water);
			}
			#endregion /*If there isn't water under us, spawn water there END*/
			else
			{
				#region /*If there isn't water to the left, spawn water there*/
				if (!position_meeting(x-32,y,obj_wall))
				and(position_meeting(x,y+64,obj_wall))
				and(!position_meeting(x-32,y,obj_water))
				{
					instance_create_depth(x-32,y,0,obj_water);
				}
				#endregion /*If there isn't water to the left, spawn water there END*/
			
				#region /*If there isn't water to the right, spawn water there*/
				if (!position_meeting(x+32,y,obj_wall))
				and(position_meeting(x,y+64,obj_wall))
				and(!position_meeting(x+32,y,obj_water))
				{
					instance_create_depth(x+32,y,0,obj_water);
				}
				#endregion /*If there isn't water to the right, spawn water there END*/
			}
		}
	}
}