// ----- Working

//
// - Run once on server start up
//
private ["_result"];

_result = [] call MAR_fnc_connectDB;
_result = format ["ExtDB3 connect firing from fn_connectDB.sqf ... result was ... %1.", _result];
(_result) call bis_fnc_log; 
"Here's Jonny (extdb3 should have fired)" call bis_fnc_log; 

[] call MAR_fnc_addKillLogEH;