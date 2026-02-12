function scr_player_check_spike_damage()
{
	/* If you touch spikes, take damage */

	/* Half-width of our pizza slice quadrants */
	var _slice_half_width = 45;

	#region /* Check normal spikes (damage from any direction) */
	var _hit_normal_spikes = collision_rectangle(
		bbox_left - 1,
		bbox_top - 1,
		bbox_right + 1,
		bbox_bottom + 1,
		obj_spikes,
		false,
		true
	);
	#endregion /* Check normal spikes (damage from any direction) END */

	#region /* Check emerging spikes on each side of the player */
	/* We capture the ACTUAL instance we collided with */

	/* Spikes below player (pointing UP) */
	var _hit_spikes_bottom = collision_rectangle(
		bbox_left + 1,
		bbox_bottom - 1,
		bbox_right - 1,
		bbox_bottom + 1,
		obj_spikes_emerge,
		false,
		true
	);

	/* Spikes right of player (pointing LEFT) */
	var _hit_spikes_right = collision_rectangle(
		bbox_right - 1,
		bbox_top + 1,
		bbox_right + 1,
		bbox_bottom - 1,
		obj_spikes_emerge,
		false,
		true
	);

	/* Spikes above player (pointing DOWN) */
	var _hit_spikes_top = collision_rectangle(
		bbox_left + 1,
		bbox_top - 1,
		bbox_right - 1,
		bbox_top + 1,
		obj_spikes_emerge,
		false,
		true
	);

	/* Spikes left of player (pointing RIGHT) */
	var _hit_spikes_left = collision_rectangle(
		bbox_left - 1,
		bbox_top + 1,
		bbox_left + 1,
		bbox_bottom - 1,
		obj_spikes_emerge,
		false,
		true
	);
	#endregion /* Check emerging spikes on each side of the player END */

	#region /* Evaluate if damage should happen */
	if (_hit_normal_spikes != noone)

	/* Bottom spikes must point UP (0°) */
	|| (_hit_spikes_bottom != noone
	&& _hit_spikes_bottom.sprite_index == spr_spikes_emerge
	&& scr_angle_in_slice(_hit_spikes_bottom.image_angle, 0, _slice_half_width))

	/* Right spikes must point LEFT (90°) */
	|| (_hit_spikes_right != noone
	&& _hit_spikes_right.sprite_index == spr_spikes_emerge
	&& scr_angle_in_slice(_hit_spikes_right.image_angle, 90, _slice_half_width))

	/* Top spikes must point DOWN (180°) */
	|| (_hit_spikes_top != noone
	&& _hit_spikes_top.sprite_index == spr_spikes_emerge
	&& scr_angle_in_slice(_hit_spikes_top.image_angle, 180, _slice_half_width))

	/* Left spikes must point RIGHT (270°) */
	|| (_hit_spikes_left != noone
	&& _hit_spikes_left.sprite_index == spr_spikes_emerge
	&& scr_angle_in_slice(_hit_spikes_left.image_angle, 270, _slice_half_width))
	{
		scr_player_move_take_damage();
	}
	#endregion /* Evaluate if damage should happen END */
}
