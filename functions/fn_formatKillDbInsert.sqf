// Format the string with array of elements to insert in the killLog
//
// - Parameters
//		array of variables matching the database table field names 
//		see below param list
//
// - Returns 
//		true if successfully added or false if failed
//
//
params [
	killedUID,		// note that sometimes the target is AI units 
	killedName, 
	killedTeam,
	killerUID,
	killerName,
	killerTeam,
	killDistance,  
	killed_xpos, 
	killed_yPos, 
	killed_zPos,  
	killer_xPos, 
	killer_yPos, 
	killer_zPos, 
	weaponName, 
	weaponClass,	// required for addon compatibility
	isVehicle, 
	vehicleName, 	
	gameTime		// seconds since server started
	];

private ["_fieldList", "_valueList"];

_fieldList = "killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, killDistance, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, weaponName, weaponClass, isVehicle, vehicleName, gameTime";
// _valueList = format ["%1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18", params ];
_valueList = " blah ";

_query = format ["INSERT INTO killlog ( %1 ) VALUES ( %2 );", _fieldList, _valueList];




