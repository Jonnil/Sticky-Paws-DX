enum localization
{
	ar_sa/*Arabic*/
	,id_id /*Indonesian*/
	,da_dk/*Danish */
	,de_de/*German*/
	,en_gb/*British English */
	,en_us/*American English */
	,es_es/*Spanish */
	,es_mx /*Mexican Spanish */
	,fr_ca/*Canadian French */
	,fr_fr/*French */
	,it_it/*Italian*/
	,hu_hu/*Hungarian*/
	,nl_nl/*Dutch */
	,nb_no/*Norwegian Bokmål*/
	,pl_pl/*Polish */
	,pt_br/*Brazilian Portuguese*/
	,pt_pt/*Portuguese*/
	,sk_sk/*Slovak*/
	,fi_fi/*Finnish */
	,sv_se/*Swedish */
	,th_th/*Thai*/
	,tr_tr/*Turkish */
	,cs_cz/*Czech */
	,el_gr/*Greek*/
	,bg_bg/*Bulgarian*/
	,ru_ru/*Russian*/
	,uk_ua/*Ukrainian*/
	,ja_jp/*Japanese*/
	,zh_cn/*Chinese Simplified (China)*/
	,zh_tw/*Chinese Traditional (Taiwan)*/
	,ko_kr/*Korean*/
}

InitTranslations();

function InitTranslations()
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

function Text(key)
{
	var text = "";
	if (file_exists("localization.csv"))
	and (global.translations[?key] != undefined)
	and (global.language_local_data[# 1 + global.language_localization, global.translations[?key]] != "")
	{
		var text = global.language_local_data[# 1 + global.language_localization, global.translations[?key]];
		var a = argument_count > 1?argument[1]:"";
		text = string_replace_all(text, "{a}", a);
	}
	else
	if (file_exists("localization.csv"))
	and (global.translations[?key] != undefined)
	and (global.language_local_data[# 1, global.translations[?key]] != "")
	{
		var text = global.language_local_data[# 1, global.translations[?key]];
		var a = argument_count > 1?argument[1]:"";
		if (debug_mode = true)
		{
			text = string(round(random(9))) + string_replace_all(text, "{a}", a) + string(round(random(9)));
		}
		else
		{
			text = string_replace_all(text, "{a}", a);
		}
	}
	else
	{
		if (debug_mode = true)
		{
			var text = string(round(random(9))) + key + string(round(random(9)));
		}
		else
		{
			var text = key;
		}
	}
	return text;
}