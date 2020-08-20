//
// - Params [_killed, _killer] call fn_getDistance;
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
	"_killDistance"
];

// Gather the data
_currentMap = worldName;
_currentMission = missionName;
_currentServerName = serverName;
_killedPos = getPos _killed;
_killerPos = getPos _killer;
_killDistance = _killedPos distance _killerPos;

// Fails ... too clever
// _return = [
// 	(_currentMap = worldName),
// 	(_currentMission = missionName),
// 	(_currentServerName = serverName),
// 	(_killerPos = getPos _killer),
// 	(_killedPos = getPos _killed),
// 	(_returnDistance = _killedPos distance _killerPos)
// ];

// TODO - The returned array needs to be unpacked  & appended seperately

theResult = [	
	_currentMap,
	_currentMission,
	_currentServerName,
	_killDistance
];

// append arrays so it's a flat file
theResult append _killedPos;
theResult append _killerPos;

// last operations is returned, but append doesn't work with this, so assert the variable to return
theResult


// Example 
// input in console: r =[(player), (player)] call MAR_fnc_getLocations;
// output: ["VR","mp_player_check","DESKTOP",0,1840.59,5488.9,0.00143909,1840.59,5488.9,0.00143909]