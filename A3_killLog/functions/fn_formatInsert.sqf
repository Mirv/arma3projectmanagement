//
// - formatKillDbInsert
//
// 		Format the string with array of elements to insert in the killLog
//
// - Parameters
//		array of variables matching the database table field names 
//		see below param list
//
// - Returns 
//		true if successfully added or false if failed
//
// - Todo
// 		See if we can work in #define for the insert portion of the query
//		The gathering functions are handling adding single quote strings currently...
// 		They probably shouldn't even though it's less work...should have fnc to do it

// #define FIELDLIST "killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, killDistance, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime"

private ["_fieldList", "_valueList", "_result"];

params [ "_data" ];

// setup table column list
_fieldList = "killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, map, mission, servername, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, killDistance, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime";

// setup data to be inserted
_valueList = _data joinString ", ";

// mysql query
_result = format ["INSERT INTO killlog ( %1 ) VALUES ( %2 );", _fieldList, _valueList];

_result;

// output: "INSERT INTO killlog ( killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, map, mission, servername, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, killDistance, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime ) VALUES ( 76561198010027779, '=JpS=Raptor-Man', 'WEST', 76561198010027779, '=JpS=Raptor-Man', 'WEST', 'VR', '__cur_mp', 'Test Server', 1836.74, 5480.22, 2.46744, 1836.74, 5480.22, 2.46744, 0, 'LMG_coax', 'Coaxial MG 7.62 mm', true, 'B_MBT_01_cannon_F', 'M2A1 Slammer', 282.789 );"