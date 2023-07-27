
var _kh = keyboard_check(ord("L")) - keyboard_check(ord("J"))
var _kv = keyboard_check(ord("K")) - keyboard_check(ord("I"))
var _kz = keyboard_check(ord("U")) - keyboard_check(ord("O"))

camera.x += (_kh / camera.zoom) * 4
camera.y += (_kv / camera.zoom) * 4
camera.zoom += _kz
camera.zoom = clamp(camera.zoom, 4, 256)

state.update(1 / 60)
