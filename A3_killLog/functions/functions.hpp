class cfgFunctions
{
  class ELDB
  {
    tag = "ELDB";  // this makes all fn_<fileName>.sqf accessible as ELBD_fnc_<filename>
    class functions
    {
      // didn't fully test this one ... stopped at 8 tests combined with placement of subdir, include style, functions.hpp in parent/sub
      // file = "functions";

      class addKillLogEH { 
        Description = "Attach gatherKillInfo to Eventhandler";
        file = "A3_killLog\functions\fn_addKillLogEH.sqf"; 
      };
      class checkDroneKill { 
        Description = "Drones require a special check.";
        file = "A3_killLog\functions\fn_checkDroneKill.sqf" 
        };    
      class connectDB { 
        Description = "Create a handle to Connect to ExtDB for executing queries."; 
        file = "A3_killLog\functions\fn_connectDB.sqf"
        };
      class execInsert { 
        Description = "Automatically the Kill Log insert query against database."; 
        file = "A3_killLog\functions\fn_execInsert.sqf"
        };
      class formatInsert { 
        Description = "Format for inserting to the killLog table."; 
        file = "A3_killLog\functions\fn_formatInsert.sqf"
        };    
      class getKillInfo { 
        Description = "Generates an array of information regarding kills by players."; 
        file = "A3_killLog\functions\fn_getKillInfo.sqf"
        };
      class getLocations { 
        Description = "Get array of distance, target and killer 3 coord array."; 
        file = "A3_killLog\functions\fn_getLocations.sqf"
        };  
      class getWeaponry { 
        Description = "Get array of the weapon class & name from the weapon config file & if it was vehicle kill.";
        file = "A3_killLog\functions\fn_getWeaponry.sqf" 
        };  
      class initServer { 
        preInit = 1; 
        Description = "Call the extDB initialization for protocol handle."; 
        file = "A3_killLog\functions\fn_init.sqf" 
      };  
    };
  };
};
