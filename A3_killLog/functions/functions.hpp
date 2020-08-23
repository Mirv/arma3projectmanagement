class MAR
{
  tag = "MAR"
  class functions
  {
    file = "functions";
    class connectDB { Description = "Create a handle to Connect to ExtDB for executing queries."; };
    class addKillStatEH { Description = "Attach gatherKillInfo to Eventhandler"; };
    class gatherKillInfo { Description = "Generates an array of information regarding kills by players."; };
    class weaponNames { Description = "Get array of the weapon class & name from the weapon config file & if it was vehicle kill."; };  
    class getLocations { Description = "Get array of distance, target and killer 3 coord array."; };  
    class formatKillDbInsert { Description = "Format for inserting to the killLog table."; };    
    class checkDroneKill { Description = "Drones require a special check."; };    
  };
};