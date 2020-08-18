// Get the weapon class & display name
// 
// - Doing both helps with mod/mission compability
// - Captures main turrent vehicle weapons
// - Edgecase: 
//   ... only the main turret captured currentlhy
//   ...This means that commander weaponry generally isn't captured
//
// Paramter:  Player object we are checking for a weapon
//
// Return:  Array with the basename & the display name of the weapon - to help with mod/mission custom weapon compatibility
//
//
systemChat "We are in the weapon~zone now!";

params ["_player"];

private ["_weaponConfig", "_weaponClass", "_instigator"];

_instigator = _player;
// Get the weapon class & display name to help with mod/mission compability
if (isNull objectParent _instigator) then {										// Not in vehicle
	_weaponConfig = configfile >> "CfgWeapons" >> (currentWeapon _instigator);	// Take the players currentWeapon
	_weaponClass = currentWeapon  _instigator;
} else {																				// In a vehicle
	_weaponConfig = configfile >> "CfgWeapons" >> (currentWeapon vehicle _instigator);	// Take the players vehicle main turrent currentWeapon
	_weaponClass = currentWeapon vehicle _instigator;
};

// Return the Weapon class & display name
[_weaponClass, getText (_weaponConfig  >> "displayname")];