
window_set_min_width(320)
window_set_min_height(180)

application_surface_draw_enable(false)

surface = -1
scale = 1

instance_create_layer(0, 0, layer, input)

game_startLevel(rm_content_1)

state = undefined

camera = {
	x: 0,
	y: 0,
	zoom: 48,
}

