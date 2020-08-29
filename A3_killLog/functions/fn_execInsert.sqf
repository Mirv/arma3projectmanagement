// - testEntireInsert
//		mar_fnc_testEntireInsert
//	- Notes
//		Could extract which table is being inserted as variable
//
params [ "_unit", "_killer"];

private ["_myData", "_result" ];

_myData = [_unit, _killer] call mar_fnc_getKillInfo;
_myData = [_myData] call mar_fnc_formatInsert;
_myData = format ["2:myProtocol:%1", _myData];
_result = "extDB3" callExtension _myData;

_result;
