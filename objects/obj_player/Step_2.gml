#region /* Speedlines Effect */
if (image_alpha > 0)
{
	if (invincible_timer >= 2)
	{
		instance_create_depth(xx, yy, 0, obj_speedline);
	}

	if (vspeed < 0)
	|| (vspeed > 0)
	{
		/* Calculate the direction from the previous to current position */
		var p_dir = point_direction(x, y, xprevious, yprevious);

		/* Set the particle's orientation to this direction */
		part_type_orientation(global.pt_flare_particles, p_dir, p_dir, 0, 0, 0);

		/* Update the particle type's color to use the player color */
		part_type_color3(global.pt_flare_particles, c_white, global.player_color[player], global.player_color[player]);

		/* Create the particle at the object's position using a pre-made particle system (global.ps_above) */
		part_particles_create(global.ps_above, x, y, global.pt_flare_particles, 1);
	}
}
#endregion /* Speedlines Effect END */
