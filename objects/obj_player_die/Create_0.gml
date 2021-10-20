depth = -9999;
count=0;
last_player=false;
iris_xscale=16;
iris_yscale=16;
iris_zoom=0;
xx=x;
yy=y;

#region /*Game Over variables*/
game_over_sprite_y = -300;
game_over_text_y = -300;
sprite_game_over_character_portrait = noone;
#endregion /*Game Over variables END*/

default_voice_pitch=1;
default_xscale=1;
default_yscale=1;

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
		hud_show_lives_timer=global.hud_hide_time;
	}
}

voice_damage=noone;
voice_burned_die=noone;

#region /*Disable the players for the camera*/

#region /*Disable player 1*/
if (player=1)
{
	with(obj_camera)
	{
		can_spawn_player1 = false;
		player1 = noone;
	}
}
#endregion /*Disable player 1 END*/

#region /*Disable player 2*/
if (player=2)
{
	with(obj_camera)
	{
		can_spawn_player2 = false;
		player2 = noone;
	}
}
#endregion /*Disable player 2 END*/

#region /*Disable player 3*/
if (player=3)
{
	with(obj_camera)
	{
		can_spawn_player3 = false;
		player3 = noone;
	}
}
#endregion /*Disable player 3 END*/

#region /*Disable player 4*/
if (player=4)
{
	with(obj_camera)
	{
		can_spawn_player4 = false;
		player4 = noone;
	}
}
#endregion /*Disable player 4 END*/

#endregion /*Disable the players for the camera END*/