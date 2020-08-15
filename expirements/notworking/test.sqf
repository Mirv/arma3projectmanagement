// Player login handling

// - requires ourData global
// - Check if steam uid in our statistics array 
// - if not make an BIS_fnc_loadEntry

	// mock as can't test full script in eden editor even in MPlayer
	// _fake_params = ["_id", "_uid", "_name"];
	_fake_params = ["123", "1234", "Stevie"];
	_fake_ourData = [
		["432", ["Lou", 0]], 
		["123", ["Stevie", 0]], 
		["321", ["Bob", 0]] 
	];

	// my if statement is gd fugly ... bandaid is to make _uid var since we call it twice already anyways
	private _uid = _fake_params select 1;
	private _name = _fake_params select 2;

	// if steam uid exists - dont' make a new one
	// - Check the existing array of players in game, does the connected player's uid match anyone present?
	if(_fake_ourData select {(_uid) isEqualTo (_x select 0)}) then
	{
		hint str "Making new player entry";
		// - setup a blank array for the stats to push if player doesn't have an entry
		private _newPlayer = [_uid, [_name, 0]];	// layout desired [_uid, [_name, _score]]
		fake_ourData append _newPlayer;	// global variable 

	} else {
		hint str "Player already has an entry";
	}

