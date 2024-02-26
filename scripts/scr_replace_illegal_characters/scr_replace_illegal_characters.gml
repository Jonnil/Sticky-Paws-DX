function scr_replace_illegal_characters(what_string) {
	/* A file name can't contain any of the following characters: \ / _ * ? " < > | */
	/* Replace illegal characters with nothing */
	what_string = string_replace_all(what_string, "\\", "");
	what_string = string_replace_all(what_string, "/", "");
	what_string = string_replace_all(what_string, ":", "");
	what_string = string_replace_all(what_string, "*", "");
	what_string = string_replace_all(what_string, "?", "");
	what_string = string_replace_all(what_string, "\"", "");
	what_string = string_replace_all(what_string, "<", "");
	what_string = string_replace_all(what_string, ">", "");
	what_string = string_replace_all(what_string, "|", "");
	
	/* In the case where you name a file anything but illegal characters, the string will be empty */
	/* You can't save a file as empty either, so rename it to just _ */
	if (what_string == "") {
		what_string = "_";
	}
	return what_string;
}