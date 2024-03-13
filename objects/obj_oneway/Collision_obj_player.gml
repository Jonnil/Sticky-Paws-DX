if (image_angle == 0
|| image_angle == 360)
&& (instance_exists(obj_player)
&& place_meeting(x - 1, y, obj_player)
&& !position_meeting(bbox_right + 1, instance_nearest(bbox_left, y, obj_player).y, obj_wall)
&& !position_meeting(bbox_right + 8, instance_nearest(bbox_left, y, obj_player).y, obj_wall)) {
	with(instance_nearest(bbox_left, y, obj_player)) {
		x += 64;
		y = instance_nearest(x, y, obj_oneway).y;
		smooth_teleport = 0;
	}
}
else
if (image_angle == 90
&& instance_exists(obj_player)
&& place_meeting(x, y + 1, obj_player)
&& !place_meeting(x, y - 1, obj_wall)
&& !place_meeting(x, y - 8, obj_wall)) {
	with(instance_nearest(x, bbox_bottom, obj_player)) {
		y -= sprite_height - 2;
		smooth_teleport = 0;
	}
}
else
if (image_angle == 180
&& instance_exists(obj_player)
&& place_meeting(x + 1, y, obj_player)
&& !position_meeting(bbox_left - 1, instance_nearest(bbox_left, y, obj_player).y, obj_wall)
&& !position_meeting(bbox_left - 8, instance_nearest(bbox_left, y, obj_player).y, obj_wall)) {
	with(instance_nearest(bbox_right, y, obj_player)) {
		x -= 64;
		y = instance_nearest(x, y, obj_oneway).y;
		smooth_teleport = 0;
	}
}
else
if (image_angle == 270
&& instance_exists(obj_player)
&& place_meeting(x, y - 1, obj_player)
&& !place_meeting(x, y + 1, obj_wall)
&& !place_meeting(x, y + 8, obj_wall)) {
	with(instance_nearest(x, bbox_top, obj_player)) {
		y += sprite_height + 2;
		smooth_teleport = 0;
	}
}