function scr_save_os_info_ini()
{
	var _info = os_get_info();
	var udid = _info[? "udid"];
	var gl_vendor_string = _info[? "gl_vendor_string"];
	var gl_version_string = _info[? "gl_version_string"];
	var gl_renderer_string = _info[? "gl_renderer_string"];
	var video_d3d11_device = _info[? "video_d3d11_device"];
	var video_d3d11_context = _info[? "video_d3d11_context"];
	var video_d3d11_swapchain = _info[? "video_d3d11_swapchain"];
	var video_adapter_vendorid = _info[? "video_adapter_vendorid"];
	var video_adapter_deviceid = _info[? "video_adapter_deviceid"];
	var video_adapter_subsysid = _info[? "video_adapter_subsysid"];
	var video_adapter_revision = _info[? "video_adapter_revision"];
	var video_adapter_description = _info[? "video_adapter_description"];
	var video_adapter_dedicatedvideomemory = _info[? "video_adapter_dedicatedvideomemory"];
	var video_adapter_dedicatedsystemmemory = _info[? "video_adapter_dedicatedsystemmemory"];
	var video_adapter_sharedsystemmemory = _info[? "video_adapter_sharedsystemmemory"];
	
	file_delete("os_info.ini");
	ini_open("os_info.ini");
	if (os_browser != undefined) ini_write_string("OS", "os_browser", string(os_browser));
	if (os_device != undefined) ini_write_string("OS", "os_device", string(os_device));
	if (os_type != undefined) ini_write_string("OS", "os_type", string(os_type));
	if (os_is_paused() != undefined) ini_write_string("OS", "os_is_paused", string(os_is_paused()));
	if (os_is_network_connected() != undefined) ini_write_string("OS", "os_is_network_connected", string(os_is_network_connected()));
	if (os_get_language() != undefined) ini_write_string("OS", "os_get_language", string(os_get_language()));
	if (os_get_region() != undefined) ini_write_string("OS", "os_get_region", string(os_get_region()));
	if (udid != undefined) ini_write_string("OS", "udid", string(udid));
	if (gl_vendor_string != undefined) ini_write_string("OS", "gl_vendor_string", string(gl_vendor_string));
	if (gl_version_string != undefined) ini_write_string("OS", "gl_version_string", string(gl_version_string));
	if (gl_renderer_string != undefined) ini_write_string("OS", "gl_renderer_string", string(gl_renderer_string));
	if (video_d3d11_device != undefined) ini_write_string("OS", "video_d3d11_device", string(video_d3d11_device));
	if (video_d3d11_context != undefined) ini_write_string("OS", "video_d3d11_context", string(video_d3d11_context));
	if (video_d3d11_swapchain != undefined) ini_write_string("OS", "video_d3d11_swapchain", string(video_d3d11_swapchain));
	if (video_adapter_vendorid != undefined) ini_write_string("OS", "video_adapter_vendorid", string(video_adapter_vendorid));
	if (video_adapter_deviceid != undefined) ini_write_string("OS", "video_adapter_deviceid", string(video_adapter_deviceid));
	if (video_adapter_subsysid != undefined) ini_write_string("OS", "video_adapter_subsysid", string(video_adapter_subsysid));
	if (video_adapter_revision != undefined) ini_write_string("OS", "video_adapter_revision", string(video_adapter_revision));
	if (video_adapter_description != undefined) ini_write_string("OS", "video_adapter_description", string(video_adapter_description));
	if (video_adapter_dedicatedvideomemory != undefined) ini_write_string("OS", "video_adapter_dedicatedvideomemory", string(video_adapter_dedicatedvideomemory));
	if (video_adapter_dedicatedsystemmemory != undefined) ini_write_string("OS", "video_adapter_dedicatedsystemmemory", string(video_adapter_dedicatedsystemmemory));
	if (video_adapter_sharedsystemmemory != undefined) ini_write_string("OS", "video_adapter_sharedsystemmemory", string(video_adapter_sharedsystemmemory));
	if (GM_build_date != undefined) ini_write_string("OS", "GM_build_date", date_time_string(GM_build_date));
	if (GM_build_type != undefined) ini_write_string("OS", "GM_build_type", string(GM_build_type));
	if (GM_version != undefined) ini_write_string("OS", "GM_version", string(GM_version));
	if (GM_runtime_version != undefined) ini_write_string("OS", "GM_runtime_version", string(GM_runtime_version));
	if (GM_project_filename != undefined) ini_write_string("OS", "GM_project_filename", string(GM_project_filename));
	if (parameter_count() != undefined) ini_write_string("OS", "parameter_count", string(parameter_count()));
	if (environment_get_variable("APPDATA") != undefined) ini_write_string("OS", "environment_get_variable(APPDATA)", string(environment_get_variable("APPDATA")));
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	
	ds_map_destroy(_info);
}