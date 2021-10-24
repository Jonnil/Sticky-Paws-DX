#region /*Don't go outside view boundary*/
if (x<camera_get_view_x(view_camera[view_current])+32)
{
	x=camera_get_view_x(view_camera[view_current])+32;
}
if (x>camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])-32)
{
	x=camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])-32;
}
if (y<camera_get_view_y(view_camera[view_current])+32)
{
	y=camera_get_view_y(view_camera[view_current])+32;
}
if (y>camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-32)
{
	y=camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-32;
}
#endregion /*Don't go outside view boundary END*/

if (time<5)
{
	y=lerp(y,ystart+5,0.1);
	image_xscale=lerp(image_xscale,2,0.15);
	image_yscale=lerp(image_yscale,2,0.15);
}
else
{
	y=lerp(y,ystart-32,0.1);
	image_xscale=lerp(image_xscale,1,0.1);
	image_yscale=lerp(image_yscale,1,0.1);
}
draw_set_halign(fa_center);
if (scoreup="1-UP")
and (show_remaining_jumps = false)
or(scoreup="2-UP")
and (show_remaining_jumps = false)
or(scoreup="3-UP")
and (show_remaining_jumps = false)
{
	draw_text_outlined(x,y,string(scoreup),global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);
}
else
if (scoreup="CHECKPOINT")
and (show_remaining_jumps = false)
{
	if (global.language_localization=localization.ar_sa){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.id_id){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.da_dk){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.de_de){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.en_gb){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.en_us){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.es_es){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.es_mx){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.fr_ca){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.fr_fr){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.it_it){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.hu_hu){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.nl_nl){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.nb_no){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.pl_pl){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.pt_br){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.pt_pt){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.sk_sk){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.fi_fi){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.sv_se){draw_text_outlined(x,y,"ÅTERVÄNDSPUNKT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.th_th){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.tr_tr){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.cs_cz){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.el_gr){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.bg_bg){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.ru_ru){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.uk_ua){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.ja_jp){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.zh_cn){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.zh_tw){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
	if (global.language_localization=localization.ko_kr){draw_text_outlined(x,y,"CHECKPOINT",global.default_text_size*2*image_xscale,c_black,c_lime,image_alpha);}
}
else
if (show_remaining_jumps = false)
{
	if (not_score = false)
	{
		global.hud_show_score = true;
		if (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_score_timer = global.hud_hide_time;
			}
		}
	}
	draw_text_outlined(x, y, string(scoreup), global.default_text_size*image_xscale, c_white, c_black, image_alpha);
}

if (show_remaining_jumps = true)
{
	draw_text_outlined(x, y, string(scoreup), global.default_text_size*image_xscale, c_gray, c_white, image_alpha);
}
time += 1;
if (time > room_speed)
{
	image_alpha = lerp(image_alpha, 0, 0.1);
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}