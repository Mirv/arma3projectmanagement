addMissionEventHandler ["EntityKilled",
{
	params ["_killed", "_killer", "_instigator"];
	if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0}; // UAV/UGV player operated kill
	if (isNull _instigator) then {_instigator = _killer}; // player driven vehicle road kill
	_returnDistance = (getPos _killed distance getPos _instigator);
	hint format ["Killed By %1 from %2 meters away!", name _instigator, _returnDistance];

}];