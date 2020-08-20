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
params ["_one", "_two"];

private ["_fieldList", "_valueList"];

_fieldList = "killedUID, KillerUID";
_valueList = format ["%1, %2", _one, _two ];
thisQuery = format ["INSERT INTO killlog ( %1 ) VALUES ( %2 );", _fieldList, _valueList];

// Setup db
_result = "extDB3" callExtension "9:ADD_DATABASE:jpsDB:myDB";
_result2 = "extDB3" callExtension "9:ADD_DATABASE_PROTOCOL:myDB:SQL:myP";

thisCall = format ["2:myP:%1", thisQuery];
// thisCall = "2:myP:INSERT INTO killlog (killedUID, KillerUID) VALUES (1, 2)";
thisResult = "extDB3" callExtension thisCall;
"extDB3" callExtension "9:ADD_PROTOCOL:LOG:DEBUG:debug.log";


