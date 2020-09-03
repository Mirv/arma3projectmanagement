// - execInsert
//		
//	- Notes
//		Could extract which table is being inserted as variable
//
params [ "_unit", "_killer"];

private ["_myData", "_result" ];

// get identity info for killed/killer
_myData = [_unit, _killer] call ELDB_fnc_getIdentities;

// Senario info: island, mission, server names
_myData append [format ["'%1'", worldName], format ["'%1'", missionName], format ["'%1'", serverName]];

// appending allows us to maintain a flat array - since arma3 doesn't have flatten command
// add location (xyz coords / server / map / mission names)
_myData append ( [ _unit, _killer ] call ELDB_fnc_getLocations );

// add weaponry
_myData append ( _killer call ELDB_fnc_getWeaponry);

// add server time
_myData pushback time; 

// format the query & call it
_myData = [_myData] call ELDB_fnc_formatInsert;
_myData = format ["2:myProtocol:%1", _myData];
_result = "extDB3" callExtension _myData;

_result;

// SQL row result
// 1, Latif Habibzai, CIV, 76561198010027779, =JpS=Raptor-Man, WEST, VR, mp_player_check2, ExtDB3 - Test - Server, 4749.4, 2396.4, 0.00143909, 4732.26, 2372.1, 0.00143909, 30, arifle_MX_ACO_pointer_F, MX 6.5 mm, 1, B_Soldier_A_F, Ammo Bearer, 5, 2020-08-30 15:47:55
