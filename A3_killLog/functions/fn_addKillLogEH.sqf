
addMissionEventHandler ["EntityKilled",{
	params ["_unit", "_killer", "_instigator"];
	if(isPLayer _killer) then {
		[ _unit, _killer ] call ELDB_fnc_execInsert;
	};
}];


// addMissionEventHandler ["EntityKilled",{
// 	params ["_unit", "_killer", "_instigator"];

// 	if(isPlayer _killer OR isPlayer _instigator) then {		
// 		// for simplicity v1 will not deal with instigator
// 		// _result = [_unit, _killer, _instigator] call MAR_fnc_execInsert;
// 		_result = [ _unit, _killer ] call MAR_fnc_execInsert;
// 		// result3 = [player, player] call mar_fnc_execInsert;
// 	}
// }];

