#region /* Load correct sprite when you get the checkpoint */
if (global.checkpoint_x == xstart)
&& (global.checkpoint_y == ystart)
{
	checkpoint_activated = true;
	if (instance_exists(obj_camera))
	&& (instance_exists(obj_player))
	{
		if (checkpoint_which_player == 1)
		&& (obj_camera.player1 > 0)
		&& (instance_exists(obj_camera.player1))
		&& (obj_camera.player1.sprite_checkpoint_activated > 0)
		{
			sprite_index = obj_camera.player1.sprite_checkpoint_activated;
		}
		else
		if (checkpoint_which_player = 2)
		&& (obj_camera.player2 > 0)
		&& (instance_exists(obj_camera.player2))
		&& (obj_camera.player2.sprite_checkpoint_activated > 0)
		{
			sprite_index = obj_camera.player2.sprite_checkpoint_activated;
		}
		else
		if (checkpoint_which_player = 3)
		&& (obj_camera.player3 > 0)
		&& (instance_exists(obj_camera.player3))
		&& (obj_camera.player3.sprite_checkpoint_activated > 0)
		{
			sprite_index = obj_camera.player3.sprite_checkpoint_activated;
		}
		else
		if (checkpoint_which_player = 4)
		&& (obj_camera.player4 > 0)
		&& (instance_exists(obj_camera.player4))
		&& (obj_camera.player4.sprite_checkpoint_activated > 0)
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
