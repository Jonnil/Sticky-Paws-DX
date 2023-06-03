/// scr_intercept_course(origin,target,speed)
//
//  Returns the course direction required to hit a moving target
//  at a given projectile speed, || (-1) if no solution is found.
//
//      origin      instance with position (x,y), real
//      target      instance with position (x,y) && (speed), real
//      speed       speed of the projectile, real
//
/// GMLscripts.com/license
function scr_intercept_course(origin, target, pspeed)
{
	var dir,alpha,phi,beta;
	dir = point_direction(origin.x, origin.y, target.x, target.y);
	alpha = target.speed / pspeed;
	phi = degtorad(target.direction - dir);
	beta = alpha * sin(phi);
	if (abs(beta) >= 1)
	{
		return (-1);
	}
	dir += radtodeg(arcsin(beta));
	return dir;
}