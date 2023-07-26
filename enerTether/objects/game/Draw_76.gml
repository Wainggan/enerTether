
var _win_w = window_get_width()
var _win_h = window_get_height()

if !surface_exists(surface) surface = surface_create(_win_w * scale, _win_h * scale)

if	_win_w != surface_get_width(application_surface) ||
	_win_h != surface_get_height(application_surface) 
{
	surface_resize(application_surface, _win_w, _win_h)
	display_set_gui_size(_win_w, _win_h)
	
	surface_resize(surface, _win_w * scale, _win_h * scale)
}



