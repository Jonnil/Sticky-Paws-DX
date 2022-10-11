function scr_file_copy_dir(source, target, attributes = fa_directory)
{
	
	/* Copies contents from source directory to target directory */
	/* Add fa_directory to attributes for recursive copying */
	var fname, i, file, files, from, to;
	/* Create directory if it doesn't exist yet: */
	if (!directory_exists(target))
	{
		directory_create(target);
	}
	/* Push matching files into array: */
	/* (Has to be done separately due to possible recursion) */
	files = 0;
	for (fname = file_find_first(source + "/*.*", attributes); fname != ""; fname = file_find_next())
	{
		/* Don't include current/parent directory "matches": */
		if (fname == ".")
		{
			continue;
		}
		if (fname == "..")
		{
			continue;
		}
		/* Push file into array */
		file[files] = fname;
		files += 1;
	}
	file_find_close()
	/* Process found files: */
	i = 0;
	repeat (files)
	{
		fname = file[i];
		i += 1;
		from = source + "/" + fname;
		to = target + "/" + fname;
		if (file_attributes(from, fa_directory))
		{
			scr_file_copy_dir(from, to, attributes) /* Recursively copy directories */
		}
		else
		{
			file_copy(from, to) /* Copy files as normal */
		}
	}
	
}