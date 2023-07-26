
/// @desc entity struct all game objects inherit from
/// @param {Struct.GameState} _state the GameState struct
function Player(_state, _x, _y) : Entity(_state, _x, _y) constructor {
	
	trail = [{ x, y }]
	
	static collision = function(_x, _y) {
		
		for (var i = 0; i < array_length(trail); i++) {
			if _x == trail[i].x && _y == trail[i].y return true
		}
		
		return false
		
	}
	
	///@desc checks to see if the player overlaps all "win" tiles correctly
	static checkWin = function () {

		var _winTiles = state.get(Win)
		
		for (var i = 0; i < array_length(_winTiles); i++) {
			var _p = _winTiles[i]
			
			if is_instanceof(_p, WinEnd) {
				var _tailIsWin = (_p.x == trail[0].x && _p.y == trail[0].y)
				var _headIsWin = (_p.x == array_last(trail).x && _p.y == array_last(trail).y)
				
				if _tailIsWin || _headIsWin continue
				else return false
			}
			
			if is_instanceof(_p, WinHead) {
				var _headIsWin = (_p.x == array_last(trail).x && _p.y == array_last(trail).y)
				
				if _headIsWin continue
				else return false
			}
			
			var _check = false
			for (var j = 0; j < array_length(trail); j++) {	
				if _p.x == trail[j].x && _p.y == trail[j].y {
					_check = true
					break
				}
			}
			
			if !_check return false
			
		}
		
		
		var _evilTiles = state.get(Invalid)
		
		for (var i = 0; i < array_length(_evilTiles); i++) {
			var _p = _evilTiles[i]

			var _check = false
			for (var j = 0; j < array_length(trail); j++) {	
				if _p.x == trail[j].x && _p.y == trail[j].y {
					_check = true
					break
				}
			}
			
			if _check return false
			
		}


		return true
		
	}
	
	static onstep = function(_k) {
		
		var _kr = false, _kh = 0, _kv = 0
		
		// god
		_kr = input.check_stutter("reverse", 12, 4)
		if !_kr {
			_kh = input.check_stutter("right", 8, 6) - input.check_stutter("left", 8, 6)
			if _kh == 0
				_kv = input.check_stutter("down", 8, 6) - input.check_stutter("up", 8, 6)
		}
		
		
		if _kr && array_length(trail) > 1 { // reverse
			array_pop(trail)
			
			x = array_last(trail).x
			y = array_last(trail).y
		}
		
		var _col = state.collision(x + _kh, y + _kv)
		
		if _col == self {
			
			if array_length(trail) > 1 {
				var _t = trail[array_length(trail) - 2]
				var _t2 = trail[0]
				if _t.x == x + _kh && _t.y == y + _kv {
					x += _kh
					y += _kv
					
					array_pop(trail)
				} else if _t2.x == x + _kh && _t2.y == y + _kv {
					array_shift(trail)
					
					x += _kh
					y += _kv
					
					array_push(trail, { x, y })
				}
			}
			
		} else if is_instanceof(_col, Box) { // attempt to push box
			var _move = _col.push(_kh, _kv)
			
			if _move {
				x += _kh
				y += _kv
					
				array_push(trail, { x, y })
			}
		} else if _col { // if anything is in the way, just don't move
			
		} else {
			x += _kh
			y += _kv
		
			array_push(trail, { x, y })
		}
		
	}
	
	static ondraw = function() {
		
		var _TAILWIDTH = 0.5
		var _HEADWIDTH = 0.7
		
		draw_set_color(#ff44cc)
		
		for (var i = 0; i < array_length(trail) - 1; i++) {
			
			draw_circle(
				wtsR_x(trail[i].x + 0.5) - 1, wtsR_y(trail[i].y + 0.5) - 1, 
				(i == 0 ? _HEADWIDTH : _TAILWIDTH) / 2 * game.camera.zoom, false
			);
			draw_line_width(
				wtsR_x(trail[i].x + 0.5) - 1, wtsR_y(trail[i].y + 0.5) - 1,
				wtsR_x(trail[i + 1].x + 0.5) - 1, wtsR_y(trail[i + 1].y + 0.5) - 1,
				_TAILWIDTH * game.camera.zoom
			);
			
		}
		
		draw_circle(
			wtsR_x(x + 0.5) - 1, wtsR_y(y + 0.5) - 1, 
			_HEADWIDTH / 2 * game.camera.zoom, false
		);
		
		draw_set_color(#2222ff)
		
		draw_circle(
			wtsR_x(x + 0.5) - 1, wtsR_y(y + 0.5) - 1, 
			0.2 / 2 * game.camera.zoom, false
		);
		if array_length(trail) > 1 {
			draw_circle(
				wtsR_x(trail[0].x + 0.5) - 1, wtsR_y(trail[0].y + 0.5) - 1, 
				0.2 / 2 * game.camera.zoom, true
			);
		}
		
	}
	
}

entity_register(eEntity.Player, Player)
