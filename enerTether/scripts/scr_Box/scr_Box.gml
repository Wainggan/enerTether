
function Box(_state, _x, _y) : Entity(_state, _x, _y) constructor {
	
	static push = function (_dx, _dy) {
		
		var _col = state.collision(x + _dx, y + _dy)
    
		if is_instanceof(_col, Hole) {
			x += _dx
			y += _dy
			_col.filled = true
			destroy()
			return true
		}
		
		if !_col {
			x += _dx
			y += _dy
			return true
		}
    
		if !is_instanceof(_col, Box) return false
    
		var _move = _col.push(_dx, _dy)
		if _move {
			x += _dx
			y += _dy
			return true
		}
		
		return false
		
	}
	
	static ondraw = function (_delta) {
		static _pad = 0.15
		var _rad = 0.15 * game.camera.zoom
		
		draw_set_color(#ffddaa)
		
		draw_set_alpha(0.6)
		draw_roundrect_ext(
			wtsR_x(x + _pad), wtsR_y(y + _pad), 
			wtsR_x(x + 1 - _pad) - 1, wtsR_y(y + 1 - _pad) - 1, 
			_rad, _rad, false
		)
		draw_set_alpha(1)
		draw_roundrect_ext(
			wtsR_x(x + _pad), wtsR_y(y + _pad), 
			wtsR_x(x + 1 - _pad) - 1, wtsR_y(y + 1 - _pad) - 1, 
			_rad, _rad, true
		)
	}
	
}

entity_register(eEntity.Box, Box)
