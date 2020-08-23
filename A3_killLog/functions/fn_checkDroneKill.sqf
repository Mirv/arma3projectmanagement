// We credit the instigator by default - later versions will credit the squad/vehicle crew/commander?
// if (isNull _instigator OR (isNil name _instigator)) then {
if (_instigator isEqualTo objNull) then {
	_instigator = _killer;
	systemChat "Firing is _instigator = _k";
} else {
	// UAV/UGV player operated kill require special handling per forums
	_instigator = UAVControl vehicle _killer select 0;
	systemChat "Firing is UAV";
};

_instigator