[
    [
        <Object>unit,
        <String>role,
        <Number>cargoIndex (see note in description),
        <Array>turretPath,
        <Boolean>personTurret
    ],
    ...
 ]

hintsilent ""; 
_list = fullCrew vehicle player; 
_b = _list select 0; 
_name = _b select 0; 
hint str _name;

// --- Works (<squadname> <playername> returned)

hintsilent "";  
_list = fullCrew vehicle player;  
_b = _list select 1;  
if(isNil _b or _b == "") then {hint "Variable nil";} else {hint "Variable not nil";};
hint str _b; 
 
// --- Works (<squadname> <playername> returned)

systemChat "Beginnig...";
_list = fullCrew vehicle player;    
if(isNil {_list select 1}) then {systemChat "Variable nil"} else {systemChat "Variable not nil"}; 
systemChat "Ending";
// --- output, beginning, Variable Nil, ending

//17 tests 

systemChat "Beginnig...";
_list = fullCrew vehicle player;    
if(isNil {_list select 3}) then {systemChat "Variable nil"} else {systemChat "Variable not nil"}; 
systemChat "Ending";
// --- output, beginning, Variable Nil, ending


systemChat "Beginnig...";
_list = fullCrew vehicle player;    
systemChat format ["%1 elements in _list", (count _list)];
systemChat "Ending";
// --- output, beginning, 1 elements in _list, ending  ... if in vehicle when called

systemChat "Beginnig..."; 
_list = fullCrew vehicle player;     
systemChat str (assignedVehicleRole player); 
systemChat "Ending"; 
// ["Turret", [0]] ... when gunner - changing weapon no effect

systemChat "Beginnig..."; 
_list = fullCrew vehicle player;     
systemChat str (assignedVehicleRole player); 
systemChat "Ending"; 
// ["Turret", [0,0]] ... when commander

systemChat "Beginnig..."; 
_list = fullCrew vehicle player;     
systemChat str (assignedVehicleRole player); 
systemChat "Ending"; 
// ["driver"] ... when driver
