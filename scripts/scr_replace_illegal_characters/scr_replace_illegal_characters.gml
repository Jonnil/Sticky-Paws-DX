function scr_replace_illegal_characters(what_string)
{
	/* A file name can't contain any of the following characters: \ / : * ? " < > | */
	/* Replace illegal characters with nothing */
	what_string = string_replace_all(what_string, "\\", "_");
	what_string = string_replace_all(what_string, "/", "_");
	what_string = string_replace_all(what_string, ":", "_");
	what_string = string_replace_all(what_string, "*", "_");
	what_string = string_replace_all(what_string, "?", "_");
	what_string = string_replace_all(what_string, "\"", "_");
	what_string = string_replace_all(what_string, "<", "_");
	what_string = string_replace_all(what_string, ">", "_");
	what_string = string_replace_all(what_string, "|", "_");
	what_string = string_replace_all(what_string, "%", "_");
	
	/* In the case where you name a file anything but illegal characters, the string will be empty */
	/* You can't save a file as empty either, so rename it to just _ */
	if (what_string == "")
	{
		what_string = "_";
	}
	
	return what_string;
}

/// @function scr_sanitize_alphanumeric(what_string)
/// @description Keeps only A–Z, a–z, 0–9 in the string; everything else is removed. If the result is empty, returns "_".
/// 1. Replaces common symbols with word equivalents (e.g. "@" to "at", "$" to "dollar", etc.)
/// 2. Keeps only A–Z, a–z, 0–9 from the remainder
/// 3. If the result is empty, returns "empty"
function scr_sanitize_alphanumeric(what_string)
{
	/* 1) Build a quick lookup of "symbol" to "text" */
	var symmap = ds_map_create();
	ds_map_add(symmap, "@",	"at");
	ds_map_add(symmap, "#",	"hash");
	ds_map_add(symmap, "$",	"dollar");
	ds_map_add(symmap, "%",	"percent");
	ds_map_add(symmap, "&",	"and");
	ds_map_add(symmap, "+",	"plus");
	ds_map_add(symmap, "-",	"minus");
	ds_map_add(symmap, "=",	"equals");
	ds_map_add(symmap, "!",	"bang");
	ds_map_add(symmap, "?",	"question");
	ds_map_add(symmap, "*",	"star");
	ds_map_add(symmap, "/",	"slash");
	ds_map_add(symmap, "\\", "backslash");
	ds_map_add(symmap, "<",	"lt");
	ds_map_add(symmap, ">",	"gt");
	ds_map_add(symmap, ".",	"dot");
	ds_map_add(symmap, ",",	"comma");
	ds_map_add(symmap, ":",	"colon");
	ds_map_add(symmap, ";",	"semicolon");
	ds_map_add(symmap, "_",	"underscore");
	ds_map_add(symmap, "~",	"tilde");
	ds_map_add(symmap, "`",	"backtick");
	ds_map_add(symmap, "\"", "quot");
	ds_map_add(symmap, "'",	"apos");
	/* ...add any others you need */
	
	/* 2) Walk the input string, building an output */
	var out = "";
	var len = string_length(what_string);
	
	for (var i = 1; i <= len; i++)
	{
		var c = string_char_at(what_string, i);
		
		/* If it's a mapped symbol, append the word */
		if (ds_map_exists(symmap, c))
		{
			out += ds_map_find_value(symmap, c);
		}
		/* Else if it's alphanumeric, keep as-is */
		else
		if ((c >= "0" && c <= "9")
		|| (c >= "A" && c <= "Z")
		|| (c >= "a" && c <= "z"))
		{
			out += c;
		}
		/* Otherwise (e.g. emoji, other punctuation), drop it entirely */
	}
	
	/* 3) Clean up */
	ds_map_destroy(symmap);
	
	/* 4) Never return empty */
	if (out == "")
	{
		out = "empty";
	}
	
	return out;
}