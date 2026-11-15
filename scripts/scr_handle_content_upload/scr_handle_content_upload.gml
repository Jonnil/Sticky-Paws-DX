function scr_content_upload_pending()
{
	return variable_global_exists("content_upload_request")
		&& is_struct(global.content_upload_request);
}

function scr_track_content_upload(request_id, upload_type, upload_id, zip_path, delete_after_success)
{
	global.content_upload_last_request_id = request_id;
	global.content_upload_request = {
		request_id: request_id,
		owner: id,
		upload_type: upload_type,
		upload_id: string(upload_id),
		zip_path: zip_path,
		progress_path: game_save_id + "save_file/online_level_progress.ini",
		delete_after_success: delete_after_success,
		started_at: get_timer(),
	};

	if (request_id == -1)
	{
		scr_finish_content_upload(false, 0, "http_transport");
	}
}

function scr_update_content_upload_timeout()
{
	if (scr_content_upload_pending()
	&& get_timer() - global.content_upload_request.started_at > 300000000)
	{
		/* A missing acknowledgement must never become a successful upload */
		scr_finish_content_upload(false, 0, "timeout");
	}
}

function scr_handle_content_upload_http(async_map)
{
	var request_id = ds_map_find_value(async_map, "id");
	if (!scr_content_upload_pending()
	|| request_id != global.content_upload_request.request_id)
	{
		return false;
	}

	var transfer_status = ds_map_find_value(async_map, "status");
	if (transfer_status == 1)
	{
		return true;
	}

	var http_status = ds_map_find_value(async_map, "http_status");
	var response_text = ds_map_find_value(async_map, "result");
	var expected_response = (global.content_upload_request.upload_type == "level")
		? "Level uploaded successfully" : "Character uploaded successfully";
	var confirmed = transfer_status == 0 && http_status == 200
		&& is_string(response_text) && response_text == expected_response;
	scr_finish_content_upload(confirmed, is_real(http_status) ? http_status : 0, "http_response");
	return true;
}

function scr_finish_content_upload(confirmed, http_status, failure_kind)
{
	if (!scr_content_upload_pending())
	{
		return;
	}
	var upload = global.content_upload_request;
	/* Clear before changing menus so duplicate events can't finish twice */
	global.content_upload_request = undefined;

	if (confirmed)
	{
		if (upload.delete_after_success && file_exists(upload.zip_path))
		{
			file_delete(upload.zip_path);
		}
		if (upload.upload_type == "level")
		{
			scr_save_ini_open(upload.progress_path);
			if (ini_read_real("finished_downloaded_level", upload.upload_id, 0) < 2)
			{
				ini_write_real("finished_downloaded_level", upload.upload_id, 2);
			}
			ini_close();
		}
		global.force_online_list_refresh = true;
		global.online_list_loaded = false;
		global.online_download_list = "";
		global.online_download_list_info = "";
		global.info_data = undefined;
		global.http_request_info = -1;
		global.server_timeout_end = undefined;
		variable_global_set("online_content_data_" + upload.upload_type, undefined);
		switch_save_data_commit();
		scr_log("INFO", "HTTP.UPLOAD", "upload_confirmed", "type=" + upload.upload_type);
	}
	else
	{
		scr_record_online_failure(failure_kind, "content_upload", http_status);
		scr_log("WARN", "HTTP.UPLOAD", "upload_not_confirmed", "http_status=" + string(http_status));
	}

	if (instance_exists(upload.owner))
	{
		with (upload.owner)
		{
			var expected_menu = "uploading_" + upload.upload_type;
			var current_id = (upload.upload_type == "level") ? string(level_id) : string(character_id);
			if (variable_instance_exists(self, "menu") && menu == expected_menu
			&& current_id == upload.upload_id)
			{
				menu_delay = 3;
				search_for_id_still = false;
				if (confirmed)
				{
					info_queue_http_request = true;
					info_queue_index = 0;
					menu = upload.upload_type + "_uploaded";
				}
				else
				{
					content_upload_error_status = http_status;
					content_upload_error_id = upload.upload_id;
					menu = upload.upload_type + "_upload_failed";
				}
			}
		}
	}
}

function scr_draw_content_upload_error(upload_type)
{
	var center_x = display_get_gui_width() * 0.5;
	var center_y = display_get_gui_height() * 0.5;
	draw_set_alpha(0.85);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(center_x, center_y - 100, l10n_text("Upload could not be confirmed"), global.default_text_size * 1.4, c_black, c_white, 1);
	var explanation = "Search this ID before trying again. The server may have received it.";
	if (content_upload_error_status == 409)
	{
		explanation = "This ID already exists. Return and choose Upload to create a new ID.";
	}
	else if (content_upload_error_status == 429)
	{
		explanation = "Too many uploads. Wait a while before trying again.";
	}
	else if (content_upload_error_status >= 400)
	{
		explanation = "The server couldn't accept this upload. Try again later.";
	}
	scr_draw_text_outlined(center_x, center_y - 40, l10n_text(explanation), global.default_text_size * 0.8, c_black, c_white, 1);
	scr_draw_text_outlined(center_x, center_y, l10n_text("Content ID") + ": " + content_upload_error_id, global.default_text_size, c_black, c_white, 1);
	scr_draw_text_outlined(center_x, center_y + 40, l10n_text("Your local files and upload archive were kept."), global.default_text_size * 0.8, c_black, c_white, 1);
	if (draw_menu_button(center_x - 185, center_y + 100, l10n_text("Back"), menu)
	|| (key_back_pressed && menu_delay == 0 && menu_joystick_delay == 0))
	{
		menu_delay = 3;
		menu = (upload_type == "level") ? "level_editor_upload" : "click_upload_character";
		if (variable_instance_exists(self, "open_sub_menu"))
		{
			open_sub_menu = true;
		}
		if (variable_instance_exists(self, "show_level_editor_corner_menu"))
		{
			show_level_editor_corner_menu = true;
		}
	}
}
