if (other.vspeed > 0)
or(other.bbox_bottom < y)
or(other.dive = true)
{
	if (can_jump_on_head = true)
	{
		if (asset_get_type("snd_boss_damaged") == asset_sound)
		{
			audio_play_sound(snd_boss_damaged, 0, 0);
			audio_sound_gain(snd_boss_damaged, global.sfx_volume, 0);
		}
		if (other.ground_pound = true)
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
			hp -= 1;
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
				if (simple_controls = false)
				{
					vspeed = -triple_jump_height;
				}
				else
				{
					vspeed = -8;
				}
			}
		}
		else
		{
			other.vspeed = -8;
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
				if (simple_controls = false)
				{
					vspeed = -triple_jump_height;
				}
				else
				{
					vspeed = -8;
				}
			}
		}
		else
		{
			other.vspeed = -8;
		}
	}
}
else
if (can_jump_on_head = true)
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
			if (simple_controls = false)
			{
				vspeed = -triple_jump_height;
			}
			else
			{
				vspeed = -8;
			}
		}
	}
	else
	{
		other.vspeed = -8;
	}
}
else
{
	if (hp > 0)
	and(takendamage = 0)
	{
		if (other.takendamage<=0)
		and(other.assist_invincible=false)
		{
			if (other.have_heart_balloon=true)
			{
				other.have_heart_balloon=false;
			}
			else
			{
				other.hp-=1;
			}
			other.takendamage=100;
		}
	}
}

if (other.invincible > 0)
and(hp > 0)
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