
function Win(_state, _x, _y) : Entity(_state, _x, _y) constructor {
	
	static collision = function (_x, _y) { return false }
	
	static ondraw = function (_delta) {
		draw_set_color(#33ff66)
		
		draw_circle(
			wtsR_x(x + 0.5) - 1, wtsR_y(y + 0.5) - 1, 
			0.8 / 2 * game.camera.zoom,
			true
		);
	}
	
}

entity_register(eEntity.Win, Win)


function WinEnd(_state, _x, _y) : Win(_state, _x, _y) constructor {
	
	static ondraw = function (_delta) {
		draw_set_color(#33ff66)
		
		draw_circle(
			wtsR_x(x + 0.5) - 1, wtsR_y(y + 0.5) - 1, 
			0.8 / 2 * game.camera.zoom,
			true
		);
		draw_circle(
			wtsR_x(x + 0.5) - 1, wtsR_y(y + 0.5) - 1, 
			0.3 / 2 * game.camera.zoom,
			true
		);
	}
	
}

entity_register(eEntity.WinEnd, WinEnd)

function WinHead(_state, _x, _y) : Win(_state, _x, _y) constructor {
	
	static ondraw = function (_delta) {
		draw_set_color(#33ff66)
		
		draw_circle(
			wtsR_x(x + 0.5) - 1, wtsR_y(y + 0.5) - 1, 
			0.8 / 2 * game.camera.zoom,
			true
		);
		draw_circle(
			wtsR_x(x + 0.5) - 1, wtsR_y(y + 0.5) - 1, 
			0.3 / 2 * game.camera.zoom,
			false
		);
	}
	
}

entity_register(eEntity.WinHead, WinHead)
