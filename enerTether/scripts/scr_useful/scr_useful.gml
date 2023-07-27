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

function map(val, start1, end1, start2, end2) {
	var prop = (val - start1)/(end1-start1);
	return prop*(end2-start2) + start2;
}

function wave(_from, _to, _duration, _offset = 0, _time = current_time * 0.001) {
	var a4 = (_from - _to) * 0.5;
	return _to + a4 + sin((((_time) + _duration * _offset) / _duration) * (pi*2)) * a4;
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

function parabola(p1, p2, y, x) {
  return -(y / power((p1 - p2) / 2, 2)) * (x - p1) * (x - p2)
}