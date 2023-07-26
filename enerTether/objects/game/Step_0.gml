
var _kh = keyboard_check(vk_right) - keyboard_check(vk_left)
var _kv = keyboard_check(vk_down) - keyboard_check(vk_up)
var _kz = keyboard_check(ord("Z")) - keyboard_check(ord("X"))

camera.x += (_kh / camera.zoom) * 4
camera.y += (_kv / camera.zoom) * 4
camera.zoom += _kz
camera.zoom = clamp(camera.zoom, 4, 256)

state.update(1 / 60)
