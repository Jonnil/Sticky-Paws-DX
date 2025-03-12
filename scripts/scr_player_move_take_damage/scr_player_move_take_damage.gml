function scr_player_move_take_damage()
{
	/* Only process damage if the player isn't currently in a damage state and isn't invincible */
	if (taken_damage < 1
	&& invincible_timer == 0)
	{
		/* If challenge mode is enabled and one-hit defeat is active, bypass any shield and immediately defeat the player. */
		if (global.challenge_mode_enable
		&& global.challenge_one_hit_defeat)
		{
			hp = 0;
		}
		else
		{
			/* If the player has the heart balloon (acts as a shield) */
			if (have_heart_balloon)
			{
				have_heart_balloon = false;
				ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
				ini_write_real("Player", "player" + string(player) + "_have_heart_balloon", false);
				ini_close(); /* Temporary save; not committed on the Switch platform */
			}
			else
			{
				/* Calculate damage: double damage if challenge_enemies_double_damage is enabled, otherwise normal damage (1) */
				var damage = 1;
				
				if (global.challenge_mode_enable
				&& global.challenge_enemies_double_damage)
				{
					damage = 2;
				}
				
				hp -= damage;
			}
		}
		
		/* Set invincibility frames if not disabled by challenge_no_post_hit_invincibility */
		if (!(global.challenge_mode_enable
		&& global.challenge_no_post_hit_invincibility))
		{
			taken_damage = 200; /* Normal invincibility duration */
		}
		else
		{
			taken_damage = 10; /* No post-hit invincibility in challenge mode */
		}
		
		/* Trigger gamepad vibration as feedback for taking damage */
		scr_gamepad_vibration(player, 1, 10);
	}
}