/// @function scr_send_pending_crash_logs()
function scr_send_pending_crash_logs()
{
    #region /* Check for Pending Crash Logs */
    var pending_logs_folder = game_save_id + "pending_crash_logs/";
    if (!directory_exists(pending_logs_folder))
    {
        return; // Nothing to send.
    }
    
    var filename = file_find_first(pending_logs_folder + "*.*");
    #endregion /* Check for Pending Crash Logs END */
    
    while (filename != "")
    {
        #region /* Read Crash Log File Content */
        var full_path = pending_logs_folder + filename;
        var ini_file = file_text_open_read(full_path);
        var ini_content = "";
        while (!file_text_eof(ini_file))
        {
            ini_content += file_text_read_string(ini_file) + "\n";
        }
        file_text_close(ini_file);
        #endregion /* Read Crash Log File Content END */
        
        #region /* Create Payload and Send to Server */
        var payload_map = ds_map_create();
        ds_map_add(payload_map, "game_name", string_replace_all(global.game_name, " ", "_"));
        ds_map_add(payload_map, "game_version", "v" + string(scr_get_build_date()));
        ds_map_add(payload_map, "timestamp", ""); // Optionally, you can extract this from the file if needed.
        ds_map_add(payload_map, "ini_content", ini_content);
        ds_map_add(payload_map, "crash_log_filename", filename);
        var post_data = json_encode(payload_map);
        ds_map_destroy(payload_map);
        
        var header_map = ds_map_create();
        ds_map_add(header_map, "Content-Type", "application/json");
        ds_map_add(header_map, "User-Agent", "gm_crash_logger");
        ds_map_add(header_map, "X-API-Key", global.api_key);
        ds_map_add(header_map, "Host", string(global.base_url));
        
        var crash_endpoint = "https://" + string(global.base_url) + "/crashlog";
        var request_id = http_request(crash_endpoint, "POST", header_map, post_data);
        ds_map_destroy(header_map);
        #endregion /* Create Payload and Send to Server END */
        
        #region /* Delete Sent Crash Log File */
        file_delete(full_path);
        #endregion /* Delete Sent Crash Log File END */
        
        filename = file_find_next();
    }
    file_find_close();
}