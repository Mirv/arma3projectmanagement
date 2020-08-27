//
// - connectDB
//		Working SQF prepping database handle
//
// - Initialize and assign the extDB connection a handle for to call too
//
// - Note
//		Should probably go in the serverInit.sqf of be called from it

// TODO - it can be abstracted
// TODO - Write a check to see that we can query against the list of base 
//	tables in db extension? before we call this

params ['_player'];


private ["_thisDB", "_result", "_thisProtocol"];

// DB declaration
_thisDB = "extDB3" callExtension "9:ADD_DATABASE:jpsDB:myDB";

// Check Database gets set or returns it already connected, if not log to extdb's system
if(_thisDB isEqualTo "[1]" or _thisDB isEqualTo "[0,""Already Connected to Database""]") then {

	// Attempt to create protocol handle to use for submitting queries
	_thisProtocol = "extDB3" callExtension "9:ADD_DATABASE_PROTOCOL:myDB:SQL:myProtocol";

	// Checks Protocol gets set or returns it already setup
	if(thisProtocol isEqualTo "[1]" or thisProtocol isEqualTo "[0,""Error Protocol Name Already Taken""]") then {
		_result = _thisProtocol;
	} else { 
		_result = false;
		"Issue making handle for protocol to use in queries - see extdb log files" call bis_fnc_log; 
		"extDB3" callExtension "9:ADD_PROTOCOL:LOG:DEBUG:debug"; 
		"extDB3" callExtension "1:DEBUG:Issue ADD_PROTOCOL in setupDB.sqf"; 
	};
} else {
	_result = false;
	"Issue making handle to db connection - see extdb log files" call BIS_fnc_log;
	"extDB3" callExtension "9:ADD_PROTOCOL:LOG:DEBUG:debug";
	"extDB3" callExtension "1:DEBUG:Issue opening ADD_DATABASE in setupDB.sqf";
};

_result;

// thisDB - explained - DB declaration
// 
// Format:"<ExtDB Protocol>:ADD_DATABASE:<Name of the DB in the extdb-config.ini>:<pick name you want in code>"
//


// thisProtocol - explained - Protocol declaration details
// This is the handle the code uses to send queries
// 
// Note you may want to tag on :TEXT or other options depending on how you prefer data to be delimited ' or " etc
// 
// Format:  "<ExtDB Protocol>:ADD_DATABASE_PROTOCOL:<Name of db you made in DB declaration>:SQL:<pick another name>"
//


