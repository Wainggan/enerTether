
/// @desc	struct representing the current state of a level. does not contain game logic.
function GameState() constructor {
	
	static __total = 0
	
	id = __total++
	
	width = -1
	height = -1
	
	entities = []
	
	static setup = function (_datalayer) {
		
		var _tilemap = layer_tilemap_get_id(_datalayer)
		
		width = tilemap_get_width(_tilemap)
		height = tilemap_get_height(_tilemap)
		
		entities = []
		
		for (var ix = 0; ix < width; ix++) {
			for (var iy = 0; iy < height; iy++) {
				var _Type = entity_deindex(tilemap_get(_tilemap, ix, iy))
				
				if _Type == undefined continue
				
				var _e = new _Type(self, ix, iy)
				
				array_push(entities, _e)
				
			}
		}
		
		return self
		
	}
	
	static collision = function (_x, _y) {
		for (var i = 0; i < array_length(entities); i++) {
			if entities[i].collision(_x, _y) return true
		}
		return false
	}
	
	static update = function(_delta) {
		
		for (var i = 0; i < array_length(entities); i++) {
			entities[i].onstep(_delta)
		}
		
	}
	
	static draw = function(_delta) {
		
		for (var i = 0; i < array_length(entities); i++) {
			var _lastC = draw_get_color()
			
			entities[i].ondraw(_delta)
		
			draw_set_color(_lastC)
		}
		
	}
	
}

