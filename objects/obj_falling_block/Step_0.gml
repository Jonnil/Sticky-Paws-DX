if (fall < 100) {
	if (place_meeting(x, y - 1, obj_player)) {
		fall++;
		image_blend = c_red;
		
		if (fall > 75) {
			xx = random_range(x - 2.5, x + 2.5);
			yy = random_range(y - 4, y + 4);
		} else if (fall > 50) {
			xx = random_range(x - 2, x + 2);
			yy = random_range(y - 3, y + 3);
		} else if (fall > 25) {
			xx = random_range(x - 1.5, x + 1.5);
			yy = random_range(y - 2, y + 2);
		} else {
			xx = random_range(x - 1, x + 1);
			yy = random_range(y - 1, y + 1);
		}
	} else {
		fall = false;
		image_blend = c_white;
		xx = x;
		yy = y;
	}
} else {
	gravity_direction = 270;
	gravity = 0.5;
	image_blend = c_red;
	xx = random_range(x - 2.5, x + 2.5);
	yy = random_range(y - 2.5, y + 2.5);
}

//vspeed = clamp(vspeed, -16, 16); /* Limit the vertical speed END */

#region /* Falling Block falling outside of view */
if (image_alpha < 1) {
	instance_activate_object(self);
	gravity = 0;
	respawn_timer--;
	
	if (respawn_timer <= 0) {
		x = xstart;
		y = ystart;
		image_alpha = 1;
		effect_create_above(ef_smoke, x, y, 2, c_white);
	}
}
#endregion /* Falling Block falling outside of view END */