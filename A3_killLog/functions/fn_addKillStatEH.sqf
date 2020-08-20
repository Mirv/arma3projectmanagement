addMissionEventHandler ["EntityKilled", {  
	// TODO - we check each field from eventAttributes?


	private ["_eventAttributes"];

	// collect info from arma3 engine
	_eventAttributes = [ "_unit", "_killer", "_instigator" ] call MAR_fnc_gatherKillInfo; 

	// shove the event attributes through the formatter for ExtDB3	
	if(isNil '_eventAttributes' AND (count _eventAttributes < 1) ) then {
		"Failed to receive attributes to submit to query formatter" call BIS_fnc_log;
	} else {
		_eventAttributes call MAR_fnc_formatKillDBInsert;
		if(isNil _eventAttributes) exitWith { 
			"Failed to receive formatted query to pass to ExtDB" call BIS_fnc_log;
		};
		
	};
}];
