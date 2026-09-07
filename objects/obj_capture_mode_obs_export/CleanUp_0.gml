for (var entry_index = 0; entry_index < array_length(staging_files); entry_index++)
{
	if (file_exists(staging_files[entry_index])) file_delete(staging_files[entry_index]);
}
if (staging_path != "" && directory_exists(staging_path)) directory_destroy(staging_path);
