#region /*If enemies are disabled, replace this object with ground object*/
if (global.enable_enemies=false)
{
	move_snap(32,32);
	instance_create_depth(x,y+32,0,obj_ground);
	instance_change(obj_ground,true);
}
#endregion /*If enemies are disabled, replace this object with ground object END*/

#region /*Gravity*/
if (asset_get_type("obj_wall")==asset_object)
and(!position_meeting(x,bbox_bottom+1,obj_wall))
and(x<camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]))
and(x>camera_get_view_x(view_camera[view_current]))
and(y<camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
and(y>camera_get_view_y(view_camera[view_current]))
{
	gravity=0.5;
}
else
{
	move_snap(32,32);
	hspeed=0;
	vspeed=0;
	gravity=0;
}
if (vspeed>=16)
{
	vspeed=16;
}
#endregion /*Gravity End*/

if (asset_get_type("obj_player")==asset_object)
and(asset_get_type("obj_wall")==asset_object)
and(instance_exists(obj_player))
{
	if (x<instance_nearest(x,y,obj_player).x-64)
	and(!position_meeting(x+32,y,obj_wall))
	or(x>instance_nearest(x,y,obj_player).x+64)
	and(!position_meeting(x-32,y,obj_wall))
	{
		yy=lerp(yy,y,0.5);
		draw_xscale=lerp(draw_xscale,image_xscale,0.5);
		draw_yscale=lerp(draw_yscale,image_yscale,0.5);
		time+=1;
	}
	else
	{
		if (place_meeting(x,y-1,obj_player))
		{
			yy=lerp(yy,y+random_range(-1,+1),0.5);
			draw_xscale=lerp(draw_xscale,image_xscale+0.05,0.5);
			draw_yscale=lerp(draw_yscale,image_yscale-0.05,0.5);
		}
		else
		{
			yy=lerp(yy,y,0.5);
			draw_xscale=lerp(draw_xscale,image_xscale,0.5);
			draw_yscale=lerp(draw_yscale,image_yscale,0.5);
		}
		time=0;
	}
}

if (time>200)
{
	if (asset_get_type("obj_bullet")==asset_object)
	{
		instance_create_depth(x,y,0,obj_bullet);
	}
	time=0;
}

draw_sprite_ext(spr_blaster,image_index,x,yy,draw_xscale,draw_yscale,image_angle,image_blend,image_alpha);