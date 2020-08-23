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

#define FIELDLIST "killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, killDistance, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime"

private ["_fieldList", "_valueList", "_theHandle"];

_theHandle = params [
	"_killedUID",
	"_killedName",
	"_killedTeam",
	"_killerUID",
	"_killerName",
	"_killerTeam",
	"_killed_xpos",
	"_killed_yPos",
	"_killed_zPos",
	"_killer_xPos",
	"_killer_yPos",
	"_killer_zPos",
	"_killDistance",
	"_weaponClass",
	"_weaponName",
	"_isVehicle",
	"_vehicleClass",
	"_vehicleName",
	"_gameTime"
];


// TODO - fieldList could easily be a macro for preprocessing
_fieldList = "killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, killDistance, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime";
// _valueList = (format ["%1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18", _this ]);
_valueList = _this joinString ", ";

format ["INSERT INTO killlog ( %1 ) VALUES ( %2 );", _fieldList, _valueList];

//  Called with:   ["1", "2"] call MAR_fnc_formatKillDbInsert;
//  Returns:   "INSERT INTO killlog ( killedUID, killedName, killedTeam, ... gameTime ) VALUES ( 1, 2 );"