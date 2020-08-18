addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	private [ "_player", "_killedSide", "_killerSide" ];

	if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0}; // UAV/UGV player operated kill
	if (isNull _instigator) then {_instigator = _killer}; // player driven vehicle road kill

	_distArray = [_unit, _instigator] call MAR_fnc_getDistance;
	_weaponArray = [_unit, _instigator] call MAR_fnc_weaponNames;

	// setup the identity of killed unit and killer
	_killed = [(getPlayerUID _unit), (name _unit), (side group _killed)];
	_killer = [(getPlayerUID _killer), (name _killer), (side group _killer)];

	// note - use append to add the arrays to prevent nesting when we combine the call to feed the SQF into SQL
	// https://community.bistudio.com/wiki/Array#Adding_.28appending.29_elements
}];