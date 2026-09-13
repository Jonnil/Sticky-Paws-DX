/// @function scr_flags_to_base64(flags)
/// @description Encode fixed Boolean flags, one bit per flag, with a URL-safe Base64 alphabet.
function scr_flags_to_base64(flags)
{
	var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
	var out = "";
	var count = array_length(flags);

	for (var i = 0; i < count; i += 6)
	{
		var value = 0;

		for (var bit = 0; bit < 6; bit++)
		{
			if ((i + bit < count) && flags[i + bit].active)
			{
				value = value | (1 << (5 - bit));
			}
		}

		out += string_char_at(alphabet, value + 1);
	}

	/* Every character is data. Zero bits pad the final sextet; never trim '_' (value 63). */
	return out;
}
