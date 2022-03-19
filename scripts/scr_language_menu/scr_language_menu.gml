// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_language_menu()
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	
	/*Language y positions*/
	var pos_ar_sa = 1;
	var pos_id_id = 2;
	var pos_da_dk = 3;
	var pos_de_de = 4;
	var pos_en_gb = 5;
	var pos_en_us = 6;
	var pos_es_es = 7;
	var pos_es_mx = 8;
	var pos_fr_ca = 9;
	var pos_fr_fr = 10;
	var pos_it_it = 11;
	var pos_hu_hu = 12;
	var pos_nl_nl = 13;
	var pos_nb_no = 14;
	var pos_pl_pl = 15;
	var pos_pt_br = 16;
	var pos_pt_pt = 17;
	var pos_sk_sk = 18;
	var pos_fi_fi = 19;
	var pos_sv_se = 20;
	var pos_th_th = 21;
	var pos_tr_tr = 22;
	var pos_cs_cz = 23;
	var pos_el_gr = 24;
	var pos_bg_bg = 25;
	var pos_ru_ru = 26;
	var pos_uk_ua = 27;
	var pos_ja_jp = 28;
	var pos_zh_cn = 29;
	var pos_zh_tw = 30;
	var pos_ko_kr = 31;
	var i;
	for(i = 1;
	i < ds_grid_width(global.language_local_data);
	i ++;)
	{
		draw_menu_checkmark(400, 52 * i + 42 + menu_y_offset, global.language_local_data[# i, 0], global.language_local_data[# i, 0], noone);
	}
}