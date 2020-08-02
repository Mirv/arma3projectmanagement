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

params ["_player"];

private ["_weaponConfig", "_weaponClass"];

// Get the weapon class & display name to help with mod/mission compability
if (isNull objectParent _player) then {										// Not in vehicle
	_weaponConfig = configfile >> "CfgWeapons" >> (currentWeapon _player);	// Take the players currentWeapon
	_weaponClass = currentWeapon  _player;
} else {																				// In a vehicle
	_weaponConfig = configfile >> "CfgWeapons" >> (currentWeapon vehicle _player);	// Take the players vehicle main turrent currentWeapon
	_weaponClass = currentWeapon vehicle _player;
};

// Return the Weapon class & display name
[_weaponClass, getText (_weaponConfig  >> "displayname")];

// hint str format ["Class: %1, Name: %2", _weapon select 0, _weapon select 1 ];