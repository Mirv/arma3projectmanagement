class MAR
{
  tag = "MAR";
  class functions
  {
    file = "functions";

    class addKillLogEH { Description = "Attach gatherKillInfo to Eventhandler"; };
    class checkDroneKill { Description = "Drones require a special check."; };    
    class connectDB { Description = "Create a handle to Connect to ExtDB for executing queries."; };
    class execInsert { Description = "Automatically the Kill Log insert query against database."; };
    class formatInsert { Description = "Format for inserting to the killLog table."; };    
    class getKillInfo { Description = "Generates an array of information regarding kills by players."; };
    class getLocations { Description = "Get array of distance, target and killer 3 coord array."; };  
    class getWeaponry { Description = "Get array of the weapon class & name from the weapon config file & if it was vehicle kill."; };  

};