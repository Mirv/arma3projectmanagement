	_fake_params = ["123", "1234", "Stevie"];
	_fake_ourData = [
		["432", ["Lou", 0]], 
		["123", ["Stevie", 0]], 
		["321", ["Bob", 0]] 
	];

	private _uid = _fake_params select 1;
	private _name = _fake_params select 2;
	if((_fake_ourData select {(_uid) isEqualTo (_x select 0)}) > 0) then
	{
		hint str "Making new player entry";
		private _newPlayer = [_uid, [_name, 0]];	
		fake_ourData append _newPlayer;	

	} else {
		hint str "Player already has an entry";
	}


/
addMissionEventHandler[onPlayerConnected { diag_log "------Test------"}];
isDedicated 


onPlayerConnected "["_id", "_uid", "_name"] execVM ""<file>""";
onPlayerConnected {diag_log [_id, _uid, _name]};

// fails
missionNamespace addMissionEventHandler["onPlayerConnected", {diag_log "------Test------"}];

// fails
this addMissionEventHandler["onPlayerConnected", {diag_log "------Test------"}];

Error in expression <this addMissionEventHandler["onPlayerConnecte>
  Error position: <addMissionEventHandler["onPlayerConnecte>
  Error Missing ;