/// @function scr_to_base64
/// @description  Encode a nonnegative integer into Base-64 (no padding)
function scr_to_base64(_val)
{
	/* Standard Base-64 alphabet, index 0 to "A", 1 to "B", ..., 63 to "/" */
	var chars	= "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	var v		= _val;
	var out		= "";
	
	show_debug_message("[scr_to_base64] start; input val = " + string(_val));
	
	/* Handle zero explicitly (maps to "A") */
	if (v == 0)
	{
		show_debug_message("[scr_to_base64] special case zero to 'A'");
		return "A";
	}
	
	/* Repeatedly divide by 64, prepend the corresponding character */
	while (v > 0)
	{
		var digit = v mod 64;
		
		/* string_char_at is 1‐based, so digit+1 */
		var c = string_char_at(chars, digit + 1);
		show_debug_message("[scr_to_base64] loop: v=" + string(v)
						+ ", digit=" + string(digit)
						+ ", char='" + string(c) + "'"
						+ ", out_so_far='" + string(out) + "'");
		out = c + out;
		v = floor(v / 64);
	}
	
	return out;
}
