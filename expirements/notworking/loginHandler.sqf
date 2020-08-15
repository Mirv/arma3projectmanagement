// Player login handling

// - Check if steam uid in our statistics array 
// - if not make an BIS_fnc_loadEntry


// Global - [_uid, [_name, _id, _score]]
private _ourScores = [];

addMissionEventHandler ["PlayerConnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];


	// if steam uid exists - dont' make a new one

	// - Check the existing array of players in game, does the connected player's uid match anyone present?
	if(!(_ourScores select {(params select 1) isEqualTo (_x select 0)})) then
	{
		// --- setup a blank array for the stats to push if player doesn't have an entry
		// - Not sure if we need "_jip", "_owner", "_idstr"
		// layout desired [_uid, [_name, _id, _score]]
		_ourScores append [params select 1, [_name, _id, _score]];
	}
	
	// if(findIf(params[_uid])) then { hint str "Player already has an entry"; } else { hint str "Making new player entry"; _ourScores pushBackUnique  }

	if(findIf(params[_uid])) then { hint str "Player already has an entry"; } else { hint str "Making new player entry"; _ourScores pushBackUnique  }
}];





_array = [
    ["Key 1", [0, 0, 0], [0, 0, 0]],
    ["Key 2", [0, 0, 0], [0, 0, 0]],
    ["Key 3", [0, 0, 0], [0, 0, 0]] 
];

_keyStr = "Key 1";
_key = _array select {(_x select 0) isEqualTo _keyStr} select 0;
// Returns ["Key 1", [0, 0, 0], [0, 0, 0]]