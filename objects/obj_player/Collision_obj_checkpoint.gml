#region /* Make sure the heart stays on the character if you spawn from a checkpoint */
if (instance_exists(obj_camera) && (obj_camera.iris_xscale < 0.3 || obj_camera.iris_yscale < 0.3))
{
	xx_heart = x;
	yy_heart = y;
}
#endregion /* Make sure the heart stays on the character if you spawn from a checkpoint END */
