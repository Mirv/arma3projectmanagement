// ----- Working

//
// - Run once on server start up
//

// Log if false as extDB failed to connect to the SQL
if(!([] call MAR_fnc_connectDB)) then { 
	"Error opening DB via ExtDB - check extDB logfile or enable ExtDB3 logging & see how to trigger entries on ExtDB3 wiki." call BIS_fnc_log;
};
