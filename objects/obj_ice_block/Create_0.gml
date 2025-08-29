depth = 12;

#region /* Add walls up outide view */
if (!position_meeting(x, y -sprite_height, obj_wall))
&& (y <= 0)
{
	instance_create_depth(x, y -sprite_height, 0, obj_wall);
	instance_create_depth(x, y -sprite_height * 2, 0, obj_wall);
}
#endregion /* Add walls up outide view END */

#region /* Add walls down outide view */
if (!position_meeting(x, y + sprite_height, obj_wall))
&& (y >=room_height)
{
	instance_create_depth(x, y + sprite_height, 0, obj_wall);
	instance_create_depth(x, y + sprite_height * 2, 0, obj_wall);
}
#endregion /* Add walls down outide view END */

#region /* Add walls left outide view */
if (!position_meeting(x -sprite_width, y, obj_wall))
&& (x <= 0)
{
	instance_create_depth(x -sprite_width, y, 0, obj_wall);
	instance_create_depth(x -sprite_width * 2, y, 0, obj_wall);
}
#endregion /* Add walls left outide view END */

#region /* Add walls right outide view */
if (!position_meeting(x + sprite_width, y, obj_wall))
&& (x >=room_width)
{
	instance_create_depth(x + sprite_width, y, 0, obj_wall);
	instance_create_depth(x + sprite_width * 2, y, 0, obj_wall);
}
#endregion /* Add walls right outide view END */

mask_index = spr_wall;
image_speed = 0;
image_angle = choose(0,90, 180, 270);
image_xscale = choose(+ 1, - 1);
image_yscale = choose(+ 1, - 1);
