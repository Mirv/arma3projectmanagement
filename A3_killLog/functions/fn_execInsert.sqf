// - testEntireInsert
//		mar_fnc_testEntireInsert
//	- Notes
//		Could extract which table is being inserted as variable
//
params [ "_unit", "_killer"];

private ["_myData", "_result" ];

"----- in execInsert -----" call BIS_FNC_LOG;
// get identity info for killed/killer
_myData = [_unit, _killer] call ELDB_fnc_getIdentities;
diag_log (format ["Insit Server %1", _myData]);
"----- post identities - in execInsert -----" call BIS_FNC_LOG;
// appending allows us to maintain a flat array - since arma3 doesn't have flatten command
// add location (xyz coords / server / map / mission names)
_myData append ( [ _unit, _killer ] call ELDB_fnc_getLocations );
diag_log (format ["Insit Server %1", _myData]);
// add weaponry
_myData append ( _killer call ELDB_fnc_getWeaponry);
diag_log _myData;
// add server time
_myData pushback time; 

// "'VR'","'__cur_mp'","'Test Server'",1836.74,5480.22,2.46744,1836.74,5480.22,2.46744,0,"'LMG_coax'","'Coaxial MG 7.62 mm'",true,"'B_MBT_01_cannon_F'","'M2A1 Slammer'",185.426]

_myData = [_myData] call ELDB_fnc_formatInsert;
_myData = format ["2:myProtocol:%1", _myData];
_result = "extDB3" callExtension _myData;

_result;

// SQL row result
// 1, Latif Habibzai, CIV, 76561198010027779, =JpS=Raptor-Man, WEST, VR, mp_player_check2, ExtDB3 - Test - Server, 4749.4, 2396.4, 0.00143909, 4732.26, 2372.1, 0.00143909, 30, arifle_MX_ACO_pointer_F, MX 6.5 mm, 1, B_Soldier_A_F, Ammo Bearer, 5, 2020-08-30 15:47:55
