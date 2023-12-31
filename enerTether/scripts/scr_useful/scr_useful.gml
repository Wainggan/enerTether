///@desc returns value closer to _b by _amount, never exceeding +/-_b
///@arg {Real} _a start value
///@arg {Real} _b target value
///@arg {Real} _amount increment
function approach(_a, _b, _amount) {
	if (_a < _b)
	    return min(_a + _amount, _b); 
	else
	    return max(_a - _amount, _b);
}

function round_ext(_value,_round) {
	return round(_value / _round) * _round;
}

function map(_val, _start1, _end1, _start2, _end2) {
	var _prop = (_val - _start1)/(_end1-_start1);
	return _prop*(_end2-_start2) + _start2;
}

function wave(_from, _to, _duration, _offset = 0, _time = current_time * 0.001) {
	var _a4 = (_from - _to) * 0.5;
	return _to + _a4 + sin((((_time) + _duration * _offset) / _duration) * (pi*2)) * _a4;
}

function wrap(_value,_min,_max) {
	var _mod = ( _value - _min ) mod ( _max - _min );
	if ( _mod < 0 ) return _mod + _max; else return _mod + _min;
}

/// @desc returns a true [percent]% of the time
/// @param _percent {real}
function chance(_percent) {
	return _percent > random(1);
}

function parabola(_p1, _p2, _y, _x) {
  return -(_y / power((_p1 - _p2) / 2, 2)) * (_x - _p1) * (_x - _p2)
}