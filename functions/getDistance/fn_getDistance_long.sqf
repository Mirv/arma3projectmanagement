//
// call with:	[_killed, _killer] call fn_getDistance;
//
// return distance float

// verbose
private _theKilled;
private _theKiller;

_killedPos = getPos _killed;
_killerPos = getPos _killer;

_returnDistance = _killedPos distance _killerPos;