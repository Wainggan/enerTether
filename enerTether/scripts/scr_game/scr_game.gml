
function game_startLevel(_rm) {
	room_goto(_rm)
}


/// @desc World To Screen - converts world x coords to screen x coords
/// @pure
function wts_x(_x) {
	return (_x - game.camera.x) * game.camera.zoom
}

/// @desc World To Screen - converts world y coords to screen y coords
/// @pure
function wts_y(_y) {
	return (_y - game.camera.y) * game.camera.zoom
}

/// @desc World To Screen Rounded - converts world x coords to screen x coords
/// @pure
function wtsR_x(_x) {
	return round(wts_x(_x))
}

/// @desc World To Screen Rounded - converts world y coords to screen y coords
/// @pure
function wtsR_y(_y) {
	return round(wts_y(_y))
}


/// @desc Screen To World - converts screen x coords to world x coords
/// @pure
function stw_x(_x) {
	return _x / game.camera.zoom + game.camera.x
}

/// @desc Screen To World - converts screen y coords to world y coords
/// @pure
function stw_y(_y) {
	return _y / game.camera.zoom + game.camera.y
}

/// @desc Screen To World Rounded - converts screen x coords to world x coords
/// @pure
function stwR_x(_x) {
	return floor(_x / game.camera.zoom + game.camera.x)
}

/// @desc Screen To World Rounded - converts screen y coords to world y coords
/// @pure
function stwR_y(_y) {
	return floor(_y / game.camera.zoom + game.camera.y)
}

