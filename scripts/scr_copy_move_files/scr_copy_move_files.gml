function scr_copy_move_files(source, target, delete_original_folder = false)
{
  /* Copies and moves all files and folders, which means copy files and folders, paste files and folders into new path, then delete original files and folders */

  if (directory_exists(source)) /* Only perform operations if source directory exists */
  {
    /* Manually specify directories and copy files */
    scr_file_copy_dir(source, target);
    scr_file_copy_dir(source + "/backgrounds", target + "/backgrounds");
    scr_file_copy_dir(source + "/data", target + "/data");
    scr_file_copy_dir(source + "/sound", target + "/sound");
    // Add more directories as needed...

    if (delete_original_folder) /* If this is set to true, then also delete the original folder */
    {
      directory_destroy(source);
    }
  }
}