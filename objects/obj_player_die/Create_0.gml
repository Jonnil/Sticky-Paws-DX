depth = -1999;
count=0;
last_player=false;
iris_xscale=16;
iris_yscale=16;
iris_zoom=0;
xx=x;
yy=y;
bubble=false;
if (bubble=false)
{
	lives-=1;
	global.lives_until_assist+=1;
}
player=1;
global.hud_show_lives=true;
if (instance_number(obj_camera)>0)
{
	with(obj_camera)
	{
		hud_show_lives_timer=global.hud_show_timer;
	}
}

voice_damage=noone;
voice_burned_die=noone;