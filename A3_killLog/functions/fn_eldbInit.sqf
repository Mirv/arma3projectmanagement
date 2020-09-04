// ----- Working - initServer.sqf

//
// - Run once on server start up
//
private ["_result"];
"[ELDB] Info: Kill Log: initserver.sqf reached" call BIS_FNC_LOG;
if(isServer) then {
	"[ELDB] Info: Kill Log: initserver's isServer confirmed." call BIS_FNC_LOG;

	// Connect to DB & assign protocol string for extDB3 to insert via
	[] call ELDB_fnc_connectDB;

	// Setup our event handler to fire
	[] call ELDB_fnc_addKillLogEH;
};