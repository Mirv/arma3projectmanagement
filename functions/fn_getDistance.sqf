//
// call with:	[_killed, _killer] call fn_getDistance;
//
// returns an array
// 		distance as float
// 		killed position array of 3 signed floats
// 		killer position array of 3 signed floats
//

private ["_theKilled", "_killerPos", "_theKiller", "_killedPos", "_theDistance"];

_killedPos = getPos _killed;
_killerPos = getPos _killer;
_returnDistance = _killedPos distance _killerPos;

[_returnDistance, _killedPos, _killerPos]