
// hide meta layers
var _layers = layer_get_id("Tiles")
layer_set_visible(_layers, false)

state = new GameState()

state.setup(_layers)


