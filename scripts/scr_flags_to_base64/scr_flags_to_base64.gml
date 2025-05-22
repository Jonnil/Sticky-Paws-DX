/// @function scr_flags_to_base64
/// @description  Encode an arbitrary-length list of Boolean globals into a Base-64 string
function scr_flags_to_base64()
{
	/* 1) Build the raw bit-string (LSB = flag[0], "1" = error) */
	var bits	= "";
	var cnt		= ds_list_size(global.bool_flag_list);
	
	for (var i = 0; i < cnt; i++)
	{
		var name = ds_list_find_value(global.bool_flag_list, i);
		var val  = variable_struct_get(global, name);
		bits += (val ? "0" : "1");
	}
	
	/* 2) Pad with "0" so length(bits) % 6 == 0 */
	var pad = (6 - (string_length(bits) mod 6)) mod 6;
	
	for (var j = 0; j < pad; j++)
	{
		bits += "0";
	}
	
	/* 3) Convert each 6-bit group to one Base-64 char */
	var alphabet	= "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"; /* Use a URL-safe alphabet */
	var out			= "";
	var total		= string_length(bits);
	
	for (var k = 1; k <= total; k += 6)
	{
		var chunk = string_copy(bits, k, 6);
		var value = 0;
		
		/* chunk[1] is the highest bit of this sextet */
		for (var b = 1; b <= 6; b++)
		{
			if (string_char_at(chunk, b) == "1")
			{
				value += 1 << (6 - b);
			}
		}
		
		out += string_char_at(alphabet, value + 1);
	}
	
	/* Trim trailing padding bits */
	while string_ends_with(out, "_")
	{
		out = string_delete(out, string_length(out), 1);
	}
	
	return out;
}
