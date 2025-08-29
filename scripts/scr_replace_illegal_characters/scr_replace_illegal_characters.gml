/// @function scr_sanitize_filename(raw_name, max_length)
/// @description
///    Transform an arbitrary string into a filesystem‑safe filename or folder name by:
///     1. Mapping a set of common symbols to word tokens (e.g. "@" becomes "at", "#" becomes "hash").
///     2. Preserving only ASCII letters, digits, hyphens and underscores.
///     3. Replacing every other character (spaces, punctuation, emoji, etc.) with a single underscore.
///     4. Collapsing multiple underscores into one, and trimming any leading/trailing underscores.
///     5. Enforcing a configurable maximum length to avoid filesystem limits.
///     6. Guarding against Windows reserved names (CON, PRN, AUX, NUL, COM1...LPT9) by prefixing an underscore if needed.
///     7. Converting the final result to lowercase for consistency across platforms.
///
/// @param raw_name        String        — The untrusted, user‑provided name to sanitize.
/// @param max_length    Number        — (Optional, default = 255) Maximum length of the returned string.
/// @return                String        — A guaranteed non‑empty, normalized name that:
///                                    • contains only [a–z0–9_-],
///                                    • does not begin or end with "_",
///                                    • is at most max_length characters long,
///                                    • is never one of the forbidden Windows device names,
///                                    • and will be "_" if all other characters are stripped out.
function scr_sanitize_filename(raw_name, max_length = 255)
{
	/* Build a quick lookup of "symbol" to "text"
	We only convert a small set of high-value symbols into words because:
	These characters (&, @, #, %, +) are commonly used by players and carry clear meaning ("and", "at", "number/hash", "percent", "plus")
	Mapping them preserves readability in filenames (e.g. "rock & roll" becomes "rock_and_roll")
	All other punctuation or exotic characters are far less semantically important, so they simply become "_" in the fallback step
	Keeping the map small makes it fast to build (or even cache once) and easy to maintain */
	var symmap = ds_map_create();
	ds_map_add(symmap, "&",    "and");
	ds_map_add(symmap, "@",    "at");
	ds_map_add(symmap, "#",    "hash");
	ds_map_add(symmap, "%",    "percent");
	ds_map_add(symmap, "+",    "plus");
	/* Underscore and Hyphen/Minus are allowed directly in names without change */

	/* Walk the input string, building an output */
	var out = "";
	var len = string_length(raw_name);

	for (var i = 1; i <= len; i++)
	{
		var c = string_char_at(raw_name, i);

		/* If it's a mapped symbol, append the word */
		if (ds_map_exists(symmap, c))
		{
			out += ds_map_find_value(symmap, c);
		}
		/* Else if it's alphanumeric, keep as-is */
		else
		if ((c >= "0" && c <= "9")
		|| (c >= "A" && c <= "Z")
		|| (c >= "a" && c <= "z")
		|| c == "-" /* Allow Hyphens */
		|| c == "_") /* Allow Underscores */
		{
			out += c;
		}
		/* Otherwise (e.g. emoji, spaces, other punctuation), normalize it to underscore */
		else
		{
			out += "_";
		}
	}

	/* Clean up */
	ds_map_destroy(symmap);

	/* Collapse repeated underscores to single "_" */
	while (string_pos("__", out) > 0)
	{
		out = string_replace_all(out, "__", "_");
	}

	/* Yrim leading/trailing underscores */
	while (string_length(out) > 0
	&& string_char_at(out, 1) == "_")
	{
		out = string_delete(out, 1, 1);
	}

	while (string_length(out) > 0
	&& string_char_at(out, string_length(out)) == "_")
	{
		out = string_delete(out, string_length(out), 1);
	}

	/* Enforce max length */
	if (string_length(out) > max_length)
	{
		out = string_copy(out, 1, max_length);
	}

	/* Never return empty */
	if (out == "")
	{
		out = "_";
	}

	/* Avoid Windows reserved names (case-insensitive) */
	var upper = string_upper(out);
	var reserved = [ "CON","PRN","AUX","NUL"
					,"COM1","COM2","COM3","COM4","COM5","COM6","COM7","COM8","COM9"
					,"LPT1","LPT2","LPT3","LPT4","LPT5","LPT6","LPT7","LPT8","LPT9" ];
	for (var j = 0; j < array_length(reserved); j++)
	{
		if (upper == reserved[j])
		{
			out = "_" + out;
			break;
		}
	}

	/* Normalize case to make it more consistent */
	out = string_lower(out);

	return out;
}
