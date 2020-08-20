
//
// - gatherKillInfo
//		When called assembles all the event info regarding death caused by a player
//
// - Parameters
//		Unit killed as object
//		killer as object
//		instigator as object
//
// - Returns
//		Mixed array of strings/int/float/bool

params [ "_unit", "_killer", "_instigator" ];

// We don't care unless it's a player
if(isPlayer _killer) then {
	// TODO - test private inside a loop works
	private [ "_theResult" ];

	// eventually when I figure the bug out - moving these two into the weapons function
	if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0}; // UAV/UGV player operated kill
	if (isNull _instigator) then {_instigator = _killer}; // player driven vehicle road kill

	// assemble it all

	// setup the identity of killed unit and killer
	_theResult = [ (getPlayerUID _unit), (name _unit), (side group _killed) ];
	_theResult append [ (getPlayerUID _instigator), (name _instigator), (side group _instigator) ];
	
	// TODO - test wrapping call with ()
	_theResult append ([ _unit, _instigator ] call MAR_fnc_getLocations);
	_theResult append ([ _instigator ] call MAR_fnc_weaponNames);
	_theResult pushback time;	
	_theResult
};
