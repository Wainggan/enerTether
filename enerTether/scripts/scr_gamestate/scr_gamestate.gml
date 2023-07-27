
/// @desc	struct representing the current state of a level. does not contain game logic (its a bit dumb)
function GameState() constructor {
	
	static __total = 0
	
	id = __total++
	
	width = -1
	height = -1
	
	entities = []
	
	///@desc sets up the current level
	///@arg {Id.Layer} _datalayer layer id of the level tiles
	static setup = function (_datalayer) {
		
		var _tilemap = layer_tilemap_get_id(_datalayer)
		
		width = tilemap_get_width(_tilemap)
		height = tilemap_get_height(_tilemap)
		
		entities = []
		
		for (var ix = 0; ix < width; ix++) {
			for (var iy = 0; iy < height; iy++) {
				var _tile = tilemap_get(_tilemap, ix, iy)
				var _Type = entity_deindex(_tile)
				
				if _Type == undefined {
					if _tile != eEntity.Null 
						log_warning($"GameState.setup: unknown tile type {_tile}")
					continue
				}
				
				var _e = new _Type(self, ix, iy)
				
				array_push(entities, _e)
				
			}
		}
		
		log_info("GameState.setup: finished successfully??")
		
		return self
		
	}

	///@desc get all entities of a type
	///@arg {Struct.Entity, Function, Array<Function>} _type
	///@return {Array<Struct.Entity>}
	static get = function (_type) {
		var _out = []
		if typeof(_type) == "struct" {
			for (var i = 0; i < array_length(entities); i++) {
				if entities[i] == _type array_push(_out, _type)
			}
			return _out
		}
		// assume the type is a constructor
		if !is_array(_type) _type = [_type]
		for (var i = 0; i < array_length(_type); i++) {
			for (var j = 0; j < array_length(entities); j++) {
				if is_instanceof(entities[j], _type[i]) array_push(_out, entities[j])
			}
		}
		return _out
	}
	
	///@desc destroys all entities of a type
	///@arg {Struct.Entity, Function, Array<Function>} _type
	static destroy = function (_type) {
		var _list = get(_type)
		for (var i = 0; i < array_length(entities); i++) {
			for (var j = 0; j < array_length(_list); j++) {
				if entities[i] == _list[j] {
					array_delete(entities, i--, 1)
					array_delete(_list, j--, 1)
				}
			}
		}
	}
	
	///@desc check if there is a collidable entity at a coordinate
	///@return {Struct.Entity, Undefined}
	static collision = function (_x, _y) {
		for (var i = 0; i < array_length(entities); i++) {
			if entities[i].collision(_x, _y) return entities[i]
		}
		return undefined
	}
	
	///@desc calls all entity's update method
	static update = function(_delta) {
		for (var i = 0; i < array_length(entities); i++) {
			entities[i].onstep(_delta)
		}
	}
	
	///@desc calls all entity's draw method
	static draw = function(_delta) {
		for (var i = 0; i < array_length(entities); i++) {
			var _lastC = draw_get_color()
			
			entities[i].ondraw(_delta)
		
			draw_set_color(_lastC)
		}
	}
	
}

