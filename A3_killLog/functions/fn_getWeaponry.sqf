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
//      Doing both helps with mod/mission compability
//
// - Edgecases: 
//      only the main turret captured currently
//      This means that commander weaponry generally isn't captured
//		We need both weapon & vehicle as shooting from truck bed
//      
//
params ["_player"];

private ["_weaponName", "_weaponClass", "_isVehicle", "_vehicleClass", "_vehicleName"];

_weaponName = (currentWeapon vehicle _player); // can't string wrap this till after we get the nice name out
_weaponClass = format ["'%1'", (getText (configfile >> "CfgWeapons" >> _weaponName >> "displayName"))];	// Take the players vehicle main turrent currentWeapon
_weaponName = format ["'%1'", _weaponClass];
_vehicleClass = (typeOf vehicle _player);
_vehicleName = format ["'%1'", (getText (configFile >> "cfgVehicles" >> _vehicleClass >> "displayName"))];
_vehicleClass = format ["'%1'", _vehicleClass ];
_isVehicle =  !(isNull objectParent player); 

result = [_weaponClass, _weaponName, _isVehicle, _vehicleClass, _vehicleName];

result;
