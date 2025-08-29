/// @function scr_select_first_valid_sprite(sprite1, sprite2, sprite3, ...)
/// @description Selects the first valid sprite from the arguments provided.
/// @param sprite1, sprite2, sprite3, ...
/// @return The first valid sprite (greater than noone) or the last sprite if all are invalid.

function scr_select_first_valid_sprite()
{
	/* Loop through all arguments provided to the script */
	for (var i = 0; i < argument_count; i++)
	{
		var sprite = argument[i];
		/* If the sprite is valid (exists and is not noone), assign it to sprite_index and return */
		if (sprite > noone)
		{
			sprite_index = sprite;
			return sprite;
		}
	}
	/* If no valid sprite was found, sprite_index remains unchanged */
}
