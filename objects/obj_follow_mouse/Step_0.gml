var viewCamera = view_camera[view_current];
var viewX = camera_get_view_x(viewCamera);
var viewY = camera_get_view_y(viewCamera);
var viewWidth = camera_get_view_width(viewCamera);
var viewHeight = camera_get_view_height(viewCamera);

x = clamp(mouse_x, viewX, viewX + viewWidth);
y = clamp(mouse_y, viewY, viewY + viewHeight);