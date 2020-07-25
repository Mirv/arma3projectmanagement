// Player login handling

// - Check if steam uid in our statistics array 
// - if not make an BIS_fnc_loadEntry


// Global - [_uid, [_name, _id, _score]]
private _ourScores = [];

addMissionEventHandler ["PlayerConnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

	// my if statement is gd fugly ... bandaid is to make _uid var since we call it twice already anyways
	private _uid = params select 1;

	// if steam uid exists - dont' make a new one
	// - Check the existing array of players in game, does the connected player's uid match anyone present?
	if(_ourScores select {(_uid) isEqualTo (_x select 0)}) then
	{
		hint str "Making new player entry";
		// --- setup a blank array for the stats to push if player doesn't have an entry
		// - Not sure if we need "_jip", "_owner", "_idstr"
		// layout desired [_uid, [_name, _id, _score]]
		private _newPlayer = [_uid, [params select 2, 0]];
		_ourScores append _newPlayer;
		{ _newPlayer} call BIS_fnc_log; 
	} else {
		hint str "Player already has an entry";
	}
}];

