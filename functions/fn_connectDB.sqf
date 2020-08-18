// --- Working SQF prepping database handle
//
// Initialize and assign the extDB connection a handle for to call too
//
// Should probably go in the serverInit.sqf of be called from it

// TODO - it can be abstracted
// TODO - Write a check to see that we can query against the list of bsae tables in db before we call this

// DB declaration
// 
// Format:"<ExtDB Protocol>:ADD_DATABASE:<Name of the DB in the extdb-config.ini>:<pick name you want in code>"
//
thisDB = "extDB3" callExtension "9:ADD_DATABASE:jpsDB:myDB";

// Check Database gets set or returns it already connected
if(!(_result isEqualTo "[1]" or _result isEqualTo "[0,""Already Connected to Database""]")) exitwith {
	"extDB3" callExtension "9:ADD_PROTOCOL:LOG:DEBUG:debug.log";
	"extDB3" callExtension "1:DEBUG:Issue opening ADD_DATABASE in setupDB.sqf";
};

// Protocol declaration details
// This is the handle the code uses to send queries
// 
// Note you may want to tag on :TEXT or other options depending on how you prefer data to be delimited ' or " etc
// 
// Format:  "<ExtDB Protocol>:ADD_DATABASE_PROTOCOL:<Name of db you made in DB declaration>:SQL:<pick another name>"
//
thisProtocol = "extDB3" callExtension "9:ADD_DATABASE_PROTOCOL:myDB:SQL:myProtocol";

// Checks Protocol gets set or returns it already setup
// 
if(!(_result isEqualTo "[1]" or _result isEqualTo "[0,""Error Protocol Name Already Taken""]")) exitwith {
	"extDB3" callExtension "9:ADD_PROTOCOL:LOG:DEBUG:debug.log";
	"extDB3" callExtension "1:DEBUG:Issue ADD_PROTOCOL in setupDB.sqf";
};