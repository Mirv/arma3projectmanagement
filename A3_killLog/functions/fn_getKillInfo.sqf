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
//		We could probably return a string since we now wrap individual strings in single quotes in this function already
//		We don't test edge case where killer is blank
//		We don't test edge case were instigator is not null object

params [ "_unit", "_killer"];
private [ "_result" ];


// at this point we would check for instigator and then set killer to instigator
// the drone check should handle if instigator is empty
// _killer = [_killer, _instigator] call MAR_fnc_checkDroneKill;

// assemble it all



// setup the identity of killed unit (64bit steamUID, displayName, side Name)
_result = [ 
	// AI doesn't have a steamUID so 1 will be my flag in db to AI kill
	if(isPLayer _unit) then {getPlayerUID _unit} else { 1 }, 
	format ["'%1'", (name _unit)],  
	format ["'%1'", (side _unit)] 
];

// add killer (64bit steamUID, displayName, side Name)
_result append [ (getPlayerUID _killer), format ["'%1'", (name _killer)],  format ["'%1'", (side _killer)] ];

// add location (xyz coords / server / map / mission names)
_result append ( [ _unit, _killer ] call MAR_fnc_getLocations );

// add weaponry
_result append ( _killer call MAR_fnc_getWeaponry);

// add server time
_result pushback time; 

_result;

// output: ["76561198010027779","'=JpS=Raptor-Man'","'WEST'","76561198010027779","'=JpS=Raptor-Man'","'WEST'","'VR'","'__cur_mp'","'Test Server'",1836.74,5480.22,2.46744,1836.74,5480.22,2.46744,0,"'LMG_coax'","'Coaxial MG 7.62 mm'",true,"'B_MBT_01_cannon_F'","'M2A1 Slammer'",185.426]