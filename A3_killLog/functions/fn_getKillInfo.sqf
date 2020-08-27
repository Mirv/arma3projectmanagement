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
//
// - Note
//		We could probably return a string since we now wrap individual strings in single quotes in this function already
//		We don't test edge case where killer is blank
//		We don't test edge case were instigator is not null object

// Quickest fix is to assign the killer to instigator if it's blank before calling gather ... alternatively we drill down into param list testing again

params [ "_unit", "_killer", ["_instigator", objNull] ];
private [ "_result" ];

// systemChat "Entering kill info";

// We don't care about recording events unless it's a player
// if(isPlayer _killer OR isPlayer _instigator) then {
if(isPlayer _killer) then {

	// systemChat format["Instigator post adjustment ... %1", _instigator];

	// at this point we would check for instigator and then set killer to instigator
	// the drone check should handle if instigator is empty
	// _killer = [_killer, _instigator] call MAR_fnc_checkDroneKill;

	// assemble it all

	// setup the identity of killed unit and killer (64bit steamUID, displayName, side Name)
	_result = [ getPlayerUID _unit, name _unit, side _unit ];
	_result append [ (getPlayerUID _killer), format ["'%1'", (name _killer)],  format ["'%1'", (side _killer)] ];
	
	// TODO - test wrapping call with ()
	_result append ( [ _unit, _killer ] call MAR_fnc_getLocations );
	_result append ( _killer call MAR_fnc_weaponNames);
	_result pushback time;	
};

// systemChat (format ["In GKI - %1", (_result joinString " - ")] );

_result;

// ["76561198010027779","=JpS=Raptor-Man","WEST","76561198010027779","=JpS=Raptor-Man","WEST","VR","mp_player_check","=JpS=Raptor-Man on DESKTOP-HP359LD",0,1840.59,5488.9,0.00143909,1840.59,5488.9,0.00143909,"'arifle_MXM_Hamr_LP_BI_F'","'MXM 6.5 mm'",false,"'None'","'None'",63.199]
// ["76561198010027779","=JpS=Raptor-Man","'WEST'","76561198010027779","=JpS=Raptor-Man","'WEST'","'VR'","'mp_player_check'","'=JpS=Raptor-Man on DESKTOP-HP359LD'",1840.59,5488.9,0.00143909,1840.59,5488.9,0.00143909,0,"'arifle_MXM_Hamr_LP_BI_F'","'MXM 6.5 mm'",false,"'None'","'None'",53.015]
// ["76561198010027779","=JpS=Raptor-Man","'WEST'","76561198010027779","=JpS=Raptor-Man","'WEST'","'VR'","'mp_player_check'","'=JpS=Raptor-Man on DESKTOP-HP359LD'",1840.59,5488.9,0.00143909,1840.59,5488.9,0.00143909,0,"'arifle_MXM_Hamr_LP_BI_F'","'MXM 6.5 mm'",false,"'None'","'None'",3.016]
// ["76561198010027779","'=JpS=Raptor-Man'","'WEST'","76561198010027779","'=JpS=Raptor-Man'","'WEST'","'VR'","'__cur_mp'","'Test Server'",1840.59,5488.9,0.00143909,1840.59,5488.9,0.00143909,0,"'arifle_MXM_Hamr_LP_BI_F'","'MXM 6.5 mm'",false,"'None'","'None'",3.883]