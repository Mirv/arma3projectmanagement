//
// - getKillInfo
//		When called assembles all the event info regarding death caused by a player
//
// - call with: [<player1>, <player2>] mar_fnc_getKillInfo;
// - test with:  [player, player] mar_fnc_getKillInfo;
//
// - Parameters
//		Unit killed as object
//		killer as object
//		instigator as object
//
// - Returns
//		Mixed array of strings/int/float/bool
//
// - Note
//		Side is reporting civilian for CSAT
//		We could probably return a string since we now wrap individual strings in single quotes in this function already
//		We don't test edge case where killer is blank
//		We don't test edge case were instigator is not null object

params [ "_unit", "_killer"];
private [ "_result" ];

// at this point we would check for instigator and then set killer to instigator
// the drone check should handle if instigator is empty
// _killer = [_killer, _instigator] call MAR_fnc_checkDroneKill;

// setup the identity of killed unit (64bit steamUID, displayName, side Name)
_result = [ 
	// AI doesn't have a steamUID so 1 will be my flag in db to AI kill
	if(isPLayer _unit) then {getPlayerUID _unit} else { 1 }, 
	format ["'%1'", (name _unit)],  
	format ["'%1'", (side _unit)],
	// adding the killer info now - this will always be a player
	(getPlayerUID _killer), 
	format ["'%1'", (name _killer)],  
	format ["'%1'", (side _killer)] 
];

_result;

// output: ["76561198010027779","'=JpS=Raptor-Man'","'WEST'","76561198010027779","'=JpS=Raptor-Man'","'WEST'"]

