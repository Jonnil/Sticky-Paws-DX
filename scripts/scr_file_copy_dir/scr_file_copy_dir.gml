function scr_file_copy_dir(source, target)
{
  /* Create target directory if it doesn't exist: */
  if (!directory_exists(target))
  {
    directory_create(target);
  }

  /* Copy all files from source directory to target directory */
  for (var fname = file_find_first(source + "/*", 0); fname != ""; fname = file_find_next();)
  {
	  
    /* Don't include current/parent directory "matches": */
    if (fname == "." || fname == "..")
    {
      continue;
    }

    var from = source + "/" + fname;
    var to = target + "/" + fname;

    /* Copy file */
    file_copy(from, to);
  }

  file_find_close();
}