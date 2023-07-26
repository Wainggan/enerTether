inputSystem = new InputManager();
inputSystem.create_input("up")
	.add_keyboard_key(vk_up)
	.add_keyboard_key(ord("W"))
	.add_gamepad_stick(gp_axislv, -1)
	.add_gamepad_button(gp_padu)
inputSystem.create_input("down")
	.add_keyboard_key(vk_down)
	.add_keyboard_key(ord("S"))
	.add_gamepad_stick(gp_axislv, 1)
	.add_gamepad_button(gp_padd)
inputSystem.create_input("left")
	.add_keyboard_key(vk_left)
	.add_keyboard_key(ord("A"))
	.add_gamepad_stick(gp_axislh, -1)
	.add_gamepad_button(gp_padl)
inputSystem.create_input("right")
	.add_keyboard_key(vk_right)
	.add_keyboard_key(ord("D"))
	.add_gamepad_stick(gp_axislh, 1)
	.add_gamepad_button(gp_padr)

inputSystem.create_input("reverse")
	.add_keyboard_key(vk_control)
	.add_keyboard_key(ord("Q"))
	
inputSystem.create_input("pause")
	.add_keyboard_key(vk_escape)
	.add_gamepad_button(gp_start)

check = inputSystem.check;
check_pressed = inputSystem.check_pressed;
check_released = inputSystem.check_released;
check_stutter = inputSystem.check_stutter;