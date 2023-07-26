
function Wall(_state, _x, _y) : Entity(_state, _x, _y) constructor {
	
	static ondraw = function (_delta) {
		draw_rectangle(
			wtsR_x(x), wtsR_y(y), 
			wtsR_x(x + 1) - 1, wtsR_y(y + 1) - 1, 
			false
		);
	}
	
}

entity_register(eEntity.Wall, Wall)
