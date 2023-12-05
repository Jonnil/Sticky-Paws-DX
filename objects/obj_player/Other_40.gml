#region /* Don't let the player outside the view */
if (can_clamp_inside_view > 3)
{
	var view_x = camera_get_view_x(view_camera[view_current]);
	var view_y = camera_get_view_y(view_camera[view_current]);
	var view_width = camera_get_view_width(view_camera[view_current]);
	var view_height = camera_get_view_height(view_camera[view_current]);
	x = clamp(x, view_x - sprite_width, view_x + view_width + sprite_width);
	y = clamp(y, view_y - sprite_height, view_y + view_height + (sprite_height * 2));
}
#endregion /* Don't let the player outside the view END */

#region /* Bottomless Pit */
/* This code needs to be in Outside View event, Outside Room event only runs code only one time when moved outside the room */
/* Don't stop horizontal speed, as it feels awkward when falling down */
if (bbox_top >= room_height + 10)
&& (!goal)
&& (!global.goal_active)
{
	die = true;
}
#endregion /* Bottomless Pit END */