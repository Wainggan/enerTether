
enum eEntity {
	Null,
	Generic,
	Player,
	Wall,
	Win,
	WinEnd,
	WinHead,
	Invalid,
	Box,
	Hole
}

/// @desc register an entity
/// @param _entityID	entity type id
/// @param _entityType	entity constructor
function entity_register(_entityID, _entityType) {
	if !variable_global_exists("entities") global.entities = {}
	global.entities[$ _entityID] = _entityType
}

/// @return {Function.Entity}
function entity_deindex(_entityID) {
	return global.entities[$ _entityID]
}
