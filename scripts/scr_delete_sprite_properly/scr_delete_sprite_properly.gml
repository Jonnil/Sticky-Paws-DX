function scr_delete_sprite_properly(spr)
{
	if (typeof(spr) != "undefined")
	&& (sprite_exists(spr)) /* Check if sprite exists before attempting deletion */
	{
		/* Never do "spr = noone" before doing sprite_delete, as this will not let the game properly delete the sprite */
		/* To make it so game doesn't crash trying to draw non-existing sprites after using sprite_delete, you need to do "sprite_exists" to check if the sprite exists before trying to draw it */
		sprite_delete(spr); /* Delete the sprite */
	}
}