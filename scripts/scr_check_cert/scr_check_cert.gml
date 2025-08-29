/// @function scr_check_cert(verbose, max_lines)
/// @description Checks if cacert.pem is present in the working directory and outputs detailed debug information. It reports file size and reads up to a specified number of lines.
/// @param {boolean} verbose - If true, prints additional details.
/// @param {real} max_lines - Maximum number of lines to read from the file (default is 20).
function scr_check_cert(verbose = true, max_lines = 20)
{
	show_debug_message("[scr_check_cert_limited] Checking if cacert.pem is present in the working directory... Working directory: " + working_directory);
	var cert_path = working_directory + "cacert.pem"; /* Adjust path if needed */

	if (file_exists(cert_path))
	{
		show_debug_message("[scr_check_cert_limited] Found cacert.pem at: " + cert_path);

		if (verbose)
		{

			#region /* Attempt to load the file into a buffer to get its size */
			var buf = buffer_load(cert_path);

			if (buf != -1)
			{
				var size = buffer_get_size(buf);
				show_debug_message("[scr_check_cert_limited] cacert.pem size: " + string(size) + " bytes");
				buffer_delete(buf);
			}
			else
			{
				show_debug_message("[scr_check_cert_limited] WARNING: Unable to load cacert.pem into a buffer to determine its size.");
			}
			#endregion /* Attempt to load the file into a buffer to get its size END */

			#region /* Open the file in text mode and read up to max_lines using file_text_readln */
			var snippet = "";
			var lines_read = 0;
			var file_id = file_text_open_read(cert_path);

			if (file_id != -1)
			{
				show_debug_message("[scr_check_cert_limited] Successfully opened cacert.pem for text reading.");

				while (!file_text_eof(file_id) && lines_read < max_lines)
				{
					var line = file_text_readln(file_id);
					//show_debug_message("[scr_check_cert_limited] Read line " + string(lines_read + 1) + ": " + line);
					snippet += line;
					lines_read += 1;
				}
				file_text_close(file_id);
				show_debug_message("[scr_check_cert_limited] cacert.pem content (first " + string(lines_read) + " lines): " + snippet);
			}
			else
			{
				show_debug_message("[scr_check_cert_limited] WARNING: Unable to open cacert.pem in text mode.");
			}
			#endregion /* Open the file in text mode and read up to max_lines using file_text_readln END */

		}
	}
	else
	{
		show_debug_message("[scr_check_cert_limited] WARNING: cacert.pem NOT FOUND at: " + cert_path);
		show_debug_message("[scr_check_cert_limited] HTTPS connections may fail if the certificate file is missing.");
	}

	show_debug_message("");
}
