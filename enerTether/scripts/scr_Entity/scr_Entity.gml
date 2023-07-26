
/// @desc entity struct all game objects inherit from
/// @param {Struct.GameState} _state the GameState struct
function Entity(_state, _x = 0, _y = 0) constructor {
	
	x = _x
	y = _y
	
	state = _state
	
	/// @desc check if a position overlaps the entity
	static collision = function(_x, _y) {
		return _x == x && _y == y
	}
	
	/// @desc to be run on every frame
	static onstep = function(_delta) {}
	
	static ondraw = function(_delta) {
		var _pad = 1/game.camera.zoom
	
		draw_rectangle(
			wtsR_x(x + _pad), wtsR_y(y + _pad), 
			wtsR_x(x + 1 - _pad * 2), wtsR_y(y + 1 - _pad * 2), 
			true
		);
	}
	
}

entity_register(eEntity.Generic, Entity)