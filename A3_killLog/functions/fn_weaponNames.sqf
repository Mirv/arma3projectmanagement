// Get the weapon class & display name
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
// - Note - several thoughts
//      Doing both helps with mod/mission compability
//      Captures main turrent vehicle weapons
//
// - Edgecases: 
//      only the main turret captured currently
//      This means that commander weaponry generally isn't captured
//		We need both weapon & vehicle as shooting from truck bed
//      

params ["_player"];

private ["_weaponName", "_weaponClass", "_isVehicle", "_vehicleClass", "_vehicleName"];

// Get the weapon class & display name to help with mod/mission compability
// systemChat format ["objectParent null? %1",(isNull objectParent _player)];
// systemChat format ["vehiclePlayer: %1",(vehicle _player)];

if (isNull objectParent _player) then {		
	// Not in vehicle	
	systemChat "WPNAMES: not in vehicle.";							
	_weaponClass = currentWeapon  _player;
	_weaponName = getText (configfile >> "CfgWeapons" >> _weaponClass >> "displayName");	// Take the players currentWeapon
	_vehicleClass = "None";
	_vehicleName = "None";
	_isVehicle = false;
} else {	
	// In a vehicle					
	systemChat "WPNAMES: in vehicle.";
	_weaponClass = (currentWeapon vehicle _player);
	_weaponName = getText (configfile >> "CfgWeapons" >> _weaponClass >> "displayName");	// Take the players vehicle main turrent currentWeapon
	_vehicleClass = typeOf vehicle _player;
	_vehicleName = getText (configFile >> "cfgVehicles" >> _vehicleClass >> "displayName");
	_isVehicle = true;
};
//c
result = [_weaponClass, _weaponName, _isVehicle, _vehicleClass, _vehicleName];
