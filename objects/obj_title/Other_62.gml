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
	show_debug_message("[HTTP Request ID Callback] Request ID matched: received " 
		+ string(async_load[? "id"]) + " vs global.http_request_id (" 
		+ string(global.http_request_id) + ")");
	
	/* Read status + body */
	var status_code = async_load[? "http_status"];
	var response_str = async_load[? "result"];
	
	show_debug_message("[HTTP Request ID Callback] Status code: " + string(status_code));
	show_debug_message("[HTTP Request ID Callback] Response string: " + string(response_str));
	
	if (status_code == 200)
	{
		show_debug_message("[HTTP Request ID Callback] HTTP status 200 OK. Processing response...");
		
		/* -------- Parse JSON safely -------- */
		var response_json = json_decode(response_str);
		
		if (response_json != undefined)
		{
			show_debug_message("[HTTP Request ID Callback] JSON decoded successfully.");
		}
		else
		{
			show_debug_message("[HTTP Request ID Callback] ERROR: JSON decoding failed.");
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
		
		show_debug_message("[HTTP Request ID Callback] response_json OK, "
		+ "in_online_download_list_load_menu = " + string(in_online_download_list_load_menu)
		+ ", has_name = " + string(_has_name)
		+ ", has_base64 = " + string(_has_base64));
		
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
				show_debug_message("[HTTP Request ID Callback] Extracted base64 data from JSON.");
				buffer = buffer_base64_decode(file_data_base64);
				show_debug_message("[HTTP Request ID Callback] Buffer created from base64 data.");
			}
			else
			{
				show_debug_message("[HTTP Request ID Callback] WARNING: No base64 'data' field present for file payload.");
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
				show_debug_message("[HTTP Request ID Callback] Created directory: " + _base_dir);
			}
			
			file_save_location = normalize_path_seps(_base_dir + _fname);
			show_debug_message("[HTTP Request ID Callback] Determined file save location: " + file_save_location);
		}
		else
		{
			/* Treat as LIST payload */
			_treat_as_file = false;
			show_debug_message("[HTTP Request ID Callback] Handling online download LIST data...");
			global.online_download_list = response_str; /* keep as string if other code expects it */
			in_online_download_list_load_menu = false;  /* clear stale flag so the next download works */
			show_debug_message("[HTTP Request ID Callback] global.online_download_list updated.");
		}
		#endregion /* Decide route: FILE vs LIST END */
		
		
		#region /* Save HTTP Buffer to File (if file route) */
		if (_treat_as_file)
		{
			if (file_save_location != ""
			&& buffer != -1)
			{
				show_debug_message("[HTTP Request ID Callback] Saving buffer to file at: " + file_save_location);
				buffer_save(buffer, file_save_location);
				
				if (file_exists(file_save_location))
				{
					show_debug_message("[HTTP Request ID Callback] Successfully saved buffer to file at: " + file_save_location);
					
					/* Advance UI state (do NOT change menu) */
					search_for_id_still = false;
					
					/* Make level list refresh (you already do this for characters elsewhere) */
					have_downloaded_from_server = true;
				}
				else
				{
					show_debug_message("[HTTP Request ID Callback] ERROR: Couldn't save buffer to file at: " + file_save_location);
					
					if (search_for_id_still)
					{
						menu = "searched_file_downloaded_failed";
					}
				}
			}
			else
			{
				show_debug_message("[HTTP Request ID Callback] No valid file_save_location or no buffer; skipping file save. "
				+ "Attempted path: " + string(file_save_location));
				
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
			show_debug_message("[HTTP Request ID Callback] Buffer memory freed.");
		}
	}
	else
	{
		show_debug_message("[HTTP Request ID Callback] ERROR: HTTP status code is not 200. Actual status: " + string(status_code));
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
		show_debug_message("[HTTP Request ID Callback] Request ID mismatch: received " 
			+ string(_rid) + ", expected " + string(global.http_request_id));
	}
}

/* ------------------------------------------------------------- */
/* -------- SECONDARY REQUEST: global.http_request_info -------- */
/* ------------------------------------------------------------- */

if (async_load[? "id"] == global.http_request_info)
{
	var status_code = async_load[? "http_status"];
	var response_str = async_load[? "result"];
	
	show_debug_message("[obj_title Async - HTTP] menu: " + string(menu) 
		+ ", status_code = " + string(status_code));
	
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
