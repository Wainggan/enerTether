
function Hole(_state, _x, _y) : Entity(_state, _x, _y) constructor {
	
	filled = false
	
	static collision = function (_x, _y) { 
		return _x == x && _y == y && !filled
	}
	
	static ondraw = function (_delta) {
		static _emptyDraw = function () {
			
			static _pad = 0.12
			var _rad = 0.15 * game.camera.zoom
			
			draw_set_color(#000000)
			draw_set_alpha(0.2)
			draw_roundrect_ext(
				wtsR_x(x + _pad), wtsR_y(y + _pad), 
				wtsR_x(x + 1 - _pad) - 1, wtsR_y(y + 1 - _pad) - 1, 
				_rad, _rad, false
			)
			
			draw_set_color(#666666)
			draw_set_alpha(1)
			draw_roundrect_ext(
				wtsR_x(x + _pad), wtsR_y(y + _pad), 
				wtsR_x(x + 1 - _pad) - 1, wtsR_y(y + 1 - _pad) - 1, 
				_rad, _rad, true
			)
			
		}
		static _filledDraw = function () {
			
			static _pad = 0.2
			var _rad = 0.15 * game.camera.zoom
			
			draw_set_color(#333311)
			draw_set_alpha(0.2)
			draw_roundrect_ext(
				wtsR_x(x + _pad), wtsR_y(y + _pad), 
				wtsR_x(x + 1 - _pad) - 1, wtsR_y(y + 1 - _pad) - 1, 
				_rad, _rad, false
			)
			
			draw_set_color(#888866)
			draw_set_alpha(1)
			draw_roundrect_ext(
				wtsR_x(x + _pad), wtsR_y(y + _pad), 
				wtsR_x(x + 1 - _pad) - 1, wtsR_y(y + 1 - _pad) - 1, 
				_rad, _rad, true
			)
			
		}
		
		if filled
			_filledDraw()
		else
			_emptyDraw()
		
	}
	
}

entity_register(eEntity.Hole, Hole)

