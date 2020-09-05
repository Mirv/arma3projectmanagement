private ["_result"];

_currentMap = format ["'%1'", worldName];
_currentMission = format ["'%1'", missionName];
_currentServerName = format ["'%1'", serverName];

_result = [_currentMap, _currentMission, _currentServerName];

_result;