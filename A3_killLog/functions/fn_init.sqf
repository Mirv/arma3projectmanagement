// ----- Working - initServer.sqf

//
// - Run once on server start up
//
private ["_result"];

// Connect to DB & assign protocol string for extDB3 to insert via
_result = [] call ELDB_fnc_connectDB;
_result = format ["[ELDB] Info: ExtDB3 connect firing from fn_connectDB.sqf ... result was ... %1.", _result];
diag_log _result;

[] call ELDB_fnc_addKillLogEH;