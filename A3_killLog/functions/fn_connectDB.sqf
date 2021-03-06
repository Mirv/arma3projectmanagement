//
// - connectDB
//		Working SQF prepping database handle
//
// - Initialize and assign the extDB connection a handle for to call too
//
// - Note
//		Should probably go in the serverInit.sqf of be called from it

// TODO - it can be abstracted
// TODO - Write a check to see that we can query against the list of database 
//	tables in db extension? before we call this

private ["_thisDB", "_result", "_thisProtocol"];

// DB declaration
_thisDB = "extDB3" callExtension "9:ADD_DATABASE:jpsDB:myDB";

if(_thisDB isEqualTo "[1]") then {
	// Attempt to create protocol handle to use for submitting queries
	_thisProtocol = "extDB3" callExtension "9:ADD_DATABASE_PROTOCOL:myDB:SQL:myProtocol";

	if(_thisProtocol isEqualTo "[1]") then {
		_result = true;
	} else {
		_result = false;
		diag_log "extDB3: Error with Database Connection.";
		"extDB3" callExtension "9:ADD_PROTOCOL:LOG:DEBUG:debug";   // specific log file
		"extDB3" callExtension "1:DEBUG:Issue ADD_PROTOCOL in connectDB.sqf"; 	//  generalized log file
	};
} else {
	_result = false;
	diag_log "extDB3: Error with Protocol - see extDB3 logs.";
	"extDB3" callExtension "9:ADD_DATABASE:LOG:DEBUG:debug";   // specific log file
	"extDB3" callExtension "1:DEBUG:Issue ADD_DATABASE in connectDB.sqf"; 	//  generalized log file
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
// Logs:  <Arma 3 | Arma 3 Server>@extdb\logs\<year>\<month>\<day>