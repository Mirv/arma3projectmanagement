// Get the weapon class & display name
//
// - call:  [<player>] call MAR_fnc_getWeaponry;
//
// - Paramter:  Player object we are checking for a weapon
//
// - Return:  Array of
//		weapon class / basename - to help with mod/mission custom weapon compatibility
//		weapon display name
//		isVehicle type (BOOL)
//		vehicle class / basename - compatibility
//		vehicle name
//

// - Notes
//      Doing both class / name  helps with mod/mission compability
//		Eventually vehicle should be come role, which will reflects player squad when not in vehicle
//
// - Edgecases: 
//      only the main turret captured currently
//      This means that commander weaponry generally isn't captured
//		We need both weapon & vehicle as shooting from truck bed
//		Enemy bleeds out
//		Enemy kiled by blast rather than direct hit of shell 
//		Enemy killed by explosions on vehicles or vehicle fires
//      
//
params ["_player"];

private ["_weaponName", "_weaponClass", "_isVehicle", "_vehicleClass", "_vehicleName"];
if (isNull objectParent player) then {
	// something in this section breaks when not in vehicle
	_weaponName = (currentWeapon _player); // can't string wrap this till after we get the nice name out
	_weaponClass = format ["'%1'", (getText (configfile >> "CfgWeapons" >> _weaponName >> "displayName"))];	// Take the players vehicle main turrent currentWeapon
	_weaponName = format ["'%1'", _weaponName];
	_isVehicle =  false; 
	_vehicleName = "'None'";
	_vehicleClass = "'None'";
} else {
	_weaponName = (currentWeapon vehicle _player); // can't string wrap this till after we get the nice name out
	_weaponClass = format ["'%1'", (getText (configfile >> "CfgWeapons" >> _weaponName >> "displayName"))];	// Take the players vehicle main turrent currentWeapon
	_weaponName = format ["'%1'", _weaponName];
	_isVehicle =  true; 
	_vehicleClass = (typeOf vehicle _player);
	_vehicleName = format ["'%1'", (getText (configFile >> "cfgVehicles" >> _vehicleClass >> "displayName"))];
	_vehicleClass = format ["'%1'", _vehicleClass ];
};
result = [_weaponClass, _weaponName, _isVehicle, _vehicleClass, _vehicleName];
// systemChat (result joinString ", ");
result;
