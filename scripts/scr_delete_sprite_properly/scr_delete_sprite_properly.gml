function scr_delete_sprite_properly(spr)
{
	/* Check if sprite exists before attempting deletion */
	if (typeof(spr) != "undefined"
	&& sprite_exists(spr)
	&& spr != noone)
	{
		var is_external = string_pos("__newsprite", sprite_get_name(spr)) == 1;

		if (is_external)
		{
			/* Never do "spr = noone" before doing sprite_delete, as this will not let the game properly delete the sprite */
			/* To make it so game doesn't crash trying to draw non-existing sprites after using sprite_delete, you need to do "sprite_exists" to check if the sprite exists before trying to draw it */
			//show_debug_message("[scr_delete_sprite_properly] Deleting old sprite ID: " + string(spr) + "\n");
			sprite_delete(spr); /* Delete the sprite */
			return true;
		}
	}

	return false; /* Didn't exist or an internal sprite */
}
