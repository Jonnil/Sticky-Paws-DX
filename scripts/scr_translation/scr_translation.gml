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

initialize_translations();

function initialize_translations()
{
	if (file_exists("localization.csv"))
	{
		global.language_local_data = load_csv("localization.csv");
		var hh = ds_grid_height(global.language_local_data);
		var translations = ds_map_create();
		for(var i = 0;
		i < hh;
		i ++)
		{
			ds_map_add(translations, global.language_local_data[# 0, i], i);
		}
		global.translations = translations;
	}
	else
	{
		global.language_local_data = 0;
		global.translations = 0;
	}
}

function l10n_text(key = "") /* The common abbreviation for localization is l10n, where the number 10 refers to the number of letters between the L and the N */
{
    var text = key;
    if (global.translations[?key] != undefined && global.language_local_data[# 1 + global.language_localization, global.translations[?key]] != "")
    {
        text = global.language_local_data[# 1 + global.language_localization, global.translations[?key]];
        var a = argument_count > 1 ? argument[1] : "";
        text = string_replace_all(text, "{a}", a);
    }
    else if (global.translations[?key] != undefined && global.language_local_data[# 1, global.translations[?key]] != "")
    {
        text = global.language_local_data[# 1, global.translations[?key]];
        var a = argument_count > 1 ? argument[1] : "";
        text = string_replace_all(text, "{a}", a);
    }
	if (global.translation_debug)
	{
		/* In debug mode, make all untranslated text flash random numbers beside the original text, to indicate easier what line is untranslated */
		if (global.translations[?key] != undefined && global.language_local_data[# 1, global.translations[?key]] != "")
		{
			var letter = string_char_at("ABCDEFGHIJKLMNOPQRSTUVWXYZ", global.language_localization + 2);
			text = string(letter) + string(global.translations[?key] + 1) + " " + string_replace_all(text, "{a}", a) + string(round(random(9)));
		}
		else
		{
			text = "A? " + key + string(round(random(9)));
		}
	}
	
	/* Find missing translation keywords and log them in .ini file */
	if (global.translations[?key] == undefined)
	{
		ini_open(working_directory + "translation_missing_keywords.ini");
		if (!ini_key_exists("Translation Missing Keywords", string(key)))
		{
			ini_write_string("Translation Missing Keywords", string(key), "");
		}
		ini_close();
	}
	
    return text;
}