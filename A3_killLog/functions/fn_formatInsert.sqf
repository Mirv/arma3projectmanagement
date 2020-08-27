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

// _theHandle = params [
params [
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

// _data = (_killedUID joinString ", ");
// systemChat str(count _data);
// systemChat (_data);

// // TODO - fieldList could easily be a macro for preprocessing
// // _fieldList = "killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, killDistance, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime";
// // _fieldList = FIELDLIST;

// systemChat "In format";
//  systemChat _valueList;

// Does this belong in it's own func?
// _killedName = format ["",_killedName];
// _killedTeam = format ["",_killedTeam];
// _killerName = format ["",];
// _killerTeam = format ["",];
// _weaponClass = format ["",];
// _weaponName = format ["",];
// _vehicleClass = format ["",];
// _vehicleName = format ["",];


// works
// t = [5, 2, 3]
// s = t select 0;
// t set [0, format['%1',s]]; // outputs ['5',2 3]

// works - 
// _killedName = "Blah";
// systemChat _killedName; // outputs Blah

// _valueList = (format ["%1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18", _this ]);
// // _valueList = (format ["%1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18", _theHandle]);
// _valueList = format ["%1",_theHandle];

// // _valueList = ([_this select 0]) joinString ", ";
// _return = _valueList;
// _return

// //  Called with:   ["1", "2"] call MAR_fnc_formatKillDbInsert;
// // //  Returns:   "INSERT INTO killlog ( killedUID, killedName, killedTeam, ... gameTime ) VALUES ( 1, 2 );"
// result = :""
// // result = {systemChat str(_x)} forEach _this;
// {result append (format ["%1", _x])} forEach _this;

//"INSERT INTO killlog ( killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, map, mission, servername, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, killDistance, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime ) VALUES ( 76561198010027779, '=JpS=Raptor-Man', 'WEST', 76561198010027779, '=JpS=Raptor-Man', 'WEST', 'VR', 'mp_player_check', '=JpS=Raptor-Man on DESKTOP-HP359LD', 1840.59, 5488.9, 0.00143909, 1840.59, 5488.9, 0.00143909, 0, 'arifle_MXM_Hamr_LP_BI_F', 'MXM 6.5 mm', false, 'None', 'None', 190.775 );"
_fieldList = "killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, map, mission, servername, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, killDistance, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime";

_valueList = _killedUID joinString ", ";
// systemChat _valueList;
// systemChat str(format ["Formating DB insert:  %1",_valueList]);
_result = format ["INSERT INTO killlog ( %1 ) VALUES ( %2 );", _fieldList, _valueList];

//["76561198010027779","'=JpS=Raptor-Man'","'WEST'","76561198010027779","'=JpS=Raptor-Man'","'WEST'","VR","__cur_mp","Test Server",1840.59,5488.9,0.00143909,1840.59,5488.9,0.00143909,0,"'arifle_MXM_Hamr_LP_BI_F'","'MXM 6.5 mm'",false,"'None'","'None'",1246.4]

// "INSERT INTO killlog ( killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, map, mission, servername, killed_xpos, killed_yPos, killed_zPos, killer_xPos, 
// killer_yPos, killer_zPos, killDistance, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime ) VALUES 
// ( [""76561198010027779"",""'=JpS=Raptor-Man'"",""'WEST'"",""76561198010027779"",""'=JpS=Raptor-Man'"",""'WEST'"",""VR"",""__cur_mp"",""Test Server"",
// 1840.59,5488.9,0.00143909,1840.59,5488.9,0.00143909,0,""'arifle_MXM_Hamr_LP_BI_F'"",""'MXM 6.5 mm'"",false,""'None'"",""'None'"",1318.5] );"
// "INSERT INTO killlog ( killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, map, mission, servername, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, killDistance, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime ) VALUES ( 76561198010027779, '=JpS=Raptor-Man', 'WEST', 76561198010027779, '=JpS=Raptor-Man', 'WEST', VR, mp_player_check, =JpS=Raptor-Man on DESKTOP-HP359LD, 1840.59, 5488.9, 0.00143909, 1840.59, 5488.9, 0.00143909, 0, 'arifle_MXM_Hamr_LP_BI_F', 'MXM 6.5 mm', false, 'None', 'None', 3.691 );"
// "INSERT INTO killlog ( killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, map, mission, servername, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, killDistance, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime ) VALUES ( 76561198010027779, '=JpS=Raptor-Man', 'WEST', 76561198010027779, '=JpS=Raptor-Man', 'WEST', 'VR', 'mp_player_check', '=JpS=Raptor-Man on DESKTOP-HP359LD', 1840.59, 5488.9, 0.00143909, 1840.59, 5488.9, 0.00143909, 0, 'arifle_MXM_Hamr_LP_BI_F', 'MXM 6.5 mm', false, 'None', 'None', 203.164 );"

_result;
