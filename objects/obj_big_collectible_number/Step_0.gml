/* The source passes its marker directly, including pickups released much later. */
if (instance_exists(big_collectible_owner))
{
	if (big_collectible_owner.object_index == obj_big_collectible && big_collectible > 0)
	{
		big_collectible_owner.big_collectible = big_collectible;
		big_collectible_owner.big_collectible_legacy_slot = big_collectible_legacy_slot;
	}
}
