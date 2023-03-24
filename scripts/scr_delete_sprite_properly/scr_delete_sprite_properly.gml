function scr_delete_sprite_properly(spr)
{
	if (spr > 0) /* Only delete sprite if it actually contains any value */
	{
		spr = noone; /* Reset the sprite back to noone, so every sprite check knows not to display anything and not crash the game */
		sprite_delete(spr); /* Finally delete the sprite */
	}
}