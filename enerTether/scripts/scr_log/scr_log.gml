
// todo: optmize. add log file functionality

enum eLL {
	Debug,
	Info,
	Warning,
	Error,
	Silent
}

global.__logger = {
	level: eLL.Info
}


/// @arg {Real} _level		severity level
function log_set_level(_level) {
	global.__logger.level = _level
}

/// @return {Real}			current severity level
function log_get_level() {
	return global.__logger.level
}

function log_print(_text) { 
	show_debug_message($"L{string(global.__logger.level)} {_text}")
}


function log_debug(_text) {
	if global.__logger.level <= eLL.Debug
		log_print($"debug - {_text}")
}

function log_info(_text) {
	if global.__logger.level <= eLL.Info
		log_print($"info - {_text}")
}

function log_warning(_text) {
	if global.__logger.level <= eLL.Warning
		log_print($"warning - {_text}")
}

function log_error(_text) {
	if global.__logger.level <= eLL.Error
		log_print($"ERROR!! - {_text}")
}