_player = _this select 0;
_isJIP = _this select 1;

// Leaving the JIP check in place for future use
if (!_isJIP) then
{
  systemchat "Starting weapon detection script - Up in JIP";
} else {
  systemchat "Starting weapon detection script - In not JIP";
};

private _result = [_player] call MaR_fnc_weaponNames;

systemchat "Ending weapon detection script";