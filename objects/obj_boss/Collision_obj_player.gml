if (other.vspeed > 0)
|| (other.bbox_bottom < y)
|| (other.dive)
{
	if (can_jump_on_head)
	{
		scr_audio_play(snd_boss_damaged, volume_source.sound);
		if (other.ground_pound)
		{
			hp -= 2;
			other.ground_pound = false;
			other.can_ground_pound = false;
			other.speed_max = 4;
			draw_xscale = 1.75;
			draw_yscale = 0.25;
		}
		else
		{
			hp --;
			other.ground_pound = false;
			other.can_ground_pound = false;
			draw_xscale = 1.25;
			draw_yscale = 0.75;
		}
		other.dive = false;
		other.ground_pound = false;
		other.can_ground_pound = false;
		if (other.key_jump_hold)
		{
			with(other)
			{
				if (simple_controls == false)
				{
					vspeed = -triple_jump_height;
				}
				else
				{
					vspeed = - 8;
				}
			}
		}
		else
		{
			other.vspeed = - 8;
		}
		image_index = 0;
		effect_create_below(ef_ring, other.x, other.bbox_bottom, 0, c_white);
		takendamage = 100;
		can_jump_on_head = false;
		time = room_speed * 2
	}
	else
	{
		if (other.x < x)
		{
			other.hspeed = -5;
		}
		else
		{
			other.hspeed = +5;
		}
		other.ground_pound = false;
		other.can_ground_pound = false;
		other.dive = false;
		if (other.key_jump_hold)
		{
			with(other)
			{
				if (simple_controls == false)
				{
					vspeed = -triple_jump_height;
				}
				else
				{
					vspeed = - 8;
				}
			}
		}
		else
		{
			other.vspeed = - 8;
		}
	}
}
else
if (can_jump_on_head)
{
	if (other.x < x)
	{
		other.hspeed = -5;
	}
	else
	{
		other.hspeed = +5;
	}
	other.ground_pound = false;
	other.can_ground_pound = false;
	other.dive = false;
	if (other.key_jump_hold)
	{
		with(other)
		{
			if (simple_controls == false)
			{
				vspeed = -triple_jump_height;
			}
			else
			{
				vspeed = - 8;
			}
		}
	}
	else
	{
		other.vspeed = - 8;
	}
}
else
{
	if (hp > 0)
	&& (takendamage == 0)
	{
		if (other.takendamage <= 0)
		&& (other.assist_invincible == false)
		{
			if (other.have_heart_balloon)
			{
				other.have_heart_balloon = false;
				
				#region /* Save heart balloon to be false */
				if (other.player == 1)
				{
					ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player1_have_heart_balloon", false);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				if (other.player = 2)
				{
					ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player2_have_heart_balloon", false);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				if (other.player = 3)
				{
					ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player3_have_heart_balloon", false);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				if (other.player = 4)
				{
					ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player4_have_heart_balloon", false);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Save heart balloon to be false END */
				
			}
			else
			{
				other.hp --;
			}
			other.takendamage = 100;
			scr_gamepad_vibration(other.player, 1, 10);
		}
	}
}

if (other.invincible_timer > 0)
&& (hp > 0)
{
	hp = 0;
	takendamage = 100;
	hspeed = 0;
	vspeed = 0;
	mask_index = spr_boss_vulnerable;
	sprite_index = spr_boss_vulnerable;
	time = 0;
	flying_back = false;
}