enum localization
{
	ar_sa /* Arabic */
	,id_id /* Indonesian */
	,da_dk /* Danish */
	,de_de /* German */
	,en_gb /* British English */
	,en_us /* American English */
	,es_es /* Spanish */
	,es_mx /* Mexican Spanish */
	,fr_ca /* Canadian French */
	,fr_fr /* French */
	,it_it /* Italian */
	,hu_hu /* Hungarian */
	,nl_nl /* Dutch */
	,nb_no /* Norwegian Bokmål */
	,pl_pl /* Polish */
	,pt_br /* Brazilian Portuguese */
	,pt_pt /* Portuguese */
	,sk_sk /* Slovak */
	,fi_fi /* Finnish */
	,sv_se /* Swedish */
	,th_th /* Thai */
	,tr_tr /* Turkish */
	,cs_cz /* Czech */
	,el_gr /* Greek */
	, bg_bg /* Bulgarian */
	,ru_ru /* Russian */
	,uk_ua /* Ukrainian */
	,ja_jp /* Japanese */
	,zh_cn /* Chinese Simplified (China) */
	,zh_tw /* Chinese Traditional (Taiwan) */
	,ko_kr /* Korean */
}

scr_initialize_translations();

/// @function scr_initialize_translations()
/// @description Initializes the translations from either the user-downloaded file in AppData
/// or from the built-in localization.csv. If neither exist, sets defaults.
function scr_initialize_translations()
{
	/* The user-downloaded file we want to check for: */
	var user_file_path = game_save_id + "language_packs/all.txt";
	
	/* The built-in fallback: */
	var included_file_path = "localization.csv";
	
	var final_path_to_use = "";
	
	/* 1) Check if the user-downloaded file exists: */
	if (file_exists(user_file_path))
	{
		final_path_to_use = user_file_path;
		show_debug_message("[scr_initialize_translations] Using user-downloaded CSV: " + user_file_path);
	}
	/* 2) Else, check if the included fallback file exists: */
	else
	if (file_exists(included_file_path))
	{
		final_path_to_use = included_file_path;
		show_debug_message("[scr_initialize_translations] Using included CSV: " + included_file_path);
	}
	/* 3) If neither exist, set no translations: */
	else
	{
		show_debug_message("[scr_initialize_translations] No translation file found at all!");
		global.language_local_data = 0;
		global.translations = 0;
		global.language_completion = 0;
		return; /* no file, so we're done */
	}
	
	/* Now load whichever CSV we decided on: */
	var translations_map = scr_language_load_csv_into_memory(final_path_to_use);
	
	if (translations_map == -1)
	{
		/* Something went wrong loading the CSV */
		global.language_local_data = 0;
		global.translations = 0;
		global.language_completion = 0;
		return;
	}
	
	/* Store the map so we can look up row indices from the code strings */
	global.translations = translations_map;
	
	/* (Optional) You might track how many languages are in the CSV: */
	/* e.g., ds_grid_width(global.language_local_data) or ds_grid_height(...) */
	
	/* At this point, we have a loaded DS grid in global.language_local_data */
	/* and a DS map in global.translations */
}