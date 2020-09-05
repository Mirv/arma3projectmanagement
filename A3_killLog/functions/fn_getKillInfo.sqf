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


// Gather all the data
// First func is assigned, rest are appended to keep the array flat

// setup the identity of killed unit (64bit steamUID, displayName, side Name)
_result = [_unit, _killer] call ELDB_fnc_getIdentities;

// get map/mission/server names
_result append ([] call ELDB_fnc_getSenario);

// add location (xyz coords / server / map / mission names)
_result append ([ _unit, _killer ] call ELDB_fnc_getLocations);

// add weaponry
_result append ([_killer] call ELDB_fnc_getWeaponry);
// [_result] call bis_fnc_log;

// add server time
_result pushback time; 

// [_result] call bis_fnc_log;

_result;

// output: ["1","'Blah'","'WEST'","2","'Dude #2'","'WEST'","'VR'","'__cur_mp'","'Test Server'",1836.74,5480.22,2.46744,1836.74,5480.22,2.46744,0,"'LMG_coax'","'Coaxial MG 7.62 mm'",true,"'B_MBT_01_cannon_F'","'M2A1 Slammer'",185.426]
