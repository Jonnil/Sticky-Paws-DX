if (position_meeting(x, y, other))
{
	other.image_alpha = lerp(other.image_alpha, 0, 0.1);
}
else
{
	other.image_alpha = lerp(other.image_alpha, 1, 0.1);
}