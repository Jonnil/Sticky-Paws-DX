#region /* Load correct sprite when you get the checkpoint */
if (global.checkpoint_x == xstart)
&& (global.checkpoint_y == ystart)
{
	checkpoint_activated = true;
	sprite_index = spr_checkpoint_activated;
	image_speed = 0;
	if (instance_exists(obj_camera))
	&& (instance_exists(obj_player))
	{
		for (var i = 1; i <= global.max_players; i += 1) {
			if (checkpoint_what_player == i &&
				obj_camera.player[i] > 0 &&
				instance_exists(obj_camera.player[i]) &&
				obj_camera.player[i].sprite_checkpoint_activated > 0) {
				sprite_index = obj_camera.player[i].sprite_checkpoint_activated;
				break; /* Exit the loop once a valid player is found */
			}
		}
	}
}
#endregion /* Load correct sprite when you get the checkpoint END */
