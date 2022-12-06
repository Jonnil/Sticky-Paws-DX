#region /* Load correct sprite when you get the checkpoint */
if (global.checkpoint_x == x)
and (global.checkpoint_y == y)
{
	checkpoint_activated = true;
	if (instance_exists(obj_camera))
	and (instance_exists(obj_player))
	{
		if (checkpoint_which_player == 1)
		and (obj_camera.player1 > 0)
		and (instance_exists(obj_camera.player1))
		and (obj_camera.player1.sprite_checkpoint_activated > 0)
		{
			sprite_index = obj_camera.player1.sprite_checkpoint_activated;
		}
		else
		if (checkpoint_which_player = 2)
		and (obj_camera.player2 > 0)
		and (instance_exists(obj_camera.player2))
		and (obj_camera.player2.sprite_checkpoint_activated > 0)
		{
			sprite_index = obj_camera.player2.sprite_checkpoint_activated;
		}
		else
		if (checkpoint_which_player = 3)
		and (obj_camera.player3 > 0)
		and (instance_exists(obj_camera.player3))
		and (obj_camera.player3.sprite_checkpoint_activated > 0)
		{
			sprite_index = obj_camera.player3.sprite_checkpoint_activated;
		}
		else
		if (checkpoint_which_player = 4)
		and (obj_camera.player4 > 0)
		and (instance_exists(obj_camera.player4))
		and (obj_camera.player4.sprite_checkpoint_activated > 0)
		{
			sprite_index = obj_camera.player4.sprite_checkpoint_activated;
		}
		else
		{
			sprite_index = spr_checkpoint;
			image_index = 1;
			image_speed = 0;
		}
	}
	else
	{
		sprite_index = spr_checkpoint;
		image_index = 1;
		image_speed = 0;
	}
}
#endregion /* Load correct sprite when you get the checkpoint END */
