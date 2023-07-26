
function Invalid(_state, _x, _y) : Entity(_state, _x, _y) constructor {
	
	static collision = function (_x, _y) { return false }
	
	static ondraw = function (_delta) {
		static _pad = 0.2
		
		draw_set_color(#cc2244)
		
		draw_line_width(
			wtsR_x(x + _pad) - 1, wtsR_y(y + _pad) - 1, 
			wtsR_x(x + 1 - _pad) - 1, wtsR_y(y + 1 - _pad) - 1, 2
		)
		draw_line_width(
			wtsR_x(x + 1 - _pad) - 1, wtsR_y(y + _pad) - 1, 
			wtsR_x(x + _pad) - 1, wtsR_y(y + 1 - _pad) - 1, 2
		)
	}
	
}

entity_register(eEntity.Invalid, Invalid)

