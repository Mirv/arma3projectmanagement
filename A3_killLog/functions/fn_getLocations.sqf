//
// - Params [_killed, _killer] call mar_fnc_getLocations;
//
// - Returns an array
// 		distance as float
// 		killed position array of 3 signed floats
// 		killer position array of 3 signed floats
//
// - Note - mostly needed to test making cfgFunction
//
params ["_killed", "_killer"];

private [
	"_currentMap",
	"_currentMission",
	"_currentServerName",
	"_killedPos",
	"_killerPos",
	"_killDistance",
	"_result"
];

_currentMap = format ["'%1'", worldName];
_currentMission = format ["'%1'", missionName];
_currentServerName = format ["'%1'", serverName];
_killedPos = getPos _killed;
_killerPos = getPos _killer;
_killDistance = _killedPos distance _killerPos;

_result = [	
	_currentMap,
	_currentMission,
	_currentServerName
];

// append arrays, rather than hand type it into result array so it's a flat file & pushback to keep the array order
_result append _killedPos;
_result append _killerPos;
_result pushBack _killDistance;

// last operations is returned, but append doesn't work with this, so assert the variable to return
_result;

// output: ["VR","mp_player_check","DESKTOP",0,1840.59,5488.9,0.00143909,1840.59,5488.9,0.00143909]