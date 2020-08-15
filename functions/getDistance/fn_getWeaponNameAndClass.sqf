// Get the weapon class & display name
// 
// - Doing both helps with mod/mission compability
// 
// - Captures main turrent vehicle weapons
// - This means that commander weaponry generally isn't captured
//
// Paramter:  Player object we are checking for a weapon
//
// Return:  Array with the basename & the display name of the weapon - to help with mod/mission custom weapon compatibility

params [_player];

_instigator = player;
// Get the weapon class & display name to help with mod/mission compability
if (isNull objectParent _instigator) then {										// Not in vehicle
	weaponConfig = configfile >> "CfgWeapons" >> (currentWeapon _instigator);	// Take the players currentWeapon
	weaponClass = currentWeapon  _instigator;
} else {																				// In a vehicle
	weaponConfig = configfile >> "CfgWeapons" >> (currentWeapon vehicle _instigator);	// Take the players vehicle main turrent currentWeapon
	weaponClass = currentWeapon vehicle _instigator;
};

_weaponName = getText (weaponConfig  >> "displayname");
_weapon = [weaponClass, _weaponName];

// hint str format ["Class: %1, Name: %2", _weapon select 0, _weapon select 1 ];