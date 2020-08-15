// track identity of killer / killed (uid/name/side)
// track the date/time
// track vehicle / weapon used
//
//
addMissionEventHandler ["EntityKilled",
{
	params ["_killed", "_killer", "_instigator"];
	if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0}; // UAV/UGV player operated road kill
	if (isNull _instigator) then {_instigator = _killer}; // player driven vehicle road kill

	// Grab the identities and teams
	private _killedIdentity = format ["Steam: %1, Side: %2, Name: %3,", getPlayerUID _killed, str(side _killed), name _killed];
	private _killerIdentity = format ["Steam: %1, Side: %2, Name: %3,", getPlayerUID _instigator, str(side(_instigator)), name _instigator];
	
	// TODO - the distance check might calc wrong if commander in base ordering an AI to make the kill
	private _returnDistance = floor(getPos _killed distance getPos _instigator);	// get distance 
	
	// Create the event 
	private _killEvent = format ["%1 was killed By %2 from %3 meters away!", _killedIdentity, _killerIdentity, _returnDistance];

	// Create the timestamp (from in game time)
	_gameDate = date;  // [2014,10,30,2,30] (Oct. 30th, 2:30am)
	private _gameTimeStamp = format["%1/%2/%3 @ %4:%5", _gameDate select 1, _gameDate select 2, _gameDate select 0, _gameDate select 3, _gameDate select 4];

	// Add the timestamp of the event to the event
	killMessage = format["%1 -- %2", _gameTimeStamp, _killEvent];
	
	hint killMessage;
}]; 

// Notes:
//
// side <obj> only works if alive & often custom missions mess with this - default sides are WEST, GUER, CIV or some such 
// ... unless you go hit up that mod maker's special preference for where they store their custom names other other customizations will fail
//
// Distance might measure from instigator - edge case being a commander not in the vehicle at great distance away - so code depending on it should
// ... check against weapon/vehicle weapon max range


addMissionEventHandler ["EntityKilled",
{
	params ["_killed", "_killer", "_instigator"];
	_weaponConfig = configfile >> "CfgWeapons" >> (primaryWeapon _killer);
	hint (getText (_weaponConfig  >> "displayname"));

}]; 

_weaponConfig = configfile >> "CfgWeapons" >> (primaryWeapon _killer);
hint (getText (_weaponConfig  >> "displayname"));

addMissionEventHandler ["EntityKilled",
{
	params ["_killed", "_killer", "_instigator"];
	if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0}; // UAV/UGV player operated road kill
	if (isNull _instigator) then {_instigator = _killer}; // player driven vehicle road kill
	_weaponConfig = configfile >> "CfgWeapons" >> (primaryWeapon _instigator);
	hint (getText (_weaponConfig  >> "displayname"));

}]; 


addMissionEventHandler ["EntityKilled",
{
    params ["_killed", "_killer", "_instigator"];
    hintsilent "";

	// We only track players
    if(isPlayer _killer) then
    {
		if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0; _isVehicle = true;}; 	// UAV/UGV player operated road kill        
        if (isNull _instigator) then {_instigator = _killer}; 													// player driven vehicle road kill

		// Find the weapon used
		// If no parent - they are on foot - use their currentWeapon
		if (isNull objectParent player) then 
		{	
			_weaponConfig = configfile >> "CfgWeapons" >> (currentWeapon _instigator);			// Take the players currentWeapon
			_weaponName = getText (_weaponConfig  >> "displayname");							// Get the name back from the list
		} else {	
			// if not attached it's the player in a vehicle or static
			_weaponName = currentWeapon (vehicle player);	// grab weapon off ONLY the main turrent - probably doesn't work for commanders
			hintsilent "";
			hint str format["%1", _weaponName];
			_isVehicle = true;
			
		};
    };
}]; 

addMissionEventHandler ["EntityKilled",
{
    params ["_killed", "_killer", "_instigator"];
    hintsilent "";

	// We only track players
    if(isPlayer _killer) then
    {
		if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0; _isVehicle = true;}; 	// UAV/UGV player operated road kill        
        if (isNull _instigator) then {_instigator = _killer}; 													// player driven vehicle road kill

		// Find the weapon used
		// If no parent - they are on foot - use their currentWeapon
			_weaponName = currentWeapon (vehicle player);	// grab weapon off ONLY the main turrent - probably doesn't work for commanders
			// hintsilent "";
			// hint str format["%1", _weaponName];
    };
}]; 


addMissionEventHandler ["EntityKilled",
{
	params ["_killed", "_killer", "_instigator"];
	if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0}; // UAV/UGV player operated road kill
	if (isNull _instigator) then {_instigator = _killer}; // player driven vehicle road kill

	// Get the weapon class & display name to help with mod/mission compability
	if (isNull objectParent _instigator) then {										// Not in vehicle
		_weaponConfig = configfile >> "CfgWeapons" >> (currentWeapon _instigator);	// Take the players currentWeapon
		_weaponName = getText (_weaponConfig  >> "displayname");					// Get the more compatible name to increase mod
		hint format ["True: Manportable weapon: %1", _weaponName];
	} else {																				// In a vehicle
		_weaponConfig = configfile >> "CfgWeapons" >> (currentWeapon vehicle _instigator);	// Take the players vehicle main turrent currentWeapon
		_weaponName = getText (_weaponConfig  >> "displayname");							// Get the more compatible name to increase mod
		hint format ["Else firing:  Vehicle Weapon %1", _weaponName];
	};

	
	hint killMessage;
}]; 


// Now we check the objecParent
// TODO - we can make a function here to get the pretty name
//
hintsilent "";
_instigator = player;
if (isNull objectParent _instigator) then {
	_weaponConfig = configfile >> "CfgWeapons" >> (currentWeapon _instigator);	// Take the players currentWeapon
	_weaponName = getText (_weaponConfig  >> "displayname");					// Get the more compatible name to increase mod
	hint format ["Weapon: %1, display name: %2", weaponClass, _weaponName];
} else {
	_weaponConfig = configfile >> "CfgWeapons" >> (currentWeapon vehicle _instigator);	// Take the players vehicle main turrent currentWeapon
	_weaponName = getText (_weaponConfig  >> "displayname");					// Get the more compatible name to increase mod
	hint format ["Weapon: %1, display name: %2", weaponClass, _weaponName];
};
