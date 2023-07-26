
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

global.entities = {}

/// @desc register an entity
/// @param _entityID	entity type id
/// @param _entityType	entity constructor
function entity_register(_entityID, _entityType) {
	global.entities[$ _entityID] = _entityType
}

/// @return {Function.Entity}
function entity_deindex(_entityID) {
	return global.entities[$ _entityID]
}
