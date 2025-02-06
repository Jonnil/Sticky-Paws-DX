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

function scr_initialize_translations()
{
	if (file_exists("localization.csv"))
	{
		global.language_local_data = load_csv("localization.csv");
		var hh = ds_grid_height(global.language_local_data);
		var translations = ds_map_create();
		
		for(var i = 0; i < hh; i ++)
		{
			ds_map_add(translations, global.language_local_data[# 0, i], i);
		}
		global.translations = translations;
	}
	else
	{
		global.language_local_data = 0;
		global.translations = 0;
		global.language_completion = 0;
	}
}