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

// Quickest fix is to assign the killer to instigator if it's blank before calling gather ... alternatively we drill down into param list testing again

params [ "_unit", "_killer", ["_instigator", objNull, BOOL] ];

systemChat "Entering kill info";

// We don't care about recording events unless it's a player
if(isPlayer _killer OR isPlayer _instigator) then {
	private [ "_theResult" ];

	systemChat format["Instigator post adjustment ... %1", _instigator];

	// at this point we would check for instigator and then set killer to instigator
	// the drone check should handle if instigator is empty
	// _killer = [_killer, _instigator] call MAR_fnc_checkDroneKill;

	// assemble it all

	// setup the identity of killed unit and killer
	_theResult = [ (getPlayerUID _unit), (name _unit), (side group _killed) ];
	_theResult append [ (getPlayerUID _killer), (name _killer), (side group _killer) ];
	
	// TODO - test wrapping call with ()
	_theResult append ( [ _unit, _killer ] call MAR_fnc_getLocations );
	_theResult append ( _killer call MAR_fnc_weaponNames);
	_theResult pushback time;	
	_theResult
};

// 
//  called with 2 players in array Result:  ["76561198010027779","=JpS=Raptor-Man",00007FF64EAF9C50,string,string,00007FF64EAF9C50,"VR","mp_player_check","=JpS=Raptor-Man on DESKTOP-HP359LD",scalar,1840.59,5488.9,0.00143909,any,any,any,any,any,24.799]

// called with 3 player in array ... ["76561198010027779","=JpS=Raptor-Man",00007FF64EAF9C50,"76561198010027779","=JpS=Raptor-Man",WEST,"VR","mp_player_check","=JpS=Raptor-Man on DESKTOP-HP359LD",0,1840.59,5488.9,0.00143909,1840.59,5488.9,0.00143909,"arifle_MXM_Hamr_LP_BI_F","MXM 6.5 mm",false,"None","None",9.175]

// ["76561198010027779","=JpS=Raptor-Man",00007FF64EAF9C50,"","Error: No vehicle",UNKNOWN,"VR","mp_player_check","=JpS=Raptor-Man on DESKTOP-HP359LD",5779.83,1836.74,5480.22,2.46056,0,0,0,"","",false,"None","None",119.827]
// from weaponName ["cannon_120mm","Cannon 120 mm",true,"B_MBT_01_cannon_F","M2A1 Slammer"]