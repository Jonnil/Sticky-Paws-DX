/* Exit early for intermediate “status == 1” notifications */
if (async_load[? "status"] == 1)
{
	exit;
}

/* ------------------------------------------------------------- */
/* --------- PRIMARY REQUEST: global.http_request_id ----------- */
/* ------------------------------------------------------------- */

if (async_load[? "id"] == global.http_request_id)
{
	scr_log("INFO", "HTTP.PRIMARY", "request_id_matched",
		"request_id=" + string(async_load[? "id"]) + ", expected=" + string(global.http_request_id));
	
	/* Read status + body */
	var status_code = async_load[? "http_status"];
	var response_str = async_load[? "result"];
	
	scr_log("INFO", "HTTP.PRIMARY", "http_status", "http_status=" + string(status_code));
	scr_log("DEBUG", "HTTP.PRIMARY", "response_received", "len=" + string(string_length(response_str)));
	
	if (status_code == 200)
	{
		scr_log("INFO", "HTTP.PRIMARY", "status_ok", "http_status=200");
		
		/* -------- Parse JSON safely -------- */
		var response_json = json_decode(response_str);
		
		if (response_json != undefined)
		{
			scr_log("DEBUG", "HTTP.PRIMARY", "json_ok", "decoded=true");
		}
		else
		{
			scr_log("ERROR", "HTTP.PRIMARY", "json_decode_failed", "reason=invalid_json");
			exit; /* Nothing more we can do */
		}
		
		/* Presence checks used to decide route */
		var _has_name = ds_map_exists(response_json, "name")
		&& response_json[? "name"] != undefined
		&& string(response_json[? "name"]) != "";
		
		var _has_base64 = ds_map_exists(response_json, "data")
		&& response_json[? "data"] != undefined
		&& is_string(response_json[? "data"])
		&& string_length(response_json[? "data"]) > 0;
		
		scr_log("DEBUG", "HTTP.PRIMARY", "payload_flags",
			"list_menu=" + string(in_online_download_list_load_menu) +
			", has_name=" + string(_has_name) +
			", has_base64=" + string(_has_base64));
		
		/* Buffer is created only if we actually have base64 payload */
		var buffer = -1;
		
		/* Decide by content */
		
		#region /* Decide route: FILE vs LIST */
		
		var file_save_location = "";
		var download_temp_path = temp_directory; /* e.g., C:\Users\<user>\AppData\Local\Temp\GameMaker... */
		var _treat_as_file = false;
		
		if (_has_name
		|| _has_base64)
		{
			_treat_as_file = true;
			
			/* Defensive: a file response is never a list load */
			in_online_download_list_load_menu = false;
			
			/* Create buffer only if we actually have base64 content */
			if (_has_base64)
			{
				var file_data_base64 = response_json[? "data"];
				scr_log("DEBUG", "HTTP.PRIMARY", "base64_present", "true");
				buffer = buffer_base64_decode(file_data_base64);
				scr_log("DEBUG", "HTTP.PRIMARY", "buffer_created");
			}
			else
			{
				scr_log("WARN", "HTTP.PRIMARY", "missing_base64_data");
			}
			
			/* Build filename */
			var _fname = "";
			
			if (_has_name)
			{
				_fname = string(response_json[? "name"]) + ".zip"; /* adjust extension if needed */
			}
			else
			{
				var _id = ds_map_exists(response_json, "id") ? string(response_json[? "id"]) : "unnamed";
				_fname = "level_" + _id + ".zip"; /* fallback */
			}
			
			/* Build base directory and ensure it exists (CORRECT: use directory_create/exists) */
			var _base_dir = normalize_path_seps(download_temp_path + "downloaded_" + string(content_type) + "/");
			
			if (!directory_exists(_base_dir))
			{
				directory_create(_base_dir);
					scr_log("INFO", "HTTP.PRIMARY", "dir_created", "path=" + _base_dir);
			}
			
			file_save_location = normalize_path_seps(_base_dir + _fname);
				scr_log("DEBUG", "HTTP.PRIMARY", "file_save_location", "path=" + file_save_location);
		}
		else
		{
			/* Treat as LIST payload */
			_treat_as_file = false;
				scr_log("INFO", "HTTP.PRIMARY", "handling_list_payload");
			global.online_download_list = response_str; /* keep as string if other code expects it */
			in_online_download_list_load_menu = false;  /* clear stale flag so the next download works */
				scr_log("DEBUG", "HTTP.PRIMARY", "list_updated");
		}
		#endregion /* Decide route: FILE vs LIST END */
		
		
		#region /* Save HTTP Buffer to File (if file route) */
		if (_treat_as_file)
		{
			if (file_save_location != ""
			&& buffer != -1)
			{
					scr_log("INFO", "HTTP.PRIMARY", "save_start", "path=" + file_save_location);
				buffer_save(buffer, file_save_location);
				
				if (file_exists(file_save_location))
				{
						scr_log("INFO", "HTTP.PRIMARY", "save_ok", "path=" + file_save_location);
					
					/* Advance UI state (do NOT change menu) */
					search_for_id_still = false;
					
					/* Make level list refresh (you already do this for characters elsewhere) */
					have_downloaded_from_server = true;
				}
				else
				{
						scr_log("ERROR", "HTTP.PRIMARY", "save_failed", "path=" + file_save_location);
					
					if (search_for_id_still)
					{
						menu = "searched_file_downloaded_failed";
					}
				}
			}
			else
			{
					scr_log("WARN", "HTTP.PRIMARY", "save_skipped", "path=" + string(file_save_location));
				
				if (search_for_id_still)
				{
					menu = "searched_file_downloaded_failed";
				}
			}
		}
		#endregion /* Save HTTP Buffer to File END */
		
		
		/* Free the buffer memory if it was created */
		if (buffer != -1)
		{
			buffer_delete(buffer);
				scr_log("DEBUG", "HTTP.PRIMARY", "buffer_freed");
		}
	}
	else
	{
	scr_log("ERROR", "HTTP.PRIMARY", "non_200", "http_status=" + string(status_code));
	}
}
else
{
	/* Avoid noisy logs for other legitimate async requests handled elsewhere */
	var _rid = async_load[? "id"];
	var _is_language_manifest = (variable_global_exists("language_http_request_id") && _rid == global.language_http_request_id);
	var _is_info              = (variable_global_exists("http_request_info") && _rid == global.http_request_info);
	var _is_content_today     = (variable_global_exists("content_added_today") && _rid == global.content_added_today);
	var _is_token             = (variable_global_exists("online_token_request") && _rid == global.online_token_request);
	var _is_lang_file         = (variable_global_exists("language_file_requests") && ds_map_exists(global.language_file_requests, string(_rid)));

	if (!(_is_language_manifest || _is_info || _is_content_today || _is_token || _is_lang_file))
	{
		scr_log("WARN", "HTTP.PRIMARY", "request_id_mismatch", "request_id=" + string(_rid) + ", expected=" + string(global.http_request_id));
	}
}

/* ------------------------------------------------------------- */
/* -------- SECONDARY REQUEST: global.http_request_info -------- */
/* ------------------------------------------------------------- */

if (async_load[? "id"] == global.http_request_info)
{
	var status_code = async_load[? "http_status"];
	var response_str = async_load[? "result"];
	
	scr_log("INFO", "HTTP.INFO", "secondary_request",
		"menu=" + string(menu) + ", http_status=" + string(status_code));
	
	if (status_code == 200)
	{
		var response_json = json_decode(response_str);
		
		if (response_json != undefined)
		{
			var _has_base64 = ds_map_exists(response_json, "data")
			&& response_json[? "data"] != undefined
			&& is_string(response_json[? "data"])
			&& string_length(response_json[? "data"]) > 0;
			
			if (_has_base64)
			{
				var buffer = buffer_base64_decode(response_json[? "data"]);
					global.online_download_list_info = response_str;
				buffer_delete(buffer);
			}
			else
			{
				/* Still keep the info JSON string if other code expects it */
				global.online_download_list_info = response_str;
			}
		}
	}
}

/* Other handlers you already call */
scr_handle_content_added_today_http();
scr_handle_token_validated();
scr_handle_language_pack_http(async_load);
